<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BudgetCreationRequestHistory extends Model
{
    protected $table = 'histories_BudgetCreationRequest';

    protected  $fillable = [
        'budget_creation_request_id',
        'budget_request_group_id',
        'budget_request_ingroup_id',
        'project_id',
        'requester_id',
        'budget_description',
        'budget_link',
        'file1',
        'file2',
        'file3',
        'status',
        'active',
	];
}
