<?php

namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;

class BudgetMaster extends Model
{
    use HistoryTracker;

    protected $table = 'budget_master';
    protected $historyModel = BudgetMasterHistory::class;

    protected $fillable = [
        'budget_group_id',
        'budget_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'template_id',
        'creation_request_id',
        'prefix',
        'description',
        'u_o_m',
        'field_1',
        'field_2',
        'field_3',
        'field_4',
        'field_5',
        'field_6',
        'field_7',
        'field_8',
        'field_9',
        'field_10',
        'field_11',
        'field_12',
        'field_13',
        'field_14',
        'field_15',
        'field_16',
        'field_17',
        'field_18',
        'field_19',
        'field_20',
        'picture',
        'status',
        'approval_level',
        'active',
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

    public function budgetCreationRequest()
    {
        return $this->belongsTo('App\BudgetCreationRequest', 'creation_request_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function itemTemplate()
    {
        return $this->belongsTo('App\BudgetMasterSetup', 'template_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalBudgetMasterHistory', 'budget_id');
    }

    public function RCQuotationResponses()
    {
        return $this->hasMany('App\RCQuotationResponse', 'budget_id');
    }

    public function activeStockItem()
    {
        return $this->hasMany('App\StockItem', 'budget_id')->where('active', 'Yes');
    }  
}
