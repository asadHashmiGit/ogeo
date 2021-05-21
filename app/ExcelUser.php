<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExcelUser extends Model
{
    protected $table = 'excel_user';

    protected  $fillable = [
        'user_id',
        'employee_name',
        'employee_email',
        'employee_designation',
	];
}
