<?php

namespace App;

use Carbon\Carbon;
use App\ApprovalStockTransferHistory;
use Illuminate\Database\Eloquent\Model;

class StockTransferRequest extends Model
{    
    protected $table = 'stock_transfer_requests';

    protected $fillable = [
        'stock_transfer_request_group_id',
        'stock_transfer_request_ingroup_id',
        'created_by',
        'company_id',
        'from_project_id',
        'to_project_id',
        'stock_item_id',
        'quantity',
        'latitude',
        'longitude',
        'location_name',
        'transfer_date',
        'notes',
        'approval_level',
        'status',
        'active'
	];

    protected $dates = [
        'transfer_date',
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

    public function fromProject()
    {
        return $this->belongsTo('App\Project', 'from_project_id')->where('active', 'Yes');
    }

    public function toProject()
    {
        return $this->belongsTo('App\Project', 'to_project_id')->where('active', 'Yes');
    }

    public function stockItem()
    {
        return $this->belongsTo('App\StockItem', 'stock_item_id')->where('active', 'Yes');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalStockTransferHistory', 'stock_transfer_request_id');
    }

}
