<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $table = 'projects';

    protected $fillable = [
        'created_by',
        'company_id',
        'title',
        'setup_type',
        'store_setup_cost',
        'annual_holding_cost_per_unit',
        'store_under_audit',
        'start_date',
        'end_date',
        'initial_end_date',
        'currency',
        'value',
        'initial_value',
        'consumed_budget',
        'po_doa_criterion',
        'rn_doa_criterion',
        'auction_types',
        'terms_n_conditions',
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

	public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function financialLimits()
    {
        return $this->hasMany('App\FinancialLimit', 'project_id')->where('active', 'Yes');
    }

    public function roles()
    {
        return $this->hasMany('App\Role', 'project_id')->where('active', 'Yes');
    }
}
