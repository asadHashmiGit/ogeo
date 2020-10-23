<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{

    /*
        1. Created and Assigned to Level 1
        2. Approved by Level 1 and Assigned to Level 2 for Further Approval
        3. Rejected By Level 2 and Assigned back to the Originator
        4. Fully Approved and Awarded
    */

    protected $table = 'purchase_orders';

    protected $fillable = [
        'purchase_order_group_id',
        'purchase_order_ingroup_id',
        'company_id',
        'project_id',
        'creator_id',
        'vendor_id',
        'quotation_id',
        'commercial_evaluation_id',
        'approval_level',
        'vendor_approved_at',
        'vendor_notes',
        'notes',
        'status',
        'active',
	];

    //Date Casting
    public function getCreatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }
    public function getUpdatedAtAttribute($timestamp) {
        return Carbon::createFromFormat('Y-m-d H:i:s', $timestamp)->format('d.M.Y - (H:i:s)');
    }

	//Statuses
	//Created Not Approved

	public function creator()
    {
        return $this->belongsTo('App\User', 'creator_id');
    }

    public function company()
    {
        return $this->belongsTo('App\Company', 'company_id')->where('active', 'Yes');
    }

    public function vendor()
    {
        return $this->belongsTo('App\Vendor', 'vendor_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function quotation()
    {
        return $this->belongsTo('App\QuotationRequest', 'quotation_id');
    }

    public function commercialEvaluation()
    {
        return $this->belongsTo('App\CommercialEvaluation', 'commercial_evaluation_id');
    }

    public function purchaseEnquiries()
    {
        return $this->belongsToMany('App\PurchaseEnquiry', 'purchase_order_purchase_enquiries_pivot', 'purchase_order_id', 'purchase_enquiry_id')->withPivot('approval_level', 'status', 'approval_notes');
    }

    //approval_level referes to Next Approval level
    public function vendorResponses()
    {
        return $this->belongsToMany('App\QuotationResponse', 'purchase_order_quotation_reposnses_pivot', 'purchase_order_id', 'quotation_reponse_id');
    }

    public function history()
    {
        return $this->hasMany('App\ApprovalPurchaseOrderHistory', 'purchase_order_id');
    }

    public function receiptNotes()
    {
        return $this->hasMany('App\ReceiptNote', 'po_id');
    }


}
