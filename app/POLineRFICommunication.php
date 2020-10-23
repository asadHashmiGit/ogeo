<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class POLineRFICommunication extends Model
{
    protected $table = 'purchase_order_line_rfi_communications';

    protected $fillable = [
        'user_id',
        'company_id',
        'po_id',
        'pe_id',
        'message',
        'read_at',
        'status'
	];

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function purchaseOrder()
    {
        return $this->belongsTo('App\PurchaseOrder', 'po_id');
    }

    public function purchaseEnquiry()
    {
        return $this->belongsTo('App\PurchaseEnquiry', 'pe_id');
    }
}
