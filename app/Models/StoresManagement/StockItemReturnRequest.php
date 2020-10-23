<?php

namespace App;

use Carbon\Carbon;
use App\ApprovalStockItemReturnRequestHistory;
use Illuminate\Database\Eloquent\Model;

class StockItemReturnRequest extends Model
{

    /* Statuses */
    # Requested Pending Approval
    # Approved By Level #
    # Rejected By Level #
    # Return Accepted
    # Return Rejected

    protected $table = 'stock_item_return_requests';

    protected $fillable = [
        'stock_item_return_request_group_id',
        'created_by',
        'company_id',
        'stock_item_issue_request_id',
        'stock_issuance_record_id',
        'stock_item_id',
        'returned_quantity',
        'notes',
        'approval_level',
        'return_decision',
        'return_note',
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

    public function stockItemIssueRequest()
    {
        return $this->belongsTo('App\StockItemIssueRequest', 'stock_item_issue_request_id')->where('active', 'Yes');
    }

    public function stockIssuanceRecord()
    {
        return $this->belongsTo('App\StockIssuanceRecord', 'stock_issuance_record_id')->where('active', 'Yes');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalStockItemReturnRequestHistory', 'stock_item_return_request_id');
    }
}
