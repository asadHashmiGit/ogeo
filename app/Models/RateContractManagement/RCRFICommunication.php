<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RCRFICommunication extends Model
{
    protected $table = 'quotation_rc_rfi_communication';

    protected $fillable = [
        'user_id',
        'vendor_user_id',
        'user_type',
        'vendor_id',
        'company_id',
        'quotation_id',
        'rc_id',
        'reply_id',
        'message',
        'read_at',
        'status'
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

	public function vendorUser()
    {
        return $this->belongsTo('App\VendorUser', 'vendor_user_id');
    }

	public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function purchaseEnquiry()
    {
        return $this->belongsTo('App\PurchaseEnquiry', 'pe_id');
    }
}
