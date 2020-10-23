<?php

namespace App;

use Carbon\Carbon;
use App\StockItemIssueRequestsHistory;
use Illuminate\Database\Eloquent\Model;

class StockIssuanceRecord extends Model
{
    protected $table = 'stock_issuance_records';

    protected $fillable = [
        'stock_issuance_record_group_id',
        'created_by',
        'company_id',
        'stock_item_issue_request_id',
        'issued_quantity',
        'issue_date',
        'notes',
        'status',
        'active'
	];

    protected $dates = [
        'issue_date',
    ];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getIssueDateAtAttribute($timestamp) {
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

    public function stockItemIssueRequest()
    {
        return $this->hasMany('App\StockItemIssueRequest', 'stock_item_issue_request_id');
    }
}
