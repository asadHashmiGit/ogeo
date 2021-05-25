<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class city extends Model
{
    protected $table = 'cities';

    protected $fillable = [
        
        'country_id',
        'city_name',
        'description',
        'status',
        
		'created_by',
		'created_date',
		'created_time',
		'updated_by',
		'updated_date',
		'updated_time',
    ];
    
   
    public function Countries()
    {
        return $this->belongsTo(Country::class, 'country_id', 'id');
    }
}
