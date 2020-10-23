<?php

namespace App;

use Carbon\Carbon;
use App\ApprovalStockItemIssueRequestHistory;
use Illuminate\Database\Eloquent\Model;

class POCancellationRequest extends Model
{

    /* Status */
    # Created Not Approved

    
    protected $table = 'purchase_order_cancellation_requests';

    protected $fillable = [
        'created_by',
        'company_id',
        'project_id',
        'purchase_order_id',
        'receipt_note_id',
        'canceled_quantity',
        'cancellation_reason',
        'notes',
        'approval_level',
        'status',
        'active'
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }


    public function creator()
    {
        return $this->belongsTo('App\User', 'created_by')->where('active', 'Yes');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id')->where('active', 'Yes');
    }

    public function purchaseOrder()
    {
        return $this->belongsTo('App\PurchaseOrder', 'purchase_order_id')->where('active', 'Yes');
    }

    public function receiptNote()
    {
        return $this->belongsTo('App\ReceiptNote', 'receipt_note_id')->where('active', 'Yes');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalPurchaseOrderCancellationHistory', 'purchase_order_cancellation_id');
    }

}
