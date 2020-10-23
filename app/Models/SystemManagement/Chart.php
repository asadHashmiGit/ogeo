<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Chart extends Model
{

	protected $table = 'charts';

	protected $fillable = [
        'created_by',
	    'sql_query',
	    'filteration_variables',
	    'chart_col_width',
	    'company_id',
	    'chart_options'
	];


	protected $casts = [
	    'company_id' => 'array',
	    'chart_options' => 'array',
	    'filteration_variables' => 'array',
	];


	public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }


    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    
}
