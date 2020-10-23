<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;

class ItemCreationRequest extends Model
{

    use HistoryTracker;

    protected $table = 'item_requests';
    protected $historyModel = ItemCreationRequestHistory::class;

    protected  $fillable = [
        'item_request_group_id',
        'item_request_ingroup_id',
        'company_id',
        'project_id',
        'requester_id',
        'item_description',
        'item_link',
        'file1',
        'file2',
        'file3',
        'status',
        'active',
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
        return $this->hasMany('App\ApprovalItemMasterHistory', 'item_request_id');
    }

    public function item()
    {
        return $this->hasOne('App\ItemMaster', 'creation_request_id');
    }
}
