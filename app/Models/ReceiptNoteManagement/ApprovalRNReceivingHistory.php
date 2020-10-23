<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ApprovalRNReceivingHistory extends Model
{

    protected $table = 'histroy_rn_receiving';

    protected $fillable = [
        'company_id',
        'receiving_id',
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

    public function receiving()
    {
        return $this->belongsTo('App\RNReceiving', 'receiving_id');
    }
}
