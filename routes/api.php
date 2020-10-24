<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* Registeration Route */
Route::post('register', 'ApiAuthController@register');
Route::post('delete_user', 'ApiAuthController@deleteUser');
Route::post('get/companies', 'UsersController@get_companies');
Route::post('get/referred', 'UsersController@get_Referrals');
Route::post('get/employees', 'UsersController@get_Employees');
Route::post('update/employees', 'UsersController@update_Employees');
Route::post('get/role', 'UsersController@get_role');

Route::post('add/recommend', 'RecommendController@add_recommend');


/* Login Routes */
Route::post('client_login', 'ApiAuthController@ClientLogin');
Route::post('vendor_login', 'ApiAuthController@VendorLogin');
Route::post('emailLogin', 'ApiAuthController@emailLogin');

/* Password Reset */
Route::post('/password/email/user', 'ForgotPasswordUserController@sendResetLinkEmail');
Route::post('/password/reset/user', 'ResetPasswordUserController@reset');

Route::post('/password/email/vendor', 'ForgotPasswordVendorController@sendResetLinkEmail');
Route::post('/password/reset/vendor', 'ResetPasswordVendorController@reset');



/* Users APIs */
Route::group(['middleware' => 'auth:api'], function () {
	/* Delete User*/
	Route::post('deleteIncompleteUser', 'ApiAuthController@deleteIncompleteUser');
	# User Routes
	Route::group(['prefix' => 'users'], function () {
	    Route::get('/client_logout', 'UsersController@logout');
	    Route::get('/get_user_details', 'UsersController@getUserDetails');
		Route::post('/change_password', 'UsersController@ChangePassword');
		
		Route::any('/set/firstStep', 'UsersController@setfirstStep');
		Route::any('/get/firstStep', 'UsersController@getfirstStep');

		Route::any('/set/secondStep', 'UsersController@setsecondStep');
		Route::any('/get/secondStep', 'UsersController@getsecondStep');

		Route::any('/set/thirdStep', 'UsersController@setthirdStep');
		Route::any('/get/thirdStep', 'UsersController@getthirdStep');

		Route::any('/set/fourthStep', 'UsersController@setfourthStep');
		Route::any('/get/fourthStep', 'UsersController@getfourthStep');


		Route::post('/complete_onboading', 'UsersController@complete_onboading');

	    Route::post('/update_account_settings', 'UsersController@UpdateAccountSettings');
	    Route::post('/update_project_details', 'UsersController@UpdateProjectDetails');
	    Route::post('/new_item_creation_request', 'UsersController@NewItemCreationRequest');
	    Route::post('/item_master_setup', 'UsersController@ItemMasterSetup');
	    Route::post('/delete_item_master_template', 'UsersController@deleteItemMasterTemplate');
	    Route::post('/item_master_creation', 'UsersController@ItemMasterCreation');
	    Route::post('/item_activations', 'UsersController@ItemActivations');
	    Route::get('/get_users_new_item_requests_list', 'UsersController@getUsersNewItemRequestList');
	    Route::get('/get_users_item_creation', 'UsersController@getUsersItemCreationList');
	    Route::get('/get_users_purchase_enquiries', 'UsersController@getUsersPurchaseEnquiryList');
	    Route::get('/get_users_rate_contract_requests', 'UsersController@getUsersRateContractRequestsList');
	    Route::get('/get_users_stock_item_requests', 'UsersController@getUsersStockItemRequestsList');
	    Route::get('/get_users_stock_issuance_requests', 'UsersController@getUsersStockIssuanceRequestsList');
	    Route::post('/get_user_stock_item_issue_request_record_details', 'UsersController@getUsersStockItemIssueRequestDetails');
	    Route::get('/get_users_stock_return_requests', 'UsersController@getUsersStockReturnRequestsList');
	    Route::post('/get_user_stock_item_return_request_record_details', 'UsersController@getUsersStockItemReturnRequestDetails');

	    Route::get('/get_users_stock_return_requests', 'UsersController@getUsersStockReturnRequestsList');

	    Route::post('/validate_item_creation', 'UsersController@validateItemCreation');
	    Route::post('/reject_item_request_by_lma', 'UsersController@rejectItemRequestByLMA');
	    Route::post('/cancel_item_request_by_originator', 'UsersController@cancelItemRequestByOriginator');
	    Route::post('/cancel_item_creation_by_originator', 'UsersController@cancelItemCreationByOriginator');
	    Route::get('/get_users_rfis', 'UsersController@getUsersRFIs');
	    Route::post('/originator_create_rfi_message', 'UsersController@createUserRFIMessage');
	    Route::post('/update_profile_details', 'UsersController@updateProfileDetails');
	    Route::get('/get_user_pending_tasks', 'UsersController@getUserPendingTasks');
	    Route::post('/update_company_details', 'UsersController@updateConpanyDetails');
	    
	    //Testing Linkings
	    Route::post('/create_testing_pdf', 'UsersController@createPDFTest');
	});

	# Routes for Getting Data From Backend
	Route::group(['prefix' => 'data', 'middleware' => 'DataNInfo'], function () {
		Route::get('/get_company_details', 'DataController@getCompanyDetails');
		Route::get('/get_complete_projects', 'DataController@getCompleteProjectsDetails');
		Route::get('/get_complete_company_details', 'DataController@getCompleteCompanyDetails');
		Route::get('/get_user_projects_list', 'DataController@getUserProjectsListPRO');
		Route::get('/get_user_projects_list_almr', 'DataController@getUserProjectsListALMR');
		Route::get('/get_user_projects_list_rcco', 'DataController@getUserProjectsListRCCO');
		Route::get('/get_item_template_list', 'DataController@getItemTemplatesList');
		Route::get('/get_user_stores_list', 'DataController@getUserStoresList');
		Route::get('/get_user_stock_issuance_request_list', 'DataController@getStockItemIssueUserRequest');
		Route::get('/get_user_roles', 'DataController@getUserRolesDataTable');
		Route::get('/get_user_activities', 'DataController@getUserRecentActivitiesDataTable');
		Route::get('/get_company_projects_list', 'DataController@getCompanyProjectsList');
		Route::get('/get_new_item_requests_list', 'DataController@getNewItemRequestList');
		Route::get('/get_item_master_templates', 'DataController@getItemMasterTemplates');
		Route::post('/get_item_master_template_details', 'DataController@getItemMasterTemplateDetails');
		Route::get('/get_item_templates_list', 'DataController@getItemMasterTemplatesList');
		Route::get('/get_account_setup_details', 'DataController@getAccountSetupDetails');
		Route::get('/get_item_unqiue_field_1', 'DataController@getItemMasterUnqiueField1');
		Route::post('/get_item_unqiue_field_2', 'DataController@getItemMasterUnqiueField2');
		Route::post('/get_item_unqiue_field_3', 'DataController@getItemMasterUnqiueField3');
		Route::post('/get_item_unqiue_field_4', 'DataController@getItemMasterUnqiueField4');
		Route::post('/get_item_unqiue_field_5', 'DataController@getItemMasterUnqiueField5');
		Route::post('/get_item_unqiue_field_6', 'DataController@getItemMasterUnqiueField6');
		Route::post('/get_item_unqiue_field_7', 'DataController@getItemMasterUnqiueField7');
		Route::post('/get_item_unqiue_field_8', 'DataController@getItemMasterUnqiueField8');
		Route::post('/get_item_unqiue_field_9', 'DataController@getItemMasterUnqiueField9');
		Route::post('/get_item_unqiue_field_10', 'DataController@getItemMasterUnqiueField10');
		Route::post('/get_search_items', 'DataController@getSearchItems');
		Route::post('/get_search_items_non_stock', 'DataController@getSearchItemsNonStock');
		Route::post('/get_search_stock_items_by_stores', 'DataController@getSearchStockItemsByStores');
		Route::post('/get_search_stock_items_by_store', 'DataController@getSearchStockItemsByStore');
		Route::get('/get_approvers_new_item_validation_list', 'DataController@getApproversItemValidationList');
		Route::post('/get_item_master_record_details', 'DataController@getItemMasterRecordDetails');
		Route::post('/project_deactivate', 'DataController@projectsDeactivate');
		Route::post('/create_new_project', 'DataController@createNewProject');
		Route::get('/get_item_master_list', 'DataController@getItemMasterList');
		Route::post('/get_pe_rfi_details', 'DataController@getPERFIDetails');
		Route::post('/get_all_pe_rfi_details', 'DataController@getAllPERFIDetails');
		Route::get('/get_user_purchase_order_list', 'DataController@getUserPurchaseOrderDataTable');


		//Purchase Enquiry Get Data Routes
		Route::get('/get_purchase_request_list', 'DataController@getPurchaseRequestList');
		Route::get('/get_purchase_request_list_for_peos', 'DataController@getPurchaseRequestListForPEOs');
		Route::post('/get_purchase_request_record_details', 'DataController@getPurchaseRequestDetails');
		Route::post('/get_item_rate_contract_details', 'DataController@getItemRateContractDetails');


		//Quotation Management Get Data Routes
		Route::post('/get_pe_list_per_type', 'DataController@getPurchaseEnquiriesPerType');
		Route::get('/get_quotations_list', 'DataController@getQuotationsDatatable');
		Route::post('/get_quotation_details', 'DataController@getQuotationDetails');
		Route::post('/get_vendors_list_without_existing', 'DataController@getVendorsListWithoutExisting');


		//Vendors Management Get Data Routes For Users
		Route::get('/get_vendors_list', 'DataController@getVendorsList');
		Route::get('/get_vendors_datatable', 'DataController@getVendorsDatatable');
		Route::post('/get_vendor_details', 'DataController@getVendorDetails');
		Route::get('/get_vendor_users_datatable', 'DataController@getVendorUsersDatatable');


		//system management data routes
		Route::get('/get_companies_datatable', 'DataController@getCompaniesDatatable');
		Route::post('/get_company_details', 'DataController@getCompanyCompleteDetails');
		Route::get('/get_users_not_completed_setup_datatable', 'DataController@getUsersNotCompletedSetupDatatable');
		Route::get('/get_companies_list', 'DataController@getCompaniesList');
		Route::post('/get_company_users_list', 'DataController@getCompanyUsersList');

		//Purchase Orders data Routes
		Route::get('/get_commercial_evaluations_list', 'DataController@getCommericalEvaluationsDatatable');
		Route::post('/get_commercial_evaluation_details', 'DataController@getCommericalEvaluationDetails');
		Route::get('/get_purchase_order_list', 'DataController@getPurchaseOrderDataTable');
		Route::post('/get_po_details', 'DataController@getPurchaseOrderDetails');
		Route::post('/get_po_line_rfi_details', 'DataController@getPOLineRFIDetails');
		Route::get('/get_po_list', 'DataController@getPurchaseOrdersList');
		Route::post('/get_rn_details', 'DataController@getReceiptNoteDetails');
		Route::get('/get_po_cancellation_request_list', 'DataController@getPurchaseOrdersCancellationRequestsList');
		Route::post('/get_po_cancellation_request_details', 'DataController@getPOCancellationRequestDetails');

		//Receipt Notes Data Routes
		Route::get('/get_po_rns_list', 'DataController@getPORNsDatatable');
		Route::get('/get_po_rns_approval_list', 'DataController@getPORNsApprovalsDatatable');
		Route::post('/get_po_rns_details', 'DataController@getPORNsDetails');
		Route::post('/receiving_details_for_approval', 'DataController@receivingDetailsForApproval');
		Route::post('/get_po_invoicing_details', 'DataController@getPOInvoicingDetails');
		


		//Rate Contract Get Data Routes
		Route::get('/get_rate_contract_item_requests_list', 'DataController@getRateContractItemRequestsList');
		Route::post('/get_rate_contract_requests_record_details', 'DataController@getRateContractItemRequestDetails');
		Route::get('/get_rc_commercial_evaluations_list', 'DataController@getRCCommericalEvaluationsDatatable');
		Route::post('/get_rc_commercial_evaluation_details', 'DataController@getRCCommericalEvaluationDetails');
		Route::get('/get_rate_contract_approval_list', 'DataController@getRateContractApprovalDataTable');
		Route::get('/get_rate_contract_list', 'DataController@getRateContractDataTable');
		Route::post('/get_rc_details', 'DataController@getRateContractDetails');
		Route::post('/get_rc_line_rfi_details', 'DataController@getRCLineRFIDetails');


		//Stores Routes for Getting Data From Backend
		Route::get('/get_stock_item_requests_list', 'DataController@getStockItemRequestsList');
		Route::post('/get_stock_item_requests_record_details', 'DataController@getStockItemRequestDetails');
		Route::post('/get_stock_item_request_list_for_creation', 'DataController@getStockItemRequestForCreation');
		Route::get('/get_stock_item_list', 'DataController@getStockItemList');
		Route::post('/get_stock_item_record_details', 'DataController@getStockItemDetails');
		Route::post('/get_stock_item_record_details_with_receiving_details', 'DataController@getStockItemWithReceivingDetails');
		Route::get('/get_stock_item_approval_list', 'DataController@getStockItemApprovalList');
		Route::get('/get_stock_transfer_request_list', 'DataController@getStockTransferRequestList');
		Route::post('/get_stock_transfer_request_record_details', 'DataController@getStockTransferRequestDetails');
		Route::get('/get_stock_item_issue_request_list', 'DataController@getStockItemIssueRequestList');
		Route::post('/get_stock_item_issue_request_record_details', 'DataController@getStockItemIssueRequestDetails');
		Route::get('/get_stock_item_issue_request_list_for_releasing', 'DataController@getStockItemIssueRequestListForReleasing');
		Route::get('/get_stock_item_return_request_list', 'DataController@getStockItemReturnRequestList');
		Route::post('/get_stock_item_return_request_record_details', 'DataController@getStockItemReturnRequestDetails');
		Route::get('/get_stock_item_issue_request_list_for_returning', 'DataController@getStockItemReturnRequestListForReturning');
		
		// Route::post('/get_rc_line_rfi_details', 'DataController@getRCLineRFIDetails');

		//Stores Routes for Getting Data From Backend
		Route::get('/get_user_dashboard_reports', 'DataController@getUserDashboardReports');
		Route::post('/update_chart_data', 'DataController@updateChartData');

	});


	# Routes for Getting Data From Backend
	Route::group(['prefix' => 'purchase_enquiry', 'middleware' => 'PurchaseEnquiry'], function () {	
		Route::post('/post_purchase_enquiry_request', 'PurchaseEnquiryController@createNewPE');
		Route::post('/validate_purchase_enquiry_creation', 'PurchaseEnquiryController@validatePurchaseEnquiry');
		Route::post('/update_purchase_enquiry_request', 'PurchaseEnquiryController@updatePurchaseEnquiry');
		Route::post('/cancel_purchase_enquiry_request', 'PurchaseEnquiryController@cancelPurchaseEnquiry');
		Route::post('/update_purchase_enquiry_request_by_peo', 'PurchaseEnquiryController@updatePurchaseEnquiryByPEO');
	});

	# Rate Contract Routes
	Route::group(['prefix' => 'rate_contracts', 'middleware' => 'RateContract'], function () {	
		Route::post('/post_rate_contract_request', 'RateContractController@createNewRateContractRequest');
		Route::post('/validate_rate_contract_item_creation', 'RateContractController@validateRateContractItemRequest');
		Route::post('/update_rate_contract_item_request', 'RateContractController@updateRateContractItemRequest');
		Route::post('/cancel_rate_contract_item_request', 'RateContractController@cancelRateContractItemRequest');
		Route::post('/create_rate_contract', 'RateContractController@createRateContract');
		Route::post('/rate_contract_approval', 'RateContractController@RateContractApproval');
		Route::post('/create_rc_line_rfi', 'RateContractController@createRateContractLineRFIMessage');
	});


	# Stores Routes
	Route::group(['prefix' => 'stores', 'middleware' => 'StoresManagement'], function () {	
		/* Stores Management Routes */
		Route::post('/post_stock_item_request', 'StoresController@createStockItemRequest');
		Route::post('/validate_store_item_request', 'StoresController@validateStockItemRequest');
		Route::post('/update_stock_item_request', 'StoresController@updateStockItemRequest');
		Route::post('/cancel_stock_item_request', 'StoresController@cancelStockItemRequest');
		Route::post('/create_new_stock_item', 'StoresController@createStockItem');
		Route::post('/update_stock_item_details', 'StoresController@updateStockItemDetails');
		Route::post('/validate_stock_item_creation', 'StoresController@approvalsOfStockItemCreation');
		Route::post('/update_stock_item_level', 'StoresController@updateStockItemLevel');
		Route::post('/create_new_stock_transfer_request', 'StoresController@createStockTransferRequest');
		Route::post('/validate_stock_transfer_request', 'StoresController@validateStockTransferRequest');
		Route::post('/post_stock_item_issue_request', 'StoresController@createStockItemIssueRequest');
		Route::post('/validate_stock_item_issue_request', 'StoresController@validateStockItemIssueRequest');
		Route::post('/create_stock_item_issuance', 'StoresController@createStockItemIssuance');
		Route::post('/create_stock_return_request', 'StoresController@createStockItemReturnRequest');
		Route::post('/validate_stock_item_return_request', 'StoresController@validateStockItemReturnRequest');
		Route::post('/accept_stock_item_return_request', 'StoresController@acceptStockItemReturnRequest');

		
	});


	# Routes for Getting Data From Backend
	Route::group(['prefix' => 'system_management', 'middleware' => 'SystemManagement'], function () {	
		Route::post('/system_master_data_system_reset', 'SystemManagementController@systemMasterDataReset');
		Route::post('/system_partial_data_system_reset', 'SystemManagementController@systemPartialDataReset');
		Route::post('/get_faqs', 'SystemManagementController@getFAQs');
		Route::get('/get_faqs_list', 'SystemManagementController@getFAQsList');
		Route::post('/get_faq_record_details', 'SystemManagementController@getFAQDetails');
		Route::post('/create_frequently_asked_question', 'SystemManagementController@createFAQs');
		Route::post('/edit_frequently_asked_question', 'SystemManagementController@editFAQs');
		Route::post('/reactivate_frequently_asked_question', 'SystemManagementController@reactivateFAQs');
		Route::post('/deactivate_frequently_asked_question', 'SystemManagementController@deactivateFAQs');
		Route::get('/get_error_log_datatable', 'SystemManagementController@getErrorsLogDataTable');
		Route::post('/get_error_log_details', 'SystemManagementController@getErrorsLogDetails');
		Route::post('/resolve_error_log', 'SystemManagementController@resolveErrorsLog');
		Route::post('/unable_to_replicate_error', 'SystemManagementController@unableToReplicatedError');
		Route::post('/delete_error_log', 'SystemManagementController@deleteErrorsLog');
		Route::get('/get_error_log_none_user_generated_datatable', 'SystemManagementController@noneUserErrorsLog');
		Route::post('/create_broadcast_message', 'SystemManagementController@sendBroadCastMessage');
		Route::post('/get_sql_response', 'SystemManagementController@getSQLResponse');
		Route::get('/get_database_tables_list', 'SystemManagementController@getDatabaseTablesList');
		Route::post('/get_table_columns_list', 'SystemManagementController@getTableColumnsList');
		Route::post('/save_and_publish_chart', 'SystemManagementController@saveNPublishChart');
	});

	# Qoutations Routes
	Route::group(['prefix' => 'quotations_management', 'middleware' => 'QuotationManagement'], function () {	
		Route::post('/create_new_quotation_request', 'QuotationsController@createQuotationRequest');
		Route::post('/create_rfi_message', 'QuotationsController@createRFIMessage');
		Route::post('/submit_commerical_evaluation', 'QuotationsController@submitCommercialEvaluation');
		Route::post('/modify_quotation_request', 'QuotationsController@modifyQuotationRequest');
		Route::post('/cancel_quotation_request', 'QuotationsController@cancelQuotationRequest');
		Route::post('/reject_ce_pe_lines_for_new_rfp', 'QuotationsController@rejectCEPELinesForNewRFP');
		Route::post('/cancel_ce_pe_lines', 'QuotationsController@cancelCEPELines');
		Route::post('/create_purchase_order', 'QuotationsController@createPurchaseOrder');
		Route::post('/create_po_line_rfi', 'QuotationsController@createPOLineRFIMessage');
		Route::post('/purchase_order_approval', 'QuotationsController@POApproval');
	});


	Route::group(['prefix' => 'receipt_notes_management', 'middleware' => 'ReciptNoteMiddleware'], function () {
		Route::post('/rn_line_receiving', 'ReceiptNotesController@receivingRNLine');
		Route::post('/validate_receipt_note_creation', 'ReceiptNotesController@validateReceiptNote');
		Route::post('/update_receipt_note_request', 'ReceiptNotesController@updateReceiptNote');
		Route::post('/invoice_status_acceptance', 'ReceiptNotesController@invoiceApprovalStatusUpdate');
		Route::post('/cancel_po_rn_line', 'ReceiptNotesController@cancelPOReceiptNoteLine');
		Route::post('/validate_po_cancellation_request', 'ReceiptNotesController@validatePOCancellationRequest');
	});


	# Vendors Routes
	Route::group(['prefix' => 'vendors_management', 'middleware' => 'VendorsManagement'], function () {	
		Route::post('/created_new_vendor', 'VendorsController@createNewVendor');
		Route::post('/check_vendor_name_duplicates', 'VendorsController@checkVendorNameDuplicates');
		Route::post('/edit_vendor_details', 'VendorsController@editVendorDetails');
		Route::post('/created_vendor_user', 'VendorsController@createVendorUser');
		Route::post('/reactivate_vendor_user', 'VendorsController@reactivateVendorUser');
		Route::post('/deactivate_vendor_user', 'VendorsController@deactivateVendorUser');
		Route::post('/delete_vendor_user', 'VendorsController@deleteVendorUser');
		Route::post('/toggle_vendor_activation', 'VendorsController@toggleVendorActivation');
		Route::post('/remove_qualification_doc', 'VendorsController@removeQualificationDoc');
	});

});



/* Vendors APIs */
Route::group(['prefix' => 'vendors', 'middleware' => 'auth:vendor-api'], function () {

	Route::get('/vendor_logout', 'VendorsController@logout');
	Route::post('/change_password', 'VendorsController@ChangePassword');
	Route::get('/get_vendor_user_details', 'VendorsController@getVendorUserDetails');
	Route::get('/get_vendor_user_roles', 'VendorsController@getVendorUserRole');
	Route::post('/update_profile_details', 'VendorsController@updateVendorProfileDetails');

	//Vendors Management Get Data Routes For Vendors
	Route::group(['prefix' => 'data', 'middleware' => 'VendorDataNInfo'], function () {

		Route::get('/get_vendor_details', 'VendorsDataController@getVendorsDetails');
		Route::get('/get_vendor_quotations_list', 'VendorsDataController@getVendorQuotationsDatatable');
		Route::post('/get_quotation_details_record_details', 'VendorsDataController@getQuotationDetails');
		Route::post('/get_quotation_details_record_details_auction', 'VendorsDataController@getQuotationDetailsAuction');
		Route::post('/get_pe_rfi_details', 'VendorsDataController@getPERFIDetails');
		Route::post('/get_all_pe_rfi_details', 'VendorsDataController@getAllPERFIDetails');

		//POs and Invoicing Data Routes
		Route::get('/get_vendor_po_list', 'VendorsDataController@getVendorPOsDatatable');
		Route::post('/get_vendor_po_details', 'VendorsDataController@getVendorPODetails');

		Route::get('/get_vendor_po_rns_list', 'VendorsDataController@getVendorPORNsDatatable');
		Route::post('/get_vendor_po_rns_details', 'VendorsDataController@getVendorPORNsDetails');

		Route::get('/get_vendor_auction_list', 'VendorsDataController@getVendorAuctionList');

		// Rate Contract Get Date Vendor Routes 
		Route::get('/get_vendor_rc_list', 'VendorsDataController@getVendorRCsDatatable');
		Route::post('/get_vendor_rc_details', 'VendorsDataController@getVendorRCDetails');

	});

	# Vendors Bidding Management Routes
	Route::group(['prefix' => 'bidding_management', 'middleware' => 'VendorsBiddingManagement'], function () {
		Route::post('/quotation_reponse_submission', 'VendorsBiddingController@submitQuotationResponse');
		Route::post('/upload_required_files', 'VendorsBiddingController@uploadRequiredFiles');
		Route::post('/create_rfi_message', 'VendorsBiddingController@createRFIMessage');
		Route::post('/mark_qoutation_as_viewed', 'VendorsBiddingController@markQuotationAsViewed');
		Route::post('/confirm_quotation_submission', 'VendorsBiddingController@confirmSubmission');
		Route::post('/auction_reponse_submission', 'VendorsBiddingController@submitAuctionResponse');
	});


	# Vendors Bidding Management Routes
	Route::group(['prefix' => 'pos_n_invoicing_management', 'middleware' => 'VendorsPOsNInvoiceManagement'], function (){
		Route::post('/po_vendor_rejection', 'VendorsPONInvoicingController@rejectPOByVendor');
		Route::post('/po_vendor_approval', 'VendorsPONInvoicingController@approvePOByVendor');
		Route::post('/rn_line_change_status', 'VendorsPONInvoicingController@RNLineChangeStatus');
		Route::post('/vendor_shipment_notification', 'VendorsPONInvoicingController@RNLineShipmentNotificaiton');
		Route::post('/vendor_invoice_upload', 'VendorsPONInvoicingController@uploadVendorInvoice');

		/* Rate Contract Routes */
		Route::post('/rc_vendor_rejection', 'VendorsPONInvoicingController@rejectRCByVendor');
		Route::post('/rc_vendor_approval', 'VendorsPONInvoicingController@approveRCByVendor');

	});

});



