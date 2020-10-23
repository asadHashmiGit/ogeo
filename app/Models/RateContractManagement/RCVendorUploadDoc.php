<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RCVendorUploadDoc extends Model
{
    protected $table = 'rate_contract_request_vendor_uploaded_docs';

    protected  $fillable = [
        'rc_id',
        'quotation_id',
        'company_id',
        'vendor_user_id',
        'vendor_id',
        'document_name',
        'required_doc_name',
        'active',
	];

    //Date Casting
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	public function creator()
    {
        return $this->belongsTo('App\VendorUser', 'vendor_user_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function rateContractRequest()
    {
        return $this->belongsTo('App\RateContractRequest', 'rc_id');
    }
}
