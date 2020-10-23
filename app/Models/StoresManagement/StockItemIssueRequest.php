<?php

namespace App;

use Carbon\Carbon;
use App\ApprovalStockItemIssueRequestHistory;
use Illuminate\Database\Eloquent\Model;

class StockItemIssueRequest extends Model
{
    protected $table = 'stock_item_issue_requests';

    protected $fillable = [
        'stock_item_issuance_request_group_id',
        'stock_item_issuance_request_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'stock_item_id',
        'quantity',
        'latitude',
        'longitude',
        'location_name',
        'notes',
        'approval_level',
        'status',
        'active'
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

    public function stockItem()
    {
        return $this->belongsTo('App\StockItem', 'stock_item_id')->where('active', 'Yes');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalStockItemIssueRequestHistory', 'stock_item_issue_request_id');
    }

    public function issuances()
    {
        return $this->hasMany('App\StockIssuanceRecord', 'stock_item_issue_request_id');
    }

    public function returnRequests()
    {
        return $this->hasMany('App\StockItemReturnRequest', 'stock_item_issue_request_id');
    }
}
