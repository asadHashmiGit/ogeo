<?php

namespace App\Http\Controllers;


use App\ApprovalStockItemHistory;
use App\ApprovalStockItemIssueRequestHistory;
use App\ApprovalStockItemRequestHistory;
use App\ApprovalStockItemReturnRequestHistory;
use App\ApprovalStockTransferHistory;
use App\FinancialLimit;
use App\ItemMaster;
use App\Notifications\StockItemCreatedNotification;
use App\Notifications\StockItemFullyApprovedNotification;
use App\Notifications\StockItemIssuanceRecordCreatedNotification;
use App\Notifications\StockItemIssueRequestFullValidatedNotification;
use App\Notifications\StockItemIssueRequestRejectedNotification;
use App\Notifications\StockItemIssueRequestValidationNotification;
use App\Notifications\StockItemRejectedNotification;
use App\Notifications\StockItemRequestCreatedNotification;
use App\Notifications\StockItemRequestFullValidatedNotification;
use App\Notifications\StockItemRequestRejectedNotification;
use App\Notifications\StockItemRequestValidationNotification;
use App\Notifications\StockItemReturnAcceptedNotification;
use App\Notifications\StockItemReturnRequestFullValidatedNotification;
use App\Notifications\StockItemReturnRequestRejectedNotification;
use App\Notifications\StockItemReturnRequestValidationNotification;
use App\Notifications\StockItemValidationNotification;
use App\Notifications\StockTransferRequestFullValidatedNotification;
use App\Notifications\StockTransferRequestRejectedNotification;
use App\Notifications\StockTransferRequestValidationNotification;
use App\RNReceiving;
use App\Role;
use App\StockIssuanceRecord;
use App\StockItem;
use App\StockItemIssueRequest;
use App\StockItemIssueRequestsHistory;
use App\StockItemRequest;
use App\StockItemReturnRequest;
use App\StockTransferRequest;
use App\User;
use App\Vendor;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Notification;
use Webpatser\Uuid\Uuid;

class StoresController extends Controller
{
    public function createStockItemRequest(Request $request)
    {
        
    	//get request data
    	$GroupedStockItemRequests = [];
    	$user = $request->user();
    	$grouping_id = Uuid::generate(4)->string;
        $StockItemRequests =  $request->all();
        $LastestSIRRecord = StockItemRequest::where('company_id', $user->company_id)->where('project_id', $StockItemRequests[0]['StoreNumber'])->orderBy('stock_item_request_group_id', 'desc')->limit(1)->get()->first();

        
        //return $LastestSIRRecord->rate_contract_request_group_id;
        if(empty($LastestSIRRecord)){
            //we are here because there is no previous records available (this is the first PE ever)
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $SIRGroupId = 1;
            $SIRInGroupId = 1;
            foreach ($StockItemRequests as $key => $PurchaseRequest) {
                $StockItemRequests[$key]['SIRGroupId'] = $SIRGroupId;
                $StockItemRequests[$key]['SIRInGroupId'] = $SIRInGroupId;
                $SIRInGroupId++;
            }

        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $SIRGroupId = $LastestSIRRecord->rate_contract_request_group_id + 1;
            $SIRInGroupId = 1;
            foreach ($StockItemRequests as $key => $StockItemRequest) {
                $StockItemRequests[$key]['SIRGroupId'] = $SIRGroupId;
                $StockItemRequests[$key]['SIRInGroupId'] = $SIRInGroupId;
                $SIRInGroupId++;
            }
        }
    
        // Group by project for ease of looping in the next piece of code
    	foreach($StockItemRequests as $StockItemRequest)
		{ 
		    $GroupedStockItemRequests[$StockItemRequest['StoreNumber']][] = $StockItemRequest;
		}

        //dd($GroupedStockItemRequests);

    	//creates the requests in the database
    	foreach ($GroupedStockItemRequests as $StoreNumber => $StockItemRequests) {

    		//find to whom you should send the notification
	        $usersIdsWithATSI = Role::where('company_id', $user->company_id)->where('project_id', $StoreNumber)->where('role_name', 'ATSI')->where('role_level', 1)->distinct()->pluck('user_id');
	        $usersWithATSI = User::whereIn('id', $usersIdsWithATSI)->get();

	        //dd($GroupedStockItemRequests, $StockItemRequests, $LastestSIRRecord, $usersIdsWithATSI, $usersWithATSI);


            /* Check if the item is already is stock item */
            // foreach ($StockItemRequests as $key => $StockItemRequest) {
            //     $Stockitem = StockItem::where('project_id', $StoreNumber)->where('item_id', $StockItemRequest['ItemNumber'])->get();
            //     if(!empty($Stockitem)){
            //         return response()->json([
            //             "messageTitle"  => 'Stock Item Existing Already.',
            //             "message"       => 'Just Now Store In Charge Approved Simialar Item, Please Check with Store In Charge',
            //             "messageType"   => 'warning'
            //         ], 200);
            //     }
            // }

    		foreach ($StockItemRequests as $key => $StockItemRequest) {
 
    			$NewSIRLine = StockItemRequest::create([
                    'stock_item_request_group_id'   	=> $StockItemRequest['SIRGroupId'],
                    'stock_item_request_ingroup_id'	    => $StockItemRequest['SIRInGroupId'],
			        'created_by'				     	=> $user->id,
			        'company_id'				     	=> $user->company_id,
			        'project_id'				     	=> $StoreNumber,
			        'item_id'                        	=> $StockItemRequest['ItemNumber'],
			        'item_description'               	=> $StockItemRequest['ItemDescription'],
			        'si_start_period'                  	=> $StockItemRequest['StockItemRequestPeriod'][0],
			        'si_end_period'                  	=> $StockItemRequest['StockItemRequestPeriod'][1],
                    'consumption_frequency'             => $StockItemRequest['ConsumptionFrequency'],
			        'quantity'                       	=> $StockItemRequest['Quantity'],
			        'u_o_m'                          	=> $StockItemRequest['UnitOfMeasurement'],
			        'notes'						     	=> $StockItemRequest['ItemLineNote'],
			        'grouping_id'				     	=> $grouping_id,
	    		]);


	    		ApprovalStockItemRequestHistory::create([
	    			'company_id'				=> $user->company_id,
			        'stock_item_request_id'	    => $NewSIRLine->id,
			        'description'				=> 'Stock Item Request Created',
			        'current_action_owner_id'	=> $user->id,
			        'next_action_owners'		=> (implode(', ', $usersWithATSI->pluck('name')->toArray())),
			        'current_approval_level'	=> 'N/A',
			        'next_approval_level'		=> 1,
			        'decision'					=> 'N/A',
			        'decision_notes'			=> 'N/A',
	            ]);

    		}


    		//Send notification to responsible users with ATSI role
	    	foreach ($usersWithATSI as $key => $user) {
	            $user->notify(new StockItemRequestCreatedNotification($NewSIRLine));
	        }

    	}    	


    	//return feedback infomration to user
    	return response()->json([
            "messageTitle"  => 'Stock Item Request Created.',
            "message"       => 'Stock Item Request Created Successfully.',
            "messageType"   => 'success'
        ], 200);	
    }


    public function validateStockItemRequest(Request $request)
    {
        $user = $request->user();

        $StockItemRequestId = $request->get('StockItemRequestId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockItemRequest = StockItemRequest::findOrfail($StockItemRequestId);
        $nextApprovalLevel = $StockItemRequest->approval_level + 1;


        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $StockItemRequest->approval_level   = 0;
            $StockItemRequest->status           = "Rejected by Level ". ($nextApprovalLevel - 1) ." and Assigned back to originator";
            $StockItemRequest->update();

            ApprovalStockItemRequestHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_request_id'     => $StockItemRequest->id,
                'description'               => "Rejected by Level ". ($nextApprovalLevel - 1) ." and Assigned back to originator",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => $StockItemRequest->creator->name,
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => 'N/A',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $StockItemRequestOrginator = $StockItemRequest->creator;
            $StockItemRequestOrginator->notify(new StockItemRequestRejectedNotification($StockItemRequest));
            
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Request Rejected.',
                "message"       => 'Stock Item Request Rejected Successfully, A notification is sent to originator for further action.',
                "messageType"   => 'success'
            ], 200);
        }

        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ATSI')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $StockItemRequest->status           = "Approved by Level ". $StockItemRequest->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $StockItemRequest->approval_level   = $nextApprovalLevel;
            $StockItemRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new StockItemRequestValidationNotification($StockItemRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalStockItemRequestHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_request_id'     => $StockItemRequest->id,
                'description'               => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => $nextApprovalLevel,
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Request Approved.',
                "message"       => 'Stock Item Request Approved Successfully, The Stock item request requires to be approved by another level before it moves to stores for stock creation.',
                "messageType"   => 'success'
            ], 200);



        } else {

            //update the item with the approval levels and status
            $StockItemRequest->status 	             = "Approved by Level ". $StockItemRequest->approval_level ." and sent for stock creation";
            $StockItemRequest->active 				 = "Yes";
            $StockItemRequest->update();


            //notify the original requester 
            ApprovalStockItemRequestHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_request_id'     => $StockItemRequest->id,
                'description'               => "Approved by Level ". $StockItemRequest->approval_level ." and sent for stock creation",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Fully Approved',
                'current_approval_level'    => $StockItemRequest->approval_level,
                'next_approval_level'       => 'Fully Approved',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $StockItemRequestOrginator = $StockItemRequest->creator;
            $StockItemRequestOrginator->notify(new StockItemRequestFullValidatedNotification());
     


		    return response()->json([
		        "messageTitle"  => 'Stock Item Request Approved.',
		        "message"       => 'Stock Item Request Approved Successfully, Request sent for stock creation.',
		        "messageType"   => 'success'
		    ], 200);

        }
    }



    public function updateStockItemRequest(Request $request)
    {
        $user = $request->user();
        $StockItemRequestId = $request->get('id');
        $StockItemRequest = StockItemRequest::findOrfail($StockItemRequestId);
        $nextApprovalLevel = $StockItemRequest->approval_level + 1;



        //update the item with the approval levels and status
        $StockItemRequest->si_start_period           = $request->get('si_start_period');
        $StockItemRequest->si_end_period             = $request->get('si_end_period');
        $StockItemRequest->item_description          = $request->get('item_description');
        $StockItemRequest->item_id                   = $request->get('item_id');
        $StockItemRequest->notes                     = $request->get('notes');
        $StockItemRequest->consumption_frequency     = $request->get('consumption_frequency');
        $StockItemRequest->quantity                  = $request->get('quantity');
        $StockItemRequest->u_o_m                     = $request->get('u_o_m');
        $StockItemRequest->status                    = "Resubmitted and Assigned to Level ". $nextApprovalLevel ." for approval";
        $StockItemRequest->approval_level            = $nextApprovalLevel;
        $StockItemRequest->update();


        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ATSI')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        // Find and send notification to next level employees
        $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
        foreach ($UsersForNextLevelApproval as $key => $user) {
            $user->notify(new StockItemRequestValidationNotification($StockItemRequest));
        }

        $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
        ApprovalStockItemRequestHistory::create([
            'company_id'                => $user->company_id,
            'stock_item_request_id'     => $StockItemRequest->id,
            'description'               => "Resubmitted and Assigned to Level ". $nextApprovalLevel ." for approval",
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
            'current_approval_level'    => ($nextApprovalLevel - 1),
            'next_approval_level'       => $nextApprovalLevel,
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        return response()->json([
                "messageTitle"  => 'Stock Item Request Updated.',
                "message"       => 'Stock Item Request Updated Successfully, Request is sent again for approval.',
                "messageType"   => 'success'
            ], 200);
    }


    public function cancelStockItemRequest(Request $request)
    {
        $user = $request->user();

        $StockItemRequestId = $request->get('ItemStockItemRequestId');
        $StockItemRequest = StockItemRequest::findOrfail($StockItemRequestId);
        $StockItemRequest->status = "Cancelled By Originator";
        $StockItemRequest->update();

        //record item history
        ApprovalStockItemRequestHistory::create([
            'company_id'                => $user->company_id,
            'stock_item_request_id'     => $StockItemRequest->id,
            'description'               => "Cancelled By Originator",
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => 'N/A',
            'current_approval_level'    => 'N/A',
            'next_approval_level'       => 'N/A',
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        return response()->json([
                "messageTitle"  => 'Stock Item Request Cancelled.',
                "message"       => 'Stock Item Request Cancelled Successfully, Stock Item Request is permanently closed.',
                "messageType"   => 'success'
            ], 200);
    }


    public function createStockItem(Request $request)
    {
        $user = $request->user();
        $NextApprovalLevel = 1;

        //Assing grouping Id Per company
        $LastestPERecord = StockItem::where('company_id', $user->company_id)->orderBy('stock_item_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->stock_item_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->stock_item_group_id + 1;
            $InGroupId = $LastestPERecord->stock_item_group_id + 1;
        }

        $StockItemRequests = array_map('intval', $request->get('StockItemRequests'));

        //dd($request->all(), $request->get('ItemIDs')[0]['ItemID']);

        $NewStockItem = StockItem::create([
            'stock_item_group_id'   => $GroupId,
            'stock_item_ingroup_id' => $InGroupId,
            'created_by'            => $user->id,
            'company_id'            => $user->company_id,
            'project_id'            => $request->get('StoreID'),
            'bin'                   => $request->get('Bin'),
            'shelf'                 => $request->get('Shelf'),
            'rack'                  => $request->get('Rack'),
            'area'                  => $request->get('Area'),
            'alley'                 => $request->get('Alley'),
            'item_id'               => $request->get('ItemIDs')[0]['ItemID'],
            'pe_generation_type'    => $request->get('PEGenerationType'),
            'replenish_level'       => $request->get('ReplenishmentLevel'),
            'replenish_quantity'    => $request->get('ReplenishmentQuantity'),
            'start_date'            => $request->get('StockingPeriod')[0],
            'end_date'              => $request->get('StockingPeriod')[1],
            'notes'                 => $request->get('StockItemNote'),
        ]);

        $NewStockItem->stockItemRequest()->attach($StockItemRequests);

        //find to whom you should send the notification
        $usersIdsWithASTMGR = Role::where('company_id', $user->company_id)->where('project_id', $request->get('StoreID'))->where('role_name', 'ASTMGR')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithASTMGR = User::whereIn('id', $usersIdsWithASTMGR)->get();
        $NextApprovalLevelNames = $usersWithASTMGR->pluck('name')->toArray();

        /* Update StockItem Creation Tracker */
        ApprovalStockItemHistory::create([
            'company_id'                => $user->company_id,
            'stock_item_id'             => $NewStockItem->id,
            'description'               => "Stock Item Create",
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
            'current_approval_level'    => 'N/A',
            'next_approval_level'       => $NextApprovalLevel,
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        /* Update StockItem Request Tracker */
        foreach ($StockItemRequests as $key => $StockItemRequestId) {
            ApprovalStockItemRequestHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_request_id'     => $StockItemRequestId,
                'description'               => "Stock Item Create Pending Approval From Store Manager at Level ". $NextApprovalLevel,
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => 'N/A',
                'next_approval_level'       => $NextApprovalLevel,
                'decision'                  => 'N/A',
                'decision_notes'            => 'N/A',
            ]);
        }

        /* Notify Stores Manager */
        foreach ($usersWithASTMGR as $key => $user) {
            $user->notify(new StockItemValidationNotification($NewStockItem));
        }

        //update stock item request status
        StockItemRequest::whereIn('id', $request->get('StockItemRequests'))->update([
            'status' => 'Created Pending Store Manager Approval',
        ]);

        return response()->json([
            "messageTitle"  => 'Stock Item Created Successfully.',
            "message"       => 'Stock Item Created Successfully and Sent for Store Manager Approval.',
            "messageType"   => 'success'
        ], 200);


        /* Send Notification To store managers for approval */
        
        
    }


    public function approvalsOfStockItemCreation(Request $request)
    {
        //dd($request->all());
        $user = $request->user();
        $StockItemRequestId = $request->get('EditModalInfo')['id'];
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockItem = StockItem::findOrfail($StockItemRequestId);
        $nextApprovalLevel = $StockItem->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            /* Update Details Of The StockItem */
            $StockItem = StockItem::findOrfail($request->get('EditModalInfo')['id'])->update($request->get('EditModalInfo'));
            $StockItem->status = "Rejected";
            $StockItem->save();

            /* Update Stock Item Tracker */
            ApprovalStockItemHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_id'             => $StockItem->id,
                'description'               => "Stock Item Create Pending Approval From Store Manager at Level ". $NextApprovalLevel,
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => 'N/A',
                'next_approval_level'       => $NextApprovalLevel,
                'decision'                  => 'Rejected',
                'decision_notes'            => $request->get('DecisionNotes'),
            ]);
            
            /* Update Stock Item Request Tracker And StockItemRequest */
            $StockItemRequests = $StockItem->stockItemRequest;
            StockItemRequest::whereIn('id', $StockItemRequests)->update([
                'status' => 'Rejected',
            ]);
            foreach ($StockItemRequests as $key => $StockItemRequestId) {
                ApprovalStockItemRequestHistory::create([
                    'company_id'                => $user->company_id,
                    'stock_item_request_id'     => $StockItemRequestId,
                    'description'               => "Stock Item Request Has Been Rejected My Store Manager",
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => "N/A",
                    'current_approval_level'    => 'N/A',
                    'next_approval_level'       => "N/A",
                    'decision'                  => 'N/A',
                    'decision_notes'            => 'N/A',
                ]);
            }

            /* Notify the Requester and Creator */
            $StockItemRequestersIDs = $StockItem->stockItemRequest->pluck('created_by')->toArray();
            $StockItemRequestersUsers = User::whereIn('id', $StockItemRequestersIDs)->get();
            $StockItemRequestersUsers->push($StockItem->creator);
            Notification::send($StockItemRequestersUsers, new StockItemRejectedNotification($StockItem));

            /* Send Feedback to User */
            return response()->json([
                "messageTitle"  => 'Stock Item Rejected Successfully.',
                "message"       => 'Stock Item Rejected Successfully. Requester Will be Notifitied.',
                "messageType"   => 'success'
            ], 200);

            
        }

        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ASTMGR')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){

            //update the item with the approval levels and status
            $StockItem->status           = "Approved by Level ". $StockItem->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $StockItem->approval_level   = $nextApprovalLevel;
            $StockItem->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new StockItemValidationNotification($StockItem));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalStockItemHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_request_id'     => $StockItem->id,
                'description'               => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => $nextApprovalLevel,
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $StockItemRequests = $StockItem->stockItemRequest->pluck('id')->toArray();
            StockItemRequest::whereIn('id', $StockItemRequests)->update([
                'status' => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
            ]);
            foreach ($StockItemRequests as $key => $StockItemRequestId) {
                ApprovalStockItemRequestHistory::create([
                    'company_id'                => $user->company_id,
                    'stock_item_request_id'     => $StockItemRequestId,
                    'description'               => "Approved by Level ". $StockItem->approval_level ." as a stock item.",
                    'current_action_owner_id'   => $user->id,
                    'current_approval_level'    => $StockItem->approval_level,
                    'next_action_owners'        => "N/A",
                    'next_approval_level'       => 'Fully Approved',
                    'decision'                  => $ValidationDecision,
                    'decision_notes'            => $ValidationDecisionNote,
                ]);
            }
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Approved.',
                "message"       => 'Stock Item Approved Successfully, The Stock item request requires to be approved by another level before it becomes a stock item.',
                "messageType"   => 'success'
            ], 200);



        } else {


            //update the item with the approval levels and status
            $StockItem->status                = "Approved by Level ". $StockItem->approval_level ." as a stock item.";
            $StockItem->active                = "Yes";
            $StockItem->update();

            //notify the original requester 
            ApprovalStockItemHistory::create([
                'company_id'                => $user->company_id,
                'stock_item_id'             => $StockItem->id,
                'description'               => "Approved by Level ". $StockItem->approval_level ." as a stock item.",
                'current_action_owner_id'   => $user->id,
                'current_approval_level'    => $StockItem->approval_level,
                'next_action_owners'        => 'N/A',
                'next_approval_level'       => 'Fully Approved',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            /* Update Stock Item Request Tracker And StockItemRequest */
            $StockItemRequests = $StockItem->stockItemRequest->pluck('id')->toArray();
            StockItemRequest::whereIn('id', $StockItemRequests)->update([
                'status' => 'Approved',
            ]);
            foreach ($StockItemRequests as $key => $StockItemRequestId) {
                ApprovalStockItemRequestHistory::create([
                    'company_id'                => $user->company_id,
                    'stock_item_request_id'     => $StockItemRequestId,
                    'description'               => "Approved by Level ". $StockItem->approval_level ." as a stock item.",
                    'current_action_owner_id'   => $user->id,
                    'current_approval_level'    => $StockItem->approval_level,
                    'next_action_owners'        => "N/A",
                    'next_approval_level'       => 'Fully Approved',
                    'decision'                  => $ValidationDecision,
                    'decision_notes'            => $ValidationDecisionNote,
                ]);
            }

            /* Notify Requester and Creator of the stock item */
            $StockItemRequestersIDs = $StockItem->stockItemRequest->pluck('created_by')->toArray();
            $StockItemRequestersUsers = User::whereIn('id', $StockItemRequestersIDs)->get();
            $StockItemRequestersUsers->push($StockItem->creator);
            Notification::send($StockItemRequestersUsers, new StockItemFullyApprovedNotification($StockItem));


            /* Create PE for this item */

            return response()->json([
                "messageTitle"  => 'Stock Item Approved.',
                "message"       => 'Stock Item Approved Successfully a Stock Item.',
                "messageType"   => 'success'
            ], 200);

        }
        
    }


    public function updateStockItemDetails(Request $request)
    {
        $StockItem = StockItem::findOrfail($request->get('EditModalInfo')['id'])->update($request->get('EditModalInfo'));

        return response()->json([
            "messageTitle"  => 'Stock Item Updated.',
            "message"       => 'Stock Item Updated Successfully.',
            "messageType"   => 'success'
        ], 200);
    }


    public function updateStockItemLevel(Request $request)
    {

        $user = $request->user();
        $StockItem = StockItem::findOrfail($request->get('StockItemID'))->update([
            'stock_level' => DB::raw("stock_level+".$request->get('ReceivedQuantity'))
        ]);
        RNReceiving::findOrfail($request->get('ReceivingBatchId'))->update([
            'received_by_store' => 'Yes', 
            'received_by_store_user_id' => $user->id, 
            'received_by_store_at' => Carbon::now(), 
            'received_by_store_notes' => $request->get('StoreReceivingNote'), 
        ]);

        return response()->json([
            "messageTitle"  => 'Stock Level Updated.',
            "message"       => 'Stock Level Updated Successfully.',
            "messageType"   => 'success'
        ], 200);
    }












    public function createStockTransferRequest(Request $request)
    {

        //dd($request->all());

        //get request data
        $GroupedStockTransferRequests = [];
        $user = $request->user();
        $StockTransferRequests =  $request->all();
        $LastestPERecord = StockTransferRequest::where('company_id', $user->company_id)->where('from_project_id', $StockTransferRequests[0]['FromStore'])->orderBy('stock_transfer_request_group_id', 'desc')->limit(1)->get()->first();


        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever)
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $PEGroupId = 1;
            $PEInGroupId = 1;
            foreach ($StockTransferRequests as $key => $PurchaseRequest) {
                $StockTransferRequests[$key]['PEGroupId'] = $PEGroupId;
                $StockTransferRequests[$key]['PEInGroupId'] = $PEInGroupId;
                $PEInGroupId++;
            }

        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $PEGroupId = $LastestPERecord->stock_transfer_request_group_id + 1;
            $PEInGroupId = 1;
            foreach ($StockTransferRequests as $key => $PurchaseRequest) {
                $StockTransferRequests[$key]['PEGroupId'] = $PEGroupId;
                $StockTransferRequests[$key]['PEInGroupId'] = $PEInGroupId;
                $PEInGroupId++;
            }
        }

    
        // Group by project for ease of looping in the next piece of code
        foreach($StockTransferRequests as $StockTransferRequest)
        { 
            $GroupedStockTransferRequests[$StockTransferRequest['FromStore']][] = $StockTransferRequest;
        }

        //creates the requests in the database
        foreach ($GroupedStockTransferRequests as $JobNumber => $TransferRequest) {

            //find to whom you should send the notification
            $usersIdsWithASTMGR = Role::where('company_id', $user->company_id)->where('project_id', $JobNumber)->where('role_name', 'ASTMGR')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithASTMGR = User::whereIn('id', $usersIdsWithASTMGR)->get();

            foreach ($TransferRequest as $key => $TransferRequest) {
                
                $NewStockTransferRequest = StockTransferRequest::create([
                    'stock_transfer_request_group_id'      => $TransferRequest['PEGroupId'],
                    'stock_transfer_request_ingroup_id'    => $TransferRequest['PEInGroupId'],
                    'created_by'                           => $user->id,
                    'company_id'                           => $user->company_id,
                    'from_project_id'                      => $TransferRequest['FromStore'],
                    'to_project_id'                        => $TransferRequest['ToStore'],
                    'stock_item_id'                        => $TransferRequest['StockItemID'],
                    'quantity'                             => $TransferRequest['TransferQuantity'],
                    'latitude'                             => $TransferRequest['Latitude'],
                    'longitude'                            => $TransferRequest['Longitude'],
                    'location_name'                        => $TransferRequest['LocationName'],
                    //'transfer_date'                        => $TransferRequest['StockTransferDate'],
                    'notes'                                => $TransferRequest['TransferLineNote'],
                ]);

                ApprovalStockTransferHistory::create([
                    'company_id'                => $user->company_id,
                    'stock_transfer_request_id' => $NewStockTransferRequest->id,
                    'description'               => 'Stock Transfer Request Created',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => (implode(', ', $usersWithASTMGR->pluck('name')->toArray())),
                    'current_approval_level'    => 'N/A',
                    'next_approval_level'       => 1,
                    'decision'                  => 'N/A',
                    'decision_notes'            => 'N/A',
                ]);

            }

            //record history infomation on the level of project
            foreach ($usersWithASTMGR as $key => $user) {
                $user->notify(new StockTransferRequestValidationNotification($NewStockTransferRequest));
            }

        }       

        //return feedback infomration to user
        return response()->json([
            "messageTitle"  => 'Stock Tranfer Request Created.',
            "message"       => 'Stock Tranfer Created Successfully.',
            "messageType"   => 'success'
        ], 200);    
    }


    public function validateStockTransferRequest(Request $request)
    {
        $user = $request->user();

        $StockTransferRequestId = $request->get('StockTransferRequestId');
        $ValidationDecision = $request->get('Decision');
        $ItemExistsAsStockItem = $request->get('ItemExistsAsStockItem');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockTransferRequest = StockTransferRequest::with('stockItem')->findOrfail($StockTransferRequestId);
        $nextApprovalLevel = $StockTransferRequest->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $StockTransferRequest->approval_level   = 0;
            $StockTransferRequest->status           = "Rejected by Level ". ($nextApprovalLevel - 1) ." and Assigned back to originator";
            $StockTransferRequest->update();

            ApprovalStockTransferHistory::create([
                'company_id'                => $user->company_id,
                'stock_transfer_request_id' => $StockTransferRequest->id,
                'description'               => "Rejected by Level ". ($nextApprovalLevel - 1) ." and Assigned back to originator",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => $StockTransferRequest->creator->name,
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => 'N/A',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $StockTransferRequestOrginator = $StockTransferRequest->creator;
            $StockTransferRequestOrginator->notify(new StockTransferRequestRejectedNotification($StockTransferRequest));
            
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Transfer Request Rejected.',
                "message"       => 'Stock Transfer Request Rejected Successfully.',
                "messageType"   => 'success'
            ], 200);
        }



        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ASTMGR')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $StockTransferRequest->status           = "Approved by Level ". $StockTransferRequest->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $StockTransferRequest->approval_level   = $nextApprovalLevel;
            $StockTransferRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new StockTransferRequestValidationNotification($StockTransferRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalStockTransferHistory::create([
                'company_id'                => $user->company_id,
                'stock_transfer_request_id' => $StockTransferRequest->id,
                'description'               => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => $nextApprovalLevel,
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Transfer Request Approved.',
                "message"       => 'Stock Transfer Request Approved Successfully, The Stock Transfer Request requires to be approved by another level before it moves to sourcing.',
                "messageType"   => 'success'
            ], 200);


        } else {

            /* Update StockItem First */
            StockItem::where('company_id', $user->company_id)->where('project_id', $StockTransferRequest->from_project_id)->where('item_id', $StockTransferRequest->stockItem->item_id)->decrement('stock_level', $StockTransferRequest->quantity);
            StockItem::where('company_id', $user->company_id)->where('project_id', $StockTransferRequest->to_project_id)->where('item_id', $StockTransferRequest->stockItem->item_id)->increment('stock_level', $StockTransferRequest->quantity);

            //update the item with the approval levels and status
            $StockTransferRequest->status       = "Approved by Level ". $StockTransferRequest->approval_level;
            $StockTransferRequest->active       = "Yes";
            $StockTransferRequest->update();

            //notify the original requester 
            ApprovalStockTransferHistory::create([
                'company_id'                => $user->company_id,
                'stock_transfer_request_id' => $StockTransferRequest->id,
                'description'               => "Approved by Level ". $StockTransferRequest->approval_level,
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Fully Approved',
                'current_approval_level'    => $StockTransferRequest->approval_level,
                'next_approval_level'       => 'Fully Approved',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $StockTransferRequestOrginator = $StockTransferRequest->creator;
            $StockTransferRequestOrginator->notify(new StockTransferRequestFullValidatedNotification());
     

            return response()->json([
                "messageTitle"  => 'Stock Transfer Request Approved.',
                "message"       => 'Stock Transfer Request Approved Successfully.',
                "messageType"   => 'success'
            ], 200);
            
            

        }
    }



    public function createStockItemIssueRequest(Request $request)
    {


        //get request data
        $GroupedStockTransferRequests = [];
        $user = $request->user();
        $StockItemIssueRequests =  $request->all();
        $LastestPERecord = StockItemIssueRequest::where('company_id', $user->company_id)->where('project_id', $StockItemIssueRequests[0]['StoreNumber'])->orderBy('stock_item_issuance_request_group_id', 'desc')->limit(1)->get()->first();


        //return $LastestPERecord->stock_item_issuance_request_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever)
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $SIRGroupId = 1;
            $SIRInGroupId = 1;
            foreach ($StockItemIssueRequests as $key => $StockIssueRequest) {
                $StockItemIssueRequests[$key]['SIRGroupId'] = $SIRGroupId;
                $StockItemIssueRequests[$key]['SIRInGroupId'] = $SIRInGroupId;
                $SIRInGroupId++;
            }

        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $SIRGroupId = $LastestPERecord->stock_item_issuance_request_group_id + 1;
            $SIRInGroupId = 1;
            foreach ($StockItemIssueRequests as $key => $StockIssueRequest) {
                $StockItemIssueRequests[$key]['SIRGroupId'] = $SIRGroupId;
                $StockItemIssueRequests[$key]['SIRInGroupId'] = $SIRInGroupId;
                $SIRInGroupId++;
            }
        }

    
        // Group by project for ease of looping in the next piece of code
        foreach($StockItemIssueRequests as $StockTransferRequest)
        { 
            $GroupedStockTransferRequests[$StockTransferRequest['StoreNumber']][] = $StockTransferRequest;
        }

        //creates the requests in the database
        foreach ($GroupedStockTransferRequests as $StoreNumber => $StockIssueRequest) {

            //find to whom you should send the notification
            $usersIdsWithATSIRS = Role::where('company_id', $user->company_id)->where('project_id', $StoreNumber)->where('role_name', 'ATSIRS')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithATSIRS = User::whereIn('id', $usersIdsWithATSIRS)->get();

            foreach ($StockIssueRequest as $key => $StockIssueRequest) {
                
                $NewStockIssueRequest = StockItemIssueRequest::create([
                    'stock_item_issuance_request_group_id'      => $StockIssueRequest['SIRGroupId'],
                    'stock_item_issuance_request_ingroup_id'    => $StockIssueRequest['SIRInGroupId'],
                    'created_by'                                => $user->id,
                    'company_id'                                => $user->company_id,
                    'project_id'                                => $StockIssueRequest['StoreNumber'],
                    'stock_item_id'                             => $StockIssueRequest['StockItemID'],
                    'quantity'                                  => $StockIssueRequest['Quantity'],
                    'latitude'                                  => $StockIssueRequest['Latitude'],
                    'longitude'                                 => $StockIssueRequest['Longitude'],
                    'location_name'                             => $StockIssueRequest['LocationName'],
                    'notes'                                     => $StockIssueRequest['ItemLineNote'],
                ]);

                ApprovalStockItemIssueRequestHistory::create([
                    'company_id'                    => $user->company_id,
                    'stock_item_issue_request_id'   => $NewStockIssueRequest->id,
                    'description'                   => 'Stock Item Issue Request Created',
                    'current_action_owner_id'       => $user->id,
                    'next_action_owners'            => (implode(', ', $usersWithATSIRS->pluck('name')->toArray())),
                    'current_approval_level'        => 'N/A',
                    'next_approval_level'           => 1,
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                ]);

            }

            //record history infomation on the level of project
            foreach ($usersWithATSIRS as $key => $user) {
                $user->notify(new StockItemIssueRequestValidationNotification($NewStockIssueRequest));
            }

        }       

        //return feedback infomration to user
        return response()->json([
            "messageTitle"  => 'Stock Item Issue Request Created.',
            "message"       => 'Stock Item Issue Created Successfully.',
            "messageType"   => 'success'
        ], 200);    
    }

    
    public function validateStockItemIssueRequest(Request $request)
    {
        $user = $request->user();

        $StockItemIssueRequestId = $request->get('StockItemIssueRequestId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockItemIssueRequest = StockItemIssueRequest::with('stockItem')->findOrfail($StockItemIssueRequestId);
        $nextApprovalLevel = $StockItemIssueRequest->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $StockItemIssueRequest->approval_level   = 0;
            $StockItemIssueRequest->status           = "Rejected by Level ". ($nextApprovalLevel - 1);
            $StockItemIssueRequest->update();

            ApprovalStockItemIssueRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_issue_request_id'   => $StockItemIssueRequest->id,
                'description'                   => "Rejected by Level ". ($nextApprovalLevel - 1),
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => $StockItemIssueRequest->creator->name,
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'next_approval_level'           => 'N/A',
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);


            $StockItemIssueRequestOrginator = $StockItemIssueRequest->creator;
            $StockItemIssueRequestOrginator->notify(new StockItemIssueRequestRejectedNotification($StockItemIssueRequest));
            
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Issue Request Rejected.',
                "message"       => 'Stock Item Issue Request Rejected Successfully.',
                "messageType"   => 'success'
            ], 200);
        }
        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ATSIRS')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $StockItemIssueRequest->status           = "Approved by Level ". $StockItemIssueRequest->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $StockItemIssueRequest->approval_level   = $nextApprovalLevel;
            $StockItemIssueRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new StockItemIssueRequestValidationNotification($StockItemIssueRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalStockItemIssueRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_issue_request_id'   => $StockItemIssueRequest->id,
                'description'                   => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'next_approval_level'           => $nextApprovalLevel,
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Issuance Request Approved.',
                "message"       => 'Stock Item Issuance Request Approved Successfully, The Stock Item Issuance Request requires to be approved by next level of approvals.',
                "messageType"   => 'success'
            ], 200);


        } else {

            //update the item with the approval levels and status
            $StockItemIssueRequest->status       = "Approved by Level ". $StockItemIssueRequest->approval_level;
            $StockItemIssueRequest->active       = "Yes";
            $StockItemIssueRequest->update();

            //notify the original requester 
            ApprovalStockItemIssueRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_issue_request_id'   => $StockItemIssueRequest->id,
                'description'                   => "Approved by Level ". $StockItemIssueRequest->approval_level,
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => 'Fully Approved',
                'current_approval_level'        => $StockItemIssueRequest->approval_level,
                'next_approval_level'           => 'Fully Approved',
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);


            $StockItemIssueRequestOrginator = $StockItemIssueRequest->creator;
            $StockItemIssueRequestOrginator->notify(new StockItemIssueRequestFullValidatedNotification());
     

            return response()->json([
                "messageTitle"  => 'Stock Item Issue Request Approved.',
                "message"       => 'Stock Item Issue Request Approved Successfully.',
                "messageType"   => 'success'
            ], 200);
            
            

        }
    }



    public function createStockItemIssuance(Request $request)
    {
        $user = $request->user();

        $GroupedStockIssuance = [];
        $user = $request->user();
        $StockItemIssuance =  $request->all();
        $LastestPERecord = StockIssuanceRecord::where('company_id', $user->company_id)->orderBy('stock_issuance_record_group_id', 'desc')->limit(1)->get()->first();

        if(empty($LastestPERecord)){
            $IssuanceGroupId = 1;
        } else {
            $IssuanceGroupId = $LastestPERecord->stock_issuance_record_group_id + 1;
        }

        $IssueDate = Carbon::createFromFormat('Y-m-d', substr($StockItemIssuance['IssueDate'],0, 10));

        $OriginalStockItemIssueRequest = StockItemIssueRequest::findOrfail($StockItemIssuance['IssuanceRequestID']);
        $SumOfRequestIssuances = StockIssuanceRecord::where('stock_item_issue_request_id', $StockItemIssuance['IssuanceRequestID'])->get()->sum('issued_quantity');

        if($SumOfRequestIssuances < $OriginalStockItemIssueRequest->quantity){

            $NewIssuanceRecord = StockIssuanceRecord::create([
                'stock_issuance_record_group_id'    => $IssuanceGroupId,
                'created_by'                        => $user->id,
                'company_id'                        => $user->company_id,
                'stock_item_issue_request_id'       => $StockItemIssuance['IssuanceRequestID'],
                'issued_quantity'                   => $StockItemIssuance['IssueQuantity'],
                'issue_date'                        => $IssueDate,
                'notes'                             => $StockItemIssuance['IssueNotes'],
            ]);

            /* Update Issuance Request */
            if($SumOfRequestIssuances == $OriginalStockItemIssueRequest->quantity){
                StockItemIssueRequest::findOrfail($StockItemIssuance['IssuanceRequestID'])->update([
                    'status' => 'Issuance Completed',
                ]);
            } else {
                StockItemIssueRequest::findOrfail($StockItemIssuance['IssuanceRequestID'])->update([
                    'status' => 'Partially Issued Total Of '.$SumOfRequestIssuances. ' Issued', 
                ]);
            }

            /* Send Notification to the Receiver */
            $OriginalStockItemIssueRequestOrginator = $OriginalStockItemIssueRequest->creator;
            $OriginalStockItemIssueRequestOrginator->notify(new StockItemIssuanceRecordCreatedNotification($NewIssuanceRecord));


            /* Send Feedback to user */
            return response()->json([
                "messageTitle"  => 'Issuance Completed Successfully.',
                "message"       => 'Issuance Completed Successfully.',
                "messageType"   => 'warning'
            ], 200);

        } else {
            return response()->json([
                "messageTitle"  => 'Issuance Issue Encountered.',
                "message"       => 'The Sum Of Issued Materials Are Greater Than Requested Quantity.',
                "messageType"   => 'warning'
            ], 200);
        }


    }


    public function createStockItemReturnRequest(Request $request)
    {
        $user = $request->user();
        $StockItemReturnRequest =  $request->all();
        $LastestPERecord = StockItemReturnRequest::where('company_id', $user->company_id)->orderBy('stock_item_return_request_group_id', 'desc')->limit(1)->get()->first();

        if(empty($LastestPERecord)){
            $IssuanceGroupId = 1;
        } else {
            $IssuanceGroupId = $LastestPERecord->stock_item_return_request_group_id + 1;
        }

        /* Create Record */
        $NewStockReturnRequest = StockItemReturnRequest::create([
            'stock_item_return_request_group_id'    => $IssuanceGroupId,
            'created_by'                            => $user->id,
            'company_id'                            => $user->company_id,
            'stock_item_issue_request_id'           => $StockItemReturnRequest['StockIssuanceRequestID'],
            //'stock_issuance_record_id'              => $StockItemReturnRequest[''],
            'stock_item_id'                         => $StockItemReturnRequest['StockItemID'],
            'returned_quantity'                     => $StockItemReturnRequest['ReturnedQuantity'],
            'notes'                                 => $StockItemReturnRequest['ReturnNotes'],
        ]);


        $StoreInChargeDetails = Role::where('project_id', $StockItemReturnRequest['StoreId'])->where('company_id', $user->company_id)->where('role_name', 'ATSIRS')->where('role_level', 1)->distinct('user_id')->pluck('user_id');
        $StoreInChargeUsers = User::whereIn('id', $StoreInChargeDetails)->get();

        /* Record History Tracker */
        ApprovalStockItemReturnRequestHistory::create([
            'company_id'                    => $user->company_id,
            'stock_item_return_request_id'  => $NewStockReturnRequest->id,
            'description'                   => 'Stock Item Return Request Created',
            'current_action_owner_id'       => $user->id,
            'next_action_owners'            => (implode(', ', $StoreInChargeUsers->pluck('name')->toArray())),
            'current_approval_level'        => 'N/A',
            'next_approval_level'           => 1,
            'decision'                      => 'N/A',
            'decision_notes'                => 'N/A',
        ]);


        /* Notify User */        
        foreach ($StoreInChargeUsers as $key => $user) {
            $user->notify(new StockItemReturnRequestValidationNotification($NewStockReturnRequest));
        }

        /* Return Feedback */
        return response()->json([
                "messageTitle"  => 'Return Request Submitted Successfully.',
                "message"       => 'Return Request Submitted Successfully.',
                "messageType"   => 'success'
            ], 200);
    }


    public function validateStockItemReturnRequest(Request $request)
    {
        $user = $request->user();

        $StockItemReturnRequestId = $request->get('StockItemReturnRequestId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockItemReturnRequest = StockItemReturnRequest::findOrfail($StockItemReturnRequestId);
        $nextApprovalLevel = $StockItemReturnRequest->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $StockItemReturnRequest->approval_level   = 0;
            $StockItemReturnRequest->status           = "Rejected by Level ". ($nextApprovalLevel - 1);
            $StockItemReturnRequest->update();

            ApprovalStockItemReturnRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_return_request_id'  => $StockItemReturnRequest->id,
                'description'                   => "Rejected by Level ". ($nextApprovalLevel - 1),
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => $StockItemReturnRequest->creator->name,
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'next_approval_level'           => 'N/A',
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);


            $StockItemReturnRequestOrginator = $StockItemReturnRequest->creator;
            $StockItemReturnRequestOrginator->notify(new StockItemReturnRequestRejectedNotification($StockItemReturnRequest));
            
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Return Request Rejected.',
                "message"       => 'Stock Item Return Request Rejected Successfully.',
                "messageType"   => 'success'
            ], 200);
        }
        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ATSIRS')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $StockItemReturnRequest->status           = "Approved by Level ". $StockItemReturnRequest->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $StockItemReturnRequest->approval_level   = $nextApprovalLevel;
            $StockItemReturnRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new StockItemReturnRequestValidationNotification($StockItemReturnRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalStockItemReturnRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_return_request_id'  => $StockItemReturnRequest->id,
                'description'                   => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'next_approval_level'           => $nextApprovalLevel,
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Stock Item Return Request Approved.',
                "message"       => 'Stock Item Return Request Approved Successfully, The Stock Item Return Request requires to be approved by next level of approvals.',
                "messageType"   => 'success'
            ], 200);


        } else {

            //update the item with the approval levels and status
            $StockItemReturnRequest->status       = "Approved by Level ". $StockItemReturnRequest->approval_level;
            $StockItemReturnRequest->active       = "Yes";
            $StockItemReturnRequest->update();

            //notify the original requester 
            ApprovalStockItemReturnRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_return_request_id'  => $StockItemReturnRequest->id,
                'description'                   => "Approved by Level ". $StockItemReturnRequest->approval_level,
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => 'Fully Approved',
                'current_approval_level'        => $StockItemReturnRequest->approval_level,
                'next_approval_level'           => 'Fully Approved',
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);


            $StockItemReturnRequestOrginator = $StockItemReturnRequest->creator;
            $StockItemReturnRequestOrginator->notify(new StockItemReturnRequestFullValidatedNotification());
     

            return response()->json([
                "messageTitle"  => 'Stock Item Return Request Approved.',
                "message"       => 'Stock Item Return Request Approved Successfully.',
                "messageType"   => 'success'
            ], 200);
            
            

        }
    }



    public function acceptStockItemReturnRequest(Request $request)
    {


        $user = $request->user();

        $StockItemReturnRequestId = $request->get('ReturnRequestID');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $StockItemReturnRequest = StockItemReturnRequest::findOrfail($StockItemReturnRequestId);
        $nextApprovalLevel = $StockItemReturnRequest->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $StockItemReturnRequest->update([
                'return_decision'   => $request->get('Decision'),
                'return_note'       => $request->get('DecisionNotes'),
                'approval_level'    => 0,
                'status'            => 'Return Rejected',
            ]);

            ApprovalStockItemReturnRequestHistory::create([
                'company_id'                    => $user->company_id,
                'stock_item_return_request_id'  => $StockItemReturnRequest->id,
                'description'                   => "Rejected by Level Store Incharge",
                'current_action_owner_id'       => $user->id,
                'next_action_owners'            => 'N/A',
                'current_approval_level'        => 'N/A',
                'next_approval_level'           => 'N/A',
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
            ]);


            $StockItemReturnRequestOrginator = $StockItemReturnRequest->creator;
            $StockItemReturnRequestOrginator->notify(new StockItemReturnRequestRejectedNotification($StockItemReturnRequest));
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Return Stock Request Rejected Successfully.',
                "message"       => 'Return Stock Request Rejected Successfully.',
                "messageType"   => 'success'
            ], 200);
        }
        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ATSIRS')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //update the item with the rejection status levels and status
        $StockItemReturnRequest->update([
            'return_decision'   => $request->get('Decision'),
            'return_note'       => $request->get('DecisionNotes'),
            'status'            => 'Return Accepted',
        ]);

        //notify the original requester 
        ApprovalStockItemReturnRequestHistory::create([
            'company_id'                    => $user->company_id,
            'stock_item_return_request_id'  => $StockItemReturnRequest->id,
            'description'                   => "Approved by Level ". $StockItemReturnRequest->approval_level,
            'current_action_owner_id'       => $user->id,
            'next_action_owners'            => 'Stock Return Approved By Store Incharge',
            'current_approval_level'        => $StockItemReturnRequest->approval_level,
            'next_approval_level'           => 'N/A',
            'decision'                      => $ValidationDecision,
            'decision_notes'                => $ValidationDecisionNote,
        ]);

        $StockItemReturnRequestOrginator = $StockItemReturnRequest->creator;
        $StockItemReturnRequestOrginator->notify(new StockItemReturnAcceptedNotification());
 

        return response()->json([
            "messageTitle"  => 'Stock Item Return Request Approved.',
            "message"       => 'Stock Item Return Request Approved Successfully.',
            "messageType"   => 'success'
        ], 200);
               
    }

}
