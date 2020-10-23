<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;

class RateContractRequest extends Model
{
    use HistoryTracker, LogsActivity;

    protected $table = 'rate_contract_requests';
    protected $historyModel = RateContractRequestHistory::class;

    protected $fillable = [
        'rate_contract_request_group_id',
        'rate_contract_request_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'item_id',
        'item_description',
        'rc_start_period',
        'rc_end_period',
        'quantity',
        'u_o_m',
        'latitude',
        'longitude',
        'location_name',
        'advanced_payment',
        'notes',
        'approval_level',
        'status',
        'active',
        'grouping_id',
        'required_documents',
        'po_vendor_id'
	];

    protected static $logAttributes = ['*'];
    
    protected static $logOnlyDirty = true;

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
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
        return $this->hasMany('App\RCQuotationResponse', 'rate_contract_request_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalRateContractRequestHistory', 'rate_contract_request_id');
    }

    public function responses()
    {
        return $this->hasMany('App\RCQuotationResponse', 'rate_contract_request_id');
    }

    public function rfis()
    {
        return $this->hasMany('App\RCRFICommunication', 'rc_id');
    }

    public function uploadedDocs()
    {
        return $this->hasMany('App\RCVendorUploadDoc', 'rc_id');
    }

    public function commericalEvaluations()
    {
        return $this->belongsToMany('App\CommercialEvaluation', 'rate_contract_request_commerical_evaluation_pivot', 'rc_id', 'commerical_evaluation_id')->withPivot('rc_note','status');
    }

    public function quotations()
    {
        return $this->belongsToMany('App\QuotationRequest', 'quotationrequests_ratecontractsrequests', 'rate_contract_request_id', 'quotation_id')->withPivot('status');
    }

    public function quantityChanges()
    {
        return $this->hasMany('App\RCQuantityChange',  'rc_id');
    }

    public function rateContracts()
    {
        return $this->belongsToMany('App\RateContract', 'rate_contract_rate_contract_request_pivot', 'rate_contract_request_id', 'rate_contract_id')->withPivot('approval_level', 'status', 'approval_notes');
    }


}
