<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected $table = 'companies';

   

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    public function projects()
    {
        return $this->hasMany('App\Project', 'company_id')->where('active', 'Yes');
    }

    public function users()
    {
        return $this->hasMany('App\User', 'company_id')->where('active', 'Yes');
    }

    public function financialLimits()
    {
        return $this->hasMany('App\FinancialLimit', 'company_id')->where('active', 'Yes');
    }

    public function roles()
    {
        return $this->hasMany('App\Role', 'company_id')->where('active', 'Yes');
    }

    public function purchaseEnquiries()
    {
        return $this->hasMany('App\PurchaseEnquiry', 'company_id');
    }

    public function quotationRequests()
    {
        return $this->hasMany('App\QuotationRequest', 'company_id');
    }

    public function ItemMasterSetup()
    {
        return $this->hasMany('App\ItemMasterSetup', 'company_id')->where('active', 'Yes');
    }

    public function items()
    {
        return $this->hasMany('App\ItemMaster', 'company_id');
    }

    public function itemCreationRequests()
    {
        return $this->hasMany('App\ItemCreationRequest', 'company_id');
    }

    public function vendors()
    {
        return $this->hasMany('App\Vendor')->where('active', 'Yes');
    }
}
