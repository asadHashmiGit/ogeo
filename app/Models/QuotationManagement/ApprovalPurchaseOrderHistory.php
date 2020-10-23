<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ApprovalPurchaseOrderHistory extends Model
{
    protected $table = 'history_purchase_order';

    protected $fillable = [
        'company_id',
        'purchase_order_id',
        'current_action_description',
        'current_action_owner_id',
        'current_approval_level',
        'decision',
        'decision_notes',
        'next_action_description',
        'next_action_owners',
        'next_approval_level',
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function currentActionBy()
    {
        return $this->belongsTo('App\User', 'current_action_owner_id');
    }

    public function purchaseOrder()
    {
        return $this->belongsTo('App\PurchaseOrder', 'purchase_order_id');
    }
}
