<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ReceiptNote extends Model
{
    protected $table = 'receipt_notes';

    protected $fillable = [
        'receipt_note_group_id',
        'receipt_note_ingroup_id',
        'company_id',
        'project_id',
        'pe_id',
        'quotation_id',
        'po_id',
        'quotation_response_id',
        'vendor_id',
        'quantity_to_be_received',
        'invoicing_status',
        'status',
        'active',
	];

	/* 
		Status:
			1. Not Yet Shipped.
            2. Partially Shipped.
            2. Partially Received Not Approved.
            2. Partially Received And Approved.
            2. Fully Shipped.
			2. Fully Received Not Approved.
            3. Fully Received And Approved

        Invoicing Status: 
            1. Invoice Not Submitted
            1. An Invoice Submitted By Vendor And It's Under Client Processing
            1. Fully Invoiced and Accepted
	*/

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function purchaseEnquiry()
    {
        return $this->belongsTo('App\PurchaseEnquiry', 'pe_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function purchaseOrder()
    {
        return $this->belongsTo('App\PurchaseOrder', 'po_id');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function quotationReponse()
    {
        return $this->belongsTo('App\QuotationResponse', 'quotation_response_id');
    }

    public function receivingRecords()
    {
        return $this->hasMany('App\RNReceiving', 'rn_id')->orderBy('created_at', 'asc');
    }

    public function invoices()
    {
        return $this->hasMany('App\ReceiptNoteInvoice', 'rn_id')->orderBy('created_at', 'asc');
    }

    public function cancellationRequests()
    {
        return $this->hasMany('App\POCancellationRequest', 'receipt_note_id')->orderBy('created_at', 'asc');
    }
}
