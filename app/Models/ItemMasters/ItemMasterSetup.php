<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ItemMasterSetup extends Model
{
    protected $table = 'item_master_setup';

    protected $fillable = [
        'template_group_id',
        'template_ingroup_id',
        'created_by',
        'company_id',
        'template_name',
        'prefix',
        'u_o_m',
        'field_1',
        'field_1_required',
        'field_2',
        'field_2_required',
        'field_3',
        'field_3_required',
        'field_4',
        'field_4_required',
        'field_5',
        'field_5_required',
        'field_6',
        'field_6_required',
        'field_7',
        'field_7_required',
        'field_8',
        'field_8_required',
        'field_9',
        'field_9_required',
        'field_10',
        'field_10_required',
        'field_11',
        'field_11_required',
        'field_12',
        'field_12_required',
        'field_13',
        'field_13_required',
        'field_14',
        'field_14_required',
        'field_15',
        'field_15_required',
        'field_16',
        'field_16_required',
        'field_17',
        'field_17_required',
        'field_18',
        'field_18_required',
        'field_19',
        'field_19_required',
        'field_20',
        'field_20_required',
        'active',
	];

    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }


    public function creator()
    {
        return $this->belongsTo('App\User', 'created_by')->where('active', 'Yes');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function items()
    {
        return $this->hasMany('App\ItemMaster', 'template_id')->where('active', 'Yes');
    }

}
