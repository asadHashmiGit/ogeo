<?php

namespace App\Http\Controllers;

use App\ApprovalPurchaseEnquiryHistory;
use App\ApprovalPurchaseOrderHistory;
use App\ApprovalRateContractRequestHistory;
use App\CommercialEvaluation;
use App\FinancialLimit;
use App\Notifications\CommericalEvaluationSubmittedNotification;
use App\Notifications\CompanyRCRFIResponseNotification;
use App\Notifications\CompanyRFIResponseNotification;
use App\Notifications\PurchaseOrderApprovalRequiredNotification;
use App\Notifications\PurchaseOrderCreatedNApprovedVendorNotification;
use App\Notifications\PurchaseOrderCreatedNotification;
use App\Notifications\PurchaseOrderLineRFINotification;
use App\Notifications\PurchaseOrderRejectionNotification;
use App\Notifications\QuotationCancelledNotification;
use App\Notifications\QuotationDateChangeNotification;
use App\Notifications\QuotationRfIDateChangeNotification;
use App\Notifications\newAuctionFloatedNotification;
use App\Notifications\newRFQFloatedNotification;
use App\POLineRFICommunication;
use App\Project;
use App\PurchaseEnquiry;
use App\PurchaseOrder;
use App\QuantityChange;
use App\QuotationRequest;
use App\QuotationResponse;
use App\QuotationResponseTracker;
use App\RCRFICommunication;
use App\RFICommunication;
use App\RateContractRequest;
use App\Role;
use App\User;
use App\Vendor;
use App\VendorUser;
use App\Vendors;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Twilio;
use DB;

class QuotationsController extends Controller
{
    public function createQuotationRequest(Request $request)
    {
    	$user = $request->user();

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

        $QuotationProjectID = $request->get('ProjectId');

        if($request->get('RequestType') == "PE"){

        	if($request->get('SourcingType') == 'Sealed Bid'){


        		$RfPEnquiries = array_map('intval', $request->get('RfPEnquiries'));
        		$SelectedVendors = array_map('intval', $request->get('SelectedVendors'));

                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('QuotationDate')[0]);
                if($startDateTemp->gte(Carbon::now())){
                    $RfPAssignedStatus = 'Request for Proposals Queued';
                } else {
                    $RfPAssignedStatus = 'Request for Proposals Floated';
                }

        		$NewQuotation = QuotationRequest::create([
                    'quotation_group_id'    => $GroupId,
                    'quotation_ingroup_id'  => $InGroupId,
                    'created_by'            => $user->id,
    		        'company_id' 			=> $user->company_id,
                    'project_id'            => $QuotationProjectID,
    		        'quotation_type' 		=> $request->get('RFQType'),
                    'quotation_for'         => "PE",
    		        'start_date' 			=> $request->get('QuotationDate')[0],
    		        'end_date' 				=> $request->get('QuotationDate')[1],
        			'rfp_name'    			=> $request->get('RFPName'),
                    'rfi_start_date'        => $request->get('RFIDate')[0],
                    'rfi_end_date'          => $request->get('RFIDate')[1],
    		        'sourcing_type' 		=> $request->get('SourcingType'),
                    'status'                => $RfPAssignedStatus,
        		]);

        		$NewQuotation->purchaseEnquiries()->attach($RfPEnquiries);
        		

        		//update purchase enquiries status
        		PurchaseEnquiry::whereIn('id', $request->get('RfPEnquiries'))->update([
        			'status' => 'Request for Proposals Floated',
        		]);

                //Create vendor submission status tracker
                $NewQuotation->Vendors()->attach($SelectedVendors, ['company_id' => $user->company_id, 'status' => 'Request for Proposals Not Yet Viewed']);
                foreach ($SelectedVendors as $key => $VendorId) {
                    QuotationResponseTracker::create([
                        'vendor_id'     => $VendorId,
                        'company_id'    => $user->company_id,
                        'quotation_id'  => $NewQuotation->id,
                        'status'        => 'Request for Proposals Not Yet Viewed',
                    ]);
                }
                
        		//add history records for the change status
        		foreach ($request->get('RfPEnquiries') as $key => $PurchaseEnquiryId) {
        			ApprovalPurchaseEnquiryHistory::create([
    	    			'company_id'				=> $user->company_id,
    			        'purchase_enquiry_id'		=> $PurchaseEnquiryId,
    			        'description'				=> 'Request for Proposals Floated',
    			        'current_action_owner_id'	=> $user->id,
    			        'next_action_owners'		=> 'Quotations From Vendors',
    			        'current_approval_level'	=> 'N/A',
    			        'next_approval_level'		=> 'N/A',
    			        'decision'					=> 'N/A',
    			        'decision_notes'			=> 'N/A',
    	            ]);
        		}
        		
                $VendorUserMissing = false;
        		//notify vendors and check if user access exists for these vendors
                $vendors = Vendor::whereIn('id', $request->get('SelectedVendors'))->get();
                foreach ($vendors as $key => $vendor) {
                    if($vendor->users->count()){
                        foreach ($vendor->users as $key => $BiddingUser) {
                            if($BiddingUser->pivot->sbm_role == 'Yes'){
                                $BiddingUser->notify(new newRFQFloatedNotification());
                                if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                                    error_reporting(E_ERROR | E_WARNING | E_PARSE);
                                    Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Quotation Request For Your Review Sent By ('. $user->company->name .'). Please login to www.ogeo.me');
                                }
                            }
                        }
                    } else {
                        $VendorUserMissing = true;
                    }
                    
                }   
                


                if($VendorUserMissing){
                    return response()->json([
                        "messageTitle"  => 'Request For Proposal Created Successfully.',
                        "message"       => 'Request For Proposal Created Successfully But the selected Vendor(s) does not have email access setup.',
                        "messageType"   => 'warning'
                    ], 200);
                } else {
                    return response()->json([
                        "messageTitle"  => 'Request For Proposal Created Successfully.',
                        "message"       => 'Request For Proposal Created Successfully. Vendor(s) are notified.',
                        "messageType"   => 'success'
                    ], 200);

                }
                
        	}


            /* Handle Live Auctions */
            if($request->get('SourcingType') == 'Live Auctions'){


                $RfPEnquiries = array_map('intval', $request->get('RfPEnquiries'));
                $SelectedVendors = array_map('intval', $request->get('SelectedVendors'));

                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('QuotationDate')[0]);
                if($startDateTemp->gte(Carbon::now())){
                    $RfPAssignedStatus = 'Request for Proposals Queued';
                } else {
                    $RfPAssignedStatus = 'Request for Proposals Floated';
                }

                $NewQuotation = QuotationRequest::create([
                    'quotation_group_id'    => $GroupId,
                    'quotation_ingroup_id'  => $InGroupId,
                    'created_by'            => $user->id,
                    'company_id'            => $user->company_id,
                    'project_id'            => $QuotationProjectID,
                    'quotation_type'        => $request->get('RFQType'),
                    'quotation_for'         => "PE",
                    'start_date'            => $request->get('QuotationDate')[0],
                    'end_date'              => $request->get('QuotationDate')[1],
                    'rfp_name'              => $request->get('RFPName'),
                    'rfi_start_date'        => $request->get('RFIDate')[0],
                    'rfi_end_date'          => $request->get('RFIDate')[1],
                    'sourcing_type'         => $request->get('SourcingType'),
                    'status'                => $RfPAssignedStatus,
                ]);

                $NewQuotation->purchaseEnquiries()->attach($RfPEnquiries);
                

                //update purchase enquiries status
                PurchaseEnquiry::whereIn('id', $request->get('RfPEnquiries'))->update([
                    'status' => 'Auction Started',
                ]);

                //Create vendor submission status tracker
                $NewQuotation->Vendors()->attach($SelectedVendors, ['company_id' => $user->company_id, 'status' => 'Request for Proposals Not Yet Viewed']);
                foreach ($SelectedVendors as $key => $VendorId) {
                    QuotationResponseTracker::create([
                        'vendor_id'     => $VendorId,
                        'company_id'    => $user->company_id,
                        'quotation_id'  => $NewQuotation->id,
                        'status'        => 'Request for Proposals Not Yet Viewed',
                    ]);
                }
                
                //add history records for the change status
                foreach ($request->get('RfPEnquiries') as $key => $PurchaseEnquiryId) {
                    ApprovalPurchaseEnquiryHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_enquiry_id'       => $PurchaseEnquiryId,
                        'description'               => 'Request for Proposals Floated',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Quotations From Vendors',
                        'current_approval_level'    => 'N/A',
                        'next_approval_level'       => 'N/A',
                        'decision'                  => 'N/A',
                        'decision_notes'            => 'N/A',
                    ]);
                }
                
                $VendorUserMissing = false;
                //notify vendors and check if user access exists for these vendors
                $vendors = Vendor::whereIn('id', $request->get('SelectedVendors'))->get();
                foreach ($vendors as $key => $vendor) {
                    if($vendor->users->count()){
                        foreach ($vendor->users as $key => $BiddingUser) {
                            if($BiddingUser->pivot->sbm_role == 'Yes'){
                                $BiddingUser->notify(new newAuctionFloatedNotification($NewQuotation));
                                if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                                    error_reporting(E_ERROR | E_WARNING | E_PARSE);
                                    Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Auction For Your Review Sent By ('. $user->company->name .'). Please login to www.ogeo.me');
                                }
                            }
                        }
                    } else {
                        $VendorUserMissing = true;
                    }
                }   
                

                if($VendorUserMissing){
                    return response()->json([
                        "messageTitle"  => 'Auction Initiated Successfully.',
                        "message"       => 'Auction Initiated Successfully But the selected Vendor(s) does not have email access setup.',
                        "messageType"   => 'warning'
                    ], 200);
                } else {
                    return response()->json([
                        "messageTitle"  => 'Auction Initiated Successfully.',
                        "message"       => 'Auction Initiated Successfully. Vendor(s) are notified.',
                        "messageType"   => 'success'
                    ], 200);
                }
                
            }
        }


        if($request->get('RequestType') == "RC"){

            if($request->get('SourcingType') == 'Sealed Bid'){

                $RfPEnquiries = array_map('intval', $request->get('RfPEnquiries'));
                $SelectedVendors = array_map('intval', $request->get('SelectedVendors'));

                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('QuotationDate')[0]);
                if($startDateTemp->gte(Carbon::now())){
                    $RfPAssignedStatus = 'Request for Proposals Queued';
                } else {
                    $RfPAssignedStatus = 'Request for Proposals Floated';
                }

                $NewQuotation = QuotationRequest::create([
                    'quotation_group_id'    => $GroupId,
                    'quotation_ingroup_id'  => $InGroupId,
                    'created_by'            => $user->id,
                    'company_id'            => $user->company_id,
                    'project_id'            => $QuotationProjectID,
                    'quotation_type'        => $request->get('RFQType'),
                    'quotation_for'         => "RC",
                    'start_date'            => $request->get('QuotationDate')[0],
                    'end_date'              => $request->get('QuotationDate')[1],
                    'rfp_name'              => $request->get('RFPName'),
                    'rfi_start_date'        => $request->get('RFIDate')[0],
                    'rfi_end_date'          => $request->get('RFIDate')[1],
                    'sourcing_type'         => $request->get('SourcingType'),
                    'status'                => $RfPAssignedStatus,
                ]);

                $NewQuotation->rateContractRequests()->attach($RfPEnquiries);
                

                //update purchase enquiries status
                RateContractRequest::whereIn('id', $request->get('RfPEnquiries'))->update([
                    'status' => 'Request for Proposals Floated',
                ]);

                //Create vendor submission status tracker
                $NewQuotation->Vendors()->attach($SelectedVendors, ['company_id' => $user->company_id, 'status' => 'Request for Proposals Not Yet Viewed']);
                foreach ($SelectedVendors as $key => $VendorId) {
                    QuotationResponseTracker::create([
                        'vendor_id'     => $VendorId,
                        'company_id'    => $user->company_id,
                        'quotation_id'  => $NewQuotation->id,
                        'status'        => 'Request for Proposals Not Yet Viewed',
                    ]);
                }
                
                //add history records for the change status
                foreach ($request->get('RfPEnquiries') as $key => $RfPEnquiryId) {
                    ApprovalRateContractRequestHistory::create([
                        'company_id'                => $user->company_id,
                        'rate_contract_request_id'  => $RfPEnquiryId,
                        'description'               => 'Request for Proposals Floated',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Quotations From Vendors',
                        'current_approval_level'    => 'N/A',
                        'next_approval_level'       => 'N/A',
                        'decision'                  => 'N/A',
                        'decision_notes'            => 'N/A',
                    ]);
                }
                
                $VendorUserMissing = false;
                //notify vendors and check if user access exists for these vendors
                $vendors = Vendor::whereIn('id', $request->get('SelectedVendors'))->get();
                foreach ($vendors as $key => $vendor) {
                    if($vendor->users->count()){
                        foreach ($vendor->users as $key => $BiddingUser) {
                            if($BiddingUser->pivot->sbm_role == 'Yes'){
                                $BiddingUser->notify(new newRFQFloatedNotification());
                                // if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                                //     error_reporting(E_ERROR | E_WARNING | E_PARSE);
                                //     Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Quotation Request For Your Review Sent By ('. $user->company->name .'). Please login to www.ogeo.me');
                                // }
                            }
                        }
                    } else {
                        $VendorUserMissing = true;
                    }
                    
                }   
                


                if($VendorUserMissing){
                    return response()->json([
                        "messageTitle"  => 'Quotation Created Successfully.',
                        "message"       => 'Quotation Created Successfully But the selected Vendor(s) does not have email access setup.',
                        "messageType"   => 'warning'
                    ], 200);
                } else {
                    return response()->json([
                        "messageTitle"  => 'Quotation Created Successfully.',
                        "message"       => 'Quotation Created Successfully. Vendor(s) are notified.',
                        "messageType"   => 'success'
                    ], 200);
                }
                
            }


            /* Handle Live Auctions */
            if($request->get('SourcingType') == 'Live Auctions'){

                $RfPEnquiries = array_map('intval', $request->get('RfPEnquiries'));
                $SelectedVendors = array_map('intval', $request->get('SelectedVendors'));

                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('QuotationDate')[0]);
                if($startDateTemp->gte(Carbon::now())){
                    $RfPAssignedStatus = 'Request for Proposals Queued';
                } else {
                    $RfPAssignedStatus = 'Request for Proposals Floated';
                }

                $NewQuotation = QuotationRequest::create([
                    'quotation_group_id'    => $GroupId,
                    'quotation_ingroup_id'  => $InGroupId,
                    'created_by'            => $user->id,
                    'company_id'            => $user->company_id,
                    'project_id'            => $QuotationProjectID,
                    'quotation_type'        => $request->get('RFQType'),
                    'quotation_for'         => "RC",
                    'start_date'            => $request->get('QuotationDate')[0],
                    'end_date'              => $request->get('QuotationDate')[1],
                    'rfp_name'              => $request->get('RFPName'),
                    'rfi_start_date'        => $request->get('RFIDate')[0],
                    'rfi_end_date'          => $request->get('RFIDate')[1],
                    'sourcing_type'         => $request->get('SourcingType'),
                    'status'                => $RfPAssignedStatus,
                ]);

                $NewQuotation->rateContractRequests()->attach($RfPEnquiries);

                //update purchase enquiries status
                RateContractRequest::whereIn('id', $request->get('RfPEnquiries'))->update([
                    'status' => 'Auction Started',
                ]);

                //Create vendor submission status tracker
                $NewQuotation->Vendors()->attach($SelectedVendors, ['company_id' => $user->company_id, 'status' => 'Request for Proposals Not Yet Viewed']);
                foreach ($SelectedVendors as $key => $VendorId) {
                    QuotationResponseTracker::create([
                        'vendor_id'     => $VendorId,
                        'company_id'    => $user->company_id,
                        'quotation_id'  => $NewQuotation->id,
                        'status'        => 'Request for Proposals Not Yet Viewed',
                    ]);
                }
                
                //add history records for the change status
                foreach ($request->get('RfPEnquiries') as $key => $PurchaseEnquiryId) {
                    ApprovalRateContractRequestHistory::create([
                        'company_id'                => $user->company_id,
                        'rate_contract_request_id'  => $PurchaseEnquiryId,
                        'description'               => 'Request for Proposals Floated',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Quotations From Vendors',
                        'current_approval_level'    => 'N/A',
                        'next_approval_level'       => 'N/A',
                        'decision'                  => 'N/A',
                        'decision_notes'            => 'N/A',
                    ]);
                }
                
                $VendorUserMissing = false;
                //notify vendors and check if user access exists for these vendors
                $vendors = Vendor::whereIn('id', $request->get('SelectedVendors'))->get();
                foreach ($vendors as $key => $vendor) {
                    if($vendor->users->count()){
                        foreach ($vendor->users as $key => $BiddingUser) {
                            if($BiddingUser->pivot->sbm_role == 'Yes'){
                                $BiddingUser->notify(new newAuctionFloatedNotification($NewQuotation));
                                // if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                                //     error_reporting(E_ERROR | E_WARNING | E_PARSE);
                                //     Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Auction For Your Review Sent By ('. $user->company->name .'). Please login to www.ogeo.me');
                                // }
                            }
                        }
                    } else {
                        $VendorUserMissing = true;
                    }
                }   
                

                if($VendorUserMissing){
                    return response()->json([
                        "messageTitle"  => 'Auction Initiated Successfully.',
                        "message"       => 'Auction Initiated Successfully But the selected Vendor(s) does not have email access setup.',
                        "messageType"   => 'warning'
                    ], 200);
                } else {
                    return response()->json([
                        "messageTitle"  => 'Auction Initiated Successfully.',
                        "message"       => 'Auction Initiated Successfully. Vendor(s) are notified.',
                        "messageType"   => 'success'
                    ], 200);
                }
            }
        }

    	
    }

    public function createRFIMessage(Request $request){

        $user = $request->user();
        $VendorId = $request->get('VendorId');

        if($request->get('QuotationType') == "PE"){

            $RFIDetails = RFICommunication::create([
                'user_id'           => $user->id,
                'user_type'         => $request->get('ReplyBy'),
                'vendor_id'         => 0,
                'company_id'        => $request->get('CompanyId'),
                'quotation_id'      => $request->get('QuotationId'),
                'pe_id'             => $request->get('PEId'),
                'reply_id'          => $request->get('RFIMessageID'),
                'message'           => $request->get('RFImessage')
            ]);

            //Notifiy the originator about the response (optional)
            // $PE = PurchaseEnquiry::findOrFail($request->get('PEId'));
            // $PE->creator->notify(new CompanyRFIResponseNotification($RFIDetails));


            //send notification to all vendor users under bidding role for the specific company
            // $VendorBiddingUsers = Vendor::where('id', $request->get('VendorId')->whereHas('users', function ($query) {
            //     $query->where('sbm_role', 'Yes');
            // })->first()->users;
            
            // foreach ($VendorBiddingUsers as $key => $VendorUser) {
            //     $VendorUser->notify(new CompanyRFIResponseNotification($RFIDetails));
            // }
            
            //update quotation tracker and vendor pivot table status
            //QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $VendorId)->wherePivot('company_id', $request->get('CompanyId'))->updateExistingPivot($VendorId, ['status' => 'Request for Proposals Not Yet Viewed']);
            
            //QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $VendorId)->where('company_id', $request->get('CompanyId'))->update([  'status' => 'RFI Responded' ]);


            //feedback to user
            return response()->json([
                "messageTitle"  => 'RFI Response Submitted Successfully.',
                "message"       => 'Your Response has been submitted successfully, the vendor is notified by email to view the response.',
                "messageType"   => 'success'
            ], 200);

        }


        if($request->get('QuotationType') == "RC"){
            $RFIDetails = RCRFICommunication::create([
                'user_id'           => $user->id,
                'user_type'         => $request->get('ReplyBy'),
                'vendor_id'         => $VendorId,
                'company_id'        => $request->get('CompanyId'),
                'quotation_id'      => $request->get('QuotationId'),
                'rc_id'             => $request->get('PEId'),
                'reply_id'          => $request->get('RFIMessageID'),
                'message'           => $request->get('RFImessage')
            ]);

            //Notifiy the originator about the response (optional)
            // $PE = PurchaseEnquiry::findOrFail($request->get('PEId'));
            // $PE->creator->notify(new CompanyRFIResponseNotification($RFIDetails));


            //send notification to all vendor users under bidding role for the specific company
            $VendorBiddingUsers = Vendor::where('id', $request->get('VendorId'))->whereHas('users', function ($query) {
                $query->where('sbm_role', 'Yes');
            })->first()->users;
            
            foreach ($VendorBiddingUsers as $key => $VendorUser) {
                $VendorUser->notify(new CompanyRCRFIResponseNotification($RFIDetails));
            }
            
            //update quotation tracker and vendor pivot table status
            QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $VendorId)->wherePivot('company_id', $request->get('CompanyId'))->updateExistingPivot($VendorId, ['status' => 'Request for Proposals Not Yet Viewed']);
            
            QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $VendorId)->where('company_id', $request->get('CompanyId'))->update([
                    'status' => 'RFI Responded'
            ]);


            //feedback to user
            return response()->json([
                "messageTitle"  => 'RFI Response Submitted Successfully.',
                "message"       => 'Your Response has been submitted successfully, the vendor is notified by email to view the response.',
                "messageType"   => 'success'
            ], 200);
        }

    }

    public function modifyQuotationRequest(Request $request)
    {
        $user = $request->user();

        /* Check if the use only intend to extend the RfI date */
        if($request->get('ExtendedRfIDate') != ""){
            $VendorUserMissing = false;
            //Modify The Quoation End Date
            $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));
            if(is_array($request->get('ExtendedRfIDate'))) {
                $QuotationRequest->update([
                    'rfi_start_date' => $request->get('ExtendedRfIDate')[0],
                    'rfi_end_date' => $request->get('ExtendedRfIDate')[1],
                ]);
            } else {
                $QuotationRequest->update([
                    'rfi_end_date' => $request->get('ExtendedRfIDate'),
                ]);
            }
            

            //Notifiy All Existing Vendors about date change
            foreach ($QuotationRequest->Vendors as $key => $Vendor) {
                foreach ($Vendor->users as $key => $VendorUser) {
                    if($VendorUser->pivot->sbm_role == "Yes"){
                        $VendorUser->notify(new QuotationRfIDateChangeNotification($QuotationRequest));
                    }
                }
            }

            /* add the history record on every PE*/
            foreach ($QuotationRequest->purchaseEnquiries as $key => $purchaseEnquiry) {
                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $purchaseEnquiry->id,
                    'current_action_description'    => 'RfI Timeframe has been modified to '.$QuotationRequest->rfi_end_date->format('d.M.Y - (H:i:s)'),
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => 'N/A',
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                    'next_action_description'       => 'N/A',
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);
            }

        }

        // We are here for date extension only
        if(empty($request->get('AddedVendors')) && $request->get('ExtendedDate') != ""){
            $VendorUserMissing = false;
            
            //Modify The Quoation End Date
            

            $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));
            
            if(is_array($request->get('ExtendedDate'))){
                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('ExtendedDate')[0]);
            } else {
                $startDateTemp = $QuotationRequest->start_date;
            }

            if($startDateTemp->gte(Carbon::now())){
                $RfPAssignedStatus = 'Request for Proposals Queued';
            } else {
                $RfPAssignedStatus = 'Request for Proposals Floated';
            }

            if(is_array($request->get('ExtendedDate'))){
                $QuotationRequest->update([
                    'start_date' => $request->get('ExtendedDate')[0],
                    'end_date' => $request->get('ExtendedDate')[1],
                    'status' => $RfPAssignedStatus,
                ]);
            } else {
                $QuotationRequest->update([
                    'end_date' => $request->get('ExtendedDate'),
                ]);
            }


            //Notifiy All Existing Vendors about date change
            foreach ($QuotationRequest->Vendors as $key => $Vendor) {
                foreach ($Vendor->users as $key => $VendorUser) {
                    if($VendorUser->pivot->sbm_role == "Yes"){
                        $VendorUser->notify(new QuotationDateChangeNotification($QuotationRequest));
                    }
                }
            }

            /* add the history record on every PE*/
            foreach ($QuotationRequest->purchaseEnquiries as $key => $purchaseEnquiry) {
                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $purchaseEnquiry->id,
                    'current_action_description'    => 'RfP Timeframe has been modified to '.$QuotationRequest->end_date->format('d.M.Y - (H:i:s)'),
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => 'N/A',
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                    'next_action_description'       => 'N/A',
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);
            }


        } elseif (!empty($request->get('AddedVendors')) && $request->get('ExtendedDate') == "") {
            #we are here for adding Vendors only

            //Add Vendors To Quotation
            $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));
            $SelectedVendors = array_map('intval', $request->get('AddedVendors'));

            foreach ($SelectedVendors as $key => $VendorId) {
                $QuotationRequest->Vendors()->attach($VendorId, ['company_id' => $QuotationRequest->company_id]);

                QuotationResponseTracker::create([
                    'vendor_id'     => $VendorId,
                    'company_id'    => $QuotationRequest->company_id,
                    'quotation_id'  => $QuotationRequest->id,
                    'status'        => 'Request for Proposals Not Yet Viewed',
                ]);
            }


            //Notify New Vendors Only
            $VendorUserMissing = false;
            //notify vendors and check if user access exists for these vendors
            $vendors = Vendor::whereIn('id', $SelectedVendors)->get();
            foreach ($vendors as $key => $vendor) {
                if($vendor->users->count()){
                    foreach ($vendor->users as $key => $BiddingUser) {
                        if($BiddingUser->pivot->sbm_role == 'Yes'){
                            $BiddingUser->notify(new newRFQFloatedNotification());
                            // if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                            //     error_reporting(E_ERROR | E_WARNING | E_PARSE);
                            //     Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Quotation Request For Your Review Sent By ('. $QuotationRequest->company->name .'). Please login to www.ogeo.me');
                            // }
                        }
                    }
                } else {
                    $VendorUserMissing = true;
                }
            }  


            /* add the history record on every PE*/
            foreach ($QuotationRequest->purchaseEnquiries as $key => $purchaseEnquiry) {
                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $purchaseEnquiry->id,
                    'current_action_description'    => 'New Vendor(s) have been added to the list of consulted vendors',
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => 'N/A',
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                    'next_action_description'       => 'N/A',
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);
            } 
            

            
        } elseif (!empty($request->get('AddedVendors')) && $request->get('ExtendedDate') != "") {
            #we are here for adding Vendors and extending date

            /* Handles Date Change */
            //Modify The Quoation End Date
            $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));

            if(is_array($request->get('ExtendedDate'))){
                $startDateTemp = Carbon::createFromFormat('Y-m-d H:i:s', $request->get('ExtendedDate')[0]);
            } else {
                $startDateTemp = $QuotationRequest->start_date;
            }

            if($startDateTemp->gte(Carbon::now())){
                $RfPAssignedStatus = 'Request for Proposals Queued';
            } else {
                $RfPAssignedStatus = 'Request for Proposals Floated';
            }

            if(is_array($request->get('ExtendedDate'))){
                $QuotationRequest->update([
                    'start_date' => $request->get('ExtendedDate')[0],
                    'end_date' => $request->get('ExtendedDate')[1],
                    'status' => $RfPAssignedStatus,
                ]);
            } else {
                $QuotationRequest->update([
                    'end_date' => $request->get('ExtendedDate'),
                ]);
            }

            //Notifiy Existing Vendors about date change
            foreach ($QuotationRequest->Vendors as $key => $Vendor) {
                foreach ($Vendor->users as $key => $VendorUser) {
                    if($VendorUser->pivot->sbm_role == "Yes"){
                        $VendorUser->notify(new QuotationDateChangeNotification($QuotationRequest));
                    }
                }
            }

            /* Handles Vendor Addition */
            //Add Vendors To Quotation
            $SelectedVendors = array_map('intval', $request->get('AddedVendors'));
            foreach ($SelectedVendors as $key => $VendorId) {
                $QuotationRequest->Vendors()->attach($VendorId, ['company_id' => $QuotationRequest->company_id]);

                QuotationResponseTracker::create([
                    'vendor_id'     => $VendorId,
                    'company_id'    => $QuotationRequest->company_id,
                    'quotation_id'  => $QuotationRequest->id,
                    'status'        => 'Request for Proposals Not Yet Viewed',
                ]);
            }

            //Notifiy New Existing Vendors
            $VendorUserMissing = false;
            //notify vendors and check if user access exists for these vendors
            $vendors = Vendor::whereIn('id', $SelectedVendors)->get();
            foreach ($vendors as $key => $vendor) {
                if($vendor->users->count()){
                    foreach ($vendor->users as $key => $BiddingUser) {
                        if($BiddingUser->pivot->sbm_role == 'Yes'){
                            $BiddingUser->notify(new newRFQFloatedNotification());
                            // if(substr($vendor->mobile, 0, 2) === '+1' && strlen($vendor->mobile) == 12){
                            //     error_reporting(E_ERROR | E_WARNING | E_PARSE);
                            //     Twilio::message($vendor->mobile, 'Hi '. $vendor->name .', You Have New Quotation Request For Your Review Sent By ('. $QuotationRequest->company->name .'). Please login to www.ogeo.me');
                            // }
                        }
                    }
                } else {
                    $VendorUserMissing = true;
                }
            } 


            /* add the history record on every PE*/
            foreach ($QuotationRequest->purchaseEnquiries as $key => $purchaseEnquiry) {
                ApprovalPurchaseEnquiryHistory::create([
                    'company_id'                    => $user->company_id,
                    'purchase_enquiry_id'           => $purchaseEnquiry->id,
                    'current_action_description'    => 'New Vendor(s) have been added to the list of consulted vendors and the end date was modified to '.$QuotationRequest->end_date->format('d.M.Y - (H:i:s)'),
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => 'N/A',
                    'decision'                      => 'N/A',
                    'decision_notes'                => 'N/A',
                    'next_action_description'       => 'N/A',
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);
            } 

  
        }

        //feedback to user
        if($VendorUserMissing){
            return response()->json([
                "messageTitle"  => 'Request for Proposals Modified Successfully.',
                "message"       => 'Request for Proposals Modified Successfully but the selected Vendor(s) does not have email access setup. Add users to vendor so vendor can view the Request for Proposals.',
                "messageType"   => 'warning'
            ], 200);
        } else {
            return response()->json([
                "messageTitle"  => 'Request for Proposals Modified Successfully.',
                "message"       => 'Request for Proposals Modified Successfully. Vendor(s) are notified.',
                "messageType"   => 'success'
            ], 200);

        }

    }


    public function cancelQuotationRequest(Request $request){

        $user = $request->user();

        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));

        $QuotationRequest->update([
            'cancellation_notes'    => $request->get('CancellationNotes'),
            'status'                => "Request for Proposals cancelled",
        ]);

        // purchase_enquiries update actions
        foreach ($QuotationRequest->purchaseEnquiries as $key => $purchaseEnquiry) {

            $purchaseEnquiry->status = "Send for a New Request for Proposals";
            $purchaseEnquiry->save();

            $QuotationRequest->purchaseEnquiries()->updateExistingPivot($purchaseEnquiry->id, ['status' => 'Request for Proposals cancelled']);

            ApprovalPurchaseEnquiryHistory::create([
                'company_id'                    => $user->company_id,
                'purchase_enquiry_id'           => $purchaseEnquiry->id,
                'current_action_description'    => 'Send for a New Request for Proposals',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'Cancelled',
                'decision_notes'                => $request->get('CancellationNotes'),
                'next_action_description'       => 'Purchase Enquiry line under review by the Request For Proposal administrator',
                'next_action_owners'            => 'Request for Proposals Administrator(s)',
                'next_approval_level'           => 'N/A',
            ]);
        }
            

        //Notifiy Existing Vendors about the cancellation
        foreach ($QuotationRequest->Vendors as $key => $Vendor) {
            foreach ($Vendor->users as $key => $VendorUser) {
                if($VendorUser->pivot->sbm_role == "Yes"){
                    $VendorUser->notify(new QuotationCancelledNotification($QuotationRequest));
                }
            }
        }


        return response()->json([
            "messageTitle"  => 'Request for Prposals Cancelled Successfully.',
            "message"       => 'Request for Prposals Cancelled Successfully and Vendor(s) are notified.',
            "messageType"   => 'success'
        ], 200);

    }




    public function submitCommercialEvaluation(Request $request)
    {
        $user = $request->user();

        if($request->get('QuotationType') == "PE"){

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
    
            
            // create Commercial Evaluation
            $commericalEvaluation = CommercialEvaluation::create([
                'commerical_evaluation_group_id'                => $GroupId,
                'commerical_evaluation_ingroup_id'              => $InGroupId,
                'evaluator_id'                                  => $user->id,
                'company_id'                                    => $request->get('PECompanyId'),
                'quotation_id'                                  => $request->get('QuotationID'),
                'quotation_notes'                               => $request->get('CEGeneralNotes'),
            ]);

            // update quotation status
            QuotationRequest::findOrFail($request->get('QuotationID'))->update(['status' => 'Commercial Evaluation Submitted']);
            $QouteRequest = QuotationRequest::with('purchaseEnquiries', 'vendorResponses')->findOrFail($request->get('QuotationID'));
                

            foreach ($request->get('CEDetails') as $key => $PERecommendation) {

                // Attach purchase enquiries with vendor responses only
                if($QouteRequest->vendorResponses->where('purchase_enquiry_id', $PERecommendation['PELineID'])->every(function ($value, $key) { return $value->price == null; })){
                    
                    PurchaseEnquiry::findOrfail($PERecommendation['PELineID'])->update([
                        'status' => 'Send for a New Request for Proposals',
                    ]);

                    // Update the status of each PE line in the pivot table of Quotation Request
                    $QouteRequest->purchaseEnquiries()->updateExistingPivot($PERecommendation['PELineID'], ['status' => 'Purchase Enquiry has no submitted vendor responses']);

                } else {


                    $commericalEvaluation->purchaseEnquiries()->attach($PERecommendation['PELineID'], ['pe_note' => $PERecommendation['PELineNote']]);

                    // Update the status of each PE line in the pivot table of Quotation Request
                    $QouteRequest->purchaseEnquiries()->updateExistingPivot($PERecommendation['PELineID'], ['status' => 'Commercial Evaluation Submitted']);


                    // Change the status of the PE 
                    PurchaseEnquiry::findOrfail($PERecommendation['PELineID'])->update([
                        'status' => 'Commercial Evaluation submitted',
                    ]);

                    

                }
                
            }


            //update quotation tracker status to submitted Vendors
            $QouteRequestSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($request) {
                $query->wherePivot('company_id', $request->get('PECompanyId'))->wherePivot('status', 'FABO Submitted');
            }])->whereHas('Vendors', function ($query1) use ($request) {
                $query1->where('quotationrequests_vendors.company_id', $request->get('PECompanyId'))->where('quotationrequests_vendors.status', 'FABO Submitted');
            })->find($request->get('QuotationID'));

            if(!empty($QouteRequestSubmittedVendors)){
                foreach ($QouteRequestSubmittedVendors->Vendors as $key => $QouteRequestSubmittedVendor) {
                    $QouteRequestSubmittedVendor->pivot->status = 'Quotation Ended';
                    $QouteRequestSubmittedVendor->pivot->update();

                    //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                    // QuotationResponseTracker::where('quotation_id', $request->get('QuotationID'))->where('vendor_id', $QouteRequestSubmittedVendor->id)->where('company_id', $request->get('PECompanyId'))->update([
                    //         'status' => 'Quotation Ended'
                    // ]);
                }
            }



            //update quotation tracker status to non-submitted Vendors
            $QouteRequestNoneSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($request) {
                $query->wherePivot('company_id', $request->get('PECompanyId'))->wherePivot('status', '!=', 'FABO Submitted');
            }])->whereHas('Vendors', function ($query1) use ($request) {
                $query1->where('quotationrequests_vendors.company_id', $request->get('PECompanyId'))->where('quotationrequests_vendors.status', '!=', 'FABO Submitted');
            })->find($request->get('QuotationID'));

            if(!empty($QouteRequestNoneSubmittedVendors)){
                foreach ($QouteRequestNoneSubmittedVendors->Vendors as $key => $QouteRequestNoneSubmittedVendor) {
                    $QouteRequestNoneSubmittedVendor->pivot->status = 'Commercial Evaluation Submitted';
                    $QouteRequestNoneSubmittedVendor->pivot->update();

                    //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                    // QuotationResponseTracker::where('quotation_id', $request->get('QuotationID'))->where('vendor_id', $QouteRequestNoneSubmittedVendor->id)->where('company_id', $request->get('PECompanyId'))->update([
                    //         'status' => 'Commercial Evaluation Submitted'
                    // ]);
                }
            }


            

            //notify the originator
            $PEUser = PurchaseEnquiry::findOrFail($request->get('CEDetails')[0]['PELineID'])->creator;
            $PEUser->notify(new CommericalEvaluationSubmittedNotification());
            
            //feedback to to user
            return response()->json([
                "messageTitle"  => 'Commercial Evaluation Submitted.',
                "message"       => 'Commercial Evaluation has been submitted successfully, The requester will be notify for vendor selection.',
                "messageType"   => 'success'
            ], 200);
        }




        if($request->get('QuotationType') == "RC"){

            $user = $request->user();

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
                'company_id'                                    => $request->get('PECompanyId'),
                'quotation_id'                                  => $request->get('QuotationID'),
                'quotation_notes'                               => $request->get('CEGeneralNotes'),
            ]);

            //update quotation status
            QuotationRequest::findOrFail($request->get('QuotationID'))->update(['status' => 'Commercial Evaluation Submitted']);
            $QouteRequest = QuotationRequest::findOrFail($request->get('QuotationID'));

            foreach ($request->get('CEDetails') as $key => $PERecommendation) {
                $commericalEvaluation->rateContractRequests()->attach($PERecommendation['PELineID'], ['rc_note' => $PERecommendation['PELineNote']]);

                //update the status of each PE line in the pivot table of Quotation Request
                $QouteRequest->rateContractRequests()->updateExistingPivot($PERecommendation['PELineID'], ['status' => 'Commercial Evaluation Submitted']);
            }


            //update quotation tracker status to submitted Vendors
            $QouteRequestSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($request) {
                $query->wherePivot('company_id', $request->get('PECompanyId'))->wherePivot('status', 'FABO Submitted');
            }])->whereHas('Vendors', function ($query1) use ($request) {
                $query1->where('quotationrequests_vendors.company_id', $request->get('PECompanyId'))->where('quotationrequests_vendors.status', 'FABO Submitted');
            })->find($request->get('QuotationID'));

            if(!empty($QouteRequestSubmittedVendors)){
                foreach ($QouteRequestSubmittedVendors->Vendors as $key => $QouteRequestSubmittedVendor) {
                    $QouteRequestSubmittedVendor->pivot->status = 'Quotation Ended';
                    $QouteRequestSubmittedVendor->pivot->update();

                    //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                    $test = QuotationResponseTracker::where('quotation_id', $request->get('QuotationID'))->where('vendor_id', $QouteRequestSubmittedVendor->id)->where('company_id', $request->get('PECompanyId'))->update([
                            'status' => 'Quotation Ended'
                    ]);
                }
            }



            //update quotation tracker status to non-submitted Vendors
            $QouteRequestNoneSubmittedVendors = QuotationRequest::with(['Vendors' => function ($query) use ($request) {
                $query->wherePivot('company_id', $request->get('PECompanyId'))->wherePivot('status', '!=', 'FABO Submitted');
            }])->whereHas('Vendors', function ($query1) use ($request) {
                $query1->where('quotationrequests_vendors.company_id', $request->get('PECompanyId'))->where('quotationrequests_vendors.status', '!=', 'FABO Submitted');
            })->find($request->get('QuotationID'));

            if(!empty($QouteRequestNoneSubmittedVendors)){
                foreach ($QouteRequestNoneSubmittedVendors->Vendors as $key => $QouteRequestNoneSubmittedVendor) {
                    $QouteRequestNoneSubmittedVendor->pivot->status = 'Commercial Evaluation Submitted';
                    $QouteRequestNoneSubmittedVendor->pivot->update();

                    //update Response Tracker (Quotation Ended means quotation is dead for the vendor)
                    QuotationResponseTracker::where('quotation_id', $request->get('QuotationID'))->where('vendor_id', $QouteRequestNoneSubmittedVendor->id)->where('company_id', $request->get('PECompanyId'))->update([
                            'status' => 'Commercial Evaluation Submitted'
                    ]);
                }
            }


            //notify the originators of each Rate Contract Request
            $PEUser = RateContractRequest::findOrFail($request->get('CEDetails')[0]['PELineID'])->creator;
            $PEUser->notify(new CommericalEvaluationSubmittedNotification());


            // /* Notify all users with RCO role for each request within each project */
            // foreach ($request->get('CEDetails') as $key => $CEDetails) {
            //     $RateContractRequests[] = RateContractRequest::findOrFail($CEDetails['PELineID']);
            // }
            // // Fron $RateContractRequest projects RCO roles and send them email.
            // foreach ($RateContractRequests as $key => $RateContractRequest) {
            //     $usersIdsWithRCO[] = Role::where('company_id', $user->company_id)->where('project_id', $RateContractRequest->project_id)->where('role_name', 'RCO')->where('role_level', 1)->distinct()->pluck('user_id');
            // }
            

            
            //feedback to to user
            return response()->json([
                "messageTitle"  => 'Commercial Evaluation Submitted.',
                "message"       => 'Commercial Evaluation has been submitted successfully, The requester will be notify for vendor selection.',
                "messageType"   => 'success'
            ], 200);
        }





    }


    public function cancelCEPELines(Request $request)
    {
        $user = $request->user();


        foreach ($request->get('CancelledPELines') as $PEID => $PE_CE_Note) {
            DB::table('purchase_enquiry_commerical_evaluation_pivot')->select('*')->where('pe_id', $PEID)->update([
                'status'        => 'Purchase Enquiry line cancelled',
                'ce_pe_notes'   => $PE_CE_Note,
            ]);
        }

        
        // purchase_enquiries update status (change front end to read the status 'CE Rejected')
        PurchaseEnquiry::whereIn('id', array_keys($request->get('CancelledPELines')))->update([
            'status' => 'Purchase Enquiry line cancelled',
        ]);
        
        // purchase_enquiries update actions
        foreach ($request->get('CancelledPELines') as $key => $value) {
            ApprovalPurchaseEnquiryHistory::create([
                'company_id'                    => $user->company_id,
                'purchase_enquiry_id'           => $key,
                'current_action_description'    => 'Purchase Enquiry line cancelled',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'Cancelled',
                'decision_notes'                => $value,
                'next_action_description'       => 'N/A',
                'next_action_owners'            => 'N/A',
                'next_approval_level'           => 'N/A',
            ]);
        }
        
        // quotation_commerical_evaluations update status
        // if the total count of the processed lines are + the count of the rejected line equals to total number of CE PE lines then change the status to 'Commercial Evaluation fully executed' otherwise the status changes to 'Commercial Evaluation partially executed'.
        $totalCountOfProcessedCELine = DB::table('purchase_enquiry_commerical_evaluation_pivot')->select('*')->whereIn('pe_id', array_keys($request->get('CancelledPELines')))->update([
            'status' => 'Purchase Enquiry line cancelled',
        ]);


        $CommercialEvaluation = CommercialEvaluation::with('purchaseEnquiries')->FindOrFail($request->get('CEID'));

        if(count($CommercialEvaluation->purchaseEnquiries->whereIn('status', ['Send for a New Request for Proposals', 'Purchase Enquiry line cancelled', 'Purchase Order Created'])) == count($CommercialEvaluation->purchaseEnquiries)){
            $CommercialEvaluation->update([
                'status' => 'Commercial Evaluation fully executed'
            ]);
        } else {
            $CommercialEvaluation->update([
                'status' => 'Commercial Evaluation partially executed'
            ]);
        }


        return response()->json([
            "messageTitle"  => 'Select lines cancelled successfully.',
            "message"       => 'The cancelled PE lines will no longer be available for any future actions.',
            "messageType"   => 'success'
        ], 200);

    }
    

    // Reject commercial evaluation line
    public function rejectCEPELinesForNewRFP(Request $request)
    {
        $user = $request->user();
        
        //dd(array_keys($request->get('CancelledPELines')));

        // purchase_enquiry_commerical_evaluation_pivot update status

        foreach ($request->get('CancelledPELines') as $PEID => $PE_CE_Note) {
            DB::table('purchase_enquiry_commerical_evaluation_pivot')->select('*')->where('pe_id', $PEID)->update([
                'status'        => 'Send for a New Request for Proposals',
                'ce_pe_notes'   => $PE_CE_Note,
            ]);
        }

        
        // purchase_enquiries update status (change front end to read the status 'CE Rejected')
        PurchaseEnquiry::whereIn('id', array_keys($request->get('CancelledPELines')))->update([
            'status' => 'Send for a New Request for Proposals',
        ]);
        
        // purchase_enquiries update actions
        foreach ($request->get('CancelledPELines') as $key => $value) {
            ApprovalPurchaseEnquiryHistory::create([
                'company_id'                    => $user->company_id,
                'purchase_enquiry_id'           => $key,
                'current_action_description'    => 'Purchase Enquiry line send for new Request for Proposals',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'Rejected',
                'decision_notes'                => $value,
                'next_action_description'       => 'Purchase Enquiry line under review by the Request For Proposal administrator',
                'next_action_owners'            => 'Request For Proposal administrator(s)',
                'next_approval_level'           => 'N/A',
            ]);
        }
        
        // quotation_commerical_evaluations update status
        // if the total count of the processed lines are + the count of the rejected line equals to total number of CE PE lines then change the status to 'Commercial Evaluation fully executed' otherwise the status changes to 'Commercial Evaluation partially executed'.
        $totalCountOfProcessedCELine = DB::table('purchase_enquiry_commerical_evaluation_pivot')->select('*')->whereIn('pe_id', array_keys($request->get('CancelledPELines')))->update([
            'status' => 'Send for a New Request for Proposals',
        ]);


        $CommercialEvaluation = CommercialEvaluation::with('purchaseEnquiries')->FindOrFail($request->get('CEID'));

        if(count($CommercialEvaluation->purchaseEnquiries->whereIn('status', ['Send for a New Request for Proposals', 'Purchase Enquiry line cancelled', 'Purchase Order Created'])) == count($CommercialEvaluation->purchaseEnquiries)){
            $CommercialEvaluation->update([
                'status' => 'Commercial Evaluation fully executed'
            ]);
        } else {
            $CommercialEvaluation->update([
                'status' => 'Commercial Evaluation partially executed'
            ]);
        }


        // Email Notification to RFP and/or PE originator
        

        //feedback to to user
        return response()->json([
            "messageTitle"  => 'Select lines sent for new Request for Proposals successfully.',
            "message"       => 'The selected lines will be avaialable for new a Request for Proporals creation.',
            "messageType"   => 'success'
        ], 200);
    }


    public function createPurchaseOrder(Request $request)
    {

        $user = $request->user();
        
        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationId'));

        //Assing grouping Id Per company
        $LastestPERecord = PurchaseOrder::where('company_id', $user->company_id)->orderBy('purchase_order_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->purchase_order_group_id + 1;
            $InGroupId = $LastestPERecord->purchase_order_group_id + 1;
        }

        /* Check of the available budget Start */
        $Project = Project::where('company_id', $user->company_id)->where('id', $QuotationRequest->project_id)->get()->first();
        $quoationVendorResponsesValues = QuotationResponse::where('company_id', $user->company_id)->where('vendor_id', $request->get('VendorId'))->where('quotation_id', $request->get('QuotationId'))->whereIn('purchase_enquiry_id', $request->get('SelectedPEs'))->get();
        $ProjectBudget = $Project->value;
        $CurrentConsumedBudget = $Project->consumed_budget;
        $CurrentAvailableBudget = $ProjectBudget - $CurrentConsumedBudget;
        $CurrentOrderValue = 0;
        foreach ($quoationVendorResponsesValues as $key => $quoationVendorResponsesValue) {
            $CurrentOrderValue = $quoationVendorResponsesValue->price + $CurrentOrderValue;
        }
        $NewConsumedBudgetValue = $CurrentOrderValue + $CurrentConsumedBudget;
        
        if($NewConsumedBudgetValue > $CurrentAvailableBudget){
            //feedback to to user
            return response()->json([
                "messageTitle"  => 'Budget Not Available. Please Increase Budget To Proceed',
                "message"       => "Project's Current Available Budget Value is ".number_format($CurrentAvailableBudget,2, '.', ',')." ".$Project->currency." and Your Current Order Value Total is ".number_format($CurrentOrderValue,2, '.', ','). " ".$Project->currency,
                "messageType"   => 'info'
            ], 200);

        } else {
            $Project->update(['consumed_budget' => $NewConsumedBudgetValue]);
        }
        /* Check of the available budget End */



        $commericalEvaluation = CommercialEvaluation::where('company_id', $user->company_id)->where('quotation_id', $request->get('QuotationId'))->get()->first();

        //create purchase order
        $PurchaseOrder = PurchaseOrder::create([
            'purchase_order_group_id'       => $GroupId,
            'purchase_order_ingroup_id'     => $InGroupId,
            'company_id'                    => $user->company_id,
            'creator_id'                    => $user->id,
            'project_id'                    => $request->get('ProjectId'),
            'vendor_id'                     => $request->get('VendorId'),
            'quotation_id'                  => $request->get('QuotationId'),
            'commercial_evaluation_id'      => $commericalEvaluation->id,
            'notes'                         => $request->get('PONotes'),
            'approval_level'                => 1,
        ]);
        $PurchaseOrder->purchaseEnquiries()->attach($request->get('SelectedPEs'));

        //find reponses for the selected vendor
        $quoationVendorResponses = QuotationResponse::where('company_id', $user->company_id)->where('vendor_id', $request->get('VendorId'))->where('quotation_id', $request->get('QuotationId'))->whereIn('purchase_enquiry_id', $request->get('SelectedPEs'))->get()->pluck('id');
        $PurchaseOrder->vendorResponses()->attach($quoationVendorResponses);


        //find to whom you should send the notification
        $usersIdsWithPOV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'POV')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithPOV = User::whereIn('id', $usersIdsWithPOV)->get();


        //Record Approval History
        ApprovalPurchaseOrderHistory::create([
            'company_id'                    => $user->company_id,
            'purchase_order_id'             => $PurchaseOrder->id,
            'current_action_description'    => 'Purchase Order Created',
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 1,
            'decision'                      => 'N/A',
            'decision_notes'                => 'N/A',
            'next_action_description'       => 'Purchase Order Under Review By The Purchase order Validator level 1',
            'next_action_owners'            => (implode(', ', $usersWithPOV->pluck('name')->toArray())),
            'next_approval_level'           => 1,
        ]);


        //notify the required user for approval with Role POV
        foreach ($usersWithPOV as $key => $user) {
            $user->notify(new PurchaseOrderCreatedNotification($PurchaseOrder));
        }

        //update status of PE pivot tabel with of the commerical evaluation
        $commericalEvaluation = CommercialEvaluation::where('company_id', $user->company_id)->where('quotation_id', $request->get('QuotationId'))->get()->first();
        foreach ($request->get('SelectedPEs') as $key => $PEId) {
            $commericalEvaluation->purchaseEnquiries()->updateExistingPivot($PEId, ['status' => 'Purchase Order Created']);
        }

        $commericalEvaluationNew = CommercialEvaluation::where('company_id', $user->company_id)->where('quotation_id', $request->get('QuotationId'))->get()->first();


        if($QuotationRequest->purchaseEnquiries->count() == $commericalEvaluationNew->purchaseEnquiriesActionedOnly->count()){
            $commericalEvaluationNew->status = 'Commercial Evaluation fully executed';
            $commericalEvaluationNew->save();
        } else {
            $commericalEvaluationNew->status = 'Commercial Evaluation partially executed';
            $commericalEvaluationNew->save();
        }

        //feedback to to user
        return response()->json([
            "messageTitle"  => 'Purchase Order created.',
            "message"       => 'Purchase Order created successfully, The created purchase order(s) are send for approval.',
            "messageType"   => 'success'
        ], 200);


    }


    public function createPOLineRFIMessage(Request $request){

        $user = $request->user();
        $PO = PurchaseOrder::findOrFail($request->get('POId'));
        $PE = PurchaseEnquiry::findOrFail($request->get('PEId'));
        $Approvers = Role::where('role_name', 'POV')->where('role_level', $PO->approval_level)->get();

        $POLineRFICommunication = POLineRFICommunication::create([
            'user_id'           => $user->id,
            'company_id'        => $user->company_id,
            'po_id'             => $request->get('POId'),
            'pe_id'             => $request->get('PEId'),
            'message'           => $request->get('POLineRFImessage')
        ]);

        if($request->get('By') == 'Requester'){
             //Notifiy the originator about the clarificaiton
            $PE->creator->notify(new PurchaseOrderLineRFINotification($POLineRFICommunication));
        } else {
           //Notifiy the the approver about the clarificaiton response
            foreach ($Approvers as $key => $Approver) {
                $Approver->user->notify(new PurchaseOrderLineRFINotification($POLineRFICommunication));
            }
        }
        
        //update PE-PO pivot table status
        $PO->purchaseEnquiries()->updateExistingPivot($PE->id, ['status' => 'In Clarifications Exchange']);

        //feedback to user
        return response()->json([
            "messageTitle"  => 'Clarification Submitted Successfully.',
            "message"       => 'Clarification has been submitted successfully, the originator will be notified.',
            "messageType"   => 'success'
        ], 200);

    }

    public function POApproval(Request $request)
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

        // return $request->all();

        $user = $request->user();
        $POId = $request->get('POId');
        $TotalPOValue = 0;



        // Get the details of the purchase order
        $OriginalPO = PurchaseOrder::with('creator', 'company', 'vendor', 'project', 'quotation', 'purchaseEnquiries', 'vendorResponses')->findOrFail($request->get('POId'));

        // Get How the approval shall be treated Unit Rate Wise/ PO Line Wise / Whole PO (po_doa_criterion)
        $PODOACriterion = Project::select('po_doa_criterion')->where('company_id', $request->get('CompanyId'))->where('id', $request->get('ProjectId'))->get()->first()->po_doa_criterion;

        // Get the financial limit of this (CURRENT Approver/Submitting User)
        $CurrentLevelPOVFinancialLimits = FinancialLimit::where('company_id', $request->get('CompanyId'))->where('project_id', $request->get('ProjectId'))->where('limit_type', 'POV')->where('level', $request->get('POApprovalLevel'))->where('currency', $request->get('Currency'))->get()->first();


        /*
            
            CASE #1 All Lines Are Rejected (Approval Array is Empty)

        */

        


        if(empty($request->get('ApprovedLines'))){

            # 1. Update status for each PO Rejected Lines
            foreach ($request->get('RejectedLines') as $key => $PEId) {
                $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                    'status' => 'Rejected By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                    'approval_level' => $request->get('POApprovalLevel')
                ]);
            }


            # 2. Update PO Lines status
            $OriginalPO->status = "Fully Rejected";
            $OriginalPO->update();


            # 3. Record History Changes
            ApprovalPurchaseOrderHistory::create([
                'company_id'                => $user->company_id,
                'purchase_order_id'         => $POId,
                'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'Fully Rejected',
                'current_approval_level'    => $request->get('POApprovalLevel'),
                'next_approval_level'       => 'Fully Rejected',
                'decision'                  => 'Fully Rejected',
                'decision_notes'            => 'Approved Line(s): Zero Lines | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
            ]);
            
            # 4. Send notification to originator (Find All Unique Originators For All Enquiry Lines and Send Them Notifications)
            $OriginatorsIdsList = $OriginalPO->purchaseEnquiries->unique('created_by')->pluck('created_by'); 
            $Originators = User::whereIn('id', $OriginatorsIdsList)->get();

            foreach ($Originators as $key => $Originator) {
                $Originator->notify(new PurchaseOrderRejectionNotification($OriginalPO));
            }

            # 5. User FeedBack
            return response()->json([
                "messageTitle"  => 'PO Rejected',
                "message"       => 'PO Rejected Successfully, The PO will will no longer be pursed. Originator Will Be Notified',
                "messageType"   => 'success'
            ], 200);

        }
        
        /* 

            CASE #2 PO Value Criterion:
                - Case 1: Current Level Does have finicial Limit.
                    - Case 1: the po value is within his financial limit
                    - Case 2: the po value is NOT within his fincancial limits
                - Case 2: (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
                    
        */


        if ($PODOACriterion == "PO value"){

            ## Calculate Total PO Value for the approved lines only ## 
            foreach ($request->get('POResponseDetails') as $key => $POLine) {
                if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){
                    $TotalPOValue = $POLine['NewPrice'] + $TotalPOValue;
                }   
            }

            ## Handle Rejected Lines ... Loop through the Rejected Lines and Kill Them By ##
            if(count($request->get('RejectedLines'))){
                # Update status for each PO Rejected Lines
                foreach ($request->get('RejectedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Rejected By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')]);
                }
            }


            //Check if the quantity has changed and record the change in the QuantityChange Model
            foreach ($request->get('POResponseDetails') as $key => $POLine) {
                if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){
                    if($POLine['OldQuantity'] != $POLine['NewQuantity']){
                        //update the quantity of the purchase enquiry
                        //PurchaseEnquiry::findOrFail($POLine['PEId'])->update(['quantity' => $POLine['NewQuantity']]);
                        
                        //Record the quantity changes changes
                        QuantityChange::create([
                            'company_id'        => $user->company_id,
                            'approver_id'       => $user->id,
                            'pe_id'             => $POLine['PEId'],
                            'quotation_id'      => $POLine['quotation_id'],
                            'approval_level'    => $request->get('POApprovalLevel'),
                            'old_quantity'      => $POLine['OldQuantity'],
                            'new_quantity'      => $POLine['NewQuantity'],
                        ]);
                    }
                }
            }


            # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the po value is within his financial limit and 2. po value is not within his fincancial limits).
            if($CurrentLevelPOVFinancialLimits){
                ## We are here because no financial limits where found for this level approver hence he is the final approver ##


                ## check the value of whole PO if within current financial limits and if not notify update that line level ##
                if($CurrentLevelPOVFinancialLimits['limit'] >= $TotalPOValue){
                    ## We are here because the PO value is within currenct approver financial limits hence current approver is the final approval  ##

                    # 1. Update status for each PO Approved Lines
                    foreach ($request->get('ApprovedLines') as $key => $PEId) {
                        $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, ['status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')']);
                    }


                    # 2. Update PO Lines status
                    $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                    $OriginalPO->update();


                    # 3. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Approvals Completed',
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => 'Approvals Completed',
                        'decision'                  => 'Approvals Completed',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);
                    
                    # 4. Send notification to vendor
                    $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                        $query->where('sbm_role', 'Yes');
                    })->first()->users;
                    foreach ($VendorBiddingUsers as $key => $VendorUser) {
                        $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                    }

                    # 5. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'Purchase Order fully approved successfully',
                        "message"       => 'The Purchase Order will be sent to vendor for his accepatance.',
                        "messageType"   => 'success'
                    ], 200);


                } else {
                    # We are here because current approver is NOT the final approval

                    # 1. Update status for each PO Approved Lines
                    foreach ($request->get('ApprovedLines') as $key => $PEId) {
                        $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                            'status' => 'Approval #'.$request->get('POApprovalLevel').' - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                            'approval_level' => $request->get('POApprovalLevel')
                        ]);
                    }

                    # 2. Update PO status
                    $OriginalPO->status = 'Approved By Level: '.$request->get('POApprovalLevel');
                    $OriginalPO->approval_level = $request->get('POApprovalLevel') + 1;
                    $OriginalPO->update();


                    # 3. Get Next Approval Level Users (POV Role) and Send then notifications
                    $usersIdsWithPOV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'POV')->where('role_level', $request->get('POApprovalLevel') + 1)->distinct()->pluck('user_id');
                    $usersWithPOV = User::whereIn('id', $usersIdsWithPOV)->get();
                    foreach ($usersWithPOV as $key => $ApproverPOV) {
                        $ApproverPOV->notify(new PurchaseOrderApprovalRequiredNotification($OriginalPO));
                    }


                    # 4. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => (implode(', ', $usersWithPOV->pluck('name')->toArray())),
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => $request->get('POApprovalLevel') + 1,
                        'decision'                  => 'PO Processed to Next Level',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);


                    # 5. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'Purchase Order approved successfully',
                        "message"       => 'The Purchase Order required additional line of approvals before it will be sent to vendor for accepatance.',
                        "messageType"   => 'success'
                    ], 200);
                }


            # (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
            } else {

                # 1. Update status for each PO Approved Lines
                foreach ($request->get('ApprovedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')
                    ]);
                }


                # 2. Update PO Lines status
                $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                $OriginalPO->update();


                # 3. Record History Changes
                ApprovalPurchaseOrderHistory::create([
                    'company_id'                => $user->company_id,
                    'purchase_order_id'         => $POId,
                    'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Approvals Completed',
                    'current_approval_level'    => $request->get('POApprovalLevel'),
                    'next_approval_level'       => 'Approvals Completed',
                    'decision'                  => 'Approvals Completed',
                    'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                ]);
                
                # 4. Send notification to vendor
                $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                    $query->where('sbm_role', 'Yes');
                })->first()->users;
                foreach ($VendorBiddingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                }


                # 5. User FeedBack
                return response()->json([
                    "messageTitle"  => 'Purchase Order fully approved successfully',
                    "message"       => 'The Purchase Order will be sent to vendor for his accepatance.',
                    "messageType"   => 'success'
                ], 200);              

            }



        /* 

            CASE #3 Unit Rate Value 
                - Case 1: Current Level Does have finicial Limit.
                     - Case 1: the unit rate is within his financial limit
                     - Case 2: the unit rate is NOT within his fincancial limits
                - Case 2: (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values. 

        */



        } else if($PODOACriterion == "Unit Rate Value"){


            ## Handle Rejected Lines ... Loop through the Rejected Lines and Kill Them By ##
            if(count($request->get('RejectedLines'))){
                # Update status for each PO Rejected Lines
                foreach ($request->get('RejectedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Rejected By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')]);
                }
            }


            # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the unit rate is within his financial limit and 2. unit rate is NOT within his fincancial limits). these go through the two cases of where to dispatch notifiation.
            if($CurrentLevelPOVFinancialLimits){


                $RequiresAdditionalApproval = false;
                
                // Loop Through PO Lines and Handle Approved and Rejected Lines Processing
                foreach ($request->get('POResponseDetails') as $key => $POLine) {

                    //If Line is Approved
                    if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){

                        
                        //Check if the quantity has changed and record the change in the QuantityChange Model
                        if($POLine['OldQuantity'] != $POLine['NewQuantity']){

                            //update the quantity of the purchase enquiry
                            //PurchaseEnquiry::findOrFail($POLine['PEId'])->update(['quantity' => $POLine['NewQuantity']]);

                            //Record the quantity changes changes
                            QuantityChange::create([
                                'company_id'        => $user->company_id,
                                'approver_id'       => $user->id,
                                'pe_id'             => $POLine['PEId'],
                                'quotation_id'      => $POLine['quotation_id'],
                                'approval_level'    => $request->get('POApprovalLevel'),
                                'old_quantity'      => $POLine['OldQuantity'],
                                'new_quantity'      => $POLine['NewQuantity'],
                            ]);
                        }

                        // Check the value of the unit rate if within current financial limits and if not notify update that line level. if the below is true then mark the approval as a final approval for this line.
                        if($CurrentLevelPOVFinancialLimits['limit'] >= $POLine['unit_rate']){

                            # 1. Update status for PO Approved Line
                            $OriginalPO->purchaseEnquiries()->updateExistingPivot($POLine['PEId'], [
                                'status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                                'approval_level' => $request->get('POApprovalLevel')
                            ]);
                            

                        } else {

                            # 1. Update status for PO Approved Line
                            $OriginalPO->purchaseEnquiries()->updateExistingPivot($POLine['PEId'], [
                                'status' => 'Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                                'approval_level' => $request->get('POApprovalLevel')
                            ]);

                            $RequiresAdditionalApproval = true;

                        }

                    }

                }


                /* Case 1: All Rejected PO Lines for status assignment*/
                
                // 1. check if all lines are rejected
                $FullyRejected = true;
                foreach ($OriginalPO->purchaseEnquiries as $key => $PELineWithPivot) {
                    //return $PELineWithPivot->pivot['status'];
                    if(strpos($PELineWithPivot->pivot['status'], 'Rejected') === false) {
                        $FullyRejected = false;
                    }
                }

                if($FullyRejected){
                    // 2. update status of the PO to Fully Rejected
                    $OriginalPO->status = "Fully Rejected";
                    $OriginalPO->update();

                    # 3. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Fully Rejected',
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => 'Fully Rejected',
                        'decision'                  => 'Fully Rejected',
                        'decision_notes'            => 'Approved Line(s): Zero Lines | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);

                    # 4. Send notification to originator (Find All Unique Originators For All Enquiry Lines and Send Them Notifications)
                    $OriginatorsIdsList = $OriginalPO->purchaseEnquiries->unique('created_by')->pluck('created_by'); 
                    $Originators = User::whereIn('id', $OriginatorsIdsList)->get();

                    foreach ($Originators as $key => $Originator) {
                        $Originator->notify(new PurchaseOrderRejectionNotification($OriginalPO));
                    }

                    # 5. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'Purchase Order Rejected',
                        "message"       => 'Purchase Order Rejected Successfully, The Purchase Order will will no longer be pursed. Originator Will Be Notified',
                        "messageType"   => 'success'
                    ], 200);
                }



                /* Case 2: we are here because we have some approved PO lines are required to be redirected to current (Vendor or next approval). If all $OriginalPO Approved lines (Unit Rate) are within current user approval limits which means that all we are done with approval and send notifications to vendor and update PO status and History Records Accordingly ----- OR ----- All of the previous can be skipped if when flag $RequiresAdditionalApproval if the limit requires that */
                if($RequiresAdditionalApproval){

                    # 1. Update PO Lines status
                    $OriginalPO->status = 'Approved By Level: '.$request->get('POApprovalLevel');
                    $OriginalPO->approval_level = $request->get('POApprovalLevel') + 1;
                    $OriginalPO->update();


                    # 2. Get Next Approval Level Users (POV Role) and Send then notifications
                    $usersIdsWithPOV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'POV')->where('role_level', $request->get('POApprovalLevel') + 1)->distinct()->pluck('user_id');
                    $usersWithPOV = User::whereIn('id', $usersIdsWithPOV)->get();
                    foreach ($usersWithPOV as $key => $ApproverPOV) {
                        $ApproverPOV->notify(new PurchaseOrderApprovalRequiredNotification($OriginalPO));
                    }


                    # 3. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => (implode(', ', $usersWithPOV->pluck('name')->toArray())),
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => $request->get('POApprovalLevel') + 1,
                        'decision'                  => 'PO Processed to Next Level',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);


                    # 4. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'Purchase Order Approved',
                        "message"       => 'Purchase Order Approved Successfully, The Purchase Order required additional line of approvals before it will be sent to vendor for accepatance.',
                        "messageType"   => 'success'
                    ], 200);

                } else {

                    # We are here because no additional approval required and vendor should be notified to accept the PO.

                    # 1. Update PO Lines status
                    $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                    $OriginalPO->update();

                    # 2. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Approvals Completed',
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => 'Approvals Completed',
                        'decision'                  => 'Approvals Completed',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);
                    
                    # 3. Send notification to vendor
                    $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                        $query->where('sbm_role', 'Yes');
                    })->first()->users;
                    foreach ($VendorBiddingUsers as $key => $VendorUser) {
                        $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                    }


                    # 4. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'PO Fully Approved',
                        "message"       => 'PO Fully Approved Successfully, The PO will be sent to vendor for his accepatance.',
                        "messageType"   => 'success'
                    ], 200);

                }


            # (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
            } else {


                //Check if the quantity has changed and record the change in the QuantityChange Model
                foreach ($request->get('POResponseDetails') as $key => $POLine) {
                    if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){
                        if($POLine['OldQuantity'] != $POLine['NewQuantity']){
                            //update the quantity of the purchase enquiry
                            //PurchaseEnquiry::findOrFail($POLine['PEId'])->update(['quantity' => $POLine['NewQuantity']]);
                            
                            //Record the quantity changes changes
                            QuantityChange::create([
                                'company_id'        => $user->company_id,
                                'approver_id'       => $user->id,
                                'pe_id'             => $POLine['PEId'],
                                'quotation_id'      => $POLine['quotation_id'],
                                'approval_level'    => $request->get('POApprovalLevel'),
                                'old_quantity'      => $POLine['OldQuantity'],
                                'new_quantity'      => $POLine['NewQuantity'],
                            ]);
                        }
                    }
                }

                # 1. Update status for each PO Approved Lines
                foreach ($request->get('ApprovedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')
                    ]);
                }


                # 2. Update PO Lines status
                $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                $OriginalPO->update();


                # 3. Record History Changes
                ApprovalPurchaseOrderHistory::create([
                    'company_id'                => $user->company_id,
                    'purchase_order_id'         => $POId,
                    'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Approvals Completed',
                    'current_approval_level'    => $request->get('POApprovalLevel'),
                    'next_approval_level'       => 'Approvals Completed',
                    'decision'                  => 'Approvals Completed',
                    'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                ]);
                
                # 4. Send notification to vendor
                $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                    $query->where('sbm_role', 'Yes');
                })->first()->users;
                foreach ($VendorBiddingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                }


                # 5. User FeedBack
                return response()->json([
                    "messageTitle"  => 'PO Fully Approved',
                    "message"       => 'PO Fully Approved Successfully, The PO will be sent to vendor for his accepatance.',
                    "messageType"   => 'success'
                ], 200);                

            }

           

        /* 

        CASE #4 PO Line Value 
                - Case 1: Current Level Does have finicial Limit.
                     - Case 1: the po line value is within his financial limit
                     - Case 2: the po line value is NOT within his fincancial limits
                - Case 2: (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values. 

        */




        } else if ($PODOACriterion == "PO line Value"){

            $RequiresAdditionalApproval = false;

            ## Handle Rejected Lines ... Loop through the Rejected Lines and Kill Them By ##
            if(count($request->get('RejectedLines'))){
                # Update status for each PO Rejected Lines
                foreach ($request->get('RejectedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Rejected By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')]);
                }
            }


            # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the unit rate is within his financial limit and 2. unit rate is NOT within his fincancial limits). these go through the two cases of where to dispatch notifiation.
            if($CurrentLevelPOVFinancialLimits){

                // Loop Through PO Lines and Handle Approved and Rejected Lines Processing
                foreach ($request->get('POResponseDetails') as $key => $POLine) {
                    //return $POLine;
                    //If Line is Approved
                    if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){

                        //Check if the quantity has changed and record the change in the QuantityChange Model
                        if($POLine['OldQuantity'] != $POLine['NewQuantity']){

                            //update the quantity of the purchase enquiry
                            PurchaseEnquiry::findOrFail($POLine['PEId'])->update(['quantity' => $POLine['NewQuantity']]);

                            //Record the quantity changes changes
                            QuantityChange::create([
                                'company_id'        => $user->company_id,
                                'approver_id'       => $user->id,
                                'pe_id'             => $POLine['PEId'],
                                'quotation_id'      => $POLine['quotation_id'],
                                'approval_level'    => $request->get('POApprovalLevel'),
                                'old_quantity'      => $POLine['OldQuantity'],
                                'new_quantity'      => $POLine['NewQuantity'],
                            ]);
                        }


                        //check the value of the line if within current financial limits and if not notify update that line level.
                        if($CurrentLevelPOVFinancialLimits['limit'] >= $POLine['NewPrice']){

                            # 1. Update status for PO Approved Line
                            $OriginalPO->purchaseEnquiries()->updateExistingPivot($POLine['PEId'], [
                                'status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                                'approval_level' => $request->get('POApprovalLevel')
                            ]);


                        } else {

                            # 1. Update status for PO Approved Line
                            $OriginalPO->purchaseEnquiries()->updateExistingPivot($POLine['PEId'], [
                                'status' => 'Approval #'.$request->get('POApprovalLevel').' - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                                'approval_level' => $request->get('POApprovalLevel')
                            ]);

                            $RequiresAdditionalApproval = true;

                        }


                    }

                }

                
                /* Case 1: All Rejected PO Lines */
                
                // 1. check if all lines are rejected
                $FullyRejected = true;
                foreach ($OriginalPO->purchaseEnquiries as $key => $PELineWithPivot) {
                    //return $PELineWithPivot->pivot['status'];
                    if(strpos($PELineWithPivot->pivot['status'], 'Rejected') === false) {
                        $FullyRejected = false;
                    }
                }

                if($FullyRejected){
                    // 2. update status of the PO to Fully Rejected
                    $OriginalPO->status = "Fully Rejected";
                    $OriginalPO->update();
                    # 3. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Fully Rejected',
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => 'Fully Rejected',
                        'decision'                  => 'Fully Rejected',
                        'decision_notes'            => 'Approved Line(s): Zero Lines | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);
                    # 4. Send notification to originator (Find All Unique Originators For All Enquiry Lines and Send Them Notifications)
                    $OriginatorsIdsList = $OriginalPO->purchaseEnquiries->unique('created_by')->pluck('created_by'); 
                    $Originators = User::whereIn('id', $OriginatorsIdsList)->get();

                    foreach ($Originators as $key => $Originator) {
                        $Originator->notify(new PurchaseOrderRejectionNotification($OriginalPO));
                    }

                    # 5. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'PO Rejected',
                        "message"       => 'PO Rejected Successfully, The PO will will no longer be pursed. Originator Will Be Notified',
                        "messageType"   => 'success'
                    ], 200);
                }



                /* Case 2: we are here because we have some approved PO are required to be redirected to current (Vendor or next approval). If all $OriginalPO Approved lines (Unit Rate) are within current user approval limits which means that all we are done with approval and send notifications to vendor and update PO status and History Records Accordingly ----- OR ----- All of the previous can be skipped if when flag $RequiresAdditionalApproval if the limit requires that */
                if($RequiresAdditionalApproval){
                    
                    # 1. Update PO Lines status
                    $OriginalPO->status = 'Approved By Level: '.$request->get('POApprovalLevel');
                    $OriginalPO->approval_level = $request->get('POApprovalLevel') + 1;
                    $OriginalPO->update();


                    # 2. Get Next Approval Level Users (POV Role) and Send then notifications
                    $usersIdsWithPOV = Role::where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('role_name', 'POV')->where('role_level', $request->get('POApprovalLevel') + 1)->distinct()->pluck('user_id');
                    $usersWithPOV = User::whereIn('id', $usersIdsWithPOV)->get();
                    foreach ($usersWithPOV as $key => $ApproverPOV) {
                        $ApproverPOV->notify(new PurchaseOrderApprovalRequiredNotification($OriginalPO));
                    }


                    # 3. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => (implode(', ', $usersWithPOV->pluck('name')->toArray())),
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => $request->get('POApprovalLevel') + 1,
                        'decision'                  => 'PO Processed to Next Level',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);


                    # 4. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'PO Approved',
                        "message"       => 'PO Approved Successfully, The PO required additional line of approvals before it will be sent to vendor for accepatance.',
                        "messageType"   => 'success'
                    ], 200);

                } else {
                    
                    # We are here because no additional approval required and vendor should be notified to accept the PO.

                    # 1. Update PO Lines status
                    $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                    $OriginalPO->update();

                    # 2. Record History Changes
                    ApprovalPurchaseOrderHistory::create([
                        'company_id'                => $user->company_id,
                        'purchase_order_id'         => $POId,
                        'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Approvals Completed',
                        'current_approval_level'    => $request->get('POApprovalLevel'),
                        'next_approval_level'       => 'Approvals Completed',
                        'decision'                  => 'Approvals Completed',
                        'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                    ]);
                    
                    # 3. Send notification to vendor
                    $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                        $query->where('sbm_role', 'Yes');
                    })->first()->users;
                    foreach ($VendorBiddingUsers as $key => $VendorUser) {
                        $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                    }


                    # 4. User FeedBack
                    return response()->json([
                        "messageTitle"  => 'PO Fully Approved',
                        "message"       => 'PO Fully Approved Successfully, The PO will be sent to vendor for his accepatance.',
                        "messageType"   => 'success'
                    ], 200);

                }

            # (Case Two) Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values.
            } else {

                //Check if the quantity has changed and record the change in the QuantityChange Model
                foreach ($request->get('POResponseDetails') as $key => $POLine) {
                    if(in_array($POLine['purchase_enquiry']['id'], $request->get('ApprovedLines'))){
                        if($POLine['OldQuantity'] != $POLine['NewQuantity']){
                            //update the quantity of the purchase enquiry
                            PurchaseEnquiry::findOrFail($POLine['PEId'])->update(['quantity' => $POLine['NewQuantity']]);
                            //Record the quantity changes changes
                            QuantityChange::create([
                                'company_id'        => $user->company_id,
                                'approver_id'       => $user->id,
                                'pe_id'             => $POLine['PEId'],
                                'quotation_id'      => $POLine['quotation_id'],
                                'approval_level'    => $request->get('POApprovalLevel'),
                                'old_quantity'      => $POLine['OldQuantity'],
                                'new_quantity'      => $POLine['NewQuantity'],
                            ]);
                        }
                    }
                }

                # 1. Update status for each PO Approved Lines
                foreach ($request->get('ApprovedLines') as $key => $PEId) {
                    $OriginalPO->purchaseEnquiries()->updateExistingPivot($PEId, [
                        'status' => 'Final Approval - Approved By '.$user->name.' at approval level ('.$request->get('POApprovalLevel').')',
                        'approval_level' => $request->get('POApprovalLevel')
                    ]);
                }


                # 2. Update PO Lines status
                $OriginalPO->status = "Approvals Fully Completed - PO Sent To Vendor";
                $OriginalPO->update();


                # 3. Record History Changes
                ApprovalPurchaseOrderHistory::create([
                    'company_id'                => $user->company_id,
                    'purchase_order_id'         => $POId,
                    'description'               => 'Processed By Level '.$request->get('POApprovalLevel').'.',
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Approvals Completed',
                    'current_approval_level'    => $request->get('POApprovalLevel'),
                    'next_approval_level'       => 'Approvals Completed',
                    'decision'                  => 'Approvals Completed',
                    'decision_notes'            => 'Approved Line(s): ('.implode(',', $request->get('ApprovedLines')).') | Rejected Line(s): ('.implode(',', $request->get('RejectedLines')).')',
                ]);
                
                # 4. Send notification to vendor
                $VendorBiddingUsers = Vendor::where('id', $OriginalPO->vendor_id)->whereHas('users', function ($query) {
                    $query->where('sbm_role', 'Yes');
                })->first()->users;
                foreach ($VendorBiddingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new PurchaseOrderCreatedNApprovedVendorNotification($OriginalPO));
                }


                # 5. User FeedBack
                return response()->json([
                    "messageTitle"  => 'PO Fully Approved',
                    "message"       => 'PO Fully Approved Successfully, The PO will be sent to vendor for his accepatance.',
                    "messageType"   => 'success'
                ], 200);                

            }
        }
     
    } // of Method POApproval
        


}
