<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class country extends Model
{
    // protected $fillable = [ 
    //     'country_name',
    //     'description',
    //     'status',
        
	// 	'created_by',
	// 	'created_date',
	// 	'created_time',
	// 	'updated_by',
	// 	'updated_date',
	// 	'updated_time',
    // ];
	protected $fillable = [ 
        'shortname',
        'name',
        'phonecode',
        
    ];
    
}
