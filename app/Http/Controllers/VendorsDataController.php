<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\ReceiptNote;
use App\RateContract;
use App\PurchaseOrder;
use App\PurchaseEnquiry;
use App\QuotationRequest;
use App\RFICommunication;
use App\QuotationResponse;
use App\RCRFICommunication;
use Illuminate\Http\Request;
use yajra\Datatables\Datatables;

class VendorsDataController extends Controller
{

    public function getVendorsDetails(Request $request)
    {
        $vendorUser = $request->user();

        return $vendorUser->vendors;
    }
    public function getVendorQuotationsDatatable(Request $request)
    {
        $vendorUser = $request->user();

        $QuotationRequests = QuotationRequest::with('creator', 'company', 'Vendors', 'commericalEvaluation')->whereHas('Vendors', function ($query) use ($vendorUser) {
            $query->where('start_date', '<=', Carbon::now())->whereIn('vendors.id', $vendorUser->vendors->pluck('id')->toArray());
        })->where('sourcing_type', 'Sealed Bid');

        return Datatables::of($QuotationRequests)
            ->addColumn('rfp_full_id', function ($QuotationRequest) {
                if ($QuotationRequest->company->rfq_prefix == "") {
                    return "RfP-" . $QuotationRequest->quotation_group_id;
                } else {
                    return $QuotationRequest->company->rfq_prefix . "-" . $QuotationRequest->quotation_group_id;
                }

            })
            ->editColumn('start_date', function ($QuotationRequest) {
                return $QuotationRequest->start_date->format('d.M.Y - (H:m:s)');
            })
            ->editColumn('end_date', function ($QuotationRequest) {
                if ($QuotationRequest->status == "Commercial Evaluation Submitted") {
                    return $QuotationRequest->commericalEvaluation->created_at;
                } else {
                    return $QuotationRequest->end_date->format('d.M.Y - (H:m:s)');
                }
            })
            ->editColumn('rfi_start_date', function ($QuotationRequest) {
                return $QuotationRequest->rfi_start_date->format('d.M.Y - (H:m:s)');
            })
            ->editColumn('rfi_end_date', function ($QuotationRequest) {
                if ($QuotationRequest->status == "Commercial Evaluation Submitted") {
                    return $QuotationRequest->commericalEvaluation->created_at;
                } else {
                    return $QuotationRequest->rfi_end_date->format('d.M.Y - (H:m:s)');
                }
            })
            ->editColumn('vendor_status', function ($QuotationRequest) use ($vendorUser) {

                $vendorDetails = $vendorUser->vendors->where('company_id', $QuotationRequest->company_id)->first();

                foreach ($QuotationRequest->trackers as $key => $statusTracker) {
                    if ($statusTracker->vendor_id == $vendorDetails->id) {
                        return '<b>' . $statusTracker->status . '</b>';
                    }
                }

            })
            ->addColumn('days_left', function ($QuotationRequest) {
                return $QuotationRequest->end_date->diffForHumans();
            })
            ->addColumn('quotation_type', function ($QuotationRequest) {
                if ($QuotationRequest->quotation_for == "PE") {
                    return "Purchase Enquiry";
                } else {
                    return "Rate Contract";
                }

            })
            ->addColumn('linesCount', function ($QuotationRequest) {
                if ($QuotationRequest->quotation_for == "PE") {
                    return $QuotationRequest->purchaseEnquiries->count();
                } else {
                    return $QuotationRequest->rateContractRequests->count();
                }

            })
            ->addColumn('action', function ($QuotationRequest) use ($vendorUser) {

                $vendorDetails = $vendorUser->vendors->where('company_id', $QuotationRequest->company_id)->first();
                foreach ($QuotationRequest->trackers as $key => $statusTracker) {
                    if ($statusTracker->vendor_id == $vendorDetails->id) {
                        $vendorStatus = $statusTracker->status;
                    }
                }

                if ($QuotationRequest->status == "Request for Proposals cancelled" || $QuotationRequest->status == "Commercial Evaluation Submitted" || $vendorStatus == 'FABO Submitted') {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="QuotationRequest" data-recordid="' . $QuotationRequest->id . '"><i class="fa fa-info"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="QuotationRequest" data-recordid="' . $QuotationRequest->id . '"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="QuotationRequest" data-recordid="' . $QuotationRequest->id . '" data-recordtype="' . $QuotationRequest->quotation_for . '"><i class="fa fa-edit"></i> </button>';

                }

            })
            ->rawColumns(['action', 'vendor_status'])
            ->make(true);

    }

    public function getAllPERFIDetails(Request $request)
    {
        $results = [];
        $results[] = PurchaseEnquiry::with('company')->findOrFail($request->get('PEId'));

        if ($request->get('QuotationType') == "PE") {
            $results[] = RFICommunication::with(['user', 'vendorUser', 'company', 'quotation.trackers', "purchaseEnquiry"])->where('pe_id', $request->get('PEId'))->get();

            return $results;
        }
        if ($request->get('QuotationType') == "RC") {
            $results[] = RCRFICommunication::with(['user', 'vendorUser', 'company', 'quotation.trackers', "purchaseEnquiry"])->where('rc_id', $request->get('PEId'))->get();

            return $results;
        }

    }

    public function getQuotationDetails(Request $request)
    {
        $AllData = [];
        $vendorUser = $request->user();
        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationId'));
        $vendorDetails = $vendorUser->vendors->where('company_id', $QuotationRequest->company_id)->first();

        if ($QuotationRequest->quotation_for == "PE") {
            return QuotationRequest::with([
                'company',
                'purchaseEnquiriesAllActive.rfis',
                'project',
                'creator',
                'purchaseEnquiriesAllActive.item.itemTemplate',
                'purchaseEnquiriesAllActive.uploadedDocs',
                'purchaseEnquiriesAllActive.project',
                'purchaseEnquiriesAllActive.responses' => function ($query0) use ($vendorUser, $QuotationRequest) {
                    $query0->where('quotation_id', $QuotationRequest->id)->whereIn('vendor_id', $vendorUser->vendors->pluck('id')->toArray());
                },
                'trackers' => function ($query1) use ($vendorDetails) {
                    $query1->where('vendor_id', $vendorDetails->id);
                }/*, 'purchaseEnquiriesAllActive.rfis' => function($query2) use ($vendorDetails){
                    $query2->where('vendor_id', $vendorDetails->id);
                }*/,
                'purchaseEnquiriesAllActive.uploadedDocs' => function ($query3) use ($vendorDetails) {
                    $query3->where('vendor_id', $vendorDetails->id);
                }])
                ->findOrFail($request->get('QuotationId'));
        }

        if ($QuotationRequest->quotation_for == "RC") {

            //dd($vendorDetails->id);

            return QuotationRequest::with(['rateContractRequests.item', 'rateContractRequests.uploadedDocs', 'rateContractRequests.project', 'rateContractRequests.responses' => function ($query0) use ($vendorUser) {
                $query0->whereIn('vendor_id', $vendorUser->vendors->pluck('id')->toArray());
            }, 'trackers' => function ($query1) use ($vendorDetails) {
                $query1->where('vendor_id', $vendorDetails->id);
            }, 'rateContractRequests.rfis' => function ($query2) use ($vendorDetails) {
                $query2->where('vendor_id', $vendorDetails->id);
            }, 'rateContractRequests.uploadedDocs' => function ($query3) use ($vendorDetails) {
                $query3->where('vendor_id', $vendorDetails->id);
            }])->findOrFail($request->get('QuotationId'));
        }

    }

    public function getQuotationDetailsAuction(Request $request)
    {
        $AllData = [];
        $vendorUser = $request->user();
        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationId'));
        $vendorDetails = $vendorUser->vendors->where('company_id', $QuotationRequest->company_id)->first();

        /* WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING  */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */
        /* MUST MUST MUST Check if the Vendor Has Allowed access to the requested Quotation */

        $QuotationRequestLineDetails = QuotationRequest::with([
            'purchaseEnquiries.item',
            'purchaseEnquiries.uploadedDocs',
            'purchaseEnquiries.project',
            'purchaseEnquiries.responses' => function ($query0) use ($vendorUser) {
                $query0->whereIn('vendor_id', $vendorUser->vendors->pluck('id')->toArray());
            }, 'trackers' => function ($query1) use ($vendorDetails) {
                $query1->where('vendor_id', $vendorDetails->id);
            }, 'purchaseEnquiries.rfis' => function ($query2) use ($vendorDetails) {
                $query2->where('vendor_id', $vendorDetails->id);
            }, 'purchaseEnquiries.uploadedDocs' => function ($query3) use ($vendorDetails) {
                $query3->where('vendor_id', $vendorDetails->id);
            }])
        ->findOrFail($request->get('QuotationId'));

        //Get PE Line Rankings Based on All Vendor Responses...
        $PELineResponseRanking = QuotationResponse::select('quotation_id', 'vendor_id', 'purchase_enquiry_id', 'unit_rate', 'company_id')->where('company_id', $QuotationRequest->company_id)->where('quotation_id', $request->get('QuotationId'))->get();

        if (!empty($PELineResponseRanking)) {

            # Find Total Bid Value
            $TotalBidValue = [];
            # used to find the total bidding value
            $VednorPEsResponsesGrouped = $PELineResponseRanking->groupBy([
                'vendor_id',
                function ($item) {
                    return $item['purchase_enquiry_id'];
                },
            ]);
            # Remove the last array to restructe the data
            foreach ($VednorPEsResponsesGrouped as $key => $VednorPEsResponsesGrouped1) {
                foreach ($VednorPEsResponsesGrouped1 as $key1 => $VednorPEsResponsesGrouped2) {
                    $VednorPEsResponsesGrouped[$key][$key1] = $VednorPEsResponsesGrouped2[0];
                }
            }
            # accomulation loop to find the actual total price and assigned it to the return value to page
            foreach ($VednorPEsResponsesGrouped as $vendorId => $VednorPEsResponsesGrouped1) {
                $totalVendorBidValue = 0;
                foreach ($VednorPEsResponsesGrouped1 as $PEId => $VednorPEsResponsesGrouped2) {
                    $totalVendorBidValue = $totalVendorBidValue + $VednorPEsResponsesGrouped2->price;
                }
                $TotalBidValue[$vendorId] = $totalVendorBidValue;
            }

            #used to find the ranking
            $PELineResponseRankingGrouped = $PELineResponseRanking->groupBy([
                'purchase_enquiry_id',
                function ($item) {
                    return $item['vendor_id'];
                },
            ]);

            # Remove the last array to restructe the data
            foreach ($PELineResponseRankingGrouped as $key => $PELineResponseRankingGrouped1) {
                foreach ($PELineResponseRankingGrouped1 as $key1 => $PELineResponseRankingGrouped2) {
                    $PELineResponseRankingGrouped[$key][$key1] = $PELineResponseRankingGrouped2[0];
                }
            }

            # Sorting vendor responses by unit rate asc order
            foreach ($PELineResponseRankingGrouped as $key => $PELineResponseRankingGrouped1) {
                $PELineResponseRankingGrouped[$key] = $PELineResponseRankingGrouped1->sortBy(function ($item) {
                    if ($item->unit_rate == null) {
                        // null means no price submitted by the vender then assum large amount as below
                        $item->unit_rate = 100000000000000000000000000000;
                        return $item->unit_rate;
                    } else {
                        return $item->unit_rate;
                    }
                });
            }

            # Return The Vedor ID Location which is the ranking in the list
            $VendorRanking = [];
            foreach ($PELineResponseRankingGrouped as $PEid => $PEVendorsResponses) {
                $ActualVendorRanking = 1;
                $PELineLowestPrice = 0;
                foreach ($PEVendorsResponses as $VendorId => $PEVendorResponse) {

                    if ($VendorId == $vendorDetails->id) {
                        //check if the same unit rate is available by another vendor
                        $FilterSimilarPrices = $PEVendorsResponses->filter(function ($item, $key) use ($PEVendorResponse) {
                            if ($item->unit_rate == $PEVendorResponse->unit_rate) {
                                return $item;
                            }
                        });

                        //Check if the unit rate price is not submitted.
                        if ($PEVendorResponse->unit_rate == 100000000000000000000000000000) {
                            $VendorRanking[$PEid] = 'Price Not Submitted';
                            break;
                        } elseif (count($FilterSimilarPrices) > 1) {
                            //Check if the prices are similar...
                            $VendorRanking[$PEid] = 'Matching Price With ' . (count($FilterSimilarPrices) - 1) . ' Vendor(s).';
                            break;
                        } else {

                            if ($ActualVendorRanking == 1) {
                                $VendorRanking[$PEid] = "Lowest Bidder";
                            } elseif ($ActualVendorRanking == 2) {
                                $VendorRanking[$PEid] = '2nd Lowest Bidder';
                            } elseif ($ActualVendorRanking == 3) {
                                $VendorRanking[$PEid] = '3rd Lowest Bidder';
                            } else {
                                $VendorRanking[$PEid] = $ActualVendorRanking . 'th Lowest Bidder';
                            }
                            break;
                        }
                    }
                    $ActualVendorRanking = $ActualVendorRanking + 1;
                }
            }
        }

        $AllData[] = $QuotationRequestLineDetails;
        $AllData[] = $VendorRanking;
        $AllData[] = $PELineResponseRankingGrouped;
        $AllData[] = $TotalBidValue;

        return $AllData;

    }

    public function getPERFIDetails(Request $request)
    {
        $vendorUser = $request->user();
        $vendorDetails = $vendorUser->vendors->where('company_id', $request->get('CompanyId'))->first();
        if ($request->get('QuotationType') == "PE") {
            return RFICommunication::with('user', 'vendorUser', 'company')->where('pe_id', $request->get('PEId'))->where('vendor_id', $vendorDetails->id)->get();
        }
        if ($request->get('QuotationType') == "RC") {
            return RCRFICommunication::with('user', 'vendorUser', 'company')->where('rc_id', $request->get('PEId'))->where('vendor_id', $vendorDetails->id)->get();
        }
    }

    public function getVendorPOsDatatable(Request $request)
    {

        $vendorUser = $request->user();
        $vendorDetailsIds = $vendorUser->vendors->pluck('id');

        $PurchaseOrders = PurchaseOrder::with(['company', 'vendor', 'purchaseEnquiries', 'vendorResponses', 'history'])->whereIn('purchase_orders.vendor_id', $vendorDetailsIds)->where('status', 'LIKE', '%PO Sent To Vendor%')->orWhere('status', 'Rejected By Vendor')->orWhere('status', 'Accepted By Vendor')->select('purchase_orders.*');

        $datatableReturn = Datatables::of($PurchaseOrders)
            ->addColumn('po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries->count();
            })
            ->addColumn('approved_po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('rejected_po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Rejected By%')->count();
            })
            ->addColumn('action', function ($PurchaseOrder) {

                if ($PurchaseOrder->status == 'Rejected By Vendor' || $PurchaseOrder->status == 'Accepted By Vendor') {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-info"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-info edit-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-edit" ></i> </button>';
                }

            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);

    }

    public function getVendorPODetails(Request $request)
    {
        $vendorUser = $request->user();

        return PurchaseOrder::with(['history.currentActionBy', 'vendorResponses' => function ($query1) {
            $query1->with('purchaseEnquiry.purchaseOrders')->whereHas('purchaseEnquiry', function ($query2) {
                $query2->with('purchaseOrders')->whereHas('purchaseOrders', function ($query4) {
                    $query4->with('purchaseOrders')->where('purchase_order_purchase_enquiries_pivot.status', 'LIKE', '%Final Approval%');
                });
            });
        }, 'vendorResponses.purchaseEnquiry.item'])->findOrFail($request->get('POId'));

        return PurchaseOrder::with(['vendorResponses.purchaseEnquiry.item'])->findOrFail($request->get('POId'));

    }

    public function getVendorRCsDatatable(Request $request)
    {

        $vendorUser = $request->user();
        $vendorDetailsIds = $vendorUser->vendors->pluck('id');

        $RateContracts = RateContract::with(['company', 'vendor', 'rateContractRequests', 'vendorResponses', 'history'])->whereIn('rate_contracts.vendor_id', $vendorDetailsIds)->where('status', 'LIKE', '%RC Sent To Vendor%')->orWhere('status', 'Rejected By Vendor')->orWhere('status', 'Accepted By Vendor')->select('rate_contracts.*');

        $datatableReturn = Datatables::of($RateContracts)
            ->addColumn('rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests->count();
            })
            ->addColumn('approved_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('rejected_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Rejected By%')->count();
            })
            ->addColumn('action', function ($RateContract) {

                if ($RateContract->status == 'Rejected By Vendor' || $RateContract->status == 'Accepted By Vendor') {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContract" data-recordid="' . $RateContract->id . '"><i class="fa fa-info"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContract" data-recordid="' . $RateContract->id . '"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-info edit-placeholder" data-elquentClass="RateContract" data-recordid="' . $RateContract->id . '"><i class="fa fa-edit" ></i> </button>';
                }

            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);

    }

    public function getVendorRCDetails(Request $request)
    {
        $vendorUser = $request->user();

        return RateContract::with(['history.currentActionBy', 'vendorResponses' => function ($query1) {
            $query1->with('rateContractRequest.rateContracts')->whereHas('rateContractRequest', function ($query2) {
                $query2->with('rateContracts')->whereHas('rateContracts', function ($query4) {
                    $query4->with('rateContracts')->where('rate_contract_rate_contract_request_pivot.status', 'LIKE', '%Final Approval%');
                });
            });
        }, 'vendorResponses.rateContractRequest.item'])->findOrFail($request->get('RCId'));

        return RateContract::with(['vendorResponses.rateContractRequest.item'])->findOrFail($request->get('RCId'));

    }

    public function getVendorPORNsDatatable(Request $request)
    {

        $vendorUser = $request->user();
        $vendorDetailsIds = $vendorUser->vendors->pluck('id');

        $PurchaseOrders = PurchaseOrder::with(['receiptNotes', 'company', 'vendor', 'purchaseEnquiries', 'vendorResponses', 'history'])->whereIn('purchase_orders.vendor_id', $vendorDetailsIds)->where('status', 'Accepted By Vendor')->select('purchase_orders.*');

        $datatableReturn = Datatables::of($PurchaseOrders)
            ->addColumn('po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries->count();
            })
            ->addColumn('total_po_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('partially_received_not_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Partially Received Not Approved')->count();
            })
            ->addColumn('partially_received_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Partially Received And Approved')->count();
            })
            ->addColumn('fully_received_not_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Fully Received Not Approved')->count();
            })
            ->addColumn('fully_received_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Fully Received And Approved')->count();
            })
            ->addColumn('action', function ($PurchaseOrder) {

                return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-info edit-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-edit"></i> </button> <button class="btn btn-xs btn-success invoice-placeholder" data-elquentClass="PurchaseOrder" data-recordid="' . $PurchaseOrder->id . '"><i class="fa fa-money"></i> </button>';

            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);

    }

    public function getVendorPORNsDetails(Request $request)
    {

        $ResultData = [];
        $PendingQuantity = array();
        $ReceivedQuantity = array();
        $InvoicableQuantity = array();
        $InvoicableAmount = array();
        $InvoicedAmount = array();
        $RetentionAmount = array();
        $RetentionDueDate = array();

        $ActiveReceivedNotes = ReceiptNote::with(['purchaseEnquiry', 'invoices' => function ($query) {
            $query->where('status', '!=', 'Invoice Rejected');
        }, 'receivingRecords' => function ($query) {
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        }])->where('po_id', $request->get('POId'))->get();

        foreach ($ActiveReceivedNotes as $ReceiptNoteID => $ActiveReceivedNote) {
            $ReceivedQuantity[$ReceiptNoteID] = 0;
            $InvoicableQuantity[$ReceiptNoteID] = 0;
            $InvoicableAmount[$ReceiptNoteID] = 0;
            $InvoicedAmount[$ReceiptNoteID] = 0;
            $RetentionAmount[$ReceiptNoteID] = 0;
            $RetentionDueDate[$ReceiptNoteID] = 'Date Not Assigned As Deliveries Are Not Completed';
            $ActiveReceivingRecords = $ActiveReceivedNote->receivingRecords;

            foreach ($ActiveReceivingRecords as $key => $receivingRecord) {
                $ReceivedQuantity[$ReceiptNoteID] = $ReceivedQuantity[$ReceiptNoteID] + $receivingRecord->received_quantity;
                if (strpos($receivingRecord->status, 'Final Approva') == false) {
                    $RetentionAmount[$ReceiptNoteID] = $RetentionAmount[$ReceiptNoteID] + $receivingRecord->receiving_rentention_amount;
                    $InvoicableQuantity[$ReceiptNoteID] = $InvoicableQuantity[$ReceiptNoteID] + $receivingRecord->received_quantity;
                    $InvoicableAmount[$ReceiptNoteID] = $InvoicableAmount[$ReceiptNoteID] + $receivingRecord->value_of_received_quantity;
                }

                if ($ActiveReceivedNote->status == 'Fully Received And Approved' && $RetentionAmount[$ReceiptNoteID] != 0) {
                    // We are capturing the updated at since this is the last thing that will happen on the records
                    //$RetentionDueDate[$ReceiptNoteID] = $receivingRecord->updated_at;
                    $RetentionDueDate[$ReceiptNoteID] = Carbon::createFromFormat("d.M.Y - (H:i:s)", $ActiveReceivedNote->updated_at)->addDays($ActiveReceivedNote->purchaseEnquiry->retention_days)->format("d.M.Y - (H:i:s)");
                }

            }

            /* Check if the date is passed after retention release then Adjust the invoicable amount */
            $RetentionReleaseDate = Carbon::createFromFormat("d.M.Y - (H:i:s)", $ActiveReceivedNote->updated_at)->addDays($ActiveReceivedNote->purchaseEnquiry->retention_days);

            if (Carbon::now()->lt($RetentionReleaseDate->addDays($ActiveReceivedNote->purchaseEnquiry->retention_days))) {
                /* Subtract Retention from Invoicable amount for this RN Line */
                $InvoicableAmount[$ReceiptNoteID] = $InvoicableAmount[$ReceiptNoteID] - $RetentionAmount[$ReceiptNoteID];
            }

            //Get Invoiced Amount
            foreach ($ActiveReceivedNote->invoices as $key => $vendorInvoice) {
                $InvoicedAmount[$ReceiptNoteID] = $InvoicedAmount[$ReceiptNoteID] + $vendorInvoice->invoice_amount;
            }

            $PendingQuantity[$ReceiptNoteID] = $ActiveReceivedNote->purchaseEnquiry->quantity - $ReceivedQuantity[$ReceiptNoteID];
        }

        $ReceiptNote = ReceiptNote::with(['purchaseOrder', 'invoices', 'receivingRecords', 'purchaseEnquiry.item', 'quotationReponse'])->where('po_id', $request->get('POId'))->get();

        $ResultData[0] = $ReceiptNote;
        $ResultData['ReceivedQuantity'] = $ReceivedQuantity;
        $ResultData['PendingQuantity'] = $PendingQuantity;
        $ResultData['InvoicableQuantity'] = $InvoicableQuantity;
        $ResultData['InvoicableAmount'] = $InvoicableAmount;
        $ResultData['InvoicedAmount'] = $InvoicedAmount;
        $ResultData['RetentionAmount'] = $RetentionAmount;
        $ResultData['RetentionDueDate'] = $RetentionDueDate;

        return $ResultData;

    }

    public function getVendorAuctionList(Request $request)
    {

        $now = Carbon::now();
        $vendorUser = $request->user();

        $ActiveAuctions = QuotationRequest::with(['creator', 'company', 'purchaseEnquiries', 'Vendors' => function ($query) use ($vendorUser) {
            $query->whereIn('vendors.id', $vendorUser->vendors->pluck('id')->toArray());
        }, 'vendorResponses' => function ($query) use ($vendorUser) {
            $query->whereIn('quotation_responses.vendor_id', $vendorUser->vendors->pluck('id')->toArray());
        }, 'trackers' => function ($query) use ($vendorUser) {
            $query->whereIn('quotation_response_tracker.vendor_id', $vendorUser->vendors->pluck('id')->toArray());
        }])->whereHas('Vendors', function ($query) use ($vendorUser) {
            $query->whereIn('vendors.id', $vendorUser->vendors->pluck('id')->toArray());
        })->where('sourcing_type', 'Live Auctions')->where('end_date', '>', $now)->orderBy('end_date', 'asc')->get();

        $inActiveAuctions = QuotationRequest::with(['creator', 'company', 'purchaseEnquiries', 'Vendors' => function ($query) use ($vendorUser) {
            $query->whereIn('vendors.id', $vendorUser->vendors->pluck('id')->toArray());
        }, 'vendorResponses' => function ($query) use ($vendorUser) {
            $query->whereIn('quotation_responses.vendor_id', $vendorUser->vendors->pluck('id')->toArray());
        }, 'trackers' => function ($query) use ($vendorUser) {
            $query->whereIn('quotation_response_tracker.vendor_id', $vendorUser->vendors->pluck('id')->toArray());
        }])->whereHas('Vendors', function ($query) use ($vendorUser) {
            $query->whereIn('vendors.id', $vendorUser->vendors->pluck('id')->toArray());
        })->where('sourcing_type', 'Live Auctions')->where('end_date', '<=', $now)->orderBy('end_date', 'asc')->get();

        #finding total bid value
        foreach ($ActiveAuctions as $key => $Auction) {
            $totalVendorBidValue = 0;
            foreach ($Auction->vendorResponses as $ResponseKey => $vendorResponse) {

                $totalVendorBidValue = $totalVendorBidValue + $vendorResponse->price;
            }
            $ActiveAuctions[$key]['TotalBidValue'] = $totalVendorBidValue;
        }

        #finding total submitted lines value
        foreach ($ActiveAuctions as $key => $Auction) {
            $totalVendorBidValue = 0;

            $SubmittedLinePrices = $Auction->vendorResponses->filter(function ($item, $key) {
                if ($item->unit_rate != null) {
                    return $item;
                }
            });
            $ActiveAuctions[$key]['TotalSubmittedLines'] = count($SubmittedLinePrices);
        }

        $Auctions['Active'] = $ActiveAuctions;
        $Auctions['inActive'] = $inActiveAuctions;
        $Auctions['now'] = $now;

        return $Auctions;
    }

}
