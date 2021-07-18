<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseEnquiryChildHeaders extends Model
{
    protected $table = 'purchase_enquiry_child_headers';

    protected  $fillable = [
        'purchase_enquiry_master_id',
        'header_name',
        'header_contant',
	];
}
