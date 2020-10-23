<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'roles';

    protected $fillable = [
        'created_by',
        'company_id',
        'project_id',
        'user_id',
        'role_name',
        'role_level',
        'ended_at',
        'active',
	];

    protected $dates = ['ended_at'];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getEndedAtAttribute($timestamp) {
        if($timestamp == null){
            return '';
        } else {
            return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
        }
    }

    public function assignedBy()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

	public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id')->where('active', 'Yes');
    }

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id')->where('active', 'Yes');
    }
}
