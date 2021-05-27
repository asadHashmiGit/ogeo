<?php

namespace App\Imports;

use App\ExcelTamplate;
use Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class TemplateImport implements ToModel, WithHeadingRow
{
    public function headingRow(): int
    {
        return 5;
    }
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new ExcelTamplate([
            'user_id'          =>  Auth::user()->id,
            'Template_Name'    => $row['template_name'],
            'Field_1_Header'   => $row['field_1_header'],
            'Field_2_Header'   => $row['field_2_header'],
            'Field_3_Header'   => $row['field_3_header'],
            'Field_4_Header'   => $row['field_4_header'],
            'Field_5_Header'   => $row['field_5_header'],
            'Field_6_Header'   => $row['field_6_header'],
            'Field_7_Header'   => $row['field_7_header'],
            'Field_8_Header'   => $row['field_8_header'],
            'Field_9_Header'   => $row['field_9_header'],
            'Field_10_Header'  => $row['field_10_header'],
            'Field_11_Header'  => $row['field_11_header'],
            'Field_12_Header'  => $row['field_12_header'],
            'Field_13_Header'  => $row['field_13_header'],
            'Field_14_Header'  => $row['field_14_header'],
            'Field_15_Header'  => $row['field_15_header'],
            'Field_16_Header'  => $row['field_16_header'],
            'Field_17_Header'  => $row['field_17_header'],
            'Field_18_Header'  => $row['field_18_header'],
            'Field_19_Header'  => $row['field_19_header'],
            'Field_20_Header'  => $row['field_20_header'],
            'Field_1_Mandatory'  => $row['field_1_mandatory'],
            'Field_2_Mandatory'  => $row['field_2_mandatory'],
            'Field_3_Mandatory'  => $row['field_3_mandatory'],
            'Field_4_Mandatory'  => $row['field_4_mandatory'],
            'Field_5_Mandatory'  => $row['field_5_mandatory'],
            'Field_6_Mandatory'  => $row['field_6_mandatory'],
            'Field_7_Mandatory'  => $row['field_7_mandatory'],
            'Field_8_Mandatory'  => $row['field_8_mandatory'],
            'Field_9_Mandatory'  => $row['field_9_mandatory'],
            'Field_10_Mandatory'  => $row['field_10_mandatory'],
            'Field_11_Mandatory'  => $row['field_11_mandatory'],
            'Field_12_Mandatory'  => $row['field_12_mandatory'],
            'Field_13_Mandatory'  => $row['field_13_mandatory'],
            'Field_14_Mandatory'  => $row['field_14_mandatory'],
            'Field_15_Mandatory'  => $row['field_15_mandatory'],
            'Field_16_Mandatory'  => $row['field_16_mandatory'],
            'Field_17_Mandatory'  => $row['field_17_mandatory'],
            'Field_18_Mandatory'  => $row['field_18_mandatory'],
            'Field_19_Mandatory'  => $row['field_19_mandatory'],
            'Field_20_Mandatory'  => $row['field_20_mandatory'],

        ]);
        
    }
}
