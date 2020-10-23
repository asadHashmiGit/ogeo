<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RCLineRFICommunication extends Model
{
    protected $table = 'rate_contract_line_rfi_communications';

    protected $fillable = [
        'user_id',
        'company_id',
        'rc_id',
        'rcr_id',
        'message',
        'read_at',
        'status'
	];

    public function user()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id');
    }

    public function rateContract()
    {
        return $this->belongsTo('App\RateContract', 'po_id');
    }

    public function rateContractRequest()
    {
        return $this->belongsTo('App\RateContractRequest', 'pe_id');
    }
}
