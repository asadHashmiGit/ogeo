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
        // return $row;
        return new ExcelTamplate([
            'user_id'          =>  Auth::user()->id,
            'Template_Name'    => $row['template_name'],
            'Field_1_Header'   => $row['header1_description'],
            'Field_2_Header'   => $row['header2_description'],
            'Field_3_Header'   => $row['header3_description'],
            'Field_4_Header'   => $row['header4_description'],
            'Field_5_Header'   => $row['header5_description'],
            'Field_6_Header'   => $row['header6_description'],
            'Field_7_Header'   => $row['header7_description'],
            'Field_8_Header'   => $row['header8_description'],
            'Field_9_Header'   => $row['header9_description'],
            'Field_10_Header'  => $row['header10_description'],
            'Field_11_Header'  => $row['header11_description'],
            'Field_12_Header'  => $row['header12_description'],
            'Field_13_Header'  => $row['header13_description'],
            'Field_14_Header'  => $row['header14_description'],
            'Field_15_Header'  => $row['header15_description'],
            'Field_16_Header'  => $row['header16_description'],
            'Field_17_Header'  => $row['header17_description'],
            'Field_18_Header'  => $row['header18_description'],
            'Field_19_Header'  => $row['header19_description'],
            'Field_20_Header'  => $row['header20_description'],
            'Field_1_Mandatory'  => $row['mandatory1_yes_or_no'],
            'Field_2_Mandatory'  => $row['mandatory2_yes_or_no'],
            'Field_3_Mandatory'  => $row['mandatory3_yes_or_no'],
            'Field_4_Mandatory'  => $row['mandatory4_yes_or_no'],
            'Field_5_Mandatory'  => $row['mandatory5_yes_or_no'],
            'Field_6_Mandatory'  => $row['mandatory6_yes_or_no'],
            'Field_7_Mandatory'  => $row['mandatory7_yes_or_no'],
            'Field_8_Mandatory'  => $row['mandatory8_yes_or_no'],
            'Field_9_Mandatory'  => $row['mandatory9_yes_or_no'],
            'Field_10_Mandatory'  => $row['mandatory10_yes_or_no'],
            'Field_11_Mandatory'  => $row['mandatory11_yes_or_no'],
            'Field_12_Mandatory'  => $row['mandatory12_yes_or_no'],
            'Field_13_Mandatory'  => $row['mandatory13_yes_or_no'],
            'Field_14_Mandatory'  => $row['mandatory14_yes_or_no'],
            'Field_15_Mandatory'  => $row['mandatory15_yes_or_no'],
            'Field_16_Mandatory'  => $row['mandatory16_yes_or_no'],
            'Field_17_Mandatory'  => $row['mandatory17_yes_or_no'],
            'Field_18_Mandatory'  => $row['mandatory18_yes_or_no'],
            'Field_19_Mandatory'  => $row['mandatory19_yes_or_no'],
            'Field_20_Mandatory'  => $row['mandatory20_yes_or_no'],

        ]);
        
    }
}
