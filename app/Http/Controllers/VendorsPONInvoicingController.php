<?php

namespace App\Http\Controllers;

use App\ApprovalPurchaseOrderHistory;
use App\ApprovalRateContractHistory;
use App\CommercialEvaluation;
use App\Notifications\PurchaseOrderVendorApprovedNotification;
use App\Notifications\PurchaseOrderVendorRejectedNotification;
use App\Notifications\RNDelieveyStatusUpdateByVendorNotification;
use App\Notifications\RNNewDelieveyByVendorNotification;
use App\Notifications\RateContractVendorApprovedNotification;
use App\Notifications\RateContractVendorRejectedNotification;
use App\PurchaseOrder;
use App\RateContract;
use App\ReceiptNote;
use App\ReceiptNoteInvoice;
use App\Role;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class VendorsPONInvoicingController extends Controller
{
    public function rejectPOByVendor(Request $request)
    {
        $now = Carbon::now();
    	$vendorUser = $request->user();
    	$PurchaseOrder = PurchaseOrder::with('purchaseEnquiries')->findOrFail($request->get('POId'));
        //$vendorDetails = $vendorUser->vendors->where('company_id', $PurchaseOrder->company_id)->first();

        # 1. Update/Kill PO Status (This will Complete That PO journey as its the final step in the process)
        $PurchaseOrder->vendor_notes = $request->get('VendorNotes');
    	$PurchaseOrder->status = "Rejected By Vendor";
        $PurchaseOrder->vendor_approved_at = $now;
    	$PurchaseOrder->update();

        # 2. Update the PO Approvals Tracker
        ApprovalPurchaseOrderHistory::create([
            'company_id'                => $PurchaseOrder->company_id,
            'purchase_order_id'         => $PurchaseOrder->id,
            'description'               => 'Vendor Rejected.',
            'current_action_owner_id'   => $vendorUser->name,
            'next_action_owners'        => 'Vendor Rejected.',
            'current_approval_level'    => 'Approvals Completed',
            'next_approval_level'       => 'Vendor Rejected.',
            'decision'                  => 'Vendor Rejected.',
            'decision_notes'            => $request->get('VendorNotes'),
        ]);

        # 3. Open Commercial Evalution Again for the Rejected PO Lines.
        $commericalEvaluation = CommercialEvaluation::where('company_id', $PurchaseOrder->company_id)->where('quotation_id', $PurchaseOrder->quotation_id)->get()->first();
        $commericalEvaluation->status = 'Commerical Evaluation Re-Opened After Vendor Rejection';
        $PurchaseOrder->vendor_approved_at = $now;
        $commericalEvaluation->update();


        # 4. Update status of PE pivot tabel with of the commerical evaluation
        foreach ($PurchaseOrder->purchaseEnquiries as $key => $PE) {
            $commericalEvaluation->purchaseEnquiries()->updateExistingPivot($PE->id, ['status' => 'Commercial Evaluation Submitted (PO Vendor Rejected)']);
        }

        # 5. Send Notification to PE Orginator about vendor cancellation
        $OriginatorsIdsList = $PurchaseOrder->purchaseEnquiries->unique('created_by')->pluck('created_by'); 
        $Originators = User::whereIn('id', $OriginatorsIdsList)->get();
        foreach ($Originators as $key => $Originator) {
            $Originator->notify(new PurchaseOrderVendorRejectedNotification($PurchaseOrder));
        }

        # 6. Send Notification to PO creators about vendor cancellation
        $usersIdsWithPOV = Role::where('company_id', $PurchaseOrder->company_id)->where('project_id', $PurchaseOrder->project_id)->where('role_name', 'POV')->distinct()->pluck('user_id');
        $usersWithProjectPOO = User::whereIn('id', $usersIdsWithPOV)->get();
        foreach ($usersWithProjectPOO as $key => $user) {
            $user->notify(new PurchaseOrderVendorRejectedNotification($PurchaseOrder));
        }
        

        return response()->json([
            "messageTitle"  => 'PO Rejected Successfully.',
            "message"       => 'PO Rejected. Client Will Be Notified For Further Action.',
            "messageType"   => 'success'
        ], 200);
    }


    public function approvePOByVendor(Request $request)
    {

        $now = Carbon::now();
        $vendorUser = $request->user();
        $PurchaseOrder = PurchaseOrder::with('purchaseEnquiries.responses')->findOrFail($request->get('POId'));
        $vendorDetails = $vendorUser->vendors->where('company_id', $PurchaseOrder->company_id)->first();

        # 1. Update PO Status (This will Complete That PO journey as its the final step in the process)
        $PurchaseOrder->vendor_notes = $request->get('VendorNotes');
        $PurchaseOrder->status = "Accepted By Vendor";
        $PurchaseOrder->vendor_approved_at = $now;
        $PurchaseOrder->update();

        # 2. Update the PO Approvals Tracker
        ApprovalPurchaseOrderHistory::create([
            'company_id'                => $PurchaseOrder->company_id,
            'purchase_order_id'         => $PurchaseOrder->id,
            'description'               => 'Vendor Accepted.',
            'current_action_owner_id'   => $vendorUser->name,
            'next_action_owners'        => 'Vendor Accepted.',
            'current_approval_level'    => 'Approvals Completed',
            'next_approval_level'       => 'Vendor Accepted.',
            'decision'                  => 'Vendor Accepted.',
            'decision_notes'            => $request->get('VendorNotes'),
        ]);    
 

        # 3. Create RN Records line wise for each accepted PEs to start and track the receiving process
        foreach ($PurchaseOrder->purchaseEnquiries as $key => $PurchaseEnquiry) { 
            ReceiptNote::create([
                'receipt_note_group_id'     => $PurchaseOrder->purchase_order_group_id,
                'receipt_note_ingroup_id'   => $key + 1,
                'company_id'                => $PurchaseOrder->company_id,
                'project_id'                => $PurchaseOrder->project_id,
                'pe_id'                     => $PurchaseEnquiry->id,
                'quotation_id'              => $PurchaseOrder->quotation_id,
                'po_id'                     => $PurchaseOrder->id,
                'quotation_response_id'     => $PurchaseEnquiry->responses->where('vendor_id', $vendorDetails->id)[0]->id,
                'vendor_id'                 => $vendorDetails->id,
                'quantity_to_be_received'   => $PurchaseEnquiry->quantity,
                'status'                    => 'Not Yet Shipped',
            ]);
        }

        # 4. Send Notification to PE Orginator about vendor acceptance
        $OriginatorsIdsList = $PurchaseOrder->purchaseEnquiries->unique('created_by')->pluck('created_by'); 
        $Originators = User::whereIn('id', $OriginatorsIdsList)->get();
        foreach ($Originators as $key => $Originator) {
            $Originator->notify(new PurchaseOrderVendorApprovedNotification($PurchaseOrder));
        }

        # 5. Send Notification to PO creators about vendor acceptance
        $usersIdsWithPOO = Role::where('company_id', $PurchaseOrder->company_id)->where('project_id', $PurchaseOrder->project_id)->where('role_name', 'POV')->distinct()->pluck('user_id');
        $usersWithProjectPOO = User::whereIn('id', $usersIdsWithPOO)->get();
        foreach ($usersWithProjectPOO as $key => $user) {
            $user->notify(new PurchaseOrderVendorApprovedNotification($PurchaseOrder));
        }

        # 6. Feedback to user
        return response()->json([
            "messageTitle"  => 'PO Approved Successfully.',
            "message"       => 'PO Accepted. Please Update Your Deliever Status.',
            "messageType"   => 'success'
        ], 200);

    }


    public function RNLineChangeStatus(Request $request)
    {

        # 1. update status of RN
        $ReceiptNote = ReceiptNote::findOrFail($request->get('RNLineId'));
        $ReceiptNote->update(['status' => $request->get('NewStatus')]);

        # 2. Send Notification to RNO users
        $usersIdsWithRNO = Role::where('company_id', $ReceiptNote->company_id)->where('project_id', $ReceiptNote->project_id)->where('role_name', 'RNO')->distinct()->pluck('user_id');
        $usersWithProjectRNO = User::whereIn('id', $usersIdsWithRNO)->get();
        foreach ($usersWithProjectRNO as $key => $user) {
            $user->notify(new RNDelieveyStatusUpdateByVendorNotification($ReceiptNote));
        }

        # 3. Feedback to user
        return response()->json([
            "messageTitle"  => 'Status Changed Successfully.',
            "message"       => 'Client Users Will Be Notified.',
            "messageType"   => 'success'
        ], 200);
    }

    public function RNLineShipmentNotificaiton(Request $request)
    {

        $ReceiptNote = ReceiptNote::findOrFail($request->get('RNLineId'));

        # 2. Send Notification to RNO users
        $usersIdsWithRNO = Role::where('company_id', $ReceiptNote->company_id)->where('project_id', $ReceiptNote->project_id)->where('role_name', 'RNO')->distinct()->pluck('user_id');
        $usersWithProjectRNO = User::whereIn('id', $usersIdsWithRNO)->get();
        foreach ($usersWithProjectRNO as $key => $user) {
            $user->notify(new RNNewDelieveyByVendorNotification($ReceiptNote));
        }

        # 3. Feedback to user
        return response()->json([
            "messageTitle"  => 'Client Notified Successfully.',
            "message"       => 'Client Notified Successfully.',
            "messageType"   => 'success'
        ], 200);
    }

    public function uploadVendorInvoice(Request $request)
    {
        $filesNames = [];
        $fileSafeNames = [];
        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();

        //upload the files into local direcotry
        $RequiredFiles = $request->file('RequiredFiles');

        // validate Docuement Size before upload also Check if we have a document to upload
        if($RequiredFiles){

            foreach ($RequiredFiles as $key => $FileDocument){
                $randomNumber = rand(1,100);
                if ($FileDocument)

                {
                    $filecontents       = file_get_contents($FileDocument);
                    $fileName           = $FileDocument->getClientOriginalName();
                    $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/VendorInvoicesUpload/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().'_'.$randomNumber.'_'.$fileName;
                    $FileDocument->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                    $filesNames[]       = $fileName;
                }

            }

            # Feedback to user
            ReceiptNoteInvoice::create([
                'company_id'            => $request->get('CompanyId'),
                'vendor_user_id'        => $vendorUser->id,
                'vendor_id'             => $vendorDetails->id,
                'rn_id'                 => $request->get('RNLineId'),
                'max_invoicable_amount' => $request->get('MaxInvoicableAmount'),
                'invoice_amount'        => $request->get('InvoiceValue'),
                'vendor_doc_name'       => implode(',', $filesNames),
                'document_safe_name'    => implode(',', $fileSafeNames)
            ]);
            

            # Update Invoicing Status of the RN Line
            ReceiptNote::findOrFail($request->get('RNLineId'))->update(['invoicing_status' => "An Invoice Submitted By Vendor And It's Under Client Processing"]);

            # Feedback to user for successful 
            return response()->json([
                "messageTitle"  => 'Invoice Uploaded Successfully.',
                "message"       => 'Invoice Uploaded Successfully.',
                "messageType"   => 'success'
            ], 200);

        }


        # Feedback to user in case of no document uploaded
        return response()->json([
            "messageTitle"  => 'Invoice Uploaded Error.',
            "message"       => 'Invoice file was not found.',
            "messageType"   => 'error'
        ], 200);

        
    }



    /* Rate Contract Methods */
    public function rejectRCByVendor(Request $request)
    {
        $now = Carbon::now();
        $vendorUser = $request->user();
        $RateContract = RateContract::with('rateContractRequests')->findOrFail($request->get('RCId'));
        //$vendorDetails = $vendorUser->vendors->where('company_id', $PurchaseOrder->company_id)->first();

        # 1. Update/Kill PO Status (This will Complete That PO journey as its the final step in the process)
        // $RateContract->vendor_notes = $request->get('VendorNotes');
        // $RateContract->status = "Rejected By Vendor";
        // $RateContract->vendor_approved_at = $now;
        // $RateContract->update();

        // # 2. Update the Rate Contract Approvals Tracker
        // ApprovalRateContractHistory::create([
        //     'company_id'                => $RateContract->company_id,
        //     'rate_contract_id'          => $RateContract->id,
        //     'description'               => 'Vendor Rejected.',
        //     'current_action_owner_id'   => $vendorUser->name,
        //     'next_action_owners'        => 'Vendor Rejected.',
        //     'current_approval_level'    => 'Approvals Completed',
        //     'next_approval_level'       => 'Vendor Rejected.',
        //     'decision'                  => 'Vendor Rejected.',
        //     'decision_notes'            => $request->get('VendorNotes'),
        // ]);

        // # 3. Open Commercial Evalution Again for the Rejected RC Lines.
        // $commericalEvaluation = CommercialEvaluation::where('company_id', $RateContract->company_id)->where('quotation_id', $RateContract->quotation_id)->get()->first();
        // $commericalEvaluation->status = 'Commerical Evaluation Re-Opened After Vendor Rejection';
        // $RateContract->vendor_approved_at = $now;
        // $commericalEvaluation->update();

        // # 4. Update status of Rate Contract Request pivot tabel with of the commerical evaluation
        // foreach ($RateContract->rateContractRequests as $key => $RCR) {
        //     $commericalEvaluation->rateContractRequests()->updateExistingPivot($RCR->id, ['status' => 'Commercial Evaluation Submitted (RC Vendor Rejected)']);
        // }

        # 5. Send Notification to Rate Contract Request Orginator about vendor cancellation
        $OriginatorsIdsList = $RateContract->rateContractRequests->unique('created_by')->pluck('created_by'); 
        $Originators = User::whereIn('id', $OriginatorsIdsList)->get();
        foreach ($Originators as $key => $Originator) {
            $Originator->notify(new RateContractVendorRejectedNotification($RateContract));
        }

        # 6. Send Notification to Rate Contract creators about vendor cancellation
        $usersIdsWithRCO = Role::where('company_id', $RateContract->company_id)->where('project_id', $RateContract->project_id)->where('role_name', 'RCO')->distinct()->pluck('user_id');
        $usersWithProjectRCO = User::whereIn('id', $usersIdsWithRCO)->get();
        foreach ($usersWithProjectRCO as $key => $user) {
            $user->notify(new RateContractVendorRejectedNotification($RateContract));
        }
        

        return response()->json([
            "messageTitle"  => 'Rate Contract Rejected Successfully.',
            "message"       => 'Rate Contract Rejected. Client Will Be Notified For Further Action.',
            "messageType"   => 'success'
        ], 200);
    }


    public function approveRCByVendor(Request $request)
    {

        $now = Carbon::now();
        $vendorUser = $request->user();
        $RateContract = RateContract::with('rateContractRequests.responses')->findOrFail($request->get('RCId'));
        $vendorDetails = $vendorUser->vendors->where('company_id', $RateContract->company_id)->first();

        # 1. Update Rate Contract Status (This will Complete That Rate Contract journey as its the final step in the process)
        $RateContract->vendor_notes = $request->get('VendorNotes');
        $RateContract->status = "Accepted By Vendor";
        $RateContract->vendor_approved_at = $now;
        $RateContract->update();

        # 2. Update the Rate Contract Approvals Tracker
        ApprovalRateContractHistory::create([
            'company_id'                => $RateContract->company_id,
            'rate_contract_id'          => $RateContract->id,
            'description'               => 'Vendor Accepted.',
            'current_action_owner_id'   => $vendorUser->name,
            'next_action_owners'        => 'Vendor Accepted.',
            'current_approval_level'    => 'Approvals Completed',
            'next_approval_level'       => 'Vendor Accepted.',
            'decision'                  => 'Vendor Accepted.',
            'decision_notes'            => $request->get('VendorNotes'),
        ]);    
 

        # 3. Send Notification to Rate Contract Request Orginator about vendor acceptance
        $OriginatorsIdsList = $RateContract->rateContractRequests->unique('created_by')->pluck('created_by'); 
        $Originators = User::whereIn('id', $OriginatorsIdsList)->get();
        foreach ($Originators as $key => $Originator) {
            $Originator->notify(new RateContractVendorApprovedNotification($RateContract));
        }

        # 4. Send Notification to Rate Contract creators about vendor acceptance
        $usersIdsWithRCO = Role::where('company_id', $RateContract->company_id)->where('project_id', $RateContract->project_id)->where('role_name', 'RCO')->distinct()->pluck('user_id');
        $usersWithProjectRCO = User::whereIn('id', $usersIdsWithRCO)->get();
        foreach ($usersWithProjectRCO as $key => $user) {
            $user->notify(new RateContractVendorApprovedNotification($RateContract));
        }

        # 5. Feedback to user
        return response()->json([
            "messageTitle"  => 'Rate Contract Approved Successfully.',
            "message"       => 'Rate Contract Accepted. Please Update Your Deliever Status.',
            "messageType"   => 'success'
        ], 200);

    }

    
}
