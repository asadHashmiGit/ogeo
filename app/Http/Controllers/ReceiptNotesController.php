<?php

namespace App\Http\Controllers;

use App\ApprovalPurchaseOrderCancellationHistory;
use App\ApprovalRNReceivingHistory;
use App\FinancialLimit;
use App\Notifications\CompanyReceiptNoteCreatedNotification;
use App\Notifications\CompanyReceivingRejectedNotification;
use App\Notifications\InvoiceAcceptedByClientNotification;
use App\Notifications\InvoiceRejectedByClientNotification;
use App\Notifications\PurchaseOrderCancellationCreatedNotification;
use App\Notifications\PurchaseOrderCancellationFullValidatedNotification;
use App\Notifications\PurchaseOrderCancellationRejectedNotification;
use App\Notifications\PurchaseOrderCancellationValidationNotification;
use App\Notifications\ReceivingApprovalRequiredNotification;
use App\Notifications\ReceivingApprovedForInvoicingNotification;
use App\POCancellationRequest;
use App\Project;
use App\RNReceiving;
use App\ReceiptNote;
use App\ReceiptNoteInvoice;
use App\Role;
use App\User;
use App\Vendor;
use Illuminate\Http\Request;

class ReceiptNotesController extends Controller
{
    public function receivingRNLine(Request $request)
    {
    	$user = $request->user();
    	$ValueOfRecievedQty = 0;
        $RententionValueOfReceivedQty = 0;

        //dd($request->get('NewStatus'), $request->get('ReceivedQuantity'), $request->get('NewPendingQty'));

    	# 1. Update status of RN
        $ReceiptNote = ReceiptNote::with('quotationReponse')->findOrFail($request->get('RNLineId'));
        $ReceiptNote->update(['status' => $request->get('NewStatus')]);

        /* Calculate the value of received Qty after applying adanced percentage */
        if($ReceiptNote->quotationReponse->advanced_percentage == 100){
            $ValueOfRecievedQty = 0;
        } else {
            $ValueOfRecievedQty = (($request->get('ReceivedQuantity') * $ReceiptNote->quotationReponse->unit_rate) * (1 - $ReceiptNote->quotationReponse->advanced_percentage/100));
        }


        /* Calculate the rentention amount for this receiving */
        if($ReceiptNote->purchaseEnquiry->retention_percentage == 0){
            $RententionValueOfReceivedQty = 0;
        } else {
            $RententionValueOfReceivedQty = ($ValueOfRecievedQty * ($ReceiptNote->purchaseEnquiry->retention_percentage/100));
        }

        //dd($ValueOfRecievedQty, $RententionValueOfReceivedQty, $ReceiptNote->purchaseEnquiry->retention_percentage);

        //Assing grouping Id Per company
        $LastestPERecord = RNReceiving::orderBy('rn_receiving_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->rn_receiving_group_id + 1;
            $InGroupId = $LastestPERecord->rn_receiving_group_id + 1;
        }


        # 2. Create The receieving Record
        RNReceiving::create([
            'rn_receiving_group_id'             => $GroupId,
            'rn_receiving_ingroup_id'           => $InGroupId,
        	'received_by'						=> $user->id,
        	'rn_id'								=> $ReceiptNote->id,
	        'received_quantity'					=> $request->get('ReceivedQuantity'),
	        'value_of_received_quantity'		=> $ValueOfRecievedQty,
            'receiving_rentention_amount'       => $RententionValueOfReceivedQty,
	        'quantity_to_complete_receiving'	=> $request->get('NewPendingQty'),
	        'note'								=> $request->get('ReceivingNotes'),
        ]);


        # 3. Send Notification to vendor SIM users
        $VendorInvoicingUsers = Vendor::where('id', $ReceiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
        foreach ($VendorInvoicingUsers as $key => $VendorUser) {
            $VendorUser->notify(new CompanyReceiptNoteCreatedNotification($ReceiptNote));
        }

        # 4. Check if all lines of the PO are Fully approved and trigger Retention invoice once done

        # 5. Send feedback to user
    	return response()->json([
            "messageTitle"  => 'Quantity Post Successfully.',
            "message"       => 'Quantity Post Successfully. Supplier Can Now Invoice The Quantity Received After The Completion Of Payment Terms Billing Period.',
            "messageType"   => 'success'
        ], 200);
    }



    public function validateReceiptNote(Request $request)
    {
        
        $user = $request->user();
        $RNReceivingId = $request->get('RNReceivingId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $RNReceiving = RNReceiving::with('receiptNote.quotationReponse')->findOrfail($RNReceivingId);
        $nextApprovalLevel = $RNReceiving->current_approval_level + 1;
        $TotalFullyApprovedQuantity = 0;
        $TotalReceivedNotApprovedQuantity = 0;
        $TotalPendingNonApprovedQuantity = 0;
        $TotalReqestedQuantity = 0;
        $TotalReceivingsApprovedNNonApproved = 0;

        // Calculate some numbers to Check the update the status of the RN line
        $ActiveReceivedNote = ReceiptNote::with(['purchaseEnquiry', 'receivingRecords' => function ($query){
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        }])->whereHas('receivingRecords', function ($query) {
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        })->findOrFail($RNReceiving->rn_id);

        foreach ($ActiveReceivedNote->receivingRecords as $key => $receivingRecord) {
            if(strpos($receivingRecord->status, 'Final Approval') !== false){
                $TotalFullyApprovedQuantity = $TotalFullyApprovedQuantity + $receivingRecord->received_quantity;
            }
            if(strpos($receivingRecord->status, 'Approved by Leve') !== false){
                $TotalReceivedNotApprovedQuantity = $TotalReceivedNotApprovedQuantity + $receivingRecord->received_quantity;
            }
            $TotalReceivingsApprovedNNonApproved = $TotalReceivingsApprovedNNonApproved + $receivingRecord->received_quantity;
        }
        $TotalPendingNonApprovedQuantity = $ActiveReceivedNote->purchaseEnquiry->quantity - $TotalFullyApprovedQuantity;
        $TotalReqestedQuantity = $ActiveReceivedNote->purchaseEnquiry->quantity;

        //return $TotalFullyApprovedQuantity;
        //$RNReceiving->receiptNote->status = "Partially Received Not Approved";
        //$RNReceiving->receiptNote->status = "Partially Received And Approved";
        //$RNReceiving->receiptNote->status = "Fully Received Not Approved";
        //$RNReceiving->receiptNote->status = "Fully Received And Approved";
        //$RNReceiving->receiptNote->status = "Not Yet Shipped";


        
        /* 

            CASE #1 Receiving Rejected:
                    
        */

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            // Update the item with the rejection status levels and status
            $RNReceiving->status           = "Receiving Completely Rejected by ".$user->name." at Level ". ($nextApprovalLevel - 1);
            $RNReceiving->update();

            //check if total received quantity is equal to the current received quantity then assign as Not Yet Shipped else mean we have some previous received quantity which means the status is "Partially Received". then check if the partially received quantity of approved items is greater than zero which means we "Partially Received And Approved" else "Partially Received Not Approved"
            if($TotalReceivedNotApprovedQuantity == $RNReceiving->received_quantity){
                $RNReceiving->receiptNote->status = "Not Yet Shipped";
            } elseif ($TotalReceivedNotApprovedQuantity > $RNReceiving->received_quantity) {
                $RNReceiving->receiptNote->status = "Partially Received Not Approved";   
            } elseif ($TotalFullyApprovedQuantity > 0) {
                $RNReceiving->receiptNote->status = "Partially Received And Approved";      
            }
            $RNReceiving->receiptNote->update();

            // Record Approval History
            ApprovalRNReceivingHistory::create([
                'company_id'                => $user->company_id,
                'receiving_id'              => $RNReceiving->id,
                'description'               => "Receiving Completely Rejected by ".$user->name." at Level ". ($nextApprovalLevel - 1),
                'current_action_owner_id'   => $user->id,
                'next_action_owners'        => 'N/A',
                'current_approval_level'    => ($nextApprovalLevel - 1),
                'next_approval_level'       => 'N/A',
                'decision'                  => $ValidationDecision,
                'decision_notes'            => $ValidationDecisionNote,
            ]);

            // Notify the previous approvers
            $RNVCompanyProjectUser = Role::where('company_id', $RNReceiving->receiptNote->company_id)->where('project_id', $RNReceiving->receiptNote->project_id)->where('role_name', 'RNV')->where('role_level', '<', ($nextApprovalLevel - 1))->get();
            if($RNVCompanyProjectUser->count()){
                foreach ($RNVCompanyProjectUser as $key => $Approver) {
                    $Approver->user->notify(new CompanyReceivingRejectedNotification($RNReceiving->receiptNote));
                }
            }

            // Notify the receiver
            $RNReceivingReceiver = $RNReceiving->receiver;
            $RNReceivingReceiver->notify(new CompanyReceivingRejectedNotification($RNReceiving->receiptNote));
            

            // Notify the vendor
            $VendorInvoicingUsers = Vendor::where('id', $RNReceiving->receiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
            foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                $VendorUser->notify(new CompanyReceivingRejectedNotification($RNReceiving->receiptNote));
            }
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Good Receiving Rejected.',
                "message"       => 'Good Receiving Rejected Successfully, A notification is sent to receiver, vendor, and any previous approvers.',
                "messageType"   => 'success'
            ], 200);
        }

        

        // Get How the approval shall be treated Unit Rate Wise/ PO Line Wise / Whole PO (po_doa_criterion)
        $RNDOACriterion = Project::where('company_id', $RNReceiving->receiptNote->company_id)->where('id', $RNReceiving->receiptNote->project_id)->get()->first()->rn_doa_criterion;

        // Get the financial limit of this (CURRENT Approver/Submitting User)
        $CurrentLevelRNVFinancialLimits = FinancialLimit::where('company_id', $RNReceiving->receiptNote->company_id)->where('project_id', $RNReceiving->receiptNote->project_id)->where('limit_type', 'RNV')->where('level', $RNReceiving->current_approval_level)->where('currency', $RNReceiving->receiptNote->quotationReponse->currency)->get()->first();

        /* We Should Include Adding Stocks Here */

        /* 

            CASE #3 Unit Rate Value 
                - Case 1: Current Level Does have finicial Limit.
                     - Case 1: the unit rate is within his financial limit
                     - Case 2: the unit rate is NOT within his fincancial limits
                - Case 2: Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values. 

        */

        if($RNDOACriterion == 'RN line Unit Rate Value'){

            # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the unit rate is within his financial limit and 2. unit rate is NOT within his fincancial limits). these go through the two cases of where to dispatch notifiation.
            if($CurrentLevelRNVFinancialLimits){

                // Check the value of the unit rate if within current financial limits and if not notify update that line level. if the below is true then mark the approval as a final approval for this line.
                if($CurrentLevelRNVFinancialLimits['limit'] >= $RNReceiving->receiptNote->quotationReponse->unit_rate){
                    /* We are Here because the approver is final approver and has financial limit */

                    # 1. Update status for RNReceiving Final Approval
                    $RNReceiving->status = 'Final Approval - Approved by '.$user->name.' at approval Level ('. $RNReceiving->current_approval_level .') and ready for invoicing';
                    $RNReceiving->update();

                    //check if there is no more pending quantity and update to fully received and approved else means its partially recieved and approved
                    if($TotalPendingNonApprovedQuantity == $RNReceiving->received_quantity){
                        $RNReceiving->receiptNote->status = "Fully Received And Approved";
                    } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved == $TotalReqestedQuantity) {
                        $RNReceiving->receiptNote->status = "Fully Received Not Approved";
                    } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved < $TotalReqestedQuantity) {
                        $RNReceiving->receiptNote->status = "Partially Received Not Approved";
                    } else {
                        $RNReceiving->receiptNote->status = "Partially Received And Approved";
                    }
                    $RNReceiving->receiptNote->update();


                    ApprovalRNReceivingHistory::create([
                        'company_id'                => $user->company_id,
                        'receiving_id'              => $RNReceiving->id,
                        'description'               => "Approved by Level ". $RNReceiving->current_approval_level ." ready for invoicing",
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Fully Approved',
                        'current_approval_level'    => $RNReceiving->current_approval_level,
                        'next_approval_level'       => 'Fully Approved',
                        'decision'                  => $ValidationDecision,
                        'decision_notes'            => $ValidationDecisionNote,
                    ]);

                    // Notify the vendor
                    $VendorInvoicingUsers = Vendor::where('id', $RNReceiving->receiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
                    foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                        $VendorUser->notify(new ReceivingApprovedForInvoicingNotification($RNReceiving->receiptNote));
                    }

                    return response()->json([
                        "messageTitle"  => 'Goods Receiving Approved.',
                        "message"       => 'Goods Receiving Approved Successfully, Ready For Vendor Invoicing.',
                        "messageType"   => 'success'
                    ], 200);


                } else {
                    /* We are Here because the approver is NOT final approver */
                    
                    // Update RNReceiving approval level and status
                    $RNReceiving->status           = "Approved by Level ". $RNReceiving->current_approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
                    $RNReceiving->current_approval_level   = $nextApprovalLevel;
                    $RNReceiving->update();

                    // Notify the next level approvers
                    $RNVCompanyProjectUser = Role::with('user')->where('company_id', $RNReceiving->receiptNote->company_id)->where('project_id', $RNReceiving->receiptNote->project_id)->where('role_name', 'RNV')->where('role_level', '>', ($nextApprovalLevel - 1))->get();
                    if($RNVCompanyProjectUser->count()){
                        foreach ($RNVCompanyProjectUser as $key => $Approver) {
                            $Approver->user->notify(new ReceivingApprovalRequiredNotification($RNReceiving->receiptNote));
                        }
                    }

                    $NextApprovalLevelNames = $RNVCompanyProjectUser->pluck('name')->toArray();
                    ApprovalRNReceivingHistory::create([
                        'company_id'                => $user->company_id,
                        'receiving_id'              => $RNReceiving->id,
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
                        "messageTitle"  => 'Good Receiving Approved Successfully.',
                        "message"       => 'Good Receiving Approved. This good receiving requires to be approved by another level before its ready for invoicing',
                        "messageType"   => 'success'
                    ], 200);


                }

            } else {
                /* We are here because current approver has no limit and considered as final approval */

                # 1. Update status for RNReceiving Final Approval
                $RNReceiving->status = 'Final Approval - Approved by '.$user->name.' at approval Level ('. $RNReceiving->current_approval_level .') and ready for invoicing';
                $RNReceiving->current_approval_level = $nextApprovalLevel - 1;
                $RNReceiving->update();

                //check if there is no more pending quantity and update to fully received and approved else means its partially recieved and approved
                if($TotalPendingNonApprovedQuantity == $RNReceiving->received_quantity){
                    $RNReceiving->receiptNote->status = "Fully Received And Approved";
                } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved == $TotalReqestedQuantity) {
                    $RNReceiving->receiptNote->status = "Fully Received Not Approved";
                } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved < $TotalReqestedQuantity) {
                    $RNReceiving->receiptNote->status = "Partially Received Not Approved";
                } else {
                    $RNReceiving->receiptNote->status = "Partially Received And Approved";
                }
                $RNReceiving->receiptNote->update();


                ApprovalRNReceivingHistory::create([
                    'company_id'                => $user->company_id,
                    'receiving_id'              => $RNReceiving->id,
                    'description'               => "Approved by Level ". $RNReceiving->current_approval_level ." ready for invoicing",
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Fully Approved',
                    'current_approval_level'    => $RNReceiving->current_approval_level,
                    'next_approval_level'       => 'Fully Approved',
                    'decision'                  => $ValidationDecision,
                    'decision_notes'            => $ValidationDecisionNote,
                ]);

                // Notify the vendor
                $VendorInvoicingUsers = Vendor::where('id', $RNReceiving->receiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
                foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new ReceivingApprovedForInvoicingNotification($RNReceiving->receiptNote));
                }


                return response()->json([
                    "messageTitle"  => 'Goods Receiving Approved.',
                    "message"       => 'Goods Receiving Approved Successfully, Ready For Vendor Invoicing.',
                    "messageType"   => 'success'
                ], 200);

            }


            /* 

                CASE #3 RN Line Value
                    - Case 1: Current Level Does have finicial Limit.
                         - Case 1: the unit rate is within his financial limit
                         - Case 2: the unit rate is NOT within his fincancial limits
                    - Case 2: Current Level Does Not have financial Limit. this means that this is the final approval and all approved lines are fully approved without checking the values. 

            */

        } elseif ($RNDOACriterion == 'RN line Value') {

            # (Case One) Current Level Does have finicial Limit (Which then has two cases 1. the unit rate is within his financial limit and 2. unit rate is NOT within his fincancial limits). these go through the two cases of where to dispatch notifiation.
            if($CurrentLevelRNVFinancialLimits){

                // Check the value of the unit rate if within current financial limits and if not notify update that line level. if the below is true then mark the approval as a final approval for this line.
                if($CurrentLevelRNVFinancialLimits['limit'] >= $RNReceiving->receiptNote->quotationReponse->unit_rate){
                    /* We are Here because the approver is final approver and has financial limit */

                    # 1. Update status for RNReceiving Final Approval
                    $RNReceiving->status = 'Final Approval - Approved by '.$user->name.' at approval Level ('. $RNReceiving->current_approval_level .') and ready for invoicing';
                    $RNReceiving->current_approval_level = $nextApprovalLevel - 1;
                    $RNReceiving->update();


                    //check if there is no more pending quantity and update to fully received and approved else means its partially recieved and approved
                    if($TotalPendingNonApprovedQuantity == $RNReceiving->received_quantity){
                        $RNReceiving->receiptNote->status = "Fully Received And Approved";
                    } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved == $TotalReqestedQuantity) {
                        $RNReceiving->receiptNote->status = "Fully Received Not Approved";
                    } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved < $TotalReqestedQuantity) {
                        $RNReceiving->receiptNote->status = "Partially Received Not Approved";
                    } else {
                        $RNReceiving->receiptNote->status = "Partially Received And Approved";
                    }
                    $RNReceiving->receiptNote->update();


                    ApprovalRNReceivingHistory::create([
                        'company_id'                => $user->company_id,
                        'receiving_id'              => $RNReceiving->id,
                        'description'               => "Approved by Level ". $RNReceiving->current_approval_level ." ready for invoicing",
                        'current_action_owner_id'   => $user->id,
                        'next_action_owners'        => 'Fully Approved',
                        'current_approval_level'    => $RNReceiving->current_approval_level,
                        'next_approval_level'       => 'Fully Approved',
                        'decision'                  => $ValidationDecision,
                        'decision_notes'            => $ValidationDecisionNote,
                    ]);

                    // Notify the vendor
                    $VendorInvoicingUsers = Vendor::where('id', $RNReceiving->receiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
                    foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                        $VendorUser->notify(new ReceivingApprovedForInvoicingNotification($RNReceiving->receiptNote));
                    }


                    return response()->json([
                        "messageTitle"  => 'Goods Receiving Approved.',
                        "message"       => 'Goods Receiving Approved Successfully, Ready For Vendor Invoicing.',
                        "messageType"   => 'success'
                    ], 200);
                    

                } else {
                    /* We are Here because the approver is NOT final approver */

                    // Update RNReceiving approval level and status
                    $RNReceiving->status           = 'Approved by Level '. $RNReceiving->current_approval_level .' and Assigned to Level '. $nextApprovalLevel .' for approval';
                    $RNReceiving->current_approval_level   = $nextApprovalLevel;
                    $RNReceiving->update();

                    // Notify the next level approvers
                    $RNVCompanyProjectUser = Role::with('user')->where('company_id', $RNReceiving->receiptNote->company_id)->where('project_id', $RNReceiving->receiptNote->project_id)->where('role_name', 'RNV')->where('role_level', '>', ($nextApprovalLevel - 1))->get();
                    if($RNVCompanyProjectUser->count()){
                        foreach ($RNVCompanyProjectUser as $key => $Approver) {
                            $Approver->user->notify(new ReceivingApprovalRequiredNotification($RNReceiving->receiptNote));
                        }
                    }

                    $NextApprovalLevelNames = $RNVCompanyProjectUser->pluck('name')->toArray();
                    ApprovalRNReceivingHistory::create([
                        'company_id'                => $user->company_id,
                        'receiving_id'              => $RNReceiving->id,
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
                        "messageTitle"  => 'Good Receiving Approved. This good receiving requires to be approved by another level before its ready for invoicing',
                        "message"       => 'Good Receiving Approved Successfully.',
                        "messageType"   => 'success'
                    ], 200);


                }

            } else {
                /* We are here because current approver has no limit and considered as final approval */

                # 1. Update status for RNReceiving Final Approval
                $RNReceiving->status = 'Final Approval - Approved by '.$user->name.' at approval Level ('. $RNReceiving->current_approval_level .') and ready for invoicing';
                $RNReceiving->current_approval_level = $nextApprovalLevel - 1;
                $RNReceiving->update();

                //check if there is no more pending quantity and update to fully received and approved else means its partially recieved and approved
                if($TotalPendingNonApprovedQuantity == $RNReceiving->received_quantity){
                    $RNReceiving->receiptNote->status = "Fully Received And Approved";
                } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved == $TotalReqestedQuantity) {
                    $RNReceiving->receiptNote->status = "Fully Received Not Approved";
                } elseif ($TotalPendingNonApprovedQuantity > $RNReceiving->received_quantity && $TotalReceivingsApprovedNNonApproved < $TotalReqestedQuantity) {
                    $RNReceiving->receiptNote->status = "Partially Received Not Approved";
                } else {
                    $RNReceiving->receiptNote->status = "Partially Received And Approved";
                }
                $RNReceiving->receiptNote->update();


                ApprovalRNReceivingHistory::create([
                    'company_id'                => $user->company_id,
                    'receiving_id'              => $RNReceiving->id,
                    'description'               => "Approved by Level ". $RNReceiving->current_approval_level ." ready for invoicing",
                    'current_action_owner_id'   => $user->id,
                    'next_action_owners'        => 'Fully Approved',
                    'current_approval_level'    => $RNReceiving->current_approval_level,
                    'next_approval_level'       => 'Fully Approved',
                    'decision'                  => $ValidationDecision,
                    'decision_notes'            => $ValidationDecisionNote,
                ]);

                // Notify the vendor
                $VendorInvoicingUsers = Vendor::where('id', $RNReceiving->receiptNote->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
                foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                    $VendorUser->notify(new ReceivingApprovedForInvoicingNotification($RNReceiving->receiptNote));
                }

                return response()->json([
                    "messageTitle"  => 'Goods Receiving Approved.',
                    "message"       => 'Goods Receiving Approved Successfully, Ready For Vendor Invoicing.',
                    "messageType"   => 'success'
                ], 200);

            }

        }


    }


    public function invoiceApprovalStatusUpdate(Request $request)
    {

        $user = $request->user();
        $ReceiptNoteInvoice = ReceiptNoteInvoice::findOrFail($request->get('InvoiceID'));
        $RNStatusUpdated = false;

        if($request->get('InvoiceStatus') == "Accepted"){
        
            //Update RN Line Invoicing Status if all this is the last pending status with "Invoice Uploaded" and the Invoicable Amount is 
            $PendingInvoices = ReceiptNoteInvoice::where('company_id', $user->company_id)->where('rn_id', $request->get('RNLineId'))->where('status', 'Invoice Uploaded')->get();

            if(($PendingInvoices->count() <= 1 && $request->get('InvoicableAmount') == 0)){
                ReceiptNote::findOrFail($request->get('RNLineId'))->update(['invoicing_status' => 'Invoicing Completed']);
                $RNStatusUpdated = true;
            } else {
                ReceiptNote::findOrFail($request->get('RNLineId'))->update(['invoicing_status' => 'Last Submitted Invoice Accepted By Client']);
            }

            //Update Invoice Status
            $ReceiptNoteInvoice->update([
                'invoice_validated_by'  => $user->id,
                'status'                => 'Invoice Accepted'
            ]);

            //Notify the supplier
            $VendorInvoicingUsers = Vendor::where('id', $ReceiptNoteInvoice->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
            foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                $VendorUser->notify(new InvoiceAcceptedByClientNotification($ReceiptNoteInvoice));
            }

            if($RNStatusUpdated){
               return response()->json([
                    "messageTitle"  => 'Invoice Accepted Successfully.',
                    "message"       => 'Invoice Accepted Successfully, Supplier Will Notified.',
                    "messageType"   => 'success',
                    "StatusUpdate"   => 'Invoicing Completed'
                ], 200); 
            } else {
                return response()->json([
                    "messageTitle"  => 'Invoice Accepted Successfully.',
                    "message"       => 'Invoice Accepted Successfully, Supplier Will Notified.',
                    "messageType"   => 'success',
                ], 200); 
            }
            

        }

        if($request->get('InvoiceStatus') == "Rejected"){
            $ReceiptNoteInvoice->update([
                'invoice_validated_by'  => $user->id,
                'status' => 'Invoice Rejected'
            ]);

            ReceiptNote::findOrFail($request->get('RNLineId'))->update(['invoicing_status' => 'Last Submitted Invoice Rejected By Client']);

            //Notify the supplier
            $VendorInvoicingUsers = Vendor::where('id', $ReceiptNoteInvoice->vendor_id)->whereHas('users', function ($query) { $query->where('sim_role', 'SIM'); })->first()->users;
            foreach ($VendorInvoicingUsers as $key => $VendorUser) {
                $VendorUser->notify(new InvoiceRejectedByClientNotification($ReceiptNoteInvoice));
            }


            return response()->json([
                "messageTitle"  => 'Invoice Rejected Successfully.',
                "message"       => 'Invoice Rejected Successfully, Supplier Will Notified.',
                "messageType"   => 'success',
            ], 200);

        }


    }

    public function cancelPOReceiptNoteLine(Request $request)
    {
        $user = $request->user();
        $ReceiptNoteId = $request->get('ReceiptNoteId');
        $CancelledQty = $request->get('CancelledQty');
        $CancellationReason = $request->get('CancellationReason');
        $CancellationNotes = $request->get('CancellationNotes');
        $ReceiptNote = ReceiptNote::findOrFail($ReceiptNoteId);



        //find to whom you should send the notification
        $usersIdsWithPOV = Role::where('company_id', $user->company_id)->where('project_id', $ReceiptNote->project_id)->where('role_name', 'POV')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithPOV = User::whereIn('id', $usersIdsWithPOV)->get();

        /* Create the cancellation request */
        $POCancellationRequest = POCancellationRequest::create([
            'created_by'            => $user->id,
            'company_id'            => $user->company_id,
            'project_id'            => $ReceiptNote->project_id,
            'purchase_order_id'     => $ReceiptNote->po_id,
            'receipt_note_id'       => $ReceiptNote->id,
            'canceled_quantity'     => $CancelledQty,
            'cancellation_reason'   => $CancellationReason,
            'notes'                 => $CancellationNotes,
        ]);

        /* update the tracker  */
        ApprovalPurchaseOrderCancellationHistory::create([
            'company_id'                        => $user->company_id,
            'purchase_order_cancellation_id'    => $POCancellationRequest->id,
            'description'                       => 'Purchase Order Cancellation Initiated',
            'current_action_owner_id'           => $user->id,
            'next_action_owners'                => (implode(', ', $usersWithPOV->pluck('name')->toArray())),
            'current_approval_level'            => 'N/A',
            'next_approval_level'               => 1,
            'decision'                          => 'N/A',
            'decision_notes'                    => 'N/A',
        ]);

        # notify relative Users
        foreach ($usersWithPOV as $key => $user) {
            $user->notify(new PurchaseOrderCancellationCreatedNotification($POCancellationRequest));
        }

        return response()->json([
            "messageTitle"  => 'Purchase Order Cancellation Initiated.',
            "message"       => 'Purchase Order Cancellation Initiated and Pending Approval.',
            "messageType"   => 'success',
        ], 200);
    }


    public function validatePOCancellationRequest(Request $request)
    {
        $user = $request->user();

        $ReceiptNoteId = $request->get('ReceiptNoteID');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $POCancellationRequest = POCancellationRequest::where('receipt_note_id', $ReceiptNoteId)->where('approval_level', '>', 0)->get()->first();
        $nextApprovalLevel = $POCancellationRequest->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $POCancellationRequest->approval_level   = 0;
            $POCancellationRequest->status           = "Rejected by Level ". ($nextApprovalLevel - 1);
            $POCancellationRequest->update();

            ApprovalPurchaseOrderCancellationHistory::create([
                'company_id'                        => $user->company_id,
                'purchase_order_cancellation_id'    => $POCancellationRequest->id,
                'description'                       => "Rejected by Level ". ($nextApprovalLevel - 1),
                'current_action_owner_id'           => $user->id,
                'next_action_owners'                => $POCancellationRequest->creator->name,
                'current_approval_level'            => ($nextApprovalLevel - 1),
                'next_approval_level'               => 'N/A',
                'decision'                          => $ValidationDecision,
                'decision_notes'                    => $ValidationDecisionNote,
            ]);


            $POCancellationRequestOrginator = $POCancellationRequest->creator;
            $POCancellationRequestOrginator->notify(new PurchaseOrderCancellationRejectedNotification($POCancellationRequest));
            
           
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Purchase Order Line Cancellation Request Rejected.',
                "message"       => 'Purchase Order Line Cancellation Request Rejected Successfully, A notification is sent to originator.',
                "messageType"   => 'success'
            ], 200);
        }

        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'POV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){


            //update the item with the approval levels and status
            $POCancellationRequest->status           = "Approved by Level ". $POCancellationRequest->approval_level ." and Assigned to Level ". $nextApprovalLevel ." for approval";
            $POCancellationRequest->approval_level   = $nextApprovalLevel;
            $POCancellationRequest->update();

            // Find and send notification to next level employees
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $user) {
                $user->notify(new PurchaseOrderCancellationValidationNotification($POCancellationRequest));
            }

            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();
            ApprovalPurchaseOrderCancellationHistory::create([
                'company_id'                        => $user->company_id,
                'purchase_order_cancellation_id'    => $POCancellationRequest->id,
                'description'                       => "Approved by Level ". ($nextApprovalLevel - 1) ." and Assigned to Level ". $nextApprovalLevel ." for approval",
                'current_action_owner_id'           => $user->id,
                'next_action_owners'                => (implode(', ', $NextApprovalLevelNames)),
                'current_approval_level'            => ($nextApprovalLevel - 1),
                'next_approval_level'               => $nextApprovalLevel,
                'decision'                          => $ValidationDecision,
                'decision_notes'                    => $ValidationDecisionNote,
            ]);
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Purchase Order Line Cancellation Request Approved.',
                "message"       => 'Purchase Order Line Cancellation Request Approved Successfully, The Purchase Order Line Cancellation Request requires to be approved by another level before it is completely cancelled.',
                "messageType"   => 'success'
            ], 200);



        } else {

            //update the item with the approval levels and status
            $POCancellationRequest->status                = "Approved by Level ". $POCancellationRequest->approval_level;
            $POCancellationRequest->active                = "Yes";
            $POCancellationRequest->update();

            /* Shall we update the Receipt Note */
            ReceiptNote::findOrfail($POCancellationRequest->receipt_note_id)->update([
                'status' => 'PO Line Cancelled',
            ]);

            //Notify the original requester 
            ApprovalPurchaseOrderCancellationHistory::create([
                'company_id'                        => $user->company_id,
                'purchase_order_cancellation_id'    => $POCancellationRequest->id,
                'description'                       => "Approved by Level ". $POCancellationRequest->approval_level,
                'current_action_owner_id'           => $user->id,
                'next_action_owners'                => 'Fully Approved',
                'current_approval_level'            => $POCancellationRequest->approval_level,
                'next_approval_level'               => 'Fully Approved',
                'decision'                          => $ValidationDecision,
                'decision_notes'                    => $ValidationDecisionNote,
            ]);


            $POCancellationRequestOrginator = $POCancellationRequest->creator;
            $POCancellationRequestOrginator->notify(new PurchaseOrderCancellationFullValidatedNotification());
     

            return response()->json([
                "messageTitle"  => 'Purchase Order Line Cancellation Request Approved.',
                "message"       => 'Purchase Order Line Cancellation Request Approved Successfully, Request sent for stock creation.',
                "messageType"   => 'success'
            ], 200);

        }
    }

}
