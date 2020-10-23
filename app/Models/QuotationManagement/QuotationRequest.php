<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class QuotationRequest extends Model
{
    protected $table = 'quotation_requests';

    protected $fillable = [
        'quotation_group_id',
        'quotation_ingroup_id',
        'rfp_name',
        'created_by',
        'company_id',
        'project_id',
        'quotation_type',
        'quotation_for',
        'start_date',
        'end_date',
        'sourcing_type',
        'rfi_start_date',
        'rfi_end_date',
        'status',
        'cancellation_notes',
        'active',
    ];

    protected $dates = [
        'start_date',
        'end_date',
        'rfi_start_date',
        'rfi_end_date',
    ];

    public function getCreatedAtAttribute($timestamp)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    // public function getStartDateAttribute($timestamp) {
    //     return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    // }
    // public function getEndDateAttribute($timestamp) {
    //     return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    // }
    // public function getRfiStartDateAttribute($timestamp) {
    //     return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    // }
    // public function getRfiEndDateAttribute($timestamp) {
    //     return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    // }

    //Status
    // 1.Request for Proposals Floated
    // 2.RFQ Floated With Date Extension
    // 3.Commercial Evaluation Submitted
    // 4.RFQ Cancelled -- To Be Created

    public function creator()
    {
        return $this->belongsTo('App\User', 'created_by')->where('active', 'Yes');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id')->where('active', 'Yes');
    }

    public function purchaseEnquiries()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'quotationrequests_purchaseenquiries', 'quotation_id', 'purchase_enquiry_id')->withPivot('status', 'note')->wherePivotIn('status', ['Active', 'Commercial Evaluation Submitted']);
    }

    public function purchaseEnquiriesAllActive()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'quotationrequests_purchaseenquiries', 'quotation_id', 'purchase_enquiry_id')->withPivot('status', 'note');
    }

    public function cancelledPurchaseEnquiries()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'quotationrequests_purchaseenquiries', 'quotation_id', 'purchase_enquiry_id')->withPivot('status', 'note')->wherePivotIn('status', ['Cancelled']);
    }

    public function rateContractRequests()
    {
        return $this->belongsToMany('App\RateContractRequest', 'quotationrequests_ratecontractsrequests', 'quotation_id', 'rate_contract_request_id')->withPivot('status', 'note');
    }

    public function Vendors()
    {
        return $this->belongsToMany('App\Vendor', 'quotationrequests_vendors', 'quotation_id', 'vendor_id')->withPivot('company_id', 'status');
    }

    public function vendorResponses()
    {
        return $this->hasMany('App\QuotationResponse', 'quotation_id');
    }

    public function vendorRCResponses()
    {
        return $this->hasMany('App\RCQuotationResponse', 'quotation_id');
    }

    public function trackers()
    {
        return $this->hasMany('App\QuotationResponseTracker', 'quotation_id');
    }

    public function rfis()
    {
        return $this->hasMany('App\RFICommunication', 'quotation_id');
    }

    public function commericalEvaluation()
    {
        return $this->hasOne('App\CommercialEvaluation', 'quotation_id');
    }

    public function rcrrfis()
    {
        return $this->hasMany('App\RCRFICommunication', 'quotation_id');
    }

    public function rcrcommericalEvaluation()
    {
        return $this->hasOne('App\RCCommercialEvaluation', 'quotation_id');
    }

}
