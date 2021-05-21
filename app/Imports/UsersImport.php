<?php

namespace App\Imports;

use App\ExcelUser;
use DB;
use Auth;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;

class UsersImport implements ToModel, WithHeadingRow, WithValidation, SkipsOnFailure
{
    use Importable, SkipsFailures;
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function headingRow(): int
    {
        return 5;
    }
    public function model(array $row)
    {
        $user = ExcelUser::create([
            'user_id'       =>  Auth::user()->id,
            'employee_name'  => $row['employee_name'],
            'employee_email'   => $row['employee_email'],
            'employee_designation'   => $row['employee_designation'],
        ]);
    }
    public function rules(): array
    {
        return [
            'employee_email' => 'email|unique:excel_user,employee_email',
        ];
    }

}
