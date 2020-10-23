<?php

namespace App;

use Carbon\Carbon;
use App\StockItemHistory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;

class StockItem extends Model
{
    use HistoryTracker, LogsActivity;
    
    protected $table = 'stock_items';
    protected $historyModel = StockItemHistory::class;

    protected $fillable = [
        'stock_item_group_id',
        'stock_item_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'bin',
        'shelf',
        'rack',
        'area',
        'alley',
        'item_id',
        'pe_generation_type',
        'replenish_level',
        'replenish_quantity',
        'stock_level',
        'start_date',
        'end_date',
        'notes',
        'approval_level',
        'status',
        'active'
	];

    protected $dates = [
        'start_date',
        'end_date'
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

    public function item()
    {
        return $this->belongsTo('App\ItemMaster', 'item_id')->where('active', 'Yes');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalStockItemHistory', 'stock_item_id');
    }

    public function stockItemRequest()
    {
    	return $this->belongsToMany('App\StockItemRequest', 'stockitems_stockitemrequests', 'stock_item_id', 'stock_item_request_id')->withPivot('status', 'note');
    }

    public function purchaseEnquiries()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'stockitems_purchaseenquiries', 'stock_item_id', 'purchase_enquiry_id')->withPivot('status', 'note');
    }

}
