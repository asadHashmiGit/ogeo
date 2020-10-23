<?php

namespace App\Http\Controllers;

use App\Chart;
use App\Events\CompanyMessageToAllUsers;
use App\Events\MessageToSpecificUser;
use App\Events\PublicMessageToAllUsers;
use App\FrequentlyAskedQuestion;
use App\Role;
use App\User;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;
use Illuminate\Validation\ValidationException;
use yajra\Datatables\Datatables;


class SystemManagementController extends Controller
{

    public function systemMasterDataReset(Request $request)
    {
        $user = $request->user();
        DB::table('activity_log')->truncate();
        DB::table('companies')->truncate();
        DB::table('failed_jobs')->truncate();
        //DB::table('faqs')->truncate();
        DB::table('financial_limits')->truncate();
        DB::table('health_checks')->truncate();
        DB::table('histories_ItemCreationRequest')->truncate();
        DB::table('histories_ItemMaster')->truncate();
        DB::table('histories_PurchaseEnquiry')->truncate();
        DB::table('histories_RateContractRequest')->truncate();
        DB::table('histories_Vendor')->truncate();
        DB::table('history_item_master')->truncate();
        DB::table('history_purchase_enquiry')->truncate();
        DB::table('history_purchase_order')->truncate();
        DB::table('history_rate_contract')->truncate();
        DB::table('history_rate_contract_request')->truncate();
        DB::table('histroy_rn_receiving')->truncate();
        DB::table('item_master')->truncate();
        DB::table('item_master_setup')->truncate();
        DB::table('item_requests')->truncate();
        DB::table('jobs')->truncate();
        DB::table('laravel_logs')->truncate();
        DB::table('migrations')->truncate();
        DB::table('notifications')->truncate();
        /*DB::table('oauth_access_tokens')->truncate();
        DB::table('oauth_auth_codes')->truncate();
        DB::table('oauth_clients')->truncate();
        DB::table('oauth_personal_access_clients')->truncate();
        DB::table('oauth_refresh_tokens')->truncate();*/
        DB::table('password_resets')->truncate();
        DB::table('password_resets_vendors')->truncate();
        DB::table('pivot_vendor_vendorusers')->truncate();
        DB::table('projects')->truncate();
        DB::table('purchase_enquiries')->truncate();
        DB::table('purchase_enquiry_commerical_evaluation_pivot')->truncate();
        DB::table('purchase_enquiry_quantity_changes')->truncate();
        DB::table('purchase_enquiry_vendor_uploaded_docs')->truncate();
        DB::table('purchase_order_line_rfi_communications')->truncate();
        DB::table('purchase_order_purchase_enquiries_pivot')->truncate();
        DB::table('purchase_order_quotation_reposnses_pivot')->truncate();
        DB::table('purchase_orders')->truncate();
        DB::table('quotation_commerical_evaluations')->truncate();
        DB::table('quotation_pe_rfi_communication')->truncate();
        DB::table('quotation_requests')->truncate();
        DB::table('quotation_response_tracker')->truncate();
        DB::table('quotation_responses')->truncate();
        DB::table('quotationrequests_purchaseenquiries')->truncate();
        DB::table('quotationrequests_ratecontractsrequests')->truncate();
        DB::table('quotationrequests_vendors')->truncate();

        DB::table('rate_contract_line_rfi_communications')->truncate();
        DB::table('rate_contract_quotation_responses')->truncate();
        DB::table('rate_contract_rate_contract_quotation_responses_pivot')->truncate();
        DB::table('rate_contract_rate_contract_request_pivot')->truncate();
        DB::table('rate_contract_request_commerical_evaluation_pivot')->truncate();
        DB::table('rate_contract_request_quantity_changes')->truncate();
        DB::table('rate_contract_request_vendor_uploaded_docs')->truncate();
        DB::table('rate_contract_requests')->truncate();
        DB::table('rate_contracts')->truncate();

        DB::table('receipt_note_receiving_invoices')->truncate();
        DB::table('receipt_note_receivings')->truncate();
        DB::table('receipt_notes')->truncate();
        DB::table('roles')->truncate();
        DB::table('system_error_log')->truncate();
        DB::table('users')->truncate();
        DB::table('vendor_users')->truncate();
        DB::table('vendors')->truncate();
        DB::table('volume_discount')->truncate();

        /* Create System Admin Username and password */
        $name = 'Muaz Malas';
        $email = 'muazmalas@gmail.com';
        $designation = 'System Administrator';
        $password = '123456';
        $picture = 'user_image.png';
        $HasedPassword = Hash::make($password);

        //check if user exists
        $SystemAdminUser = User::create([
            'company_id'    => 0, 
            'name'          => $name, 
            'email'         => $email,
            'designation'   => $designation,
            'picture'       => $picture,
            'password'      => $HasedPassword
        ]);

        Role::create([
            'created_by'    => 1,
            'company_id'    => 0,
            'project_id'    => 0,
            'user_id'       => 1,
            'role_name'     => 'SAD',
            'role_level'    => 1,
            'active'        => 'Yes',
        ]);


        if(Auth::guard('web')->attempt(['email' => $email, 'password' => $password], false, false)) {
            // Authentication passed...
            return response()->json([
                "messageTitle"  => 'All Data Records Are Cleared.',
                "message"       => 'Only System Data Remains, Username: muazmalas@gmail.com | Password: 123456',
                "messageType"   => 'success'
            ], 200);
        } else {
            // invalid credentials, act accordingly
            return response()->json([
                "messageTitle"  => 'All Data Records Are Cleared.',
                "message"       => 'Please Logout and Relogin with the following credentials, Username: muazmalas@gmail.com | Password: 123456',
                "messageType"   => 'warning'
            ], 200);
        }

    }



    public function systemPartialDataReset(Request $request)
    {
        $user = $request->user();

        DB::table('activity_log')->truncate();
        DB::table('failed_jobs')->truncate();
        DB::table('health_checks')->truncate();
        DB::table('histories_ItemCreationRequest')->truncate();
        DB::table('histories_ItemMaster')->truncate();
        DB::table('histories_PurchaseEnquiry')->truncate();
        DB::table('histories_RateContractRequest')->truncate();
        DB::table('histories_StockItem')->truncate();
        DB::table('histories_StockItemRequest')->truncate();
        DB::table('histories_Vendor')->truncate();
        DB::table('history_item_master')->truncate();
        DB::table('history_purchase_enquiry')->truncate();
        DB::table('history_purchase_order')->truncate();
        DB::table('history_purchase_order_cancellation')->truncate();
        DB::table('history_rate_contract')->truncate();
        DB::table('history_rate_contract_request')->truncate();
        DB::table('history_stock_item')->truncate();
        DB::table('history_stock_item_issue_request')->truncate();
        DB::table('history_stock_item_request')->truncate();
        DB::table('history_stock_item_return_request')->truncate();
        DB::table('history_stock_transfer')->truncate();
        DB::table('histroy_rn_receiving')->truncate();
        DB::table('jobs')->truncate();
        DB::table('laravel_logs')->truncate();
        DB::table('migrations')->truncate();
        DB::table('notifications')->truncate();
        DB::table('purchase_enquiries')->truncate();
        DB::table('purchase_enquiry_commerical_evaluation_pivot')->truncate();
        DB::table('purchase_enquiry_quantity_changes')->truncate();
        DB::table('purchase_enquiry_vendor_uploaded_docs')->truncate();
        DB::table('purchase_order_cancellation_requests')->truncate();
        DB::table('purchase_order_line_rfi_communications')->truncate();
        DB::table('purchase_order_purchase_enquiries_pivot')->truncate();
        DB::table('purchase_order_quotation_reposnses_pivot')->truncate();
        DB::table('purchase_orders')->truncate();
        DB::table('quotation_commerical_evaluations')->truncate();
        DB::table('quotation_pe_rfi_communication')->truncate();
        DB::table('quotation_rc_rfi_communication')->truncate();
        DB::table('quotation_requests')->truncate();
        DB::table('quotation_response_tracker')->truncate();
        DB::table('quotation_responses')->truncate();
        DB::table('quotationrequests_purchaseenquiries')->truncate();
        DB::table('quotationrequests_ratecontractsrequests')->truncate();
        DB::table('quotationrequests_vendors')->truncate();
        DB::table('rate_contract_line_rfi_communications')->truncate();
        DB::table('rate_contract_quotation_responses')->truncate();
        DB::table('rate_contract_rate_contract_quotation_responses_pivot')->truncate();
        DB::table('rate_contract_rate_contract_request_pivot')->truncate();
        DB::table('rate_contract_request_commerical_evaluation_pivot')->truncate();
        DB::table('rate_contract_request_quantity_changes')->truncate();
        DB::table('rate_contract_request_vendor_uploaded_docs')->truncate();
        DB::table('rate_contract_requests')->truncate();
        DB::table('rate_contracts')->truncate();
        DB::table('receipt_note_receiving_invoices')->truncate();
        DB::table('receipt_note_receivings')->truncate();
        DB::table('receipt_notes')->truncate();
        DB::table('stock_issuance_records')->truncate();
        DB::table('stock_item_issue_requests')->truncate();
        DB::table('stock_item_requests')->truncate();
        DB::table('stock_item_return_requests')->truncate();
        DB::table('stock_items')->truncate();
        DB::table('stock_transfer_requests')->truncate();
        DB::table('stockitems_purchaseenquiries')->truncate();
        DB::table('stockitems_stockitemrequests')->truncate();
        DB::table('volume_discount')->truncate();


        return response()->json([
            "messageTitle"  => 'All Data Records Are Cleared.',
            "message"       => 'Data Has Been Removed',
            "messageType"   => 'warning'
        ], 200);

    }

	public function getFAQs(Request $request)
    {    	
    	return FrequentlyAskedQuestion::where('question_category', $request->all()[0])->where('active', 'Yes')->get();
    }

    public function getFAQsList(Request $request)
    {
    	$FAQsList = FrequentlyAskedQuestion::with('creator')->select('faqs.*');

        return Datatables::of($FAQsList)
            ->editColumn('id', 'FAQ-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('FAQ-', id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('question_description', '{!! str_limit($question_description, 300) !!}')
            ->addColumn('action', function ($FrequentlyAskedQuestion) {
            	if($FrequentlyAskedQuestion->active == "Yes"){
                    return '<button title="Show Info" class="btn btn-xs btn-info view-placeholder"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-danger FAQDeactivate" title="Deactivate" data-faqid="'.$FrequentlyAskedQuestion->id.'"><i class="mdi mdi-eye-off"></i> </button>';
            	} else {
            		return '<button title="Show Info"  class="btn btn-xs btn-info view-placeholder"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success FAQReactivate" title="Reactivate" data-faqid="'.$FrequentlyAskedQuestion->id.'"><i class="mdi mdi-eye"></i> </button>';
            	}
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }

    public function getFAQDetails(Request $request)
    {    	
    	return FrequentlyAskedQuestion::FindOrFail($request->get('recordId'));
    }

    public function createFAQs(Request $request)
    {

    	FrequentlyAskedQuestion::create([
    		'question_category' 	=> $request->get('question_category'),
    		'question_title' 		=> $request->get('question_title'),
    		'question_description' 	=> $request->get('question_description'),
    	]);

    	//return feedback infomration to user
    	return response()->json([
            "messageTitle"  => 'FAQ Created Successfully.',
            "message"       => 'Frequently Asked Question Created Successfully.',
            "messageType"   => 'success'
        ], 200);	
    }

    public function editFAQs(Request $request)
    {
        $FAQ = FrequentlyAskedQuestion::FindOrFail($request->get('edit_question_id'));

        $FAQ->question_category = $request->get('edit_question_category');
        $FAQ->question_title = $request->get('edit_question_title');
        $FAQ->question_description = $request->get('edit_question_description');
        $FAQ->update();

        //return feedback infomration to user
        return response()->json([
            "messageTitle"  => 'FAQ Edited Successfully.',
            "message"       => 'Frequently Asked Question Edited Successfully.',
            "messageType"   => 'success'
        ], 200);
    }

    public function deactivateFAQs(Request $request)
    {

    	FrequentlyAskedQuestion::FindOrFail($request->all()[0])->update(['active' => 'No']);

    	return response()->json([
            "messageTitle"  => 'FAQ Deactivated Successfully.',
            "message"       => 'Frequently Asked Question Deactivated Successfully.',
            "messageType"   => 'success'
        ], 200);	
    }


    public function reactivateFAQs(Request $request)
    {

    	FrequentlyAskedQuestion::FindOrFail($request->all()[0])->update(['active' => 'Yes']);

    	return response()->json([
            "messageTitle"  => 'FAQ Reactivated Successfully.',
            "message"       => 'Frequently Asked Question Reactivated Successfully.',
            "messageType"   => 'success'
        ], 200);	
    }

    public function getErrorsLogDataTable(Request $request)
    {
        //$ErrorsLog = DB::table('laravel_logs')->join('users', 'laravel_logs.id', '=', 'contacts.user_id')->select('*');

        $ErrorsLogUsers = DB::table('laravel_logs')
        ->join('users', function($join)
        {
            $join->on('laravel_logs.created_by', '=', 'users.id')->where('creator_type', '=', 'App\User');
        })
        ->select('laravel_logs.*', 'users.name')->get();

        $ErrorsLogVendors = DB::table('laravel_logs')
        ->join('vendor_users', function($join)
        {
            $join->on('laravel_logs.created_by', '=', 'vendor_users.id')->where('creator_type', '=', 'App\VendorUser');
                 
        })
        ->select('laravel_logs.*', 'vendor_users.name')->get();

        $ErrorsLog = array_merge(json_decode($ErrorsLogUsers), json_decode($ErrorsLogVendors));

        usort($ErrorsLog, 'sortByOrder');

        return Datatables::of($ErrorsLog)
            ->editColumn('user_agent', function ($error) {
                return implode(', ', parse_user_agent($error->user_agent));
            })
            ->addColumn('action', function ($error) {
                return '<button title="Show Info" class="btn btn-xs btn-info view-placeholder" data-recordid="'.$error->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success resolveErrorLog" data-recordid="'.$error->id.'"><i class="fa fa-check"></i> </button> <button class="btn btn-xs btn-warning unableToReplicate" data-recordid="'.$error->id.'"><i class="fa fa-exclamation"></i> </button> </button> <button class="btn btn-xs btn-danger deleteErrorLog" data-recordid="'.$error->id.'"><i class="fa fa-remove"></i> </button>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function getErrorsLogDetails(Request $request)
    {
        $ErrordDetails = DB::table('laravel_logs')->select('*')->where('id', $request->get('recordId'))->get();
        $ErrordDetails = json_decode($ErrordDetails, true);
        return $ErrordDetails[0];
    }

    public function resolveErrorsLog(Request $request)
    {
        $ErrordDetails = DB::table('laravel_logs')->select('*')->where('id', $request->get('recordId'))->update([
            'resolve_status' => 'Resolved'
        ]);

        return response()->json([
            "messageTitle"  => 'Error Successfully Marked as Resolved.',
            "message"       => 'Error Successfully Marked as Resolved. Thanks for taking care of this application.',
            "messageType"   => 'success'
        ], 200);    
    }

    public function unableToReplicatedError(Request $request)
    {
        $ErrordDetails = DB::table('laravel_logs')->select('*')->where('id', $request->get('recordId'))->update([
            'resolve_status' => 'Unable To Replicate'
        ]);

        return response()->json([
            "messageTitle"  => 'Error Successfully Marked as Unable to Replicate.',
            "message"       => 'Error Successfully Marked as Unable to Replicate. Thanks for trying to take care of this application.',
            "messageType"   => 'success'
        ], 200);    
    }

    public function deleteErrorsLog(Request $request)
    {
        $ErrordDetails = DB::table('laravel_logs')->select('*')->where('id', $request->get('recordId'))->delete();

        return response()->json([
            "messageTitle"  => 'Error Deleted Successfully.',
            "message"       => 'Error Deleted Successfully. Thanks for trying to take care of this application.',
            "messageType"   => 'success'
        ], 200);    
    }


    public function noneUserErrorsLog(Request $request)
    {
        //$ErrorsLog = DB::table('laravel_logs')->join('users', 'laravel_logs.id', '=', 'contacts.user_id')->select('*');

        $ErrorsLogNoneUsers = DB::table('laravel_logs')
            ->select('laravel_logs.*')
            ->where('created_by', null)
            ->get();

        return Datatables::of($ErrorsLogNoneUsers)
            ->editColumn('user_agent', function ($error) {
                return implode(', ', parse_user_agent($error->user_agent));
            })
            ->addColumn('action', function ($error) {
                return '<button title="Show Info" class="btn btn-xs btn-info view-placeholder" data-recordid="'.$error->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success resolveErrorLog" data-recordid="'.$error->id.'"><i class="fa fa-check"></i> </button> <button class="btn btn-xs btn-warning unableToReplicate" data-recordid="'.$error->id.'"><i class="fa fa-exclamation"></i> </button> </button> <button class="btn btn-xs btn-danger deleteErrorLog" data-recordid="'.$error->id.'"><i class="fa fa-remove"></i> </button>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }


    public function sendBroadCastMessage(Request $request)
    {
        //Log::stack(['single'])->info('Something happened 1'); // Recording To Log File
        $user = $request->user();
        $medium = $request->get('BroadCastDetails')['message_medium'];
        $type = $request->get('BroadCastDetails')['message_type'];
        $title = $request->get('BroadCastDetails')['message_title'];
        $body = $request->get('BroadCastDetails')['message_body'];
        $now = Carbon::now();
        $companyId = $request->get('BroadCastDetails')['company_id'];
        $userIds = $request->get('BroadCastDetails')['user_id'];


        if($medium == 'InSystemLiveMessage'){

            if($type == 'PublicMessage'){

                event(new PublicMessageToAllUsers($user, $title, $body, $now));

                return response()->json([
                    "messageTitle"  => 'Public Broadcast Sent Successfully.',
                    "message"       => 'Public Broadcast message sent to selected users Successfully.',
                    "messageType"   => 'success'
                ], 200);

            } else if ($type == 'PrivateCompanyMessage') {

                if($companyId != ''){
                    event(new CompanyMessageToAllUsers($user, $title, $body, $now, $companyId));

                    return response()->json([
                        "messageTitle"  => 'Company Broadcast Sent Successfully.',
                        "message"       => 'Company Broadcast message sent to selected users Successfully.',
                        "messageType"   => 'success'
                    ], 200);

                }

                return response()->json([
                    "messageTitle"  => 'Company Broadcast Was Not Sent.',
                    "message"       => 'Please Select A Company To Broardcast.',
                    "messageType"   => 'danger'
                ], 200);

                

            } else if ($type == 'PrivateUserMessage') {

                if($companyId == ''){
                    return response()->json([
                        "messageTitle"  => 'Users Broadcast Was Not Sent.',
                        "message"       => 'Please Select A Company and Users To Broardcast.',
                        "messageType"   => 'danger'
                    ], 200);
                }

                if(!empty($userIds)){
                    foreach ($userIds as $key => $userId) {
                        event(new MessageToSpecificUser($user, $title, $body, $now, $userId));
                    }

                    return response()->json([
                        "messageTitle"  => 'User Broadcast Sent Successfully.',
                        "message"       => 'User Broadcast message sent to selected users Successfully.',
                        "messageType"   => 'success'
                    ], 200);

                    
                }
                
                return response()->json([
                    "messageTitle"  => 'Company Broadcast Was Not Sent.',
                    "message"       => 'Please Select A User To Contiune.',
                    "messageType"   => 'danger'
                ], 200);

            }
            
            
        }
        
    }



    public function getSQLResponse(Request $request)
    {
        $user = $request->user();
        $SQLQuery = $request->get('SQLQuery');

        //Replace Logged In User
        $SQLQuery = str_replace('$GetLoggedInUserId', ''.$user->id.'', $SQLQuery);

        return DB::select(DB::raw($SQLQuery));
    }


    public function getDatabaseTablesList(Request $request)
    {
        $tables = [];
        $tempTables = DB::select('SHOW TABLES');
        foreach ($tempTables as $key => $tableDetails) {
            foreach ($tableDetails as $key => $tableName) {
                $tables[] = $tableName;
            }
        }
        return $tables;
    }

    public function getTableColumnsList(Request $request)
    {
        $table = $request->get('TableName');
        return Schema::getColumnListing($table);
    }


    public function saveNPublishChart(Request $request)
    {
        $user = $request->user();

        $ChartFilteration   = $request->get('ChartFilteration');
        $ChartOptions       = $request->get('ChartOptions');
        $SQLQueryDetails    = $request->get('SQLQueryDetails')['SQLQuery'];

        $newChart = Chart::create([
            'created_by'                => $user->id,
            'sql_query'                 => $SQLQueryDetails,
            'filteration_variables'     => $ChartFilteration,
            // 'company_id'                => $ChartOptions['CompanyId'],
            'chart_col_width'           => $ChartOptions['ChartWidth'],
            'chart_options'             => $ChartOptions['ChartOptions']
        ]);

        return response()->json([
            "messageTitle"  => 'Chart Save and Published Successfully.',
            "message"       => 'Chart Save and Published Successfully.',
            "messageType"   => 'success'
        ], 200);
    }




}
