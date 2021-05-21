<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExcelTamplate extends Model
{
    protected $table = 'excel_tamplate';

    protected  $fillable = [
        'user_id',
        'Template_Name',
        'Field_1_Header',
        'Field_2_Header',
        'Field_3_Header',
        'Field_4_Header',
        'Field_5_Header',
        'Field_6_Header',
        'Field_7_Header',
        'Field_8_Header',
        'Field_9_Header',
        'Field_10_Header',
        'Field_11_Header',
        'Field_12_Header',
        'Field_13_Header',
        'Field_14_Header',
        'Field_15_Header',
        'Field_16_Header',
        'Field_17_Header',
        'Field_18_Header',
        'Field_19_Header',
        'Field_20_Header',
        
	];
}
