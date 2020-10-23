<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class CommercialEvaluation extends Model
{
    protected $table = 'quotation_commerical_evaluations';

    protected $fillable = [
        'commerical_evaluation_group_id',
        'commerical_evaluation_ingroup_id',
        'evaluator_id',
        'company_id',
        'quotation_id',
        'quotation_notes',
        'status',
        'active',
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	public function evaluator()
    {
        return $this->belongsTo('App\User', 'evaluator_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function purchaseOrders()
    {
        return $this->hasMany('App\PurchaseOrder', 'commercial_evaluation_id');
    }

    public function purchaseEnquiries()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'purchase_enquiry_commerical_evaluation_pivot', 'commerical_evaluation_id', 'pe_id')->withPivot('pe_note', 'status', 'ce_pe_notes');
    }
    
    public function purchaseEnquiriesActionedOnly()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'purchase_enquiry_commerical_evaluation_pivot', 'commerical_evaluation_id', 'pe_id')->withPivot('pe_note', 'status', 'ce_pe_notes')->wherePivotIn('status', ['Send for a New Request for Proposals', 'Purchase Enquiry line cancelled', 'Purchase Order Created']);
    }

    public function rateContractRequests()
    {
        return $this->belongsToMany('App\RateContractRequest', 'rate_contract_request_commerical_evaluation_pivot', 'commerical_evaluation_id', 'rc_id')->withPivot('rc_note','status');
    }

    


}
