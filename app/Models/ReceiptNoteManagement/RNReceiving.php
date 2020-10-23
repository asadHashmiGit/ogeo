<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class RNReceiving extends Model
{
    protected $table = 'receipt_note_receivings';

    protected $fillable = [
        'rn_receiving_group_id',
        'rn_receiving_ingroup_id',
        'received_by',
        'rn_id',
        'received_quantity',
        'value_of_received_quantity',
        'receiving_rentention_amount',
        'quantity_to_complete_receiving',
        'note',
        'current_approval_level',
        'received_by_store',
        'received_by_store_user_id',
        'received_by_store_at',
        'received_by_store_notes',
        'status',
        'active',
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    // public function getReceivedByStoreAtAttribute($timestamp) {
    //     return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    // }

    public function receiver()
    {
        return $this->belongsTo('App\User', 'received_by');
    }

    public function storeReceiver()
    {
        return $this->belongsTo('App\User', 'received_by_store_user_id');
    }

    public function receiptNote()
    {
        return $this->belongsTo('App\ReceiptNote', 'rn_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalRNReceivingHistory', 'receiving_id');
    }
}
