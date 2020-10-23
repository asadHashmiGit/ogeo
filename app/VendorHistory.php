<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class VendorHistory extends Model
{
    protected $table = 'histories_Vendor';

    protected  $fillable = [
        'vendor_id',
        'created_by',
        'name',
	    'rep_name',
	    'rep_title',
	    'address',
	    'po_box',
	    'phone',
	    'mobile',
	    'url',
	    'lic_num',
	    'lic_expiry_date',
	    'provided_service',
	    'city',
        'country',
        'officer_name',
        'officer_phone',
        'bank_name',
        'bank_iban',
        'vendor_score',
        'turnover',
        'open_since',
        'sold_brands',   
        'exculsive_brands',   
        'linked_item_templates',   
        'vendor_type',
	    'notes',
	    'status',
	    'active',
	];
}
