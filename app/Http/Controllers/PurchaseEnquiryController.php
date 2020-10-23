<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\ApprovalPurchaseEnquiryHistory;
use App\CommercialEvaluation;
use App\ItemMaster;
use App\Notifications\CommericalEvaluationSubmittedNotification;
use App\Notifications\PurchaseEnquiryFullValidatedNotification;
use App\Notifications\PurchaseEnquiryRejectedNotification;
use App\Notifications\PurchaseRequestCreatedNotification;
use App\Notifications\PurchaseRequestValidationNotification;
use App\PurchaseEnquiry;
use App\QuotationRequest;
use App\QuotationResponse;
use App\QuotationResponseTracker;
use App\RCQuotationResponse;
use App\RateContract;
use App\Role;
use App\User;
use App\Vendor;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Webpatser\Uuid\Uuid;
use DB;
use Storage;

class PurchaseEnquiryController extends Controller
{
    public function createNewPE(Request $request)
    {
        DB::beginTransaction();

      try{

            	//get request data
    	$GroupedPurchaseRequests = [];
    	$user = $request->user();
    	$grouping_id = Uuid::generate(4)->string;
        $PurchaseRequests =  $request->all();
    	$PurchaseRequests =  $request->all();
        $LastestPERecord = PurchaseEnquiry::where('company_id', $user->company_id)->where('project_id', $PurchaseRequests[0]['JobNumber'])->orderBy('purchase_enquiry_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever)
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $PEGroupId = 1;
            $PEInGroupId = 1;
            foreach ($PurchaseRequests as $key => $PurchaseRequest) {
                $PurchaseRequests[$key]['PEGroupId'] = $PEGroupId;
                $PurchaseRequests[$key]['PEInGroupId'] = $PEInGroupId;
                $PEInGroupId++;
            }

        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            //Generate Number Coding for For PE Gourp and Individual PE Receords in the list
            $PEGroupId = $LastestPERecord->purchase_enquiry_group_id + 1;
            $PEInGroupId = 1;
            foreach ($PurchaseRequests as $key => $PurchaseRequest) {
                $PurchaseRequests[$key]['PEGroupId'] = $PEGroupId;
                $PurchaseRequests[$key]['PEInGroupId'] = $PEInGroupId;
                $PEInGroupId++;
            }
        }

    
        // Group by project for ease of looping in the next piece of code
    	foreach($PurchaseRequests as $PurchaseRequest)
		{ 
		    $GroupedPurchaseRequests[$PurchaseRequest['JobNumber']][] = $PurchaseRequest;
		}

    	//creates the requests in the database
    	foreach ($GroupedPurchaseRequests as $JobNumber => $JobPurchaseRequests) {

    		//find to whom you should send the notification
	        $usersIdsWithPRV = Role::where('company_id', $user->company_id)->where('project_id', $JobNumber)->where('role_name', 'PRV')->where('role_level', 1)->distinct()->pluck('user_id');
	        $usersWithPRV = User::whereIn('id', $usersIdsWithPRV)->get();

    		foreach ($JobPurchaseRequests as $key => $JobPurchaseRequests) {

            
                //If no item number is available and the company does not require LOM the add the description of these items to the library automatically.
                $NewItem = false;
                if($JobPurchaseRequests['EnquiryFromItemMaster'] == "No" || $user->company->lom_manditory == "FreeText"){

                   


                    $NewItem = ItemMaster::create([
                        'created_by'            => $user->id,
                        'item_group_id'         => 'N/A',
                        'item_ingroup_id'       => 'N/A',
                        'company_id'            => $user->company_id,
                        'project_id'            => $JobNumber,
                        'description'           => $JobPurchaseRequests['ItemDescription'],
                        'u_o_m'                 => $JobPurchaseRequests['UnitOfMeasurement'],
                        'status'                => "Pre Approved by Level (System) As LOM is Not Required",
                        'active'                => "Yes",
                    ]);
                }

                $image_array=array();
                foreach($JobPurchaseRequests['Images'] as $image)
                {
                    
                      
                            $image = preg_replace('/^data:image\/\w+;base64,/', '', $image);
                            // $image = str_replace('data:image/png;base64,', '', $image);
                            $image = str_replace(' ', '+', $image);
                            $type = explode(';', $image)[0];
                            $type = explode('/', $type)[1];
                            $imageName = "profile" . md5(rand(100, 1000)) . rand(100, 1000) . ".jpeg";
                            Storage::disk('uploads')->put('images/' . $imageName, base64_decode($image));
            
        
                           $image_array[]=$imageName;
                }

    			
    			$NewPE = PurchaseEnquiry::create([
                    'purchase_enquiry_group_id'      => $JobPurchaseRequests['PEGroupId'],
                    'purchase_enquiry_ingroup_id'    => $JobPurchaseRequests['PEInGroupId'],
			        'created_by'				     => $user->id,
			        'company_id'				     => $user->company_id,
			        'project_id'				     => $JobNumber,
			        'enquiry_type'                   => $JobPurchaseRequests['EnquiryType'],
                    'store_item_request'             => ($JobPurchaseRequests['StoreItemrequest'] ?: 'No'),
			        'item_id'                        => ( $NewItem ? $NewItem->id : $JobPurchaseRequests['ItemNumber'] ),
			        'item_description'               => $JobPurchaseRequests['ItemDescription'],
			        'service_description'		     => $JobPurchaseRequests['ServiceDescription'],
			        'quantity'                       => $JobPurchaseRequests['Quantity'],
			        'u_o_m'                          => $JobPurchaseRequests['UnitOfMeasurement'],
			        'latitude'                       => $JobPurchaseRequests['Latitude'],
                    'longitude'                      => $JobPurchaseRequests['Longitude'],
			        'location_name'			         => $JobPurchaseRequests['LocationName'],
			        'underlying_transaction'	     => $JobPurchaseRequests['UnderlyingTransaction'],
                    'sourcing_priority'              => $JobPurchaseRequests['SourcingPriority'],
                    'p_images'                       => json_encode($image_array),
                    'advanced_payment'               => $JobPurchaseRequests['AdvancedPayment'],
                    'retention_percentage'           => ($JobPurchaseRequests['RetentionPercentage'] != '' ? $JobPurchaseRequests['RetentionPercentage'] : 0),
                    'retention_days'                 => ($JobPurchaseRequests['RetentionDays'] != '' ? $JobPurchaseRequests['RetentionDays'] : 0),
			        'required_documents'	         => ($JobPurchaseRequests['RequiredDocuments'] != '') ? implode(',', $JobPurchaseRequests['RequiredDocuments']) : "None",
			        'notes'						     => $JobPurchaseRequests['PELineNote'],
			        'grouping_id'				     => $grouping_id,
	    		]);

	    		ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $NewPE->id,
                    'current_action_description'    => 'Purchase Enquiry Line Originated',
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => 'N/A',
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                    'next_action_description'       => 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level 1',
                    'next_action_owners'            => (implode(', ', $usersWithPRV->pluck('name')->toArray())),
                    'next_approval_level'           => 1,
	            ]);

                /* Link PE to StockItem If it's the request is for a Store Item replenishment */
                if($JobPurchaseRequests['StoreItemrequest'] == "Yes"){
                    $NewPE->stockItems()->attach($JobPurchaseRequests['StockItemID']);
                }

    		}


    		//record history infomation on the level of project
	    	// foreach ($usersWithPRV as $key => $user) {
	        //     $user->notify(new PurchaseRequestCreatedNotification($NewPE));
	        // }

    	}    	

          DB::commit();
    	//return feedback infomration to user
    	return response()->json([
            "messageTitle"  => 'Purchase Enquiry Created.',
            "message"       => 'Purchase Enquiry Created Successfully.',
            "messageType"   => 'success'
        ], 200);

      }catch(\Exception $e){
        DB::rollBack();
	//return feedback infomration to user
                return response()->json([
                    "messageTitle"  => 'Error',
                    "message"       => $e->getMessage(),
                    "messageType"   => 'error'
                ], 200);
                }
	
    }


    public function validatePurchaseEnquiry(Request $request)
    {
        $user = $request->user();

        $PurchaseEnquiryId = $request->get('PurchaseEnquiryId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $PurchaseEnquiry = PurchaseEnquiry::findOrfail($PurchaseEnquiryId);
        $nextApprovalLevel = $PurchaseEnquiry->approval_level + 1;


        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $PurchaseEnquiry->approval_level   = 0;
            $PurchaseEnquiry->status           = "Purchase Enquiry Line Rejected By Level ". ($nextApprovalLevel - 1) ." and Assigned back to the Originator";
            $PurchaseEnquiry->update();


            ApprovalPurchaseEnquiryHistory::create([
                'company_id'                    => $user->company_id,
                'purchase_enquiry_id'           => $PurchaseEnquiry->id,
                'current_action_description'    => 'Purchase Enquiry line Under Review By The Purchase Enquiry Validator level '.($nextApprovalLevel - 1),
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
                'next_action_description'       => "Purchase Enquiry line Under correction By The Purchase Enquiry Originator",
                'next_action_owners'            => $PurchaseEnquiry->creator->name,
                'next_approval_level'           => 'N/A',
            ]);


            $PurchaseEnquiryOrginator = $PurchaseEnquiry->creator;
            // $PurchaseEnquiryOrginator->notify(new PurchaseEnquiryRejectedNotification($PurchaseEnquiry));
            
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Purchase Enquiry Rejected.',
                "message"       => 'Purchase Enquiry Rejected Successfully, A notification is sent to originator for further action.',
                "messageType"   => 'success'
            ], 200);
        }

        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'PRV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $PurchaseEnquiry->status           = "Purchase Enquiry Line Approved by Level ". $PurchaseEnquiry->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for Further Approval";
            $PurchaseEnquiry->approval_level   = $nextApprovalLevel;
            $PurchaseEnquiry->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                // $user->notify(new PurchaseRequestValidationNotification($PurchaseEnquiry));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();


            ApprovalPurchaseEnquiryHistory::create([
                'company_id'                    => $user->company_id,
                'purchase_enquiry_id'           => $PurchaseEnquiry->id,
                'current_action_description'    => "Purchase Enquiry line Under Review By The Purchase Enquiry Validator level ".($nextApprovalLevel - 1),
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => ($nextApprovalLevel - 1),
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
                'next_action_description'       => "Purchase Enquiry line Under Review By The Purchase Enquiry Validator level ".$nextApprovalLevel,
                'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                'next_approval_level'           => $nextApprovalLevel,
            ]);

            // ApprovalPurchaseEnquiryHistory::create([
            //     'company_id'                => $user->company_id,
            //     'purchase_enquiry_id'       => $PurchaseEnquiry->id,
            //     'description'               => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
            //     'current_action_owner_id'   => $user->id,
            //     'next_action_owners'        => (implode(', ', $NextApprovalLevelNames)),
            //     'current_approval_level'    => ($nextApprovalLevel - 1),
            //     'next_approval_level'       => $nextApprovalLevel,
            //     'decision'                  => $ValidationDecision,
            //     'decision_notes'            => $ValidationDecisionNote,
            // ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Purchase Enquiry Approved.',
                "message"       => "Purchase Enquiry approved successfully, The purchase enquiry requires another level of approval before it's sent for a Request for Proposals creation.",
                "messageType"   => 'success'
            ], 200);



        } else {

            /* If the PE item has rate contract create system generated quotation request and attach prices and lead times to it from rate contract vendors then create submitted commercial evaluation and change the status of the purchase enquiries to "Request for Proposals Floated" */
            $RateContracts = RateContract::with(['vendorResponses' => function ($query1) use ($PurchaseEnquiry, $user) {
                $query1->with('rateContractRequest')->where('item_id', $PurchaseEnquiry->item_id)->where('company_id',  $user->company_id);
            }])->whereHas('rateContractRequests', function ($query) use ($PurchaseEnquiry, $user) {
                $query->where('item_id', $PurchaseEnquiry->item_id)->where('company_id',  $user->company_id);
            })->get();
            
            if(count($RateContracts)){

                $now = Carbon::now();

                /* Create Quotation Request */
                //Assing grouping Id Per company
                $LastestPERecord = QuotationRequest::where('company_id', $user->company_id)->orderBy('quotation_group_id', 'desc')->limit(1)->get()->first();

                //return $LastestPERecord->purchase_enquiry_group_id;
                if(empty($LastestPERecord)){
                    //we are here because there is no previous records available (this is the first PE ever) 
                    $GroupId = 1;
                    $InGroupId = 1;
                } else {
                    //we are here because there is a previous records available and will use the the next sequence number
                    $GroupId = $LastestPERecord->quotation_group_id + 1;
                    $InGroupId = $LastestPERecord->quotation_group_id + 1;
                }

                //dd($PurchaseEnquiry->quantity);
                //dd($RateContracts[0]->vendorResponses[0]->toArray());

                $PurchaseEnquiryId = $PurchaseEnquiry->id;
                $SelectedVendors = $RateContracts->pluck('vendor_id')->toArray();


                $NewQuotation = QuotationRequest::create([
                    'quotation_group_id'    => $GroupId,
                    'quotation_ingroup_id'  => $InGroupId,
                    'created_by'            => $user->id,
                    'company_id'            => $user->company_id,
                    'project_id'            => $PurchaseEnquiry->project_id,
                    'quotation_type'        => 'Materials',
                    'quotation_for'         => "PE",
                    'start_date'            => $now,
                    'end_date'              => $now,
                    'sourcing_type'         => 'Rate Contract',
                ]);


                $NewQuotation->purchaseEnquiries()->attach($PurchaseEnquiryId);

                
                //update purchase enquiries status
                PurchaseEnquiry::where('id', $PurchaseEnquiryId)->update([
                    'status' => 'PO Generation Pending',
                ]);

                //Create vendor submission status tracker
                $NewQuotation->Vendors()->attach($SelectedVendors, ['company_id' => $user->company_id, 'status' => 'Quotation Submitted']);
                foreach ($SelectedVendors as $key => $VendorId) {
                    QuotationResponseTracker::create([
                        'vendor_id'     => $VendorId,
                        'company_id'    => $user->company_id,
                        'quotation_id'  => $NewQuotation->id,
                        'status'        => 'Quotation Submitted', // Status can be changed to match normal process "Request for Proposals Floated"
                    ]);
                }
                

                /* Submit Vendor response based on rate contract */
                foreach ($RateContracts as $key => $RateContract) {
                    QuotationResponse::create([
                        'response_by'               => $RateContract->vendorResponses[0]->response_by,
                        'vendor_id'                 => $RateContract->vendorResponses[0]->vendor_id,
                        'company_id'                => $RateContract->vendorResponses[0]->company_id,
                        'item_id'                   => $RateContract->vendorResponses[0]->item_id,
                        'purchase_enquiry_id'       => $PurchaseEnquiryId,
                        'quotation_id'              => $NewQuotation->id,
                        'unit_rate'                 => $RateContract->vendorResponses[0]->unit_rate,
                        'price'                     => $RateContract->vendorResponses[0]->unit_rate * $PurchaseEnquiry->quantity,
                        'currency'                  => $RateContract->vendorResponses[0]->currency,
                        'lead_days'                 => $RateContract->vendorResponses[0]->lead_days,
                        'advanced_percentage'       => $RateContract->vendorResponses[0]->advanced_percentage,
                        'validity_date'             => $RateContract->vendorResponses[0]->rateContractRequest->rc_end_period,
                        'notes'                     => "Auto Generated Quotation Response Based On Rate Cotnract ID: ". $RateContract->id,
                    ]);

                    $QuotationResponseTracker = QuotationResponseTracker::where('quotation_id', $NewQuotation->id)->where('vendor_id', $RateContract->vendorResponses[0]->vendor_id)->where('company_id', $RateContract->vendorResponses[0]->company_id)->update([
                            'status' => 'Quotation Submitted'
                    ]);

                }


                /* Submmit Commerical Evaluation */
                //Assing grouping Id Per company
                $LastestPERecord = CommercialEvaluation::where('company_id', $user->company_id)->orderBy('commerical_evaluation_group_id', 'desc')->limit(1)->get()->first();

                //return $LastestPERecord->purchase_enquiry_group_id;
                if(empty($LastestPERecord)){
                    //we are here because there is no previous records available (this is the first PE ever) 
                    $GroupId = 1;
                    $InGroupId = 1;
                } else {
                    //we are here because there is a previous records available and will use the the next sequence number
                    $GroupId = $LastestPERecord->commerical_evaluation_group_id + 1;
                    $InGroupId = $LastestPERecord->commerical_evaluation_group_id + 1;
                }
                
                //create Commercial Evaluation
                $commericalEvaluation = CommercialEvaluation::create([
                    'commerical_evaluation_group_id'                => $GroupId,
                    'commerical_evaluation_ingroup_id'              => $InGroupId,
                    'evaluator_id'                                  => $user->id,
                    'company_id'                                    => $user->company_id,
                    'quotation_id'                                  => $NewQuotation->id,
                    'quotation_notes'                               => "Auto Generated Commercial Evaluation Based On Rate Cotnract(s)",
                ]);

                //update quotation status
                QuotationRequest::findOrFail($NewQuotation->id)->update(['status' => 'Commercial Evaluation Submitted']);
                $QouteRequest = QuotationRequest::findOrFail($NewQuotation->id);

                $commericalEvaluation->purchaseEnquiries()->attach($PurchaseEnquiryId, ['pe_note' => "Auto Generated Quotation Response Based On Rate Cotnract(s)"]);

                //update the status of each PE line in the pivot table of Quotation Request
                $QouteRequest->purchaseEnquiries()->updateExistingPivot($PurchaseEnquiryId, ['status' => 'Commerical Evaluation Sub mitted']);
            

                //update quotation tracker status to submitted Vendors
                $QouteRequestSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($user) {
                    $query->wherePivot('company_id', $user->company_id)->wherePivot('status', 'Quotation Submitted');
                }])->whereHas('Vendors', function ($query1) use ($user) {
                    $query1->where('quotationrequests_vendors.company_id', $user->company_id)->where('quotationrequests_vendors.status', 'Quotation Submitted');
                })->find($NewQuotation->id);

                if(!empty($QouteRequestSubmittedVendors)){
                    foreach ($QouteRequestSubmittedVendors->Vendors as $key => $QouteRequestSubmittedVendor) {
                        $QouteRequestSubmittedVendor->pivot->status = 'Quotation Ended';
                        $QouteRequestSubmittedVendor->pivot->update();

                        //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                        $test = QuotationResponseTracker::where('quotation_id', $NewQuotation->id)->where('vendor_id', $QouteRequestSubmittedVendor->id)->where('company_id', $user->company_id)->update([
                                'status' => 'Quotation Ended'
                        ]);
                    }
                }



                //update quotation tracker status to non-submitted Vendors
                $QouteRequestNoneSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($user) {
                    $query->wherePivot('company_id', $user->company_id)->wherePivot('status', '!=', 'Quotation Submitted');
                }])->whereHas('Vendors', function ($query1) use ($user) {
                    $query1->where('quotationrequests_vendors.company_id', $user->company_id)->where('quotationrequests_vendors.status', '!=', 'Quotation Submitted');
                })->find($NewQuotation->id);

                if(!empty($QouteRequestNoneSubmittedVendors)){
                    foreach ($QouteRequestNoneSubmittedVendors->Vendors as $key => $QouteRequestNoneSubmittedVendor) {
                        $QouteRequestNoneSubmittedVendor->pivot->status = 'Commercial Evaluation Submitted';
                        $QouteRequestNoneSubmittedVendor->pivot->update();

                        //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                        QuotationResponseTracker::where('quotation_id', $NewQuotation->id)->where('vendor_id', $QouteRequestNoneSubmittedVendor->id)->where('company_id', $user->company_id)->update([
                                'status' => 'Commercial Evaluation Submitted'
                        ]);
                    }
                }


                //notify the originator
                $PEUser = PurchaseEnquiry::findOrFail($PurchaseEnquiryId)->creator;
                $PEUser->notify(new CommericalEvaluationSubmittedNotification());

                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $PurchaseEnquiryId,
                    'current_action_description'    => "Purchase Enquiry line Under Review By The Purchase Enquiry Validator level ".($nextApprovalLevel - 1),
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => ($nextApprovalLevel - 1),
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Purchase Enquiry line Under Review by The Request For Proposal Administrator",
                    'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                    'next_approval_level'           => $nextApprovalLevel,
                ]);


                return response()->json([
                    "messageTitle"  => 'Purchase Enquiry Fully Approved Successfully.',
                    "message"       => 'Purchase Enquiry Send for Purchase Order Creation and Rate Contract Selection.',
                    "messageType"   => 'success'
                ], 200);


            } else {

                //update the item with the approval levels and status
                $PurchaseEnquiry->status    = "Purchase Enquiry Line Fully Approved and Sent for Request For Proposal";
                $PurchaseEnquiry->active = "Yes";
                $PurchaseEnquiry->update();


                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $PurchaseEnquiry->id,
                    'current_action_description'    => "Purchase Enquiry line Under Review By The final Purchase Enquiry Validator level",
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $PurchaseEnquiry->approval_level,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Purchase Enquiry line Under Review by The Request For Proposal Administrator",
                    'next_action_owners'            => 'Request For Proposal Administrator(s)',
                    'next_approval_level'           => '',
                ]);


                $PurchaseEnquiryOrginator = $PurchaseEnquiry->creator;
                // $PurchaseEnquiryOrginator->notify(new PurchaseEnquiryFullValidatedNotification());
         

                /* Back to validator screen */
                return response()->json([
                    "messageTitle"  => 'Purchase Enquiry Fully Approved.',
                    "message"       => 'Purchase Enquiry sent for Request for Proposals creation.',
                    "messageType"   => 'success'
                ], 200);
            }
            

        }
    }


    public function updatePurchaseEnquiry(Request $request)
    {
        $user = $request->user();
        $PurchaseEnquiryId = $request->get('ID');
        $PurchaseEnquiry = PurchaseEnquiry::findOrfail($PurchaseEnquiryId);
        $nextApprovalLevel = $PurchaseEnquiry->approval_level + 1;

        //update the item with the approval levels and status
        $PurchaseEnquiry->project_id                = $request->get('JobNumber');
        $PurchaseEnquiry->advanced_payment          = $request->get('AdvancedPayment');
        $PurchaseEnquiry->item_description          = $request->get('ItemDescription');
        $PurchaseEnquiry->item_id                   = $request->get('ItemNumber');
        $PurchaseEnquiry->latitude                  = $request->get('Latitude');
        $PurchaseEnquiry->longitude                 = $request->get('Longitude');
        $PurchaseEnquiry->location_name             = $request->get('LocationName');
        $PurchaseEnquiry->notes                     = $request->get('PELineNote');
        $PurchaseEnquiry->quantity                  = $request->get('Quantity');
        $PurchaseEnquiry->service_description       = $request->get('ServiceDescription');
        $PurchaseEnquiry->u_o_m                     = $request->get('UnitOfMeasurement');
        $PurchaseEnquiry->enquiry_type              = $request->get('EnquiryType');
        $PurchaseEnquiry->underlying_transaction    = $request->get('UnderlyingTransaction');
        $PurchaseEnquiry->retention_percentage      = ($request->get('RetentionPercentage') != '' ? $request->get('RetentionPercentage') : 0);
        $PurchaseEnquiry->retention_days            = ($request->get('RetentionDays') != '' ? $request->get('RetentionDays') : 0);
        $PurchaseEnquiry->required_documents        = ($request->get('RequiredDocuments') != '') ? implode(',', $request->get('RequiredDocuments')) : "None";
        $PurchaseEnquiry->status                    = "Purchase Enquiry Line Resubmitted and Assigned to Level ". $nextApprovalLevel ." for Approval";
        $PurchaseEnquiry->approval_level            = $nextApprovalLevel;
        $PurchaseEnquiry->update();


        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'PRV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        // Find and send notification to next level employees
        $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
        foreach ($UsersForNextLevelApproval as $key => $user) {
            $user->notify(new PurchaseRequestValidationNotification($PurchaseEnquiry));
        }

        $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
        ApprovalPurchaseEnquiryHistory::create([
            'company_id'                    => $user->company_id,
            'purchase_enquiry_id'           => $PurchaseEnquiry->id,
            'current_action_description'    => "Purchase Enquiry line Under correction By The Purchase Enquiry Originator",
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => ($nextApprovalLevel - 1),
            'decision'                      => 'N/A',
            'decision_notes'                => 'N/A',
            'next_action_description'       => "Purchase Enquiry line Under Review By The Purchase Enquiry Validator level ". $nextApprovalLevel,
            'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
            'next_approval_level'           => $nextApprovalLevel,
        ]);


        return response()->json([
                "messageTitle"  => 'Purchase Enquiry Updated.',
                "message"       => 'Purchase Enquiry Updated Successfully, Enquiry is sent again for approval.',
                "messageType"   => 'success'
            ], 200);
    }


    public function cancelPurchaseEnquiry(Request $request)
    {
        $user = $request->user();

        $PurchaseEnquiryId = $request->get('PurchaseEnquiryId');
        $PurchaseEnquiry = PurchaseEnquiry::findOrfail($PurchaseEnquiryId);
        $PurchaseEnquiry->status = "Purchase Enquiry Line Cancelled by Originator";
        $PurchaseEnquiry->update();

        //record item history
        ApprovalPurchaseEnquiryHistory::create([
            'company_id'                    => $user->company_id,
            'purchase_enquiry_id'           => $PurchaseEnquiry->id,
            'current_action_description'    => "Cancelled By Originator",
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => "N/A",
            'decision'                      => 'N/A',
            'decision_notes'                => 'N/A',
            'next_action_description'       => 'N/A',
            'next_action_owners'            => 'N/A',
            'next_approval_level'           => 'N/A',
        ]);


        return response()->json([
                "messageTitle"  => 'Purchase Enquiry Permanently Cancelled.',
                "message"       => 'Purchase Enquiry Cancelled Successfully, Purchase Enquiry is permanently Cancelled.',
                "messageType"   => 'success'
            ], 200);
    }


    public function updatePurchaseEnquiryByPEO(Request $request)
    {
        $user = $request->user();

        $PurchaseEnquiryId = $request->get('PurchaseEnquiryId');
        $PurchaseEnquiry = PurchaseEnquiry::findOrfail($PurchaseEnquiryId);
        

        return $PurchaseEnquiry;

    }



}
