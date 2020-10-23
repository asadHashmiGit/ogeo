<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ApprovalStockTransferHistory extends Model
{
    protected $table = 'history_stock_transfer';

    protected $fillable = [
        'company_id',
        'stock_transfer_request_id',
        'description',
        'current_action_owner_id',
        'next_action_owners',
        'current_approval_level',
        'next_approval_level',
        'decision',
        'decision_notes'
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

    public function stockTransferRequest()
    {
        return $this->belongsTo('App\StockTransferRequest', 'stock_transfer_request_id');
    }
}
