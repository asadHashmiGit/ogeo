<?php

namespace App;
use Carbon\Carbon;

use Illuminate\Database\Eloquent\Model;

class ApprovalBudgetMasterHistory extends Model
{
    protected $table = 'history_budget_master';

    protected $fillable = [
        'company_id',
        'budget_request_id',
        'budget_id',
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

	public function item()
    {
        return $this->belongsTo('App\BudgetMaster', 'budget_id');
    }

    public function itemCreationRequest()
    {
        return $this->belongsTo('App\BudgetCreationRequest', 'budget_request_id');
    }
}
