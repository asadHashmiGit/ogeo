<?php

namespace App\Http\Requests;

use App\QuotationRequest;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class ViewRFPDetailsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        $quotationRequest = QuotationRequest::findorFail($this->QuotationId);
        return $quotationRequest && $this->user()->can('view', $quotationRequest);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'QuotationId' => 'required|integer',
            'QuotationType' => [
                'required',
                Rule::In(['PE', 'RC']),
            ],
        ];
    }


    public function messages()
    {
        return [
            'QuotationId.required' => ':attribute is required ',
            'QuotationId.integer' => ':attribute is required',
            'QuotationType.required'  => ':attribute is required',
            'QuotationType.in'  => ':attribute should be PE or RC',
        ];
    }


    public function attributes()
    {
        return [
            'QuotationId' => 'Quotation ID',
            'QuotationType' => 'Quotation Type',
        ];
    }
}
