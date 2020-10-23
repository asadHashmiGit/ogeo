<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class QuotationResponseTracker extends Model
{
    protected $table = 'quotation_response_tracker';

    protected $fillable = [
        'vendor_id',
        'company_id',
        'quotation_id',
        'status'
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    /* Quotation Tracker Status
        1. Request for Proposals Not Yet Viewed
        2. Request for Proposals Viewed
        3. Quotation Will Be Sent
        4. Quotation Will NOT Be Sent
        5. RFI Submitted
        6. RFI Responded
        7. Quotation Submitted
        8. Commercial Evaluation Submitted
        9. QuotationResponseTracker ->this is for non submitted vendor after creating CE.
    */



	public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

}
