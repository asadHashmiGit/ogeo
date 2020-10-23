<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class PurchaseEnquiryHistory extends Model
{
    protected $table = 'histories_PurchaseEnquiry';

    protected  $fillable = [
        'purchase_enquiry_id',
        'purchase_enquiry_group_id',
        'purchase_enquiry_ingroup_id',
        'created_by',
        'company_id',
        'project_id',
        'enquiry_type',
        'store_item_request',
        'item_id',
        'item_description',
        'service_description',
        'quantity',
        'u_o_m',
        'latitude',
        'longitude',
        'underlying_transaction',
        'sourcing_priority',
        'advanced_payment',
        'retention_percentage',
        'retention_days',
        'retention_released',
        'notes',
        'status',
        'active',
        'grouping_id',
        'required_documents',
	];

    

    
}
