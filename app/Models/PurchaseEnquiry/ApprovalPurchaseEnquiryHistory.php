<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ApprovalPurchaseEnquiryHistory extends Model
{
    protected $table = 'history_purchase_enquiry';

    protected $fillable = [
        'company_id',
        'purchase_enquiry_id',
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

    public function purchaseEnquiry()
    {
        return $this->belongsTo('App\PurchaseEnquiry', 'purchase_enquiry_id');
    }
}
