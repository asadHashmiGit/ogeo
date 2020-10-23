<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RCQuotationResponse extends Model
{
    protected $table = 'rate_contract_quotation_responses';

    protected $fillable = [
        'response_by',
        'vendor_id',
        'company_id',
        'item_id',
        'rate_contract_request_id',
        'quotation_id',
        'unit_rate',
        'price',
        'currency',
        'lead_days',
        'advanced_percentage',
        'notes',
        'uploaded_files',
        'validity_date',
        'status',
        'active'
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function vendorUser()
    {
        return $this->belongsTo('App\VendorUser', 'response_by');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'response_by');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function item()
    {
        return $this->belongsTo('App\ItemMaster', 'item_id');
    }

    public function rateContractRequest()
    {
        return $this->belongsTo('App\RateContractRequest');
    }

    public function quotationRequest()
    {
        return $this->belongsTo('App\RCQuotationRequest', 'quotation_id');
    }

    public function rateContracts()
    {
        return $this->belongsToMany('App\RateContract', 'rate_contract_rate_contract_quotation_responses_pivot', 'rate_contract_quotation_response_id', 'rate_contract_id');
    }


}
