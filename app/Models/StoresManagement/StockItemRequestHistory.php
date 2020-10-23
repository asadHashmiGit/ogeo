<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockItemRequestHistory extends Model
{
    protected $table = 'histories_StockItemRequest';

    protected  $fillable = [
        'stock_item_request_id',
        'stock_item_request_group_id',
        'stock_item_request_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'item_id',
        'item_description',
        'si_start_period',
        'si_end_period',
        'consumption_frequency',
        'quantity',
        'u_o_m',
        'notes',
        'status',
        'active',
        'grouping_id',
	];
}
