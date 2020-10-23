<?php

namespace App;

use Carbon\Carbon;
use App\StockItemRequestHistory;
use Illuminate\Database\Eloquent\Model;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;
use Spatie\Activitylog\Traits\LogsActivity;

class StockItemRequest extends Model
{
    use HistoryTracker, LogsActivity;

    protected $table = 'stock_item_requests';
    protected $historyModel = StockItemRequestHistory::class;

    protected $fillable = [
        'stock_item_request_group_id',
        'stock_item_request_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'item_id',
        'item_description',
        'si_start_period',
        'si_end_period',
        'consumption_frequency',
        'quantity',
        'u_o_m',
        'notes',
        'approval_level',
        'status',
        'active',
        'grouping_id',
	];

    protected static $logAttributes = ['*'];
    
    protected static $logOnlyDirty = true;

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	public function creator()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

	public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function item()
    {
        return $this->belongsTo('App\ItemMaster', 'item_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalStockItemRequestHistory', 'stock_item_request_id');
    }

    public function stockItem()
    {
        return $this->belongsToMany('App\StockItem', 'stockitems_stockitemrequests', 'stock_item_request_id', 'stock_item_id')->withPivot('status');
    }


}
