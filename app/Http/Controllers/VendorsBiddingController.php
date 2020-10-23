<?php

namespace App\Http\Controllers;

use App\ApprovalRateContractHistory;
use App\Notifications\VendorRCRFISubmittedNotification;
use App\Notifications\VendorRFISubmittedNotification;
use App\PurchaseEnquiry;
use App\QuotationRequest;
use App\QuotationResponse;
use App\QuotationResponseTracker;
use App\RCQuotationResponse;
use App\RCRFICommunication;
use App\RCVendorUploadDoc;
use App\RFICommunication;
use App\RateContractRequest;
use App\Role;
use App\User;
use App\VendorUploadDoc;
use App\VolumeDiscount;
use Carbon\Carbon;
use Illuminate\Http\Request;

class VendorsBiddingController extends Controller
{
    public function submitQuotationResponse(Request $request)
    {
    	$vendorUser = $request->user();

        $PurchaseEnquiries = $request->all();
        $FirstPELineId = $request->get(0)['PELineID'];
        $PECompanyId = $request->get(0)['PECompany'];
        $QuotationID = $request->get(0)['QuotationID'];
        $VolDisDetails = [];
        if(isset($request->get(0)['VolDisDetails'])){
            $VolDisDetails = $request->get(0)['VolDisDetails'];
        }

    	$vendorDetails = $vendorUser->vendors->where('company_id', $PECompanyId)->first();

    	foreach ($PurchaseEnquiries as $key => $PurchaseEnquiry) {

            if($PurchaseEnquiry['QuotationType'] == "PE"){
                QuotationResponse::create([
                    'response_by'               => $vendorUser->id,
                    'vendor_id'                 => $vendorDetails->id,
                    'company_id'                => $PECompanyId,
                    'item_id'                   => $PurchaseEnquiry['PELineItemID'],
                    'purchase_enquiry_id'       => $PurchaseEnquiry['PELineID'],
                    'quotation_id'              => $PurchaseEnquiry['QuotationID'],
                    'unit_rate'                 => $PurchaseEnquiry['PELineUnitPrice'],
                    'price'                     => $PurchaseEnquiry['PELinePrice'],
                    'currency'                  => $PurchaseEnquiry['PELineCurrency'],
                    'lead_days'                 => $PurchaseEnquiry['PELineLeadDays'],
                    'advanced_percentage'       => $PurchaseEnquiry['AdvancedPayment'],
                    'validity_date'             => $PurchaseEnquiry['QuotationValidityDate'],
                    'notes'                     => $PurchaseEnquiry['PELineNote'],
                    'uploaded_files'            => $PurchaseEnquiry['PEUploadedFiles'],
                ]);
            }

            if($PurchaseEnquiry['QuotationType'] == "RC"){
                RCQuotationResponse::create([
                    'response_by'               => $vendorUser->id,
                    'vendor_id'                 => $vendorDetails->id,
                    'company_id'                => $PECompanyId,
                    'item_id'                   => $PurchaseEnquiry['PELineItemID'],
                    'rate_contract_request_id'  => $PurchaseEnquiry['PELineID'],
                    'quotation_id'              => $PurchaseEnquiry['QuotationID'],
                    'unit_rate'                 => $PurchaseEnquiry['PELineUnitPrice'],
                    'price'                     => $PurchaseEnquiry['PELinePrice'],
                    'currency'                  => $PurchaseEnquiry['PELineCurrency'],
                    'lead_days'                 => $PurchaseEnquiry['PELineLeadDays'],
                    'advanced_percentage'       => $PurchaseEnquiry['AdvancedPayment'],
                    'validity_date'             => $PurchaseEnquiry['QuotationValidityDate'],
                    'notes'                     => $PurchaseEnquiry['PELineNote'],
                    'uploaded_files'            => $PurchaseEnquiry['PEUploadedFiles'],
                ]);
            }

            /* Gather What info is required to update on the request to be viewed by originator */
            // ApprovalRateContractHistory::create([
            //     'company_id'                => $PECompanyId,
            //     'rate_contract_id'          => $PurchaseEnquiry['PELineID'],
            //     'description'               => 'Vendor FABO Submitted',
            //     'current_action_owner_id'   => 'By Vendor '.$vendorDetails->name,
            //     'next_action_owners'        => 'Commercial Evaluation', // get ID of commercial Evaluators
            //     'current_approval_level'    => 'N/A',
            //     'next_approval_level'       => 'N/A',
            //     'decision'                  => 'FABO Submitted',
            //     'decision_notes'            => 'FABO Submitted',
            // ]);
    		
    	}

        //update quotation response status
        $QuotationResponseTracker = QuotationResponseTracker::where('quotation_id', $QuotationID)->where('vendor_id', $vendorDetails->id)->where('company_id', $PECompanyId)->update([
                'status' => 'FABO Submitted'
        ]);

            
        /* Adding Volume Discount for the Quotation if you keyed in volume discount */
        if(count($VolDisDetails)){
            foreach ($VolDisDetails as $key => $VolDisc) {
                /* Update Volume Discount Details */
                VolumeDiscount::create([
                    'quotation_id'      => $QuotationID,
                    'company_id'        => $PECompanyId,
                    'vendor_user_id'    => $vendorUser->id,
                    'vendor_id'         => $vendorDetails->id,
                    'from_value'        => $VolDisDetails[$key]['FromTotalValue'],
                    'to_value'          => $VolDisDetails[$key]['ToTotalValue'],
                    'precentage_value'  => $VolDisDetails[$key]['Percentage'],
                ]);
            }
        }


        /* Notification to Commercial Evaluation Evaluator and Originator To be Completed */
        


        //Why no buddy is notified here?
    	if($PurchaseEnquiry['QuotationType'] == "PE"){
        	return response()->json([
                "messageTitle"  => 'Proposal Submitted Successfully.',
                "message"       => 'Proposal submitted. If you are selected, a PO will be generated against this proposal and you will be notified through email.',
                "messageType"   => 'success'
            ], 200);
        }

        if($PurchaseEnquiry['QuotationType'] == "RC"){
            return response()->json([
                "messageTitle"  => 'Proposal Submitted Successfully.',
                "message"       => 'Proposal submitted. If you are selected, a Rate Contract will be generated against this proposal and you will be notified through email.',
                "messageType"   => 'success'
            ], 200);
        }

    }

    public function uploadRequiredFiles(Request $request)
    {
        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();

        //upload the files into local direcotry
        $RequiredFiles = $request->file('RequiredFiles');
        $PEId = preg_replace('/[^0-9]/', '', $request->get('PEId'));

        $RequiredDocList = json_decode($request->get('RequiredDocsDetails'));

        // validate Docuement Size before upload
        if($request->get('QuotationType') == '"PE"'){
            if($RequiredFiles){
                foreach ($RequiredFiles as $key => $FileDocument) {
                    $randomNumber = rand(1,100);
                
                    if ($FileDocument) {
                        $filecontents       = file_get_contents($FileDocument);
                        $fileName           = $FileDocument->getClientOriginalName();
                        $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                        $folderName         = '/public/uploads/RCVendorUploadsRequiredDocs/';
                        $destinationPath    = base_path() . $folderName;
                        $safeName           = time().'_'.$randomNumber.'_'.$fileName;
                        $FileDocument->move($destinationPath, $safeName);
                        $fileSafeNames[]    = $safeName;
                    }
                }
            }

           
            //add the file into to DB
            foreach ($fileSafeNames as $key => $name) {
                VendorUploadDoc::create([
                    'pe_id'             => $PEId,
                    'quotation_id'      => $request->get('QuotationId'),
                    'company_id'        => $request->get('CompanyId'),
                    'vendor_user_id'    => $vendorUser->id,
                    'vendor_id'         => $vendorDetails->id,
                    'required_doc_name' => $RequiredDocList[$key],
                    'document_name'     => $name,
                ]);
            }

            return response()->json([
                "messageTitle"  => 'Files Uploaded Successfully.',
                "message"       => 'Files Uploaded Successfully.',
                "messageType"   => 'success'
            ], 200);
            
        }

        if($request->get('QuotationType') == '"RC"'){

            if($RequiredFiles){
                foreach ($RequiredFiles as $key => $FileDocument) {
                    $randomNumber = rand(1,100);
                
                    if ($FileDocument) {
                        $filecontents       = file_get_contents($FileDocument);
                        $fileName           = $FileDocument->getClientOriginalName();
                        $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                        $folderName         = '/public/uploads/RCVendorUploadsRequiredDocs/';
                        $destinationPath    = base_path() . $folderName;
                        $safeName           = time().'_'.$randomNumber.'_'.$fileName;
                        $FileDocument->move($destinationPath, $safeName);
                        $fileSafeNames[]    = $safeName;
                    }
                }
            }

           
            //add the file into to DB
            foreach ($fileSafeNames as $key => $name) {
                RCVendorUploadDoc::create([
                    'rc_id'             => $PEId,
                    'quotation_id'      => $request->get('QuotationId'),
                    'company_id'        => $request->get('CompanyId'),
                    'vendor_user_id'    => $vendorUser->id,
                    'vendor_id'         => $vendorDetails->id,
                    'required_doc_name' => $RequiredDocList[$key],
                    'document_name'     => $name,
                ]);
            }

            return response()->json([
                "messageTitle"  => 'Files Uploaded Successfully.',
                "message"       => 'Files Uploaded Successfully.',
                "messageType"   => 'success'
            ], 200);

                
        }

        
    }

    public function createRFIMessage(Request $request){

        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();

        if($request->get('QuotationType') == "PE"){

            $RFIDetails = RFICommunication::create([
                'vendor_user_id'    => $vendorUser->id,
                'user_type'         => "Vendor",
                'vendor_id'         => $vendorDetails->id,
                'company_id'        => $request->get('CompanyId'),
                'quotation_id'      => $request->get('QuotationId'),
                'pe_id'             => $request->get('PEId'),
                'reply_id'          => $request->get('RFIMessageID'),
                'message'           => $request->get('RFImessage')
            ]);

            //Notifiy the originator
            $PE = PurchaseEnquiry::findOrFail($request->get('PEId'));
            $PE->creator->notify(new VendorRFISubmittedNotification($RFIDetails));


            //send notification email to all RFQM role users within relevent company and within the requested project
            $UserIdsInRFQM = Role::where('company_id', $request->get('CompanyId'))->where('project_id', $PE->project->id)->where('role_name', 'RFQM')->where('role_level', 1)->distinct()->pluck('user_id');
            $UsersInRFQM = User::whereIn('id', $UserIdsInRFQM)->get();
            foreach ($UsersInRFQM as $key => $RFQMUser) {
                $RFQMUser->notify(new VendorRFISubmittedNotification($RFIDetails));
            }
            

            //update quotation tracker status
            // QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($vendorDetails->id, ['status' => 'RFI Submitted']);
            // QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->update([
            //         'status' => 'RFI Submitted'
            // ]);


            //feedback to user
            return response()->json([
                "messageTitle"  => 'RFI Submitted Successfully.',
                "message"       => 'Your Request for Information Has Been Submitted Successfully. An Answer Will Be Provided As Soon As Possible.',
                "messageType"   => 'success'
            ], 200);
        }


        if($request->get('QuotationType') == "RC"){
            
            $RFIDetails = RCRFICommunication::create([
                'vendor_user_id'    => $vendorUser->id,
                'user_type'         => "Vendor",
                'vendor_id'         => $vendorDetails->id,
                'company_id'        => $request->get('CompanyId'),
                'quotation_id'      => $request->get('QuotationId'),
                'rc_id'             => $request->get('PEId'),
                'reply_id'          => $request->get('RFIMessageID'),
                'message'           => $request->get('RFImessage')
            ]);

            //update quotation tracker status
            // QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($vendorDetails->id, ['status' => 'RFI Submitted']);
            // QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->update([
            //         'status' => 'RFI Submitted'
            // ]);

            //Notifiy the originator
            $RC = RateContractRequest::findOrFail($request->get('PEId'));
            $RC->creator->notify(new VendorRCRFISubmittedNotification($RFIDetails));


            //send notification email to all RFQM role users within relevent company and within the requested project
            $UserIdsInRFQM = Role::where('company_id', $request->get('CompanyId'))->where('project_id', $RC->project->id)->where('role_name', 'RFQM')->where('role_level', 1)->distinct()->pluck('user_id');
            $UsersInRFQM = User::whereIn('id', $UserIdsInRFQM)->get();
            foreach ($UsersInRFQM as $key => $RFQMUser) {
                $RFQMUser->notify(new VendorRCRFISubmittedNotification($RFIDetails));
            }

            //feedback to user
            return response()->json([
                "messageTitle"  => 'RFI Submitted Successfully.',
                "message"       => 'Your Request for Information Has Been Submitted Successfully. An Answer Will Be Provided As Soon As Possible.',
                "messageType"   => 'success'
            ], 200);
        }
        

    }

    public function markQuotationAsViewed(Request $request)
    {
        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();

        QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($vendorDetails->id, ['status' => 'Request for Proposals Viewed']);
        QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->update([
                'status' => 'Request for Proposals Viewed'
        ]);

        return response()->json([
            "messageTitle"  => 'Quotation Response Tracker Updated.',
            "message"       => 'Quotation Response Tracker Updated Successfully.',
            "messageType"   => 'success'
        ], 200);
    }


    public function confirmSubmission(Request $request)
    {
        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();

        if($request->get('WillSubmit')){
            QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($vendorDetails->id, ['status' => 'Offer will be submitted']);
            QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->update([
                    'status' => 'Offer will be submitted'
            ]);
        } else {
            QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($vendorDetails->id, ['status' => 'No offer will be submitted']);
            QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $vendorDetails->id)->where('company_id', $request->get('CompanyId'))->update([
                    'status' => 'No offer will be submitted'
            ]);
        }

        return response()->json([
            "messageTitle"  => 'Feedback Submitted.',
            "message"       => 'Feedback Submitted Successfully.',
            "messageType"   => 'success'
        ], 200);
    }


    public function submitAuctionResponse(Request $request)
    {
        $vendorUser = $request->user();

        $now = Carbon::now();
        $PurchaseEnquiries = $request->all();
        $FirstPELineId = $request->get(0)['PELineID'];
        $PECompanyId = $request->get(0)['PECompany'];
        $QuotationID = $request->get(0)['QuotationID'];
        $vendorDetails = $vendorUser->vendors->where('company_id', $PECompanyId)->first();

        $VendorResponses = QuotationResponse::where('company_id', $PECompanyId)->where('quotation_id', $QuotationID)->where('vendor_id', $vendorDetails->id)->get();

        $Quotation = QuotationRequest::findOrFail($QuotationID);


        # Check if we are allowed to sumbit based on the end date of the auction
        if($Quotation->end_date->gt($now)){

            if($VendorResponses->count()){
                foreach ($VendorResponses as $key => $VendorResponse) {
                    $VendorResponse->update([
                        'response_by'               => $vendorUser->id,
                        'vendor_id'                 => $vendorDetails->id,
                        'company_id'                => $PECompanyId,
                        'purchase_enquiry_id'       => $PurchaseEnquiries[$key]['PELineID'],
                        'quotation_id'              => $PurchaseEnquiries[$key]['QuotationID'],
                        'unit_rate'                 => $PurchaseEnquiries[$key]['PELineUnitPrice'],
                        'price'                     => $PurchaseEnquiries[$key]['PELinePrice'],
                        'currency'                  => $PurchaseEnquiries[$key]['PELineCurrency'],
                        'lead_days'                 => $PurchaseEnquiries[$key]['PELineLeadDays'],
                        'advanced_percentage'       => $PurchaseEnquiries[$key]['AdvancedPayment'],
                        'validity_date'             => $PurchaseEnquiries[$key]['QuotationValidityDate'],
                        'notes'                     => $PurchaseEnquiries[$key]['PELineNote'],
                        'uploaded_files'            => $PurchaseEnquiries[$key]['PEUploadedFiles'],
                    ]);
                }

            } else {
                foreach ($PurchaseEnquiries as $key => $PurchaseEnquiry) {
                    //create new records
                    QuotationResponse::create([
                        'response_by'               => $vendorUser->id,
                        'vendor_id'                 => $vendorDetails->id,
                        'company_id'                => $PECompanyId,
                        'purchase_enquiry_id'       => $PurchaseEnquiry['PELineID'],
                        'quotation_id'              => $PurchaseEnquiry['QuotationID'],
                        'unit_rate'                 => $PurchaseEnquiry['PELineUnitPrice'],
                        'price'                     => $PurchaseEnquiry['PELinePrice'],
                        'currency'                  => $PurchaseEnquiry['PELineCurrency'],
                        'lead_days'                 => $PurchaseEnquiry['PELineLeadDays'],
                        'advanced_percentage'       => $PurchaseEnquiry['AdvancedPayment'],
                        'validity_date'             => $PurchaseEnquiry['QuotationValidityDate'],
                        'notes'                     => $PurchaseEnquiry['PELineNote'],
                        'uploaded_files'            => $PurchaseEnquiry['PEUploadedFiles'],
                    ]);
                }
            }

            //update quotation response status
            $QuotationResponseTracker = QuotationResponseTracker::where('quotation_id', $QuotationID)->where('vendor_id', $vendorDetails->id)->where('company_id', $PECompanyId)->update([
                    'status' => 'FABO Submitted'
            ]);

            //Why no buddy is notified here?
            
            return response()->json([
                "messageTitle"  => 'Prices Submitted Successfully.',
                "message"       => 'Prices submitted. If you are selected, a PO will be generated against these prices and you will notified through email.',
                "messageType"   => 'success'
            ], 200);

        } else {

            return response()->json([
                "messageTitle"  => 'Auction Time Ended.',
                "message"       => 'Prices Cannot Be Submitted Because the Auction Time as Endded.',
                "messageType"   => 'error'
            ], 200);

        }

    }

}
