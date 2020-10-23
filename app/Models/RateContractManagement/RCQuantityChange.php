<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RCQuantityChange extends Model
{

    protected $table = 'rate_contract_request_quantity_changes';

    protected $fillable = [
        'company_id',
        'approver_id',
        'rc_id',
        'quotation_id',
        'approval_level',
        'old_quantity',
        'new_quantity',
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

	public function approver()
    {
        return $this->belongsTo('App\User', 'approver_id');
    }

    public function rateContractRequest()
    {
        return $this->belongsTo('App\RateContractRequest', 'rc_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    
    
}
