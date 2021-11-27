<?php

namespace App\Http\Controllers;

use App\ApprovalRateContractHistory;
use App\ApprovalRateContractRequestHistory;
use App\CommercialEvaluation;
use App\FinancialLimit;
use App\ItemMaster;
use App\Notifications\RateContractApprovalRequiredNotification;
use App\Notifications\RateContractCreatedNotification;
use App\Notifications\RateContractLineRFINotification;
use App\Notifications\RateContractRejectionNotification;
use App\Notifications\RateContractRequestCreatedNotification;
use App\Notifications\RateContractRequestFullValidatedNotification;
use App\Notifications\RateContractRequestRejectedNotification;
use App\Notifications\RateContractRequestValidationNotification;
use App\QuotationRequest;
use App\QuotationResponse;
use App\RCLineRFICommunication;
use App\RCQuantityChange;
use App\RCQuotationResponse;
use App\RateContract;
use App\RateContractRequest;
use App\Role;
use App\User;
use App\Vendor;
use Illuminate\Http\Request;
use Webpatser\Uuid\Uuid;

class RateContractController extends Controller
{
    public function createNewRateContractRequest(Request $request)
    {
        //get request data
        error_reporting(0);
        ini_set('display_errors', 0);
        ini_set('display_startup_errors', 0);

        $GroupedRateContractRequests = [];
        $user = $request->user();
        $grouping_id = Uuid::generate(4)->string;
        $RateContractRequests =  $request->all();

        $LastestPERecord = RateContractRequest::where('company_id', $user->company_id)->where('project_id', $RateContractRequests[0]['JobNumber'])->orderBy('rate_contract_request_group_id', 'desc')->limit(1)->get()->first();



        //return $LastestPERecord->rate_contract_request_group_id;
        if (empty($LastestPERecord)) {
            //we are here because there is no previous records available (this is the first PE ever)
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $RCRGroupId = 1;
            $RCRInGroupId = 1;
            foreach ($RateContractRequests as $key => $PurchaseRequest) {
                $RateContractRequests[$key]['RCRGroupId'] = $RCRGroupId;
                $RateContractRequests[$key]['RCRInGroupId'] = $RCRInGroupId;
                $RCRInGroupId++;
            }
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $RCRGroupId = $LastestPERecord->rate_contract_request_group_id + 1;
            $RCRInGroupId = 1;
            foreach ($RateContractRequests as $key => $RateContractRequest) {
                $RateContractRequests[$key]['RCRGroupId'] = $RCRGroupId;
                $RateContractRequests[$key]['RCRInGroupId'] = $RCRInGroupId;
                $RCRInGroupId++;
            }
        }
        //        print_r( $LastestPERecord);echo "--";



        /*
        //If no item number is available and the company does not require LOM then add the description of these items to the library automatically.
        if($user->company->lom_manditory == "FreeText"){
            foreach ($RateContractRequests as $key => $RateContractRequest) {
                $NewItem = ItemMaster::create([
                    'created_by'            => $user->id,
                    'item_group_id'         => 11,
                    'item_ingroup_id'       => 11,
                    'company_id'            => $user->company_id,
                    'project_id'            => $RateContractRequest['JobNumber'],
                    'description'           => $RateContractRequest['ItemDescription'],
                    'status'                => "Pre Approved by Level (System) As LOM is Not Required",
                    'active'                => "Yes",
                ]);
                $RateContractRequests[$key]['ItemNumber'] = $NewItem->id;
            }
        }

        */

        // Group by project for ease of looping in the next piece of code
        foreach ($RateContractRequests as $RateContractRequest) {
            $GroupedRateContractRequests[$RateContractRequest['JobNumber']][] = $RateContractRequest;
        }

        //creates the requests in the database
        foreach ($GroupedRateContractRequests as $JobNumber => $RateContractRequests) {

            //find to whom you should send the notification
            //$usersIdsWithRCCV = Role::where('company_id', $user->company_id)->where('project_id', $JobNumber)->where('role_name', 'RCCV')->where('role_level', 1)->distinct()->pluck('user_id');
            //$usersWithRCCV = User::whereIn('id', $usersIdsWithRCCV)->get();

            foreach ($RateContractRequests as $key => $RateContractRequest) {


                $cities = implode(",", $RateContractRequest['CompanyCitys']);

                $NewRCLine = RateContractRequest::create([
                    'rate_contract_request_group_id'       => $RateContractRequest['RCRGroupId'],
                    'rate_contract_request_ingroup_id'    => $RateContractRequest['RCRInGroupId'],
                    'created_by'                         => $user->id,
                    'company_id'                         => $user->company_id,
                    'project_id'                         => $JobNumber,
                    'item_id'                            => $RateContractRequest['ItemNumber'],
                    'item_description'                   => $RateContractRequest['ItemLibraryDescription']['description'],
                    'quantity'                           => $RateContractRequest['Quantity'],
                    'country'                             => $RateContractRequest['CompanyCountry'],
                    'cities'                         => $cities,
                    'grouping_id'                         => $grouping_id,
                ]);


                /*	ApprovalRateContractRequestHistory::create([
	    			'company_id'				=> $user->company_id,
			        'rate_contract_request_id'	=> $NewRCLine->id,
			        'description'				=> 'Rate Contract Request Created',
			        'current_action_owner_id'	=> $user->id,
			        'next_action_owners'		=> (implode(', ', $usersWithRCCV->pluck('name')->toArray())),
			        'current_approval_level'	=> 'N/A',
			        'next_approval_level'		=> 1,
			        'decision'					=> 'N/A',
			        'decision_notes'			=> 'N/A',
	            ]);*/
            }


            //Send notification to responsible users with RCCV role
            //foreach ($usersWithRCCV as $key => $user) {
            //  $user->notify(new RateContractRequestCreatedNotification($NewRCLine));
            //}

        }


        //return feedback infomration to user
        return response()->json([
            "messageTitle"  => 'Rate Contract Request Created.',
            "message"       => 'Rate Contract Request Created Successfully.',
            "messageType"   => 'success'
        ], 200);
    }


    public function validateRateContractItemRequest(Request $request)
    {
        error_reporting(0);
        ini_set('display_errors', 0);
        ini_set('display_startup_errors', 0);

        $user = $request->user();

        $RCItemRequestId = $request->get('RCItemRequestId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $RCItemRequest = RateContractRequest::findOrfail($RCItemRequestId);
        $nextApprovalLevel = $RCItemRequest->approval_level + 1;


        //check if item creation is rejected
        if ($ValidationDecision == "Rejected") {

            //update the item with the rejection status levels and status
            $RCItemRequest->approval_level   = 0;
            $RCItemRequest->status           = "Rejected by Level " . ($nextApprovalLevel - 1) . " and Assigned back to originator";
            $RCItemRequest->update();

            ApprovalRateContractRequestHistory::create([
                'company_id'                => $user->company_id,
                'rate_contract_request_id'  => $RCItemRequest->id,
                'description'               => "Rejected by Level " . ($nextApprovalLevel - 1) . " and Assigned back to originator",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => $RCItemRequest->creator->name,
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => 'N/A',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);


            $RCItemRequestOrginator = $RCItemRequest->creator;
            $RCItemRequestOrginator->notify(new RateContractRequestRejectedNotification($RCItemRequest));



            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Rate Contract Item Request Rejected.',
                "message"       => 'Rate Contract Item Request Rejected Successfully, A notification is sent to originator for further action.',
                "messageType"   => 'success'
            ], 200);
        }


        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'RCCV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

       

        //check if we will have another approvals level if yes then do the below
        if ($NextApprovalLevelsForConcernedRole->count() > 0) {


            //update the item with the approval levels and status
            $RCItemRequest->status           = "Approved by Level " . $RCItemRequest->approval_level . " and Assigned to Level " . $nextApprovalLevel . " for approval";
            $RCItemRequest->approval_level   = $nextApprovalLevel;
            $RCItemRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new RateContractRequestValidationNotification($RCItemRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalRateContractRequestHistory::create([
                'company_id'                => $user->company_id,
                'rate_contract_request_id'  => $RCItemRequest->id,
                'description'               => "Approved by Level " . ($nextApprovalLevel - 1) . " and Assigned to Level " . $nextApprovalLevel . " for approval",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => $nextApprovalLevel,
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);

            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Rate Contract Item Request Approved.',
                "message"       => 'Rate Contract Item Request Approved Successfully, The rate contract item request requires to be approved by another level before it moves to sourcing.',
                "messageType"   => 'success'
            ], 200);
        } else {

            //update the item with the approval levels and status
            $RCItemRequest->status     = "Approved by Level " . $RCItemRequest->approval_level . " and sent for sourcing";
            $RCItemRequest->active                 = "Yes";
            $RCItemRequest->update();


            //notify the original requester 
            ApprovalRateContractRequestHistory::create([
                'company_id'                => $user->company_id,
                'rate_contract_request_id'  => $RCItemRequest->id,
                'description'               => "Approved by Level " . $RCItemRequest->approval_level . " and sent for sourcing",
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Fully Approved',
                'current_approval_level'    => $RCItemRequest->approval_level,
                'next_approval_level'       => 'Fully Approved',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);



            $RCItemRequestOrginator = $RCItemRequest->creator;
            //$RCItemRequestOrginator->notify(new RateContractRequestFullValidatedNotification());



            return response()->json([
                "messageTitle"  => 'Rate Contract Item Request Approved.',
                "message"       => 'Rate Contract Item Request Approved Successfully, Request sent for sourcing.',
                "messageType"   => 'success'
            ], 200);
        }
    }


    public function updateRateContractItemRequest(Request $request)
    {
        $user = $request->user();
        $ItemRateContractRequestId = $request->get('id');
        $ItemRateContractRequest = RateContractRequest::findOrfail($ItemRateContractRequestId);
        $nextApprovalLevel = $ItemRateContractRequest->approval_level + 1;



        //update the item with the approval levels and status
        $ItemRateContractRequest->rc_start_period          = $request->get('rc_start_period');
        $ItemRateContractRequest->rc_end_period          = $request->get('rc_end_period');
        $ItemRateContractRequest->item_description          = $request->get('item_description');
        $ItemRateContractRequest->item_id                   = $request->get('item_id');
        $ItemRateContractRequest->location_name             = $request->get('location_name');
        $ItemRateContractRequest->notes                     = $request->get('notes');
        $ItemRateContractRequest->quantity                  = $request->get('quantity');
        $ItemRateContractRequest->u_o_m                     = $request->get('u_o_m');
        $ItemRateContractRequest->status                    = "Resubmitted and Assigned to Level " . $nextApprovalLevel . " for approval";
        $ItemRateContractRequest->approval_level            = $nextApprovalLevel;
        $ItemRateContractRequest->update();


        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'RCCV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        // Find and send notification to next level employees
        $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
        foreach ($UsersForNextLevelApproval as $key => $user) {
            $user->notify(new RateContractRequestValidationNotification($ItemRateContractRequest));
        }

        $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
        ApprovalRateContractRequestHistory::create([
            'company_id'                => $user->company_id,
            'rate_contract_request_id'  => $ItemRateContractRequest->id,
            'description'               => "Resubmitted and Assigned to Level " . $nextApprovalLevel . " for approval",
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
            'current_approval_level'    => ($nextApprovalLevel - 1),
            'next_approval_level'       => $nextApprovalLevel,
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        return response()->json([
            "messageTitle"  => 'Rate Contract Item Request Updated.',
            "message"       => 'Rate Contract Item Request Updated Successfully, Request is sent again for approval.',
            "messageType"   => 'success'
        ], 200);
    }


    public function cancelRateContractItemRequest(Request $request)
    {
        $user = $request->user();

        $ItemRateContractRequestId = $request->get('ItemRateContractRequestId');
        $ItemRateContractRequest = RateContractRequest::findOrfail($ItemRateContractRequestId);
        $ItemRateContractRequest->status = "Cancelled By Originator";
        $ItemRateContractRequest->update();

        //record item history
        ApprovalRateContractRequestHistory::create([
            'company_id'                => $user->company_id,
            'rate_contract_request_id'  => $ItemRateContractRequest->id,
            'description'               => "Cancelled By Originator",
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => 'N/A',
            'current_approval_level'    => 'N/A',
            'next_approval_level'       => 'N/A',
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        return response()->json([
            "messageTitle"  => 'Rate Contract Item Request Cancelled.',
            "message"       => 'Rate Contract Item Request Cancelled Successfully, Rate Contract Item Request is permanently closed.',
            "messageType"   => 'success'
        ], 200);
    }


    public function createRateContract(Request $request)
    {

        $user = $request->user();

        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationId'));

        //Assing grouping Id Per company
        $LastestPERecord = RateContract::where('company_id', $user->company_id)->orderBy('rate_contract_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if (empty($LastestPERecord)) {
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->purchase_order_group_id + 1;
            $InGroupId = $LastestPERecord->purchase_order_group_id + 1;
        }

        //create purchase order
        $RateContract = RateContract::create([
            'rate_contract_group_id'       => $GroupId,
            'rate_contract_ingroup_id'     => $InGroupId,
            'company_id'        => $user->company_id,
            'creator_id'        => $user->id,
            'project_id'        => $request->get('ProjectId'),
            'vendor_id'         => $request->get('VendorId'),
            'quotation_id'      => $request->get('QuotationId'),
            'notes'             => $request->get('RCNotes'),
            'approval_level'    => 1,
        ]);
        $RateContract->rateContractRequests()->attach($request->get('SelectedRCs'));

        //find reponses for the selected vendor
        $quoationVendorResponses = RCQuotationResponse::where('company_id', $user->company_id)->where('vendor_id', $request->get('VendorId'))->where('quotation_id', $request->get('QuotationId'))->whereIn('rate_contract_request_id', $request->get('SelectedRCs'))->get()->pluck('id');
        $RateContract->vendorResponses()->attach($quoationVendorResponses);


        //find to whom you should send the notification
        $usersIdsWithRCV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'RCV')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithRCV = User::whereIn('id', $usersIdsWithRCV)->get();


        //Record Approval History
        ApprovalRateContractHistory::create([
            'company_id'                => $user->company_id,
            'rate_contract_id'          => $RateContract->id,
            'description'               => 'Rate Contract Created',
            'current_action_owner_id'   => $user->id,
            'next_action_owners'        => (implode(', ', $usersWithRCV->pluck('name')->toArray())),
            'current_approval_level'    => 'N/A',
            'next_approval_level'       => 1,
            'decision'                  => 'N/A',
            'decision_notes'            => 'N/A',
        ]);


        //notify the required user for approval with Role POV
        foreach ($usersWithRCV as $key => $user) {
            $user->notify(new RateContractCreatedNotification($RateContract));
        }

        // $commericalEvaluation = CommercialEvaluation::with(['rateContractRequests' => function($query)
        // {
        //     $query->wherePivot('status', 'PO Created'); 
        // }])->where('company_id', $user->company_id)->where('quotation_id', $request->get('QuotationId'))->get()->first();

        $commericalEvaluation = CommercialEvaluation::where('company_id', $user->company_id)->where('quotation_id', $request->get('QuotationId'))->get()->first();

        //update status of PE pivot tabel with of the commerical evaluation
        foreach ($request->get('SelectedRCs') as $key => $PEId) {
            $commericalEvaluation->rateContractRequests()->updateExistingPivot($PEId, ['status' => 'Rate Contract Created']);
        }

        //update status of the commerical evaluation if all PEs are having a PO.
        if ($QuotationRequest->rateContractRequests->count() == $commericalEvaluation->rateContractRequests->count()) {
            $commericalEvaluation->status = 'Rate Contract Created';
            $commericalEvaluation->save();
        }

        //feedback to to user
        return response()->json([
            "messageTitle"  => 'Rate Contract Created.',
            "message"       => 'Rate Contract Created successfully, The created rate contract is send for approval.',
            "messageType"   => 'success'
        ], 200);
    }



    public function createRateContractLineRFIMessage(Request $request)
    {

        $user = $request->user();
        $RC = RateContract::findOrFail($request->get('RCId'));
        $RateContractRequest = RateContractRequest::findOrFail($request->get('RCRId'));
        $Approvers = Role::where('role_name', 'RCV')->where('role_level', $RC->approval_level)->get();

        $RCLineRFICommunication = RCLineRFICommunication::create([
            'user_id'           => $user->id,
            'company_id'        => $user->company_id,
            'rc_id'             => $request->get('RCId'),
            'rcr_id'            => $request->get('RCRId'),
            'message'           => $request->get('RCLineRFImessage')
        ]);

        if ($request->get('By') == 'Requester') {
            //Notifiy the originator about the clarificaiton
            $RateContractRequest->creator->notify(new RateContractLineRFINotification($RCLineRFICommunication));
        } else {
            //Notifiy the the approver about the clarificaiton response
            foreach ($Approvers as $key => $Approver) {
                $Approver->user->notify(new RateContractLineRFINotification($RCLineRFICommunication));
            }
        }

        //update PE-PO pivot table status
        $RC->rateContractRequests()->updateExistingPivot($RateContractRequest->id, ['status' => 'In Clarifications Exchange']);

        //feedback to user
        return response()->json([
            "messageTitle"  => 'Clarification Submitted Successfully.',
            "message"       => 'Clarification has been submitted successfully, the originator will be notified.',
            "messageType"   => 'success'
        ], 200);
    }





    public function RateContractApproval(Request $request)
    {



        /* How this approval method works: */
        # 1. The system Collects Some Data.
        # 2. The system Checks if all lines are rejected then regardless of the level or the PO approval critia we will update all lines as rejected and notifiy originator.
        # 3. The system then Check PO Approval Criteria (PO Value, Unit Rate, PO Line).
        # 4. The system check whether the user is the FINAL approval level to skip all the headach and approve or reject all po lines then notify the vendor and update PO status.
        # 5. If point 4 is not true then the system would dive into the details

        /* 
            Database Changes are: 
                1. Update PO Line Pivot Status and Approval Level
                2. Update PO Status and Approval Level
                3. Update PE Quantity if Changed 
                4. Creation of ApprovalPurchaseOrderHistory
                5. Creation of QuantityChange
        */

        $user = $request->user();
        $RCId = $request->get('RCId');
        $TotalRCValue = 0;



        // Get the details of the purchase order
        $OriginalRC = RateContract::with('creator', 'company', 'vendor', 'project', 'quotation', 'rateContractRequests', 'vendorResponses')->findOrFail($request->get('RCId'));

        // Get the financial limit of this (CURRENT Approver/Submitting User)
        $CurrentLevelRCVFinancialLimits = FinancialLimit::where('company_id', $request->get('CompanyId'))->where('project_id', $request->get('ProjectId'))->where('limit_type', 'RCV')->where('level', $request->get('RCApprovalLevel'))->where('currency', $request->get('Currency'))->get()->first();


        /*
            
            CASE #1 All Lines Are Rejected (Approval Array is Empty)

        */


        if (empty($request->get('ApprovedLines'))) {

            # 1. Update status for each PO Rejected Lines
            foreach ($request->get('RejectedLines') as $key => $RCRId) {
                $OriginalRC->rateContractRequests()->updateExistingPivot($RCRId, [
                    'status' => 'Rejected By ' . $user->name . ' at approval level (' . $request->get('RCApprovalLevel') . ')',
                    'approval_level' => $request->get('RCApprovalLevel')
                ]);
            }


            # 2. Update PO Lines status
            $OriginalRC->status = "Fully Rejected";
            $OriginalRC->update();


            # 3. Record History Changes
            ApprovalRateContractHistory::create([
                'company_id'                => $user->company_id,
                'rate_contract_id'          => $RCId,
                'description'               => 'Processed By Level ' . $request->get('RCApprovalLevel') . '.',
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Fully Rejected',
                'current_approval_level'    => $request->get('RCApprovalLevel'),
                'next_approval_level'       => 'Fully Rejected',
                'decision'                  => 'Fully Rejected',
                'decision_notes'            => 'Approved Line(s): Zero Lines | Rejected Line(s): (' . implode(',', $request->get('RejectedLines')) . ')',
            ]);

            # 4. Send notification to originator (Find All Unique Originators For All Enquiry Lines and Send Them Notifications)
            $OriginatorsIdsList = $OriginalRC->rateContractRequests->unique('created_by')->pluck('created_by');
            $Originators = User::whereIn('id', $OriginatorsIdsList)->get();

            foreach ($Originators as $key => $Originator) {
                $Originator->notify(new RateContractRejectionNotification($OriginalRC));
            }

            # 5. User FeedBack
            return response()->json([
                "messageTitle"  => 'Rate Contract Rejected',
                "message"       => 'Rate Contract Rejected Successfully, The Rate Contract will will no longer be pursed. Originator Will Be Notified',
                "messageType"   => 'success'
            ], 200);
        }

        /* 

            CASE #2 PO Value Criterion:
                - Case 1: Current Level DOES have finicial Limit.
                    - Case 1: the po value is within his financial limit
                    - Case 2: the po value is NOT within his fincancial limits
                - Case 2: (Case Two) Current Level Does NOT have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
                    
        */


        ## Handle Rejected Lines ... Loop through the Rejected Lines and Kill Them By ##
        if (count($request->get('RejectedLines'))) {
            # Update status for each PO Rejected Lines
            foreach ($request->get('RejectedLines') as $key => $RCRId) {
                $OriginalRC->rateContractRequests()->updateExistingPivot($RCRId, [
                    'status' => 'Rejected By ' . $user->name . ' at approval level (' . $request->get('RCApprovalLevel') . ')',
                    'approval_level' => $request->get('RCApprovalLevel')
                ]);
            }
        }





        ## Calculate Total RC Value for the approved lines only ## 
        foreach ($request->get('RCResponseDetails') as $key => $RCLine) {
            if (in_array($RCLine['rate_contract_request']['id'], $request->get('ApprovedLines'))) {
                $TotalRCValue = $RCLine['NewPrice'] + $TotalRCValue;
            }
        }



        # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the Rate Contract Total value is within his financial limit and 2. Rate Contract Total value is not within his fincancial limits).
        if ($CurrentLevelRCVFinancialLimits) {
            ## We are here because no financial limits where found for this level approver hence he is the final approver ##
            //dd($TotalRCValue, $CurrentLevelRCVFinancialLimits);

            ## check the value of whole Rate Contract is within current financial limits and if not notify update that line level ##
            if ($CurrentLevelRCVFinancialLimits['limit'] >= $TotalRCValue) {
                ## We are here because the PO value is within currenct approver financial limits hence current approver is the final approval  ##

                # 1. Update status for each PO Approved Lines
                foreach ($request->get('ApprovedLines') as $key => $RCRId) {
                    $OriginalRC->rateContractRequests()->updateExistingPivot($RCRId, ['status' => 'Final Approval - Approved By ' . $user->name . ' at approval level (' . $request->get('RCApprovalLevel') . ')']);
                }


                # 2. Update PO Lines status
                $OriginalRC->status = "Approvals Fully Completed - RC Sent To Vendor";
                $OriginalRC->update();

                # 3. Record History Changes
                ApprovalRateContractHistory::create([
                    'company_id'                => $user->company_id,
                    'rate_contract_id'          => $RCId,
                    'description'               => 'Processed By Level ' . $request->get('RCApprovalLevel') . '.',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Approvals Completed',
                    'current_approval_level'    => $request->get('RCApprovalLevel'),
                    'next_approval_level'       => 'Approvals Completed',
                    'decision'                  => 'Approvals Completed',
                    'decision_notes'            => 'Approved Line(s): (' . implode(',', $request->get('ApprovedLines')) . ') | Rejected Line(s): (' . implode(',', $request->get('RejectedLines')) . ')',
                ]);

                # 4. Send notification to vendor
                $VendorBiddingUsers = Vendor::where('id', $OriginalRC->vendor_id)->whereHas('users', function ($query) {
                    $query->where('sbm_role', 'SBM');
                })->first()->users;
                foreach ($VendorBiddingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new RateContractApprovalRequiredNotification($OriginalRC));
                }

                # 5. User FeedBack
                return response()->json([
                    "messageTitle"  => 'Rate Contract Fully Approved',
                    "message"       => 'Rate Contract Fully Approved Successfully, The Rate Contract will be sent to vendor for his accepatance.',
                    "messageType"   => 'success'
                ], 200);
            } else {

                # We are here because current approver is NOT the final approval

                # 1. Update status for each Rate Approved Lines
                foreach ($request->get('ApprovedLines') as $key => $RCRId) {
                    $OriginalRC->rateContractRequests()->updateExistingPivot($RCRId, [
                        'status' => 'Approval #' . $request->get('RCApprovalLevel') . ' - Approved By ' . $user->name . ' at approval level (' . $request->get('RCApprovalLevel') . ')',
                        'approval_level' => $request->get('RCApprovalLevel')
                    ]);
                }

                # 2. Update Rate Lines status
                $OriginalRC->status = 'Approved By Level: ' . $request->get('RCApprovalLevel');
                $OriginalRC->approval_level = $request->get('RCApprovalLevel') + 1;
                $OriginalRC->update();


                # 3. Get Next Approval Level Users (RCV Role) and Send then notifications
                $usersIdsWithRCV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'RCV')->where('role_level', $request->get('RCApprovalLevel') + 1)->distinct()->pluck('user_id');
                $usersWithRCV = User::whereIn('id', $usersIdsWithRCV)->get();
                foreach ($usersWithRCV as $key => $ApproverRCV) {
                    $ApproverRCV->notify(new RateContractApprovalRequiredNotification($OriginalRC));
                }


                # 4. Record History Changes
                ApprovalRateContractHistory::create([
                    'company_id'                => $user->company_id,
                    'rate_contract_id'          => $RCId,
                    'description'               => 'Processed By Level ' . $request->get('RCApprovalLevel') . '.',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => (implode(', ', $usersWithRCV->pluck('name')->toArray())),
                    'current_approval_level'    => $request->get('RCApprovalLevel'),
                    'next_approval_level'       => $request->get('RCApprovalLevel') + 1,
                    'decision'                  => 'Rate Contract Processed to Next Level',
                    'decision_notes'            => 'Approved Line(s): (' . implode(',', $request->get('ApprovedLines')) . ') | Rejected Line(s): (' . implode(',', $request->get('RejectedLines')) . ')',
                ]);


                # 5. User FeedBack
                return response()->json([
                    "messageTitle"  => 'Rate Contract Approved',
                    "message"       => 'Rate Contract Approved Successfully, The Rate Contract required additional line of approvals before it will be sent to vendor for accepatance.',
                    "messageType"   => 'success'
                ], 200);
            }


            # (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
        } else {

            # 1. Update status for each Rate Contract Approved Lines
            foreach ($request->get('ApprovedLines') as $key => $RCRId) {
                $OriginalRC->rateContractRequests()->updateExistingPivot($RCRId, [
                    'status' => 'Final Approval - Approved By ' . $user->name . ' at approval level (' . $request->get('RCApprovalLevel') . ')',
                    'approval_level' => $request->get('RCApprovalLevel')
                ]);
            }


            # 2. Update RC Lines status
            $OriginalRC->status = "Approvals Fully Completed - RC Sent To Vendor";
            $OriginalRC->update();


            # 3. Record History Changes
            ApprovalRateContractHistory::create([
                'company_id'                => $user->company_id,
                'rate_contract_id'          => $RCId,
                'description'               => 'Processed By Level ' . $request->get('RCApprovalLevel') . '.',
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Approvals Completed',
                'current_approval_level'    => $request->get('RCApprovalLevel'),
                'next_approval_level'       => 'Approvals Completed',
                'decision'                  => 'Approvals Completed',
                'decision_notes'            => 'Approved Line(s): (' . implode(',', $request->get('ApprovedLines')) . ') | Rejected Line(s): (' . implode(',', $request->get('RejectedLines')) . ')',
            ]);

            # 4. Send notification to vendor
            $VendorBiddingUsers = Vendor::where('id', $OriginalRC->vendor_id)->whereHas('users', function ($query) {
                $query->where('sbm_role', 'SBM');
            })->first()->users;
            foreach ($VendorBiddingUsers as $key => $VendorUser) {
                $VendorUser->notify(new RateContractApprovalRequiredNotification($OriginalRC));
            }


            # 5. User FeedBack
            return response()->json([
                "messageTitle"  => 'Rate Contract Fully Approved',
                "message"       => 'Rate Contract Fully Approved Successfully, The Rate Contract will be sent to vendor for his accepatance.',
                "messageType"   => 'success'
            ], 200);
        }
    }
}
