<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ReceiptNoteInvoice extends Model
{
    protected $table = 'receipt_note_receiving_invoices';

    protected $fillable = [
        'invoice_validated_by',
        'company_id',
        'vendor_user_id',
        'vendor_id',
        'rn_id',
        'max_invoicable_amount',
        'invoice_amount',
        'vendor_doc_name',
        'document_safe_name',
        'status',
        'active',
	];

    public function validator()
    {
        return $this->belongsTo('App\User', 'invoice_validated_by');
    }

	public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function uploader()
    {
        return $this->belongsTo('App\VendorUser', 'vendor_user_id');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function receiptNote()
    {
        return $this->belongsTo('App\ReceiptNote', 'rn_id');
    }
}
