<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class QuotationResponse extends Model
{
    protected $table = 'quotation_responses';

    protected $fillable = [
        'response_by',
        'vendor_id',
        'company_id',
        'purchase_enquiry_id',
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
        'active',
    ];

    public function getCreatedAtAttribute($timestamp)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp)
    {
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

    public function purchaseEnquiry()
    {
        return $this->belongsTo('App\PurchaseEnquiry', 'purchase_enquiry_id');
    }

    public function quotationRequest()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function purchaseOrders()
    {
        return $this->belongsToMany('App\PurchaseOrder', 'purchase_order_quotation_reposnses_pivot', 'quotation_reponse_id', 'purchase_order_id');
    }

}
