<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VendorCreationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //'VendorLicenseNumber'       => 'required|string|max:255|unique:vendors|lic_num',
            //'VendorEmail'               => 'required|string|email|max:255|unique:vendors|email',
        ];
    }


    public function messages()
    {
        return [
            //'lic_num.unique'    => 'License Number Already Registered Under Other Vendor',
            //'email.unique'      => 'Email Already Assigned to Another Vendor',
        ];
    }
}
