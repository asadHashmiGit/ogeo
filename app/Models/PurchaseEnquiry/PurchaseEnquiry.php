<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;
use Spatie\Activitylog\Traits\LogsActivity;

class PurchaseEnquiry extends Model
{

    /* Purchase Enquiry Status */
    /*
    PE line Created, Waiting for Approval(s)
    PE line Rejected
    PE line Cancelled
    PE line Resubmitted for Approval(s)
    PE line Approved by Level (…)
    PE line Fully approved
    PE line released under Request for Proposals
    PE line first proposal received
    PE line commercial evaluation started
    PE line commercial evaluation completed
    PE line commercial evaluation rejected
    PE line Purchase Order Created, waiting for internal approval(s)
    PE line Purchase Order Rejected
    PE line Purchase Order Cancelled
    PE line Purchase Order is Resubmitted for Approval(s)
    PE line Purchase Order Internally Approved by Level (…)
    PE line Purchase Order Awarded
    PE line Purchase Order Accepted by the Awardee Vendor
    PE line Purchase Order Rescinded
    PE line Purchase Ordered Reawarded
    PE line Early Dispatch Notification Received
    PE line Receipt Note …% Approved
    PE line Invoiced …% Completed
    PE line Invoiced …% Accepted
     */

    use HistoryTracker, LogsActivity;

    protected $table = 'purchase_enquiries';
    protected $historyModel = PurchaseEnquiryHistory::class;

    protected $fillable = [
        'enquiry_from_item_master',
        'purchase_enquiry_group_id',
        'purchase_enquiry_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'expected_price',
        'total_expected_price',
        'enquiry_type',
        'store_item_request',
        'item_id',
        'vendor_commercial_offer',
        'type_of_services_contract',
        'title',
        'item_description',
        'service_description',
        'quantity',
        'u_o_m',
        'images',
        'p_images',
        'latitude',
        'longitude',
        'location_name',
        'underlying_transaction',
        'sourcing_priority',
        'advanced_payment',
        'retention_percentage',
        'retention_days',
        'retention_released',
        'notes',
        'approval_level',
        'status',
        'active',
        'grouping_id',
        'required_documents',
        'po_vendor_id',
    ];

    protected static $logAttributes = ['*'];

    protected static $logOnlyDirty = true;

    public function getCreatedAtAttribute($timestamp)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function creator()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function item()
    {
        return $this->belongsTo('App\ItemMaster', 'item_id');
    }

    public function vendorResponses()
    {
        return $this->hasMany('App\QuotationResponse', 'purchase_enquiry_id');
    }

    public function childheaders()
    {
        return $this->hasMany(PurchaseEnquiryChildHeaders::class, 'purchase_enquiry_master_id', 'id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalPurchaseEnquiryHistory', 'purchase_enquiry_id');
    }

    public function responses()
    {
        return $this->hasMany('App\QuotationResponse', 'purchase_enquiry_id');
    }

    public function rfis()
    {
        return $this->hasMany('App\RFICommunication', 'pe_id');
    }

    public function uploadedDocs()
    {
        return $this->hasMany('App\VendorUploadDoc', 'pe_id');
    }

    public function commericalEvaluations()
    {
        return $this->belongsToMany('App\CommercialEvaluation', 'purchase_enquiry_commerical_evaluation_pivot', 'pe_id', 'commerical_evaluation_id')->withPivot('pe_note', 'status', 'ce_pe_notes');
    }

    public function quotations()
    {
        return $this->belongsToMany('App\QuotationRequest', 'quotationrequests_purchaseenquiries', 'purchase_enquiry_id', 'quotation_id')->withPivot('status');
    }

    public function activeQuotation()
    {
        return $this->belongsToMany('App\QuotationRequest', 'quotationrequests_purchaseenquiries', 'purchase_enquiry_id', 'quotation_id')->withPivot('status')->wherePivot('status', 'Active');
    }

    public function purchaseOrders()
    {
        return $this->belongsToMany('App\PurchaseOrder', 'purchase_order_purchase_enquiries_pivot', 'purchase_enquiry_id', 'purchase_order_id')->withPivot('approval_level', 'status', 'approval_notes');
    }

    public function purchaseOrderActive()
    {
        return $this->belongsToMany('App\PurchaseOrder', 'purchase_order_purchase_enquiries_pivot', 'purchase_enquiry_id', 'purchase_order_id')->withPivot('approval_level', 'status', 'approval_notes')->wherePivot('status', 'NOT LIKE', '%Rejected%');
    }
    

    public function stockItems()
    {
        return $this->belongsToMany('App\StockItem', 'stockitems_purchaseenquiries', 'purchase_enquiry_id', 'stock_item_id')->withPivot('status', 'note');
    }

    public function quantityChanges()
    {
        return $this->hasMany('App\QuantityChange', 'pe_id')->orderBy('created_at', 'asc');
    }

    public function ReceiptNote()
    {
        return $this->hasOne('App\ReceiptNote', 'pe_id');
    }

}
