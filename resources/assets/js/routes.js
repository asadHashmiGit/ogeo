/* eslint-disable no-undef */
export const routes = [
    
    /* Login Routes */
    {
        path: '/',
        name: 'Home Page',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/HomePage.vue').default,
    },{
        path: '/registration',
        name: 'Registration',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/Registration.vue').default,
    },{
        path: '/client_login',
        name: 'Client Login',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/UserLogin.vue').default,
    },{
        path: '/client_forget_password_request',
        name: 'Client Forget Password Request',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/UserForgetPasswordRequest.vue').default,
    },{
        path: '/user_password_set',
        name: 'Client New Password Set',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/UserNewPasswordSet.vue').default,
    },{
        path: '/vendor_login',
        name: 'Vendor Login',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/VendorLogin.vue').default,
    },{
        path: '/vendor_forget_password_request',
        name: 'Vendor Forget Password Request',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/VendorForgetPasswordRequest.vue').default,
    },{
        path: '/vendor_password_set',
        name: 'Vendor New Password Set',
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/auth/VendorNewPasswordSet.vue').default,
    },

    
    /*  User Routes */
    {
        path: '/app/dashboard',
        name: "Dashbaord",
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        component: require('./pages/user/Dashboard.vue').default,
    },
    {
        path: '/app/company_settings',
        name: "Company Settings",
        component: require('./pages/user/CompanySettings.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        }
    },
    {
        path: '/app/manage_projects',
        name: "Manager Projects",
        component: require('./pages/user/ManageProjects.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        }
    },
    {
        path: '/app/complete_onboarding_process',
        name: "Completed Onboarding process",
        component: require('./pages/user/CompletedOnboradingProcess.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        }
    },
    {
        path: '/app/account_settings',
        name: "Account Settings",
        component: require('./pages/user/AccountSettings.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        }
    },
    {
        path: '/app/system_management',
        component: require('./pages/system_management/SystemManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "System Management",
                component: require('./pages/system_management/SystemInfo.vue').default
            }, 
            { 
                path: 'frequently_asked_questions',
                name: "Frequently Asked Questions",
                component: require('./pages/system_management/FAQs.vue').default
            },
            { 
                path: 'system_errors_log',
                name: "System Errors Log",
                component: require('./pages/system_management/ErrorsLog.vue').default
            },
            { 
                path: 'broadcast_center',
                name: "Broadcast Center",
                component: require('./pages/system_management/BroadCastCenter.vue').default
            },
            { 
                path: 'charts_creation',
                name: "Charts Creation",
                component: require('./pages/system_management/ChartsCreation.vue').default
            },
            { 
                path: 'available_charts',
                name: "Available Charts",
                component: require('./pages/system_management/AvailableCharts.vue').default
            },
        ]

    },
    {
        path: '/app/profile',
        component: require('./pages/profile/Profile.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "General Information",
                component: require('./pages/profile/ProfileInfo.vue').default
            }, 
            { 
                path: 'item_creation_requests',
                name: "User's Item Creation Requests",
                component: require('./pages/profile/ItemCreationRequests.vue').default
            },
            { 
                path: 'item_creations',
                name: "Item Creations",
                component: require('./pages/profile/ItemCreations.vue').default
            },
            { 
                path: 'user_purchase_enquiries',
                name: "Purchase Enquiries",
                component: require('./pages/profile/PurchaseEnquiries.vue').default
            },
            { 
                path: 'user_request_for_information',
                name: "Request For Information",
                component: require('./pages/profile/RequestForInformation.vue').default
            },
            { 
                path: 'purchase_orders_clarifications',
                name: "Purchase Orders",
                component: require('./pages/profile/PurchaseOrdersClarifications.vue').default
            },
            { 
                path: 'user_rate_contract_requests',
                name: "Rate Contract Requests",
                component: require('./pages/profile/RateContractRequests.vue').default
            },
            { 
                path: 'user_stock_item_requests',
                name: "Stock Item Requests",
                component: require('./pages/profile/StockItemRequests.vue').default
            },  
            { 
                path: 'user_stock_issuance_requests',
                name: "Stock Issuance Requests",
                component: require('./pages/profile/StockItemIssuanceRequests.vue').default
            },  
            { 
                path: 'user_stock_return_requests',
                name: "Stock Return Requests",
                component: require('./pages/profile/StockItemReturnRequests.vue').default
            },               
        ]
    },
    {
        path: '/app/purchase_enquiry',
        component: require('./pages/purchase_enquiry/PurchaseEnquiry.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Purchase Enquiry",
                component: require('./pages/purchase_enquiry/NewPurchaseEnquiry.vue').default
            },
            { 
                name: "Purchase Enquiries List",
                path: 'list',
                component: require('./pages/purchase_enquiry/PurchaseEnquiriesList.vue').default
            },
            { 
                name: "Purchase Enquiry Approvals",
                path: 'approvals',
                component: require('./pages/purchase_enquiry/PurchaseEnquiryApprovals.vue').default
            },
            { 
                name: "New Request to Update a Set-up Budget",
                path: 'library_of_materials',
                component: require('./pages/purchase_enquiry/PEItemMasterList.vue').default
            },
            { 
                name: "Uers Item Creation Request",
                path: 'new_item_creation',
                component: require('./pages/items_master/NewItemCreationRequest.vue').default
            },
                    
        ]
    },
    {
        path: '/app/items_master',
        
        component: require('./pages/items_master/ItemsMaster.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Request To Update The LoM",
                component: require('./pages/items_master/NewItemCreationRequest.vue').default
            },
            { 
                path: 'requests_list',
                name: "List Of Requests To Update LoM",
                component: require('./pages/items_master/ItemCreationRequests.vue').default
            },
            { 
                path: 'items_list',
                name: "Library of Materials",
                component: require('./pages/items_master/ItemMasterList.vue').default
            },
            { 
                path: 'approval',
                name: "Item Creation Approvals",
                component: require('./pages/items_master/ItemCreationApprovals.vue').default
            },
            { 
                path: 'template_setup',
                name: "Template Creation",
                component: require('./pages/items_master/ItemTemplateSetup.vue').default
            },
            { 
                path: 'new_item_creation',
                name: "New Item Creation",
                component: require('./pages/items_master/NewItemCreation.vue').default
            },  
        ]
    },
    {
        path: '/app/set_up_budget',
        
        component: require('./pages/setup_budget/setupMaster.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Request To Update The Set-up Budget",
                component: require('./pages/setup_budget/NewBudgetCreationRequest.vue').default
            },
            { 
                path: '',
                name: "Set-up Budget",
                component: require('./pages/setup_budget/SetUpBudget.vue').default
            },
            { 
                path: 'budget_requests_list',
                name: "List Of Requests To Update Set-up Budget",
                component: require('./pages/setup_budget/BudgetCreationRequests.vue').default
            },
            // { 
            //     path: 'items_list',
            //     name: "Library of Materials",
            //     component: require('./pages/setup_budget/BudgetMasterList.vue').default
            // },
            { 
                path: 'approval',
                name: "Set-up Budget Creation Approvals",
                component: require('./pages/setup_budget/BudgetCreationApprovals.vue').default
            },
            { 
                path: 'template_setup',
                name: "Template Creation",
                component: require('./pages/setup_budget/ItemBudgetTemplateSetup.vue').default
            },
            { 
                path: 'new_item_creation',
                name: "New Item Creation",
                component: require('./pages/setup_budget/NewBudgetCreation.vue').default
            },  
        ]
    },
    {
        path: '/app/quotations',
        component: require('./pages/quotations/QuotationManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Request for Proposals",
                component: require('./pages/quotations/RequestForQuotation.vue').default
            },
            { 
                path: 'manage_quotations',
                name: "Manage Requests For Proposals",
                component: require('./pages/quotations/ManageQuotations.vue').default
            },
        ]
    },
    {
        path: '/app/purchase_orders',
        component: require('./pages/purchase_orders/PurchaseOrdersManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "Commerical Evaluation List",
                component: require('./pages/purchase_orders/POGeneration.vue').default
            },
            { 
                name: "Purchase Orders Approvals",
                path: 'approvals',
                component: require('./pages/purchase_orders/PurchaseOrderApprovals.vue').default
            },
            { 
                name: "Purchase Orders List",
                path: 'purchase_orders_list',
                component: require('./pages/purchase_orders/PurchaseOrdersList.vue').default
            },
            { 
                name: "Purchase Orders Cancellation Approvals",
                path: 'po_cancellation_approvals',
                component: require('./pages/purchase_orders/PurchaseOrderCancellationApprovals.vue').default
            },
        ]
    },
    {
        path: '/app/receipt_notes',
        component: require('./pages/receipt_note/ReceiptNotesManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "POs Receipt Note List",
                component: require('./pages/receipt_note/ReceiptNoteList.vue').default
            },
            { 
                name: "Receipt Note Approvals",
                path: 'approvals',
                component: require('./pages/receipt_note/ReceiptNoteApprovals.vue').default
            },
        ]
    },
    {
        path: '/app/vendors_management',
        component: require('./pages/vendors_management/VendorManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "Vendors List",
                component: require('./pages/vendors_management/VendorsList.vue').default
            },
            { 
                path: 'create_new_vendor',
                name: "Create New Vendor",
                component: require('./pages/vendors_management/CreateVendor.vue').default
            },
            { 
                path: 'create_vendor_access',
                name: "Create Vendor Access",
                component: require('./pages/vendors_management/CreateVendorUser.vue').default
            },
            { 
                path: 'invoice_handling',
                name: "Invoice Handling",
                component: require('./pages/vendors_management/InvoiceHandling.vue').default
            },
        ]
    },
    {
        path: '/app/rate_contracts',
        component: require('./pages/rate_contracts/RateContractManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Rate Contract Request",
                component: require('./pages/rate_contracts/NewRequestRateContractCreation.vue').default
            },
            { 
                path: 'rate_contracts_requests_approvals',
                name: "Rate Contract Requests Approvals",
                component: require('./pages/rate_contracts/RateContractRequestsApprovals.vue').default
            },
            { 
                path: 'create_rate_contract',
                name: "Rate Contract Creation",
                component: require('./pages/rate_contracts/RateContractCreation.vue').default
            },
            { 
                path: 'rate_contract_creation_approvals',
                name: "Rate Contract Creation Approvals",
                component: require('./pages/rate_contracts/RateContractCreationApprovals.vue').default
            },
            { 
                path: 'rate_contract_list',
                name: "Rate Contract List",
                component: require('./pages/rate_contracts/RateContractList.vue').default
            }, 
        ]
    },
    {
        path: '/app/stores_management',
        component: require('./pages/stores_management/StoreRoomsManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "Stock Item Creation",
                component: require('./pages/stores_management/StockItemCreation.vue').default
            },
            { 
                path: 'stock_item_creation_approval',
                name: "Stock Item Creation Approvals",
                component: require('./pages/stores_management/StockItemCreationApproval.vue').default
            },
            { 
                path: 'stock_item_transfer',
                name: "Stock Transfer Request",
                component: require('./pages/stores_management/StockItemTransferRequest.vue').default
            },
            { 
                path: 'stock_item_transfer_approval',
                name: "Stock Transfer Request Approvals",
                component: require('./pages/stores_management/StockItemTransferApprovals.vue').default
            },
            { 
                path: 'stock_items_list_management',
                name: "Stock Items Management",
                component: require('./pages/stores_management/StockItemsListManagement.vue').default
            },
            { 
                path: 'stores_stock_issuance_list',
                name: "Stock Issuance Requests",
                component: require('./pages/stores_management/StoresStockItemIssuanceRequests.vue').default
            },  
            { 
                path: 'stores_stock_return_list',
                name: "Stock Return Requests",
                component: require('./pages/stores_management/StoresStockItemReturnRequests.vue').default
            },
            // { 
            //     path: 'stock_item_pe_list',
            //     name: "Stock Item Purchase Enquiry List",
            //     component: require('./pages/stores_management/StockItemPERequestsList.vue').default
            // },  
        ]
    },

    {
        path: '/app/store_requests',
        component: require('./pages/store_requests/StoreRoomsRequestsManagemenet.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: false,
        },
        children: [
            { 
                path: '',
                name: "New Stock Item Request",
                component: require('./pages/store_requests/NewStockItemRequestCreation.vue').default
            },
            { 
                path: 'stock_item_requests_approvals',
                name: "Stock Item Requests Approvals",
                component: require('./pages/store_requests/StockItemRequestsApprovals.vue').default
            },
            { 
                path: 'stock_issuance_requests',
                name: "Stocks Issuance Request",
                component: require('./pages/store_requests/StocksIssuanceRequest.vue').default
            },
            { 
                path: 'stock_issuance_approvals',
                name: "Stock Issuance Approval",
                component: require('./pages/store_requests/StockIssuanceApproval.vue').default
            },
            { 
                path: 'stock_return_requests',
                name: "Stocks Return Request",
                component: require('./pages/store_requests/StocksReturnRequest.vue').default
            },
            { 
                path: 'stock_return_approvals',
                name: "Stock Return Approval",
                component: require('./pages/store_requests/StockReturnApproval.vue').default
            },
        ]
    },


    /*  Vendors Routes */
    {
        path: '/vendors/users/profile',
        component: require('./pages/vendors/users/ProfileInfo.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: true,
        },
    },
    {
        path: '/vendors/dashboards',
        component: require('./pages/vendors/dashboards/Dashboards.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: true,
        },
        children: [
            { 
                path: '',
                name: "Main Dashbaord",
                component: require('./pages/vendors/dashboards/MainDashboard.vue').default
            },
            { 
                path: 'bidding_dashboard',
                name: "Bidding Dashbaord",
                component: require('./pages/vendors/dashboards/BiddingDashboard.vue').default
            },
            { 
                path: 'invoicing_dashboard',
                name: "Invoicing Dashbaord",
                component: require('./pages/vendors/dashboards/InvoicingDashboard.vue').default
            }
        ]
    },
    {
        path: '/vendors/bidding_management',
        component: require('./pages/vendors/bidding_management/BiddingManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: true,
        },
        children: [
            { 
                path: '',
                name: "Sealed Bids",
                component: require('./pages/vendors/bidding_management/QuotationRequests.vue').default
            },
            { 
                path: 'reverse_auction',
                name: "Live Auctions",
                component: require('./pages/vendors/bidding_management/ReverseAuction.vue').default
            },
            { 
                path: 'japanees_auction',
                name: "Japanees Auction",
                component: require('./pages/vendors/bidding_management/JapaneesAuction.vue').default
            },
        ]
    },
    {
        path: '/vendors/po_n_invoice_management',
        component: require('./pages/vendors/po_n_invoice_management/POsNInvoicingManagement.vue').default,
        meta: {
            requiresAuth: true,
            vendorRoute: true,
        },
        children: [
            { 
                path: '',
                name: "POs Management",
                component: require('./pages/vendors/po_n_invoice_management/VendorPurchaseOrderManagement.vue').default
            },
            { 
                path: 'rate_contract_management',
                name: "RCs Management",
                component: require('./pages/vendors/po_n_invoice_management/VendorRateContractManagement.vue').default
            },
            { 
                path: 'pending_payment',
                name: "Receiving & Invoicing",
                component: require('./pages/vendors/po_n_invoice_management/ReceivingNInvoicing.vue').default
            },
        ]
    },



    /* Frequently Asked Questions Routes */
    { path: '/app/process_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/ProcessFAQs.vue').default },
    { path: '/app/system_access_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/SystemAccessFAQs.vue').default },
    { path: '/app/purchase_enquiry_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/PurchaseEnquiryFAQs.vue').default },
    { path: '/app/item_master_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/ItemMasterFAQs.vue').default },
    { path: '/app/quotations_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/QuotationFAQs.vue').default },
    { path: '/app/purchase_orders_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/PurchaseOrderFAQs.vue').default },
    { path: '/app/receipt_notes_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/ReceiptNoteFAQs.vue').default },
    { path: '/app/suppliers_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/SupplierFAQs.vue').default },
    { path: '/app/rate_contract_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/RateContractFAQs.vue').default },
    { path: '/app/dashboard_faqs', meta: { requiresAuth: true,
    vendorRoute: false, }, component: require('./pages/faqs/DashboardFAQs.vue').default },


    { 
        path: "*", 
        meta: {
            requiresAuth: false,
            vendorRoute: false,
        },
        component: require('./pages/system_management/PageNotFound.vue').default
    }
    
];