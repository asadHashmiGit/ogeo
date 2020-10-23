<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use LaravelEnso\HistoryTracker\app\Traits\HistoryTracker;

class Vendor extends Model
{

	use HistoryTracker, Notifiable;

    protected $table = 'vendors';
    protected $historyModel = VendorHistory::class;

    protected  $fillable = [
        'company_id',
	    'created_by',
        'name',
	    'rep_name',
        'rep_title',
	    'mobile',
	    'address',
	    'po_box',
	    'phone',
	    'url',
	    'lic_num',
	    'lic_expiry_date',
	    'provided_service',
	    'notes',
        'city',
        'country',
        'officer_name',
        'officer_phone',
        'bank_name',
        'bank_iban',
        'turnover',
        'open_since',
        'sold_brands',   
        'exculsive_brands',   
        'vendor_type',
        'vendor_score',
	    'status',
	    'active',
	];

	protected $dates = [ 'lic_expiry_date' ];

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

    public function users()
    {
        return $this->belongsToMany('App\VendorUser', 'pivot_vendor_vendorusers', 'vendor_id', 'vendoruser_id')->withPivot('sbm_role', 'sim_role');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function quotationResponses()
    {
        return $this->hasMany('App\QuotationResponse', 'vendor_id');
    }

    public function quotationRCResponses()
    {
        return $this->hasMany('App\RCQuotationResponse', 'vendor_id');
    }

    public function BiddingUsers()
    {
        return $this->hasMany('App\VendorUser')->where('sbm_role', 'SBM');
    }

    public function InvoicingUsers()
    {
        return $this->hasMany('App\VendorUser')->where('sim_role', 'SIM');
    }

    public function uploadedDocuments()
    {
        return $this->hasMany('App\VendorUploadDoc');
    }

    public function itemTemplates()
    {
        return $this->belongsToMany('App\ItemMasterSetup', 'vendor_itemtemplates', 'vendor_id', 'template_id');
    }

    public function qualificationDocuments()
    {
        return $this->hasMany('App\VendorQualificationDocs', 'vendor_id');
    }

}
