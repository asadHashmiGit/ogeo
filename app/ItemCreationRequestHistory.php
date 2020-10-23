<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemCreationRequestHistory extends Model
{
    protected $table = 'histories_ItemCreationRequest';

    protected  $fillable = [
        'item_creation_request_id',
        'item_request_group_id',
        'item_request_ingroup_id',
        'project_id',
        'requester_id',
        'item_description',
        'item_link',
        'file1',
        'file2',
        'file3',
        'status',
        'active',
	];
}
