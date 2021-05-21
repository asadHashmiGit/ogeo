<?php

namespace App;
use Carbon\Carbon;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;
use Illuminate\Database\Eloquent\Model;

class BudgetCreationRequest extends Model
{
    use HistoryTracker;

    protected $table = 'set_up_budget_requests';
    protected $historyModel = BudgetCreationRequestHistory::class;


    protected  $fillable = [
        'budget_request_group_id',
        'budget_request_ingroup_id',
        'company_id',
        'project_id',
        'requester_id',
        'budget_description',
        'budget_link',
        'first_request_amount',
        'first_end_date',
        'pro_ini_consumed_budget',
        'pro_ini_value',
        'request_amount',
        'request_end_date',
        'file1',
        'file2',
        'file3',
        'status',
        'active',
        'very_first_initial_end_date',
        'very_first_initial_amount',
    ];
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

    public function requester()
    {
        return $this->belongsTo('App\User', 'requester_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalBudgetMasterHistory', 'budget_request_id');
    }

    public function item()
    {
        return $this->hasOne('App\BudgetMaster', 'creation_request_id');
    }
}
