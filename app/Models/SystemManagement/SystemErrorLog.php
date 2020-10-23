<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SystemErrorLog extends Model
{

    protected $fillable = [
        'env',
        'message',
        'level',
        'context',
        'extra'
    ];

    protected $casts = [
        'context' => 'array',
        'extra'   => 'array'
    ];
}
