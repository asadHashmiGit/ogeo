<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockItemHistory extends Model
{
    protected $table = 'histories_StockItem';

    protected  $fillable = [
        'stock_item_id',
        'stock_item_group_id',
        'stock_item_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'bin',
        'shelf',
        'rack',
        'area',
        'alley',
        'item_id',
        'pe_generation_type',
        'replenish_level',
        'replenish_quantity',
        'stock_level',
        'start_date',
        'end_date',
        'notes',
        'approval_level',
        'status',
        'active'
    ];
}
