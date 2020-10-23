<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class VendorQualificationDocs extends Model
{
    protected $table = 'vendor_qualification_docs';

    protected  $fillable = [
        'created_by',
        'company_id',
        'vendor_id',
        'document_name',
        'auto_generated_name',
	];

    //Date Casting
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	public function creator()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }


}
