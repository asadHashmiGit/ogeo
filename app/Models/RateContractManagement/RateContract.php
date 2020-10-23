<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RateContract extends Model
{
    protected $table = 'rate_contracts';

    protected $fillable = [
        'rate_contract_group_id',
        'rate_contract_ingroup_id',
        'company_id',
        'project_id',
        'creator_id',
        'vendor_id',
        'quotation_id',
        'approval_level',
        'vendor_approved_at',
        'vendor_notes',
        'notes',
        'status',
        'active',
	];

    //Date Casting
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	//Statuses
	//Created Not Approved

	public function creator()
    {
        return $this->belongsTo('App\User', 'creator_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function rateContractRequests()
    {
        return $this->belongsToMany('App\RateContractRequest', 'rate_contract_rate_contract_request_pivot', 'rate_contract_id', 'rate_contract_request_id')->withPivot('approval_level', 'status', 'approval_notes');
    }

    //approval_level referes to Next Approval level

    public function vendorResponses()
    {
        return $this->belongsToMany('App\RCQuotationResponse', 'rate_contract_rate_contract_quotation_responses_pivot', 'rate_contract_id', 'rate_contract_quotation_response_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalRateContractHistory', 'rate_contract_id');
    }

}

