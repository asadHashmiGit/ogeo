<?php

namespace App;

use App\Notifications\PasswordResetNotificationVendor;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Spatie\Activitylog\Traits\HasActivity;

class VendorUser extends Authenticatable
{
    use HasApiTokens, Notifiable, HasActivity;

	protected $table = 'vendor_users';

    protected $guard = 'vendor';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'picture',
        'phone_number',
        'address',
        'password',
        'active',
    ];

    //Date Casting
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    protected static $ignoreChangedAttributes = ['created_at', 'updated_at', 'remember_token'];
    protected static $logAttributes = ['designation','phone_number','address','picture', 'password'];
    protected static $logOnlyDirty = true;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function vendors()
    {
        return $this->belongsToMany('App\Vendor', 'pivot_vendor_vendorusers', 'vendoruser_id', 'vendor_id')->where('active', 'Yes')->withPivot('sbm_role', 'sim_role');
    }


    public function sendPasswordResetNotification($token)
    {
        $this->notify(new PasswordResetNotificationVendor($token));
    }

}



