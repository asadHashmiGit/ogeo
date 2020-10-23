<?php

namespace App;

use App\Notifications\PasswordResetNotification;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Spatie\Activitylog\Traits\CausesActivity;
use Spatie\Activitylog\Traits\HasActivity;
use Spatie\Activitylog\Traits\LogsActivity;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable, HasActivity;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'company_id',
        'name',
        'email',
        'designation',
        'phone_number',
        'address',
        'picture',
        'password',
        'active',
        'ref_id',
    ];

    protected static $ignoreChangedAttributes = ['created_at', 'updated_at', 'remember_token'];
    protected static $logAttributes = ['designation','phone_number','address','picture', 'password'];
    protected static $logOnlyDirty = true;
    
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function roles()
    {
        return $this->hasMany('App\Role', 'user_id')->where('active', 'Yes');
    }

    public function hasRole(string $RoleName)
    {
        return $this->roles()->where('role_name', $RoleName)->count() > 0;
    }


    public function hasRoleInProjects(string $RoleName, array $ProjectsIds)
    {
        return $this->roles()->where('role_name', $RoleName)->whereIn('project_id', $ProjectsIds)->count() > 0;
    }


    public function sendPasswordResetNotification($token)
    {
        $this->notify(new PasswordResetNotification($token));
    }


}
