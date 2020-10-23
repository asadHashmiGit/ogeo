<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RateContractRequestHistory extends Model
{
    protected $table = 'histories_RateContractRequest';

    protected  $fillable = [
        'rate_contract_request_id',
        'rate_contract_request_group_id',
        'rate_contract_request_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'item_id',
        'item_description',
        'rc_start_period',
        'rc_end_period',
        'quantity',
        'u_o_m',
        'latitude',
        'longitude',
        'advanced_payment',
        'notes',
        'status',
        'active',
        'grouping_id',
        'required_documents',
	];
}
