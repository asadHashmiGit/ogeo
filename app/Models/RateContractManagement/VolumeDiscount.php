<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class VolumeDiscount extends Model
{
    protected $table = 'volume_discount';

    protected  $fillable = [
        'quotation_id',
        'company_id',
        'vendor_user_id',
        'vendor_id',
        'from_value',
        'to_value',
        'precentage_value',
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

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }
}
