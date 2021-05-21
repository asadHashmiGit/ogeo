<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BudgetMasterHistory extends Model
{
    protected $table = 'histories_BudgetMaster';

    protected  $fillable = [
        'budget_master_id',
        'budget_group_id',
        'budget_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'creation_request_id',
        'prefix',
        'description',
        'field_1',
        'field_2',
        'field_3',
        'field_4',
        'field_5',
        'field_6',
        'field_7',
        'field_8',
        'field_9',
        'field_10',
        'picture',
        'status',
        'approval_level',
        'active',
	];
}
