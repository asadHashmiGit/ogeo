<?php

namespace App\Http\Controllers;

use Auth;
use App\User;
use App\Role;
use App\Chart;
use App\Vendor;
use App\Country;
use App\City;
use App\ImageReady;
use App\Company;
use App\Project;
use App\CompanyLogoPreview;
use App\StockItem;
use Carbon\Carbon;
use App\ItemMaster;
use App\VendorUser;
use App\ReceiptNote;
use App\RNReceiving;
use App\RateContract;
use App\PurchaseOrder;
use Vuetable\Vuetable;
use DateTime;
use App\FinancialLimit;
use App\ItemMasterSetup;
use App\BudgetMasterSetup;
use App\PurchaseEnquiry;
use App\QuotationRequest;
use App\RFICommunication;
use App\StockItemRequest;
use App\RCRFICommunication;
use App\ItemCreationRequest;
use App\RateContractRequest;
use App\RCQuotationResponse;
use Illuminate\Http\Request;
use App\CommercialEvaluation;
use App\BudgetCreationRequest;
use App\StockTransferRequest;
use App\POCancellationRequest;
use App\StockItemIssueRequest;
use App\POLineRFICommunication;
use App\RCLineRFICommunication;
use App\StockItemReturnRequest;
use App\PurchaseEnquiryChildHeaders;
use yajra\Datatables\Datatables;
use Illuminate\Support\Facades\DB;
use App\ApprovalRNReceivingHistory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\ViewRFPDetailsRequest;
use Illuminate\Database\Eloquent\Collection;
use File;

class DataController extends Controller
{

    public function getCompanyDetails(Request $request)
    {
        $user = $request->user();

        return $user->company;
    }

    public function countries()
    {
        return Country::get();
    }

    public function getProjectCurrency($id)
    {
        return Project::where('id', $id)->pluck('currency');
    }

    public function deleteCompanyLogo($logopreview)
    {
        // return $logopreview;
        // $filename =  $logopreview->get('filename');
        CompanyLogoPreview::where('logo',$logopreview)->delete();
        $path=public_path().'/uploads/LogosPreview/'.$logopreview;
        if (file_exists($path)) {
            File::delete($path);
        }
        return $logopreview;

    }
    
    public function saveCompanyLogo(Request $request)
    {
        $CompanyLogo = $request->file('CompanyLogo');
       
        if ($CompanyLogo)
        {
            $filecontents       = file_get_contents($CompanyLogo);
            $fileName           = $CompanyLogo->getClientOriginalName();
            $extension          = $CompanyLogo->getClientOriginalExtension() ?: 'png';
            $folderName         = '/public/uploads/LogosPreview/';
            $destinationPath    = base_path() . $folderName;
            $safeName           = time().$fileName;
            $CompanyLogo->move($destinationPath, $safeName);
        }

        $companylogopreview = new CompanyLogoPreview();

        $companylogopreview->logo = $safeName;

        $companylogopreview->save();


        return response()->json([
            'success'   => true,
            'message'   => 'File Uploaded',
            'file'      => $safeName,
        ]);
        

    }

    public function cityWise($country)
    {
        if($country == null || $country == '')
        {
            return 0;
        }
        $CountryID = explode(",", $country);
        return City::whereIn('country_id', $CountryID)->get();
      
    }

    public function getCompleteProjectsDetails(Request $request)
    {

        try { 
    	$user = $request->user();
        $company = $user->company;
    	$ProjectsDetails = $user->company->projects;
    	$RolesDetails = [];

    	foreach ($ProjectsDetails as $key => $project) {

    		$ProjectRoles = $project->load('company', 'financialLimits')->roles->load('user');
            
    		$RolesGroups = $ProjectRoles->groupBy(['role_name','role_level']);


            $ProjectsDetails[$key]['PRV_Number'] = count($RolesGroups['PRV']);
            $ProjectsDetails[$key]['ALMV_Number'] = count($RolesGroups['ALMV']);
            $ProjectsDetails[$key]['POV_Number'] = count($RolesGroups['POV']);
            $ProjectsDetails[$key]['RNV_Number'] = count($RolesGroups['RNV']);


            if(property_exists('RCCV', $RolesGroups)){
                $ProjectsDetails[$key]['RCCV_Number'] = count($RolesGroups['RCCV']);
            } else {
                $ProjectsDetails[$key]['RCCV_Number'] = null;
            }
            if(property_exists('RCV', $RolesGroups)){
                $ProjectsDetails[$key]['RCV_Number'] = count($RolesGroups['RCV']);
            } else {
                $ProjectsDetails[$key]['RCV_Number'] = null;
            }
            

            //dd(count($RolesGroups['ASTMGR']));

            if($project->setup_type == "Yes"){
                $ProjectsDetails[$key]['ASTMGR_Number'] = count($RolesGroups['ASTMGR']);
                $ProjectsDetails[$key]['ATSIRS_Number'] = count($RolesGroups['ATSIRS']);
                $ProjectsDetails[$key]['ATSI_Number'] = count($RolesGroups['ATSI']);  
            } 
    		

            /*if($project->financialLimits->where('limit_type', 'POV')->count()){
                foreach ($project->financialLimits->where('limit_type', 'POV') as $key => $financialLimit) {
                    $ProjectsDetails[$key]['POV_Financial_Details'] = $financialLimit;
                }
            }

            if($project->financialLimits->where('limit_type', 'RNV')->count()){
                foreach ($project->financialLimits->where('limit_type', 'RNV') as $key => $financialLimit) {
                    $ProjectsDetails[$key]['RNV_Financial_Details'] = $financialLimit;
                }
            }*/
            

    		foreach ($RolesGroups as $role_name => $details) {
    			$ProjectsDetails[$key][$role_name] = $details;
    		}

    	}

        return $ProjectsDetails;
    } catch (\Exception $e) {
       
        return response()->json(['status'=>false,'message'=>$e->getMessage()." on line ".$e->getline()]);
    }

    }


    public function getCompleteCompanyDetails(Request $request)
    {
        $user = $request->user();
        $company = $user->company;

        return $company;

    }

    // public function getUserProjectsListRCCO(Request $request)
    // {
    //     $user = $request->user();

    //     return $user->roles->where('role_name', 'RCCO')->where('project_id', '!=', null)->unique('project_id')->load('project')->pluck('project.title', 'project.id');

    // }

    public function getUserProjectsListPRO(Request $request)
    {
        $user = $request->user();

        return $user->roles->where('role_name', 'PRO')->where('project_id', '!=', null)->unique('project_id')->load('project')->pluck('project.title', 'project.id');

    }


    public function getUserProjectsListALMR(Request $request)
    {
        $user = $request->user();

        return $user->roles->where('role_name', 'ALMR')->where('project_id', '!=', null)->unique('project_id')->load('project')->pluck('project.title', 'project.id');

    }
    public function getUserProjectsListBUSO(Request $request)
    {
        $user = $request->user();

        return $user->roles->where('role_name', 'SUBO')->where('project_id', '!=', null)->unique('project_id')->load('project')->pluck('project.title', 'project.id');

    }



    public function getItemTemplatesList(Request $request)
    {
        $user = $request->user();
        return ItemMasterSetup::with('company')->where('company_id', $user->company_id)->where('active', 'Yes')->get();
    }


    public function getUserStoresList(Request $request)
    {
        $user = $request->user();

        $StoresId = Role::with('project')->where('user_id', $user->id)->where('role_name', 'RTSI')->where('project_id', '!=', null)->whereHas('project', function($query){
                $query->where('projects.setup_type', 'Yes');
            })->distinct('project_id')->pluck('project_id')->toArray();

        return Project::whereIn('id', $StoresId)->pluck('title', 'id');

    }


    public function getStockItemIssueUserRequest(Request $request)
    {
        $user = $request->user();

        $StockItemRequests = StockItemIssueRequest::with(['issuances', 'stockItem', 'returnRequests' => function($query){
            $query->where('status', 'NOT LIKE', '%Rejected%');
        }])->where('created_by', $user->id)->where('status', 'NOT LIKE', '%Completed%')->where('status', 'NOT LIKE', '%Rejected%')->get();

        foreach ($StockItemRequests as $key => $StockItemRequest) {
            $StockItemRequests[$key]['totalreceived'] = 0;
            $StockItemRequests[$key]['totalreturned'] = 0;
            foreach ($StockItemRequest->issuances as $index => $issuance) {
                $StockItemRequests[$key]['totalreceived'] = $issuance->issued_quantity + $StockItemRequests[$key]['totalreceived'];
            }
            foreach ($StockItemRequest->returnRequests as $index => $returnRequest) {
                $StockItemRequests[$key]['totalreturned'] = $returnRequest->returned_quantity + $StockItemRequests[$key]['totalreturned'];
            }
            $StockItemRequests[$key]['totalpending'] = $StockItemRequest->quantity - $StockItemRequests[$key]['totalreceived'];
            $StockItemRequests[$key]['totalreturable'] = $StockItemRequests[$key]['totalreceived'] - $StockItemRequests[$key]['totalreturned'];
        }

        return $StockItemRequests;

    }


    public function getUserRolesDataTable(Request $request)
    {
        $user = $request->user();

        $UserRoles = Role::with('assignedBy', 'company' , 'project', 'user')->where('user_id', $user->id)->where('project_id', '!=', null);

        return Datatables::of($UserRoles)
            ->editColumn('role_name', function ($Role) {
                
                if(getRoleFullName($Role->role_name)['RoleFullName'] == 'Not Assinged'){
                    return $Role->role_name;
                }

                return '
                <span>'.getRoleFullName($Role->role_name)['RoleFullName'].'</span>
                <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                    <span class="tooltip-item2">
                        <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                    </span>
                    <span  style="bottom: 10px; left: 200px" class="tooltip-content4 clearfix">
                        <span class="tooltip-text2">'.getRoleFullName($Role->role_name)['RoleDescription'].'</span>
                    </span>
                </span>';
            })
            ->addColumn('assigned_project', function ($UserRole) use ($user) {
                if($UserRole->company()->exists()){
                    if($UserRole->company->setup_mode == 'Company Wide'){
                        return 'Company';
                    } else {
                        return $UserRole->project_id;
                    }
                } else {
                    return 'Admin';
                }
                
            })
            ->addColumn('role_pool_count', function ($UserRole) use ($user) {
                if($UserRole->ended_at != null){
                    return 'N/A';
                } else {
                    if($UserRole->project()->exists()){
                        return $UserRole->project->roles->where('role_name', $UserRole->role_name)->where('role_level', $UserRole->role_level)->count();
                    } else {
                        //This mean we are the admin since no projects is linked.
                        return User::where('company_id', 0)->get()->count(); 
                    }
                    
                }
            })
            ->addColumn('assigned_period', function ($UserRole) use ($user) {
                
                if($UserRole->ended_at == null){
                    $now = Carbon::now();
                    $createdDate = Carbon::createFromFormat('d.M.Y - (H:i:s)', $UserRole->created_at);
                    return $createdDate->diffInDays($now). ' Days';
                } else {
                    $endedDate = Carbon::createFromFormat('d.M.Y - (H:i:s)', $UserRole->ended_at);
                    $createdDate = Carbon::createFromFormat('d.M.Y - (H:i:s)', $UserRole->created_at);
                    return $createdDate->diffInDays($endedDate). ' Days';
                }
                
            })
            ->rawColumns(['role_name']) 
            ->make(true);
    }


    public function getCompanyProjectsList(Request $request)
    {
        $user = $request->user();

        return Project::where('company_id', $user->company_id)->pluck('title', 'id');

    }


    public function getNewItemRequestList(Request $request)
    {
        $user = $request->user();
        $now = Carbon::now();

        $AccessableProjects = $user->roles->whereIn('role_name', ['LMA', 'ALMR', 'ALMV'])->unique('project_id')->pluck('project_id');

        $ItemCreationRequests = ItemCreationRequest::with('requester', 'project.company', 'item.itemTemplate')->whereIn('project_id', $AccessableProjects);

        return Datatables::of($ItemCreationRequests)
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            //here should be a function to show the link properly if not avaiable...
            ->editColumn('item_link', function ($Item) { 
                if($Item->item_link){
                    return '<a target="_blank" href="'.$Item->item_link.'">Item Link</a>';
                }
                return 'N/A';
            })
            ->filterColumn('created_at', function ($query, $keyword) {
                $query->whereRaw("DATE_FORMAT(created_at,'%d.%M.%Y') like ?", ["%$keyword%"]);
            })
            ->filterColumn('updated_at', function ($query, $keyword) {
                $query->whereRaw("DATE_FORMAT(updated_at,'%d.%M.%Y') like ?", ["%$keyword%"]);
            })
            ->editColumn('status', function ($Item) { 
                return '<b>'.$Item->status.'</b> <br><i>Since: '.$Item->updated_at.'</i>';
            })
            ->addColumn('action', function ($ItemCreationRequest) use ($user) {

                if(strpos($ItemCreationRequest->status, 'Rejected') !== false && $user->id == $ItemCreationRequest->requester_id){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';
                }

                //get the level of approvals allowed to this item' project for this user
                if($ItemCreationRequest->item){

                    // This handles the case if the user resubmit and there is a previous item created which i will be edited by LMA
                    if(strpos($ItemCreationRequest->status, 'Resubmitted and Assigned') !== false && $user->hasRole('LMA') ){
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                    }

                    $UserApprovalLevel = $ItemCreationRequest->project->roles->where('role_name', 'ALMV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                    $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.


                    //only if use has this level within this project
                    if((in_array($ItemCreationRequest->item->approval_level, $UserApprovalLevel) && strpos($ItemCreationRequest->status, 'Assigned to Validator level') !== false)){

                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';

                    } else {
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                    }

                }
                if($user->hasRole('LMA') && (strpos($ItemCreationRequest->status, 'Created and Assigned') !== false || strpos($ItemCreationRequest->status, 'Resubmitted and Assigned') !== false)){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$ItemCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                }   
                
            })
            ->rawColumns(['item_link', 'action', 'status']) 
            ->make(true);

    }
    public function getNewBudgetRequestList(Request $request)
    {
        // return $request;
        $user = $request->user();
        $now = Carbon::now();

        $AccessableProjects = $user->roles->whereIn('role_name', ['SUBO', 'SUBV'])->unique('project_id')->pluck('project_id');

        $BudgetCreationRequests = BudgetCreationRequest::with('requester', 'project.company', 'item.itemTemplate')->whereIn('project_id', $AccessableProjects);

        // return $BudgetCreationRequests;
        return Datatables::of($BudgetCreationRequests)
            // ->editColumn('budget_description', '{!! str_limit($budget_description, 60) !!}')
            // ->editColumn('request_end_date', $Budget->request_end_date)
            //here should be a function to show the link properly if not avaiable...
            // ->editColumn('budget_link', function ($Budget) { 
            //     // if($Budget->budget_link){
            //     //     return '<a target="_blank" href="'.$Budget->budget_link.'">Budget Link</a>';
            //     // }
            //     return 'N/A';
            // })
            ->filterColumn('created_at', function ($query, $keyword) {

                $query->whereRaw("DATE_FORMAT(created_at,'%d.%M.%Y') like ?", ["%$keyword%"]);
            })
            // ->filterColumn('request_end_date', function ($query, $keyword) {
            //     $query->whereRaw("DATE_FORMAT(request_end_date,'%d.%M.%Y') like ?", ["%$keyword%"]);
            // })

            // ->filterColumn('very_first_initial_end_date', function ($query, $keyword) {
            //     $query->whereRaw("DATE_FORMAT(very_first_initial_end_date,'%d.%M.%Y') like ?", ["%$keyword%"]);
            // })
            // ->filterColumn('end_date', function ($query, $keyword) {
            //     $query->whereRaw("DATE_FORMAT(end_date,'%d.%M.%Y') like ?", ["%$keyword%"]);
            // })
            // ->filterColumn('initial_end_date', function ($query, $keyword) {
            //     $query->whereRaw("DATE_FORMAT(initial_end_date,'%d.%M.%Y') like ?", ["%$keyword%"]);
            // })
            ->filterColumn('updated_at', function ($query, $keyword) {
                $query->whereRaw("DATE_FORMAT(updated_at,'%d.%M.%Y') like ?", ["%$keyword%"]);
            })
            ->editColumn('status', function ($Budget) { 
                return '<b>'.$Budget->status.'</b> <br><i>Since: '.$Budget->updated_at.'</i>';
            })
            ->editColumn('request_amount', function ($Budget) {
                return $Budget->request_amount;
                // $query->whereRaw("DATE_FORMAT(request_amount,'%d.%M.%Y') like ?", ["%$keyword%"]);
            })
            // ->editColumn('end_date', function ($Budget) {
            //     // $myDateTime = DateTime::createFromFormat('Y-m-d', $Budget->project->end_date);
            //     // $formattedweddingdate = $Budget->project->end_date->format('d-m-Y'); 
            //     // return DATE_FORMAT($Budget->project->end_date,'%d.%M.%Y');
            //     // $datefim->format('d/m/Y');
            //     return $Budget->very_first_initial_end_date;
            // })
            ->editColumn('request_end_date', function ($Budget) {
                return $Budget->first_end_date;
            })
            ->editColumn('available_budget', function ($Budget) { 
                // $av_budget = $Budget->project->value - $Budget->project->consumed_budget;
                // return $av_budget . $Budget->project->currency;
                return $Budget->very_first_initial_amount;
            })
            ->editColumn('currency', function ($Budget) { 
                return $Budget->project->currency;
            })
            ->editColumn('reason_for_the_request', function ($Budget) { 
                return $Budget->budget_description;
            })
            ->editColumn('initial_value', function ($Budget) { 
                return $Budget->project->initial_value;
            })
            ->editColumn('initial_end_date', function ($Budget) { 
                return $Budget->project->initial_end_date;
            })
            ->editColumn('end_date', function ($Budget) { 
                return $Budget->project->end_date;
            })
            ->editColumn('very_first_initial_end_date', function ($Budget) { 
                return $Budget->very_first_initial_end_date;
            })
            ->addColumn('action', function ($BudgetCreationRequest) use ($user) {

                if(strpos($BudgetCreationRequest->status, 'Rejected') !== false && $user->id == $BudgetCreationRequest->requester_id){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';
                }

                //get the level of approvals allowed to this item' project for this user
                if($BudgetCreationRequest->item){

                    // This handles the case if the user resubmit and there is a previous item created which i will be edited by LMA
                    if(strpos($BudgetCreationRequest->status, 'Resubmitted and Assigned') !== false && $user->hasRole('SUBV') ){
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                    }

                    $UserApprovalLevel = $BudgetCreationRequest->project->roles->where('role_name', 'SUBV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                    $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.


                    //only if use has this level within this project
                    if((in_array($BudgetCreationRequest->item->approval_level, $UserApprovalLevel) && strpos($BudgetCreationRequest->status, 'Assigned to Validator') !== false)){

                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';

                    } else {
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                    }

                }
                if($user->hasRole('SUBV') && (strpos($BudgetCreationRequest->status, 'Created and Assigned') !== false || strpos($BudgetCreationRequest->status, 'Resubmitted and Assigned') !== false)){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                }   
                // if(strpos($BudgetCreationRequest->status, 'Rejected') !== false && $user->id == $BudgetCreationRequest->requester_id){
                //     return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';
                // }

                // //get the level of approvals allowed to this item' project for this user
                // if($BudgetCreationRequest->item){
                //     // return 'i m here';

                //     // This handles the case if the user resubmit and there is a previous item created which i will be edited by LMA
                //     if(strpos($BudgetCreationRequest->status, 'Resubmitted and Assigned') !== false && $user->hasRole('SUBO') ){
                //         return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                //     }

                //     $UserApprovalLevel = $BudgetCreationRequest->project->roles->where('role_name', 'SUBV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                //     $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.


                //     //only if use has this level within this project
                //     if((strpos($BudgetCreationRequest->status, 'Assigned to Validator level') !== false)){

                //         return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button> ';

                //     } else {
                //         return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                //     }

                // }
                // if($user->hasRole('SUBO') && (strpos($BudgetCreationRequest->status, 'Created and Assigned') !== false || strpos($BudgetCreationRequest->status, 'Resubmitted and Assigned') !== false)){
                //     return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-edit"></i> </button>';
                // } else {
                //     return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="BudgetCreationRequest" data-recordid="'.$BudgetCreationRequest->id.'"><i class="fa fa-info"></i> </button>';
                // }   
                
            })
            ->rawColumns(['item_link', 'action', 'status']) 
            ->make(true);

    }


    public function projectsDeactivate(Request $request)
    {
    	$user = $request->user();

    	$project = Project::findOrFail($request->get('ProjectId'))->update(['active' => 'No']);
    	$Roles = Role::where('project_id', $request->get('ProjectId'))->update(['active' => 'No']);

    	//Extra step if users are having only one project deactivate then and send them notification.


    	//If Success
        return response()->json([
            "message" => "(".$request->get('ProjectTitle'). ') Deleted Successfully.'
        ], 200);
    }


    public function createNewProject(Request $request)
    {
        // return 'i m here';
    	$user = $request->user();

    	//Getting logged in user
        $user = $request->user();
        $userList = [];
        $RolesList = [];

        //Segregating the values from the request
        $ProjectsDetails = $request->all()[0];
        
        /* Store Project Details */
        $project = Project::create([
            'created_by'            => $user->id,
            'company_id'            => $user->company->id,
            'title'                 => $ProjectsDetails['ProjectTitle'],
            'setup_type'            => $ProjectsDetails['StoreSetup'],
            'start_date'            => $ProjectsDetails['ProjectPeriod'][0],
            'end_date'              => $ProjectsDetails['ProjectPeriod'][1],
            'currency'              => $ProjectsDetails['ProjectCompanyCurrency'],
            'value'                 => $ProjectsDetails['ProjectValue'],
            'po_doa_criterion'      => $ProjectsDetails['ProjectPODOACriterion'],
            'rn_doa_criterion'      => $ProjectsDetails['ProjectRNDOACriterion'],
            'auction_types'         => implode(',', $ProjectsDetails['ProjectAuctionType']),
            'terms_n_conditions'    => $ProjectsDetails['ProjectTsNCs']
        ]);
        

        /* Create Users */
        # get list of unique users
        foreach ($ProjectsDetails as $ProjectInfoKey => $data) {
            if(substr($ProjectInfoKey, -4) == "List"){
                foreach ($data as $key => $ListData) {
                    if(substr($key, 0, 5) == 'level'){
                        foreach ($ListData as $number => $userData) {
                            if(!empty($userData)){
                                $userList[$userData['email']] = $userData;
                            } 
                        }
                    } else {
                        $userList[$ListData['email']] = $ListData;
                    }
                }
            }   
        }


        # store new users only in the DB and send him notifications (Queued)
        foreach ($userList as $email => $userDetails) {
            $randomPassword = str_random(8);
            $randomPasswordHased = Hash::make($randomPassword);

            //check if user exists
            $ExistingUser = User::where('email', $userDetails['email'])->get()->first();
            if(empty($ExistingUser)){
                $NewUser = User::create([
                    'company_id'    => $user->company->id, 
                    'name'          => $userDetails['fullName'], 
                    'email'         => $userDetails['email'],
                    'designation'   => $userDetails['designation'],
                    'picture'       => 'user_image.png',
                    'password'      => $randomPasswordHased
                ]);

                # Send User Email Notification with the new Access Cridentials
                $NewUser->notify(new NewUserCreated($randomPassword));
            }   
        }

        /* Create User Roles By Getting User Information (User_ID) */            
        foreach ($ProjectsDetails as $ProjectInfoKey => $data) {
            if(substr($ProjectInfoKey, -4) == "List"){
                foreach ($data as $level => $ListData) {
                    
                    if(substr($level, 0, 5) == 'level'){
                        foreach ($ListData as $number => $userData) {
                            if(!empty($userData)){

                                //get User ID
                                $UserInfo = User::where('email', $userData['email'])->get()->first();
                                $userData['user_id'] = $UserInfo->id;
                                $RolesList[$ProjectInfoKey][$level][] = $userData;
                            } 
                        }
                    } else {
                        //get User ID
                        $UserInfo = User::where('email', $userData['email'])->get()->first();
                        $ListData['user_id'] = $UserInfo->id;
                        $RolesList[$ProjectInfoKey]['level_1'][] = $ListData;
                    }
                }
            }   
        }

        # Store Actual Roles In Database
        foreach ($RolesList as $RoleName => $RoleEmployees) {
            foreach ($RoleEmployees as $levelNumber => $EmployeeDetails) {
            	foreach ($EmployeeDetails as $key => $SingleEmployeeDetails) {
	                Role::create([
	                    'created_by'    => $user->id,
	                    'company_id'    => $user->company->id,
	                    'project_id'    => $project->id,
	                    'user_id'       => $SingleEmployeeDetails['user_id'],
	                    'role_name'     => substr($RoleName, 0, strpos($RoleName, '_')),
	                    'role_level'    => substr($levelNumber, -1),
	                ]);
            	}
            }
        }


        /* Update All Projects Roles */
        /* Copy new ASTMGR for all projects */
        if($project->setup_type == "Yes"){
            /*Get the ASTMGR Role*/
            $ASTMGR_Roles = Role::where('project_id', $project->id)->where('role_name', 'ASTMGR')->get();
            /*Delete the ASTMGR Role*/
            //if the setup is store then update all role ASTMGR roles // # delete all previous ASTGR roles
            Role::where('company_id', $project->company_id)->where('role_name', 'ASTMGR')->delete();
        
            /*Insert the ASTMGR Role to all projects*/
            foreach ($project->company->projects as $key => $projectDetails) {
                foreach ($ASTMGR_Roles as $key => $ASTMGR_Role) {
                    $New_ASTMGR_Role = $ASTMGR_Role->replicate();
                    $New_ASTMGR_Role->project_id = $projectDetails->id;
                    $New_ASTMGR_Role->save();
                }    
            }
        }


        /* financial approval limits if any */

        //storing POV financial limits
        foreach ($ProjectsDetails['POV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $project->id,
                'limit_type'    => 'POV',
                'level'         => $data['POV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }

        //storing RNV financial limits
        foreach ($ProjectsDetails['RNV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $project->id,
                'limit_type'    => 'RNV',
                'level'         => $data['RNV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }


        //storing RCV financial limits
        foreach ($ProjectsDetails['RCV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $project->id,
                'limit_type'    => 'RCV',
                'level'         => $data['RCV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }

        //Feed Back To Users
        return response()->json([
            "message" => 'New Project Completed Successfully.'
        ], 200);
    }

    public function getItemMasterRecordDetails(Request $request)
    {
        // return $request->all();
        $user = $request->user();
        $className = $request->all()[0];
        $recordID = $request->all()[1];
        $modelName = "App\\" . $className;
        $RecordInfo = $modelName::findOrFail($recordID);

        if(!empty($RecordInfo->requester_id)){

            return $RecordInfo->load('requester', 'project', 'company', 'item', 'item.itemTemplate', 'history.currentActionBy');

        } elseif (!empty($RecordInfo->created_by)) {

            if($RecordInfo->creation_request_id == null){

                return $RecordInfo->load('creator', 'project', 'company', 'item', 'item.itemTemplate', 'history.currentActionBy');
            } else {

                return $RecordInfo->load('creator', 'project', 'history.currentActionBy', 'company', 'itemTemplate', 'itemCreationRequest.history.currentActionBy');
            }

        } else {

            return $RecordInfo;
        }
 
    }

    public function getBudgetMasterRecordDetails(Request $request)
    {
        // return $request->all();
        $user = $request->user();
        $className = $request->all()[0];
        $recordID = $request->all()[1];
        $modelName = "App\\" . $className;
        $RecordInfo = $modelName::findOrFail($recordID);

        if(!empty($RecordInfo->requester_id)){

            return $RecordInfo->load('requester', 'project', 'company', 'item', 'item.itemTemplate', 'history.currentActionBy');

        } elseif (!empty($RecordInfo->created_by)) {

            if($RecordInfo->creation_request_id == null){

                return $RecordInfo->load('creator', 'project', 'company', 'item', 'item.itemTemplate', 'history.currentActionBy');
            } else {

                return $RecordInfo->load('creator', 'project', 'history.currentActionBy', 'company', 'itemTemplate', 'itemCreationRequest.history.currentActionBy');
            }

        } else {

            return $RecordInfo;
        }
 
    }

    public function savetUserProjectsBUS($id)
    {
        // return $id;
        return Project::where('id', $id)->first();
        // try { 
        // $user = Auth::user();
        // $company = $user->company;
        // return $user->company->projects; 
    	// $ProjectsDetails = $user->company->projects;
    	

        // return $ProjectsDetails;
        // } 
        // catch (\Exception $e) {
        
        //     return response()->json(['status'=>false,'message'=>$e->getMessage()." on line ".$e->getline()]);
        // }

    }    

    public function NewItemCreationRequestSUB(Request $request)
    {
        return $request;
    }

    public function getAccountSetupDetails(Request $request)
    {
        $user = $request->user();

        return $user->company;
    }



    public function getItemMasterTemplates(Request $request)
    {
        $user = $request->user();

        //Get Items per company
        $ItemsTemplatesList = ItemMasterSetup::with('creator', 'items')->where('company_id', $user->company_id)->where('active', 'Yes');

        return Datatables::of($ItemsTemplatesList)
            ->addColumn('description', function ($Template) {

                $description = "";

                for ($i=1; $i <= 20; $i++) { 
                    if($Template['field_'.$i] != 'Ogeo-None'){
                        $description = $description.' | '.$Template['field_'.$i];
                    }
                }

                $description = $description.' | ';

                return $description;
                
            })
            ->addColumn('items_count', function ($Template) {
                return $Template->items->count();
                
            })
            ->addColumn('action', function ($Template) {

                if($Template->items->count() == 0){
                    return '<button class="btn btn-xs btn-danger edit-placeholder" data-elquentClass="ItemMasterSetup"><i class="fa fa-remove"></i> </button>';
                } else {
                    return '';
                }
                
                
            })
            ->rawColumns(['action']) 
            ->make(true);
    }

    public function getItemMasterTemplateDetails(Request $request)
    {
        $user = $request->user();
        $TemplateID = $request->get('TemplateID');

        //Check the company has no previous setup
        if(!$user->company->ItemMasterSetup->count()){
            return 'false';
        }

        $TemplateDetails = ItemMasterSetup::where('id', $TemplateID)->get()->first();

        return $TemplateDetails;
   
    }


    public function getItemMasterTemplatesList(Request $request)
    {
        $user = $request->user();

        $ItemMasterTemplateList = ItemMasterSetup::select('id' ,'template_name')
            ->where('company_id', $user->company_id)
            ->where('active', 'Yes')
            ->distinct()
            ->pluck('template_name', 'id');

        return $ItemMasterTemplateList;
    }
    // public function getBudgetMasterTemplatesList(Request $request)
    // {
    //     $user = $request->user();

    //     $BudgetMasterTemplateList = BudgetMasterSetup::select('id' ,'template_name')
    //         ->where('company_id', $user->company_id)
    //         ->where('active', 'Yes')
    //         ->distinct()
    //         ->pluck('template_name', 'id');

    //     return $BudgetMasterTemplateList;
    // }


    public function getItemMasterUnqiueField1(Request $request)
    {
        $user = $request->user();
        $ItemMasterField1 = ItemMaster::select('field_1')->where('company_id', $user->company_id)->distinct()->pluck('field_1');

        return $ItemMasterField1;
    }


    public function getItemMasterUnqiueField2(Request $request)
    {
        $user = $request->user();
        $Field1Value = $request->get('field1Value');

        $Field2Values = ItemMaster::select('field_2')->where('company_id', $user->company_id)->where('field_1', $Field1Value)->distinct()->pluck('field_2');

        if(!$Field2Values){
            $Field2Values[0] = "No Data";
        }

        return $Field2Values;
    }


    public function getItemMasterUnqiueField3(Request $request)
    {
        $user = $request->user();
        $Field2Value = $request->get('field2Value');

        $Field3Values = ItemMaster::select('field_3')->where('company_id', $user->company_id)->where('field_2', $Field2Value)->distinct()->pluck('field_3');

        if(!$Field3Values){
            $Field3Values[0] = "No Data";
        }

        return $Field3Values;
    }

    public function getItemMasterUnqiueField4(Request $request)
    {
        $user = $request->user();
        $Field3Value = $request->get('field3Value');

        $Field4Values = ItemMaster::select('field_4')->where('company_id', $user->company_id)->where('field_3', $Field3Value)->distinct()->pluck('field_4');

        if(!$Field4Values){
            $Field4Values[0] = "No Data";
        }

        return $Field4Values;
    }

    public function getItemMasterUnqiueField5(Request $request)
    {
        $user = $request->user();
        $Field4Value = $request->get('field4Value');

        $Field5Values = ItemMaster::select('field_5')->where('company_id', $user->company_id)->where('field_4', $Field4Value)->distinct()->pluck('field_5');

        if(!$Field5Values){
            $Field5Values[0] = "No Data";
        }

        return $Field5Values;
    }

    public function getItemMasterUnqiueField6(Request $request)
    {
        $user = $request->user();
        $Field5Value = $request->get('field5Value');

        $Field6Values = ItemMaster::select('field_6')->where('company_id', $user->company_id)->where('field_5', $Field5Value)->distinct()->pluck('field_6');

        if(!$Field6Values){
            $Field6Values[0] = "No Data";
        }

        return $Field6Values;
    }

    public function getItemMasterUnqiueField7(Request $request)
    {
        $user = $request->user();
        $Field6Value = $request->get('field6Value');

        $Field7Values = ItemMaster::select('field_7')->where('company_id', $user->company_id)->where('field_6', $Field6Value)->distinct()->pluck('field_7');

        if(!$Field7Values){
            $Field7Values[0] = "No Data";
        }

        return $Field7Values;
    }

    public function getItemMasterUnqiueField8(Request $request)
    {
        $user = $request->user();
        $Field7Value = $request->get('field7Value');

        $Field8Values = ItemMaster::select('field_8')->where('company_id', $user->company_id)->where('field_7', $Field7Value)->distinct()->pluck('field_8');

        if(!$Field8Values){
            $Field8Values[0] = "No Data";
        }

        return $Field8Values;
    }

    public function getItemMasterUnqiueField9(Request $request)
    {
        $user = $request->user();
        $Field8Value = $request->get('field8Value');

        $Field9Values = ItemMaster::select('field_9')->where('company_id', $user->company_id)->where('field_8', $Field8Value)->distinct()->pluck('field_9');

        if(!$Field9Values){
            $Field9Values[0] = "No Data";
        }

        return $Field9Values;
    }

    public function getItemMasterUnqiueField10(Request $request)
    {
        $user = $request->user();
        $Field9Value = $request->get('field9Value');

        $Field10Values = ItemMaster::select('field_10')->where('company_id', $user->company_id)->where('field_9', $Field9Value)->distinct()->pluck('field_10');

        if(!$Field10Values){
            $Field10Values[0] = "No Data";
        }

        return $Field10Values;
    }



    public function getSearchItems(Request $request)
    {
        $user = $request->user()->load('company');
        $allItems = new Collection();
        $searchQuery = $request->get('searchQuery');
        $searchQuery = explode(" ", $searchQuery);
        if($user->company->lom_prefix){
            $sql = "CONCAT('".$user->company->lom_prefix."-',item_group_id,'-',item_ingroup_id) like ?";
        } else {
            $sql = "CONCAT('LoM-',item_group_id,'-',item_ingroup_id) like ?";
        }

        foreach ($searchQuery as $key => $keyword) {
            $Items = ItemMaster::with('company', 'itemTemplate')
                ->whereHas("itemTemplate", function($q) {
                    $q->where("active", 'Yes');
                })
                ->where('active', 'Yes')
                ->where('company_id', $user->company_id)
                ->where('description', 'like', '%'.$keyword.'%')
                ->orWhereRaw($sql, ["%{$keyword}%"])
                ->get();
            $allItems = $allItems->merge($Items);
        }
        
        return $allItems;

    }



    public function getSearchItemsNonStock(Request $request)
    {
        $user = $request->user();
        $StoreID = $request->get('StoreID');
        $searchQuery = $request->get('searchQuery');

        $Items = ItemMaster::with('company', 'itemTemplate', 'activeStockItem.project')
            // // ->whereHas("activeStockItem", function($q) use ($StoreID) {
            // //     $q->where("stock_items.project_id", $StoreID);
            // // })
            // ->whereDoesntHave('activeStockItem', function($q) use ($StoreID) {
            //     $q->where("stock_items.project_id", $StoreID);
            // })
            // //->doesntHave('activeStockItem')
            ->where('company_id', $user->company_id)
            ->where('description', 'like', '%'.$searchQuery.'%')
            ->where('active', 'Yes')
            ->get();

        //return $Items;

        /* Check Store Avaialblity */
        foreach ($Items as $key => $item) {
            foreach ($item->activeStockItem as $index => $stockItem) {
                if($stockItem['project_id'] == $StoreID){
                    $Items[$key]['ExistsInStore'] = true;
                    break;
                } else {
                    $Items[$key]['ExistsInStore'] = false;
                }
            }
        }

        return $Items;

    }



    public function getSearchStockItemsByStore(Request $request)
    {
        $user = $request->user();
        $StoreID = $request->get('StoreID');
        $searchQuery = $request->get('searchQuery');

        $StoreItems = StockItem::with('item.itemTemplate')->where('active', 'Yes')
            ->where('company_id', $user->company_id)
            ->where('project_id', $StoreID)
            ->whereHas('item', function ($query) use ($searchQuery) {
                $query->where('description', 'like', '%'.$searchQuery.'%');
            })
            ->get();

        return $StoreItems;

    }


    public function getSearchStockItemsByStores(Request $request)
    {
        $user = $request->user();
        $searchQuery = $request->get('searchQuery');
        $FromStoreID = $request->get('FromStoreID');
        $ToStoreID = $request->get('ToStoreID');

        $FromStoreItems = StockItem::with('item.itemTemplate')->where('active', 'Yes')
            ->where('company_id', $user->company_id)
            ->where('project_id', $FromStoreID)
            ->whereHas('item', function ($query) use ($searchQuery) {
                $query->where('description', 'like', '%'.$searchQuery.'%');
            })
            ->get();

        $ToStoresItems = StockItem::with('item.itemTemplate')->where('active', 'Yes')
            ->where('company_id', $user->company_id)
            ->where('project_id', $ToStoreID)
            ->whereHas('item', function ($query) use ($searchQuery) {
                $query->where('description', 'like', '%'.$searchQuery.'%');
            })
            ->get();

        $IntersectInItems = [];

        foreach ($FromStoreItems as $key => $FromStoreItem) {
            foreach ($ToStoresItems as $key => $ToStoresItem) {
                /* Check Item Match */
                if($FromStoreItem->item_id == $ToStoresItem->item_id){
                    $IntersectInItems[] = $FromStoreItem;
                }

            }        
        }        

        return $IntersectInItems;

    }


    public function getApproversItemValidationList(Request $request)
    {
        $user = $request->user();

        //get user's current approval level
        $ApprovalLevelsForALMVRole = $user->roles->where('role_name', 'ALMV')->unique('role_level')->pluck('role_level');
        $ApprovalLevelsForALMVRole[] = "0"; //adding rejected item with 0 level.

        $AccessableProjects = $user->roles->where('role_name', 'ALMV')->unique('project_id')->pluck('project_id');

        $ItemsList = ItemMaster::with('creator')->whereIn('approval_level', $ApprovalLevelsForALMVRole)->whereIn('project_id', $AccessableProjects)->select('item_master.*');

        return Datatables::of($ItemsList)
            ->editColumn('description', '{!! str_limit($description, 60) !!}')
            ->addColumn('action', function ($ItemMaster) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $ItemMaster->project->roles->where('role_name', 'ALMV')->where('user_id', $user->id)->pluck('role_level')->toArray();

                //only if use has this level within this project
                if((in_array($ItemMaster->approval_level, $UserApprovalLevel) && strpos($ItemMaster->status, 'purchase enquiry selection') == false)  || strpos($ItemMaster->status, 'Resubmitted') !== false ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-info"></i> </button>';

                    // return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="ItemMaster"><i class="fa fa-edit"></i> </button>';
                }
                
            })
            ->rawColumns(['action']) 
            ->make(true);


            // || $ItemMaster->status == "Approved by Level 1 and Assigned to Level 2 for approval"

    }


    public function getItemMasterList(Request $request)
    {
        $user = $request->user()->load('roles');

        //Get Items per project
        //$AccessableProjects = $user->roles->unique('project_id')->pluck('project_id');
        //$ItemsList = ItemMaster::with('creator')->whereIn('project_id', $AccessableProjects)->where('active', 'Yes')->select('item_master.*');

        //Get Items per company
        $ItemsList = ItemMaster::with('creator', 'project', 'company', 'itemTemplate')->whereHas('itemTemplate')->where('item_master.company_id', $user->company_id)->where('status', "LIKE", "%Fully Approved%");

        return Datatables::of($ItemsList)
            ->addColumn('show_id', function ($Item) use ($user) {
                if($Item->company->lom_prefix == ''){
                    return 'LoM-'.$Item->item_group_id.'-'.$Item->item_ingroup_id;
                } else {
                    return $Item->company->lom_prefix.'-'.$Item->item_group_id.'-'.$Item->item_ingroup_id;
                }
            })
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('LoM-',item_group_id,'-',item_ingroup_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('complete_description_with_headers', function ($Item) { 
                $FinalDescription = "";
                for ($i=1; $i <= 20; $i++) { 
                    if($Item->itemTemplate['field_'.$i] != 'Ogeo-None'){
                        $FinalDescription .= '<b>'.$Item->itemTemplate['field_'.$i].':</b> '.$Item['field_'.$i].'<b> | </b>';
                    }
                }
                return $FinalDescription;
            })
            ->filterColumn('complete_description_with_headers', function($query, $keyword) {
                $FinalDescription = 'description';
                $sql = $FinalDescription." like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('active', function ($Item) { 
                if($Item->active == 'Yes'){
                    return '<b>Active</b> <br><i>Since: '.$Item->updated_at.'</i>';
                } else {
                    return '<b>Inactive</b> <br><i>Since: '.$Item->updated_at.'</i>';
                }
            })
            ->editColumn('description', '{!! str_limit($description, 60) !!}')
            ->addColumn('action', function ($ItemMaster) use ($user) {
                    
                    if($user->hasRole('LMA')){

                        if($ItemMaster->active == 'No'){
                            return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success activations-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'" data-currentstatus="'.$ItemMaster->active.'"><i class="fa fa-eye"></i> </button>';
                        } else {
                            return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-danger activations-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'" data-currentstatus="'.$ItemMaster->active.'"><i class="fa fa-eye-slash"></i> </button>';
                        }

                    } else {
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="ItemMaster" data-recordid="'.$ItemMaster->id.'"><i class="fa fa-info"></i> </button>';
                    }
                
            })
            ->rawColumns(['action', 'complete_description_with_headers', 'active']) 
            ->make(true);

    }


    public function getPurchaseRequestList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $PurchaseEnquiries = PurchaseEnquiry::with('company', 'project', 'creator', 'item')->where('company_id', $user->company_id)->where('active', 'Yes');

        return Datatables::of($PurchaseEnquiries)
            ->addColumn('show_id', function ($PurchaseEnquiry) use ($user) {
                if($PurchaseEnquiry->company->pe_prefix == ''){
                    return 'PE-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                } else {
                    return $PurchaseEnquiry->company->pe_prefix.'-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                }
            })
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT(purchase_enquiry_group_id,'-',purchase_enquiry_ingroup_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->item_id == null){
                    return $PurchaseEnquiry->item_description;
                } else {
                    return $PurchaseEnquiry->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('service_description', '{!! str_limit($service_description, 60) !!}')
            ->addColumn('updated_at_human', function ($PurchaseEnquiry) {
                $now = Carbon::now();
                $UpdatedAt = Carbon::createFromFormat('d.M.Y - (H:i:s)', $PurchaseEnquiry->updated_at);
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return $PurchaseEnquiry->status. ' <i>Since '.$DifferenceInMinutes.' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return $PurchaseEnquiry->status. ' <i>Since '.$DifferenceInHours[0].' Hours(s) '.$RemainingMinutes[0].' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    //return $DifferenceInDays[0].' Day(s)<br>'.$RemainingHours[0].' Hour(s)<br>'.$RemainingMinutes[0].' Minute(s) Ago';
                    return $PurchaseEnquiry->status. ' <i>Since '.$DifferenceInDays[0].' Day(s) and<br>'.$RemainingHours[0].' Hour(s)</i>';
                }
            })
            ->addColumn('action', function ($PurchaseEnquiry) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $PurchaseEnquiry->project->roles->where('role_name', 'PRV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($PurchaseEnquiry->approval_level, $UserApprovalLevel) && strpos($PurchaseEnquiry->status, 'Created') !== false) || (in_array($PurchaseEnquiry->approval_level, $UserApprovalLevel) && strpos($PurchaseEnquiry->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="PurchaseEnquiry"><i class="fa fa-edit" data-recordid="'.$PurchaseEnquiry->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action', 'updated_at_human']) 
            ->make(true);

    }


    public function getPurchaseRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[1];
        $RecordInfo = PurchaseEnquiry::where('id', $recordID)->where('company_id', $user->company_id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'company', 'item.itemTemplate', 'history.currentActionBy', 'project.company', 'ReceiptNote.invoices', 'purchaseOrders.vendor', 'quantityChanges');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }



    public function getPurchaseOrdersList(Request $request)
    {
        $user = $request->user();

        // Get purchase enquiries per company
        // $ReceiptNotes = ReceiptNote::with('project', 'purchaseEnquiry', 'purchaseOrder', 'receivingRecords', 'invoices')->where('company_id', $user->company_id)->where('active', 'Yes')->get();

        //Get purchase enquiries per company
        $PurchaseOrders = PurchaseOrder::with(
            'creator',
            'company',
            'project',
            'vendor',
            'quotation',
            'purchaseEnquiries',
            'receiptNotes.receivingRecords',
            'receiptNotes.purchaseEnquiry'
        )
        ->where('company_id', $user->company_id)
        ->where('active', 'Yes')->get();

        return Datatables::of($PurchaseOrders)
            // ->addColumn('show_id', '{{ $purchase_order_group_id }}-{{ $purchase_order_ingroup_id }}')
            ->addColumn('show_id', function ($PurchaseOrder) use ($user) {
                if($PurchaseOrder->company->po_prefix == ''){
                    return 'PO-'.$PurchaseOrder->purchase_order_group_id;
                } else {
                    return $PurchaseOrder->company->po_prefix.'-'.$PurchaseOrder->purchase_order_group_id;
                }
            })
            ->addColumn('pe_lines', function ($PurchaseOrder) {
                $PEList = "";
                foreach ($PurchaseOrder->purchaseEnquiries as $key => $PurchaseEnquiry) {
                    if($PurchaseEnquiry->company->pe_prefix == ''){
                        $PEList .= "PE-".$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id.'<br>';
                    } else {
                        $PEList .= $PurchaseEnquiry->company->pe_prefix."-".$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id.'<br>';
                    }
                }
                return $PEList;
            })
            ->addColumn('total_po_value', function ($PurchaseOrder) use ($user) {
                return '250.00 AED';
            })
            ->addColumn('action', function ($PurchaseOrder) use ($user) {

                $UserApprovalLevel = Role::where('company_id', $user->company_id)->where('role_name', 'POV')->where('user_id', $user->id)->pluck('role_level')->toArray();

                $ShowCancellation = '';
                if($user->hasRole('POO')){
                    $ShowCancellation = '<button class="btn btn-xs btn-danger cancel-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-minus-circle"></i> </button>';
                }

                //in_array($PurchaseOrder->approval_level, $UserApprovalLevel)
                if( $PurchaseOrder->status == 'Approvals Fully Completed - PO Sent To Vendor' || ($PurchaseOrder->status == 'Fully Rejected') || ($PurchaseOrder->status == 'Rejected By Vendor') || !in_array($PurchaseOrder->approval_level, $UserApprovalLevel) ){
                    return '
                        <button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-info"></i> </button>
                        
                        <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-edit"></i> </button>
  
                    ' . $ShowCancellation;
                } else {
                    return '
                        <button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder"  data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-info"></i> </button>
                        
                        <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="PurchaseOrder"  data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-edit"></i> </button>

                    ' . $ShowCancellation;
                }
                
                
            })
            ->rawColumns(['action', 'pe_lines']) 
            ->make(true);

    }

    public function getReceiptNoteDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[1];
        $RNDetails = ReceiptNote::with('project', 'purchaseEnquiry', 'purchaseOrder', 'receivingRecords', 'invoices', 'cancellationRequests.history.currentActionBy')->findOrFail($recordID);

        return $RNDetails;
    }


    public function getPurchaseOrdersCancellationRequestsList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $POCancellationRequests = POCancellationRequest::with('project', 'purchaseOrder', 'receiptNote.receivingRecords', 'receiptNote.purchaseEnquiry', 'receiptNote.invoices')->where('company_id', $user->company_id)->where('active', 'Yes')->get();

        return Datatables::of($POCancellationRequests)
            ->addColumn('show_id', function ($POCancellationRequest) {
                return $POCancellationRequest->receiptNote->receipt_note_group_id.'-'.$POCancellationRequest->receiptNote->receipt_note_ingroup_id;
            })
            ->addColumn('total_received_quantity', function ($POCancellationRequest) {
                return $POCancellationRequest->receiptNote->receivingRecords->sum('received_quantity');
            })
            ->addColumn('total_pending_quantity', function ($POCancellationRequest) {
                return abs($POCancellationRequest->receiptNote->receivingRecords->sum('received_quantity') - $POCancellationRequest->receiptNote->purchaseEnquiry->quantity);
            })
            ->addColumn('total_invoiced_quantity', function ($POCancellationRequest) {
                return $POCancellationRequest->receiptNote->invoices->sum('invoice_amount').' '.$POCancellationRequest->project->currency;
            })
            ->addColumn('action', function ($POCancellationRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $POCancellationRequest->project->roles->where('role_name', 'POV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($POCancellationRequest->approval_level, $UserApprovalLevel) && strpos($POCancellationRequest->status, 'Created') !== false) || (in_array($POCancellationRequest->approval_level, $UserApprovalLevel) && strpos($POCancellationRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="POCancellationRequest" data-recordid="'.$POCancellationRequest->id.'" data-receiptnoteid="'.$POCancellationRequest->receiptNote->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="POCancellationRequest" data-recordid="'.$POCancellationRequest->id.'" data-receiptnoteid="'.$POCancellationRequest->receiptNote->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="POCancellationRequest" data-recordid="'.$POCancellationRequest->id.'" data-receiptnoteid="'.$POCancellationRequest->receiptNote->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="POCancellationRequest"><i class="fa fa-edit" data-recordid="'.$POCancellationRequest->id.'" data-receiptnoteid="'.$POCancellationRequest->receiptNote->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }

    public function getPOCancellationRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[1];
        $ReceiptNoteID = $request->all()[2];
        $RNDetails = ReceiptNote::with('project', 'purchaseEnquiry', 'purchaseOrder', 'receivingRecords', 'invoices', 'cancellationRequests.history.currentActionBy')->findOrFail($ReceiptNoteID);

        return $RNDetails;
    }


    public function getPurchaseRequestListForPEOs(Request $request)
    {
        // dd($request->all());
        $user = $request->user()->load('company');
        $UserProjects = Role::select('project_id')->where('user_id',$user->id)->get()->toArray();

        //Get purchase enquiries per company
        $PurchaseEnquiries = PurchaseEnquiry::with('childheaders', 'company', 'quotations', 'project', 'creator', 'item.itemTemplate')->whereIn('purchase_enquiries.project_id', $UserProjects)->where('purchase_enquiries.company_id', $user->company_id)->where('purchase_enquiries.active', "Yes");
        
        // return $PurchaseEnquiries->company;
        // $date = substr($PurchaseEnquiries->created_at, 0, -12);
        // $month = substr($PurchaseEnquiries->created_at, 0, -12);
        // return \Carbon\Carbon::parse($date)->format('Y');
        // return \Carbon\Carbon::parse($date)->format('m');
        return Datatables::of($PurchaseEnquiries)
        
            ->addColumn('show_id', function ($PurchaseEnquiry) use ($user) {
                if($PurchaseEnquiry->company->pe_prefix == ''){
                    return 'PE-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                } else {
                    if($PurchaseEnquiry->company->customization_numbering == 'Yes')
                    {
                        $date = substr($PurchaseEnquiry->created_at, 0, -12);
                        $month = \Carbon\Carbon::parse($date)->format('m');
                        $year = \Carbon\Carbon::parse($date)->format('Y');
                        return $PurchaseEnquiry->company->pe_prefix.'-'.$year.$month.'.'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                        
                    }
                    else{
                        return $PurchaseEnquiry->company->pe_prefix.'-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                    }
                    
                }
            })
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT(purchase_enquiry_group_id,'-',purchase_enquiry_ingroup_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->item_id == null){
                    return @$PurchaseEnquiry->item_description;
                } else {
                    return @$PurchaseEnquiry->item->description;
                }
            })
            ->editColumn('retention_percentage', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->retention_percentage == 0){
                    return 'No Applicable';
                } else {
                    return $PurchaseEnquiry->retention_percentage.'% | '.$PurchaseEnquiry->retention_days.' Day(s) From The Date Of Full Delivery.' ;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('service_description', '{!! str_limit($service_description, 60) !!}')
            ->addColumn('location_details', function ($PurchaseEnquiry) { 
                return '<b>Location Name:</b> '.$PurchaseEnquiry->location_name.'<br>
                        <b>Latitude:</b> '.$PurchaseEnquiry->latitude.'<br>
                        <b>Longitude:</b> '.$PurchaseEnquiry->longitude.'<br>';
            })
            ->filterColumn('location_details', function($query, $keyword) {
                $sql = "CONCAT(location_name,' ',Latitude,' ',longitude) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('complete_description_with_headers', function ($PurchaseEnquiry) { 
                if(@$PurchaseEnquiry->item->template_id != null){
                    // dd($PurchaseEnquiry->company);
                    if($PurchaseEnquiry->company->lom_prefix == ''){
                        $FinalDescription = '<b>LoM-'.$PurchaseEnquiry->item->item_group_id.'-'.$PurchaseEnquiry->item->item_ingroup_id.'</b><br>';
                    } else {
                        $FinalDescription = '<b>'.$PurchaseEnquiry->company->lom_prefix.'-'.$PurchaseEnquiry->item->item_group_id.'-'.$PurchaseEnquiry->item->item_ingroup_id.'</b><br>';
                    }

                    for ($i=1; $i <= 20; $i++) { 
                        if($PurchaseEnquiry->item->itemTemplate['field_'.$i] != 'Ogeo-None'){
                            $FinalDescription .= '<b>'.$PurchaseEnquiry->item->itemTemplate['field_'.$i].':</b> '.$PurchaseEnquiry->item['field_'.$i].'<b> | </b>';
                        }
                    }
                    return $FinalDescription;
                } else {
                    return @$PurchaseEnquiry->item->description;
                }
            })
            ->filterColumn('complete_description_with_headers', function($query, $keyword) use ($user) {
                //$sql = "item.description like ?";
                $query->whereHas('item', function ($query1) use ($keyword, $user) {
                    if($user->company->lom_prefix == ''){
                        $sql = "CONCAT('LoM-',item_group_id,'-',item_ingroup_id,' ',description) like ?";
                    } else {
                        $sql = "CONCAT('".$user->company->lom_prefix."-',item_group_id,'-',item_ingroup_id,' ',description) like ?";
                    }
                    $query1->whereRaw($sql, '%'.$keyword.'%');
                });
            })
            ->addColumn('updated_at_human', function ($PurchaseEnquiry) {
                $now = Carbon::now();
                $UpdatedAt = Carbon::createFromFormat('d.M.Y - (H:i:s)', $PurchaseEnquiry->updated_at);
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return '<b>'.$PurchaseEnquiry->status.'</b>';
                    // return '<b>'.$PurchaseEnquiry->status.'</b><br><i>Since '.$DifferenceInMinutes.' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$PurchaseEnquiry->status.'</b>';
                    // return '<b>'.$PurchaseEnquiry->status.'</b><br><i>Since '.$DifferenceInHours[0].' Hours(s) '.$RemainingMinutes[0].' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    //return $DifferenceInDays[0].' Day(s)<br>'.$RemainingHours[0].' Hour(s)<br>'.$RemainingMinutes[0].' Minute(s)';
                    return '<b>'.$PurchaseEnquiry->status.'</b>';
                    // return '<b>'.$PurchaseEnquiry->status.'</b><br><i>Since '.$DifferenceInDays[0].' Day(s) and <br>'.$RemainingHours[0].' Hour(s)</i>';
                }
            })
            ->addColumn('service_description', function ($PurchaseEnquiry) {
                // $test = array();
                // return $PurchaseEnquiry->service_description;
                if($PurchaseEnquiry->service_description != '')
                {
                    return $PurchaseEnquiry->service_description;
                }
                else
                {
                    return PurchaseEnquiryChildHeaders::where('purchase_enquiry_master_id', $PurchaseEnquiry->id)->pluck('header_name');
                    
                }
            })
            ->filterColumn('updated_at_human', function($query, $keyword) {
                $sql = "status like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($PurchaseEnquiry) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $PurchaseEnquiry->project->roles->where('role_name', 'PRV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if user has this level within this project
                if((in_array($PurchaseEnquiry->approval_level, $UserApprovalLevel) && strpos($PurchaseEnquiry->status, 'Created') !== false) || (in_array($PurchaseEnquiry->approval_level, $UserApprovalLevel) && (strpos($PurchaseEnquiry->status, 'for Further Approval') !== false || strpos($PurchaseEnquiry->status, 'Resubmitted and Assigned') !== false)) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button>'. (count($PurchaseEnquiry->rfis) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationid="'.$PurchaseEnquiry->quotations[0]->id.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations[0]->quotation_for.'">RFI </button>' : '');
                }
                
                if(strpos($PurchaseEnquiry->status, 'Rejected') !== false && $user->hasRole('PRO')){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button> '. (count($PurchaseEnquiry->rfis) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationid="'.$PurchaseEnquiry->quotations[0]->id.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations[0]->quotation_for.'">RFI </button>' : '');
                }

                if($PurchaseEnquiry->retention_percentage != 0 && strpos($PurchaseEnquiry->status, "Purchase Order Accepted by the Awardee Vendor") !== false ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button> '. (count($PurchaseEnquiry->rfis) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationid="'.$PurchaseEnquiry->quotations[0]->id.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations[0]->quotation_for.'">RFI </button>' : '');
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button> '. (count($PurchaseEnquiry->rfis) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationid="'.$PurchaseEnquiry->quotations[0]->id.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations[0]->quotation_for.'">RFI </button>' : '');
                }
                
                
                
            })
            ->rawColumns(['action', 'updated_at_human', 'complete_description_with_headers', 'location_details', 'service_description']) 
            ->make(true);

    }



    public function getStockTransferRequestList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockTransferRequests = StockTransferRequest::with(['creator', 'fromProject', 'toProject', 'stockItem.item'])->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_transfer_requests.*');

        return Datatables::of($StockTransferRequests)
            ->addColumn('show_id', 'STR-{{$stock_transfer_request_group_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('STR-', stock_transfer_request_group_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockTransferRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $StockTransferRequest->fromProject->roles->where('role_name', 'ASTMGR')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($StockTransferRequest->approval_level, $UserApprovalLevel) && strpos($StockTransferRequest->status, 'Created') !== false) || (in_array($StockTransferRequest->approval_level, $UserApprovalLevel) && strpos($StockTransferRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockTransferRequest" data-recordid="'.$StockTransferRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockTransferRequest" data-recordid="'.$StockTransferRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockTransferRequest" data-recordid="'.$StockTransferRequest->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="StockTransferRequest"><i class="fa fa-edit" data-recordid="'.$StockTransferRequest->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);

    }


    public function getStockTransferRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[0];
        $RecordInfo = StockTransferRequest::where('id', $recordID)->where('company_id', $user->company_id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'stockItem.item', 'history.currentActionBy', 'fromProject', 'toProject');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }




    public function getStockItemIssueRequestList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockIssueRequests = StockItemIssueRequest::with(['creator', 'project', 'stockItem.item'])->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_item_issue_requests.*');

        return Datatables::of($StockIssueRequests)
            ->addColumn('show_id', 'SIIR-{{$stock_item_issuance_request_group_id}}-{{$stock_item_issuance_request_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIIR-', stock_item_issuance_request_group_id,'-','stock_item_issuance_request_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockIssueRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $StockIssueRequest->project->roles->where('role_name', 'ATSIRS')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($StockIssueRequest->approval_level, $UserApprovalLevel) && strpos($StockIssueRequest->status, 'Requested') !== false) || (in_array($StockIssueRequest->approval_level, $UserApprovalLevel) && strpos($StockIssueRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="StockItemIssueRequest"><i class="fa fa-edit" data-recordid="'.$StockIssueRequest->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }


    public function getStockItemIssueRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[0];
        $RecordInfo = StockItemIssueRequest::with('issuances.creator')->where('id', $recordID)->where('company_id', $user->company_id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'stockItem.item', 'history.currentActionBy', 'project');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }



    public function getStockItemIssueRequestListForReleasing(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockIssueRequests = StockItemIssueRequest::with(['creator', 'project', 'stockItem.item'])->where('company_id', $user->company_id)->where('status', 'like', '%Approved by%')->where('active', 'Yes')->select('stock_item_issue_requests.*');

        return Datatables::of($StockIssueRequests)
            ->addColumn('show_id', 'SIIR-{{$stock_item_issuance_request_group_id}}-{{$stock_item_issuance_request_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIIR-', stock_item_issuance_request_group_id,'-','stock_item_issuance_request_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockIssueRequest) use ($user) {

                //only if use has this level within this project
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success edit-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-edit"></i> </button>';
                
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }



    public function getStockItemReturnRequestList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockReturnRequests = StockItemReturnRequest::with('creator', 'stockItemIssueRequest.stockItem.item', 'stockItemIssueRequest.project')->where('company_id', $user->company_id)->where('active', 'Yes');


        return Datatables::of($StockReturnRequests)
            ->addColumn('show_id', 'SIRR-{{$stock_item_return_request_group_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIRR-', stock_item_return_request_group_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockReturnRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $StockReturnRequest->stockItemIssueRequest->project->roles->where('role_name', 'ATSIRS')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($StockReturnRequest->approval_level, $UserApprovalLevel) && strpos($StockReturnRequest->status, 'Requested') !== false) || (in_array($StockReturnRequest->approval_level, $UserApprovalLevel) && strpos($StockReturnRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="StockItemReturnRequest"><i class="fa fa-edit" data-recordid="'.$StockReturnRequest->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }


    public function getStockItemReturnRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[0];
        $RecordInfo = StockItemReturnRequest::with('creator')->where('id', $recordID)->where('company_id', $user->company_id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'stockItemIssueRequest.stockItem.item', 'history.currentActionBy', 'stockItemIssueRequest.project');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }



    public function getStockItemReturnRequestListForReturning(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockReturnRequests = StockItemReturnRequest::with('creator', 'stockItemIssueRequest.stockItem.item', 'stockItemIssueRequest.project')->where('company_id', $user->company_id)->where('status', 'like', '%Approved by%')->orWhere('status', 'Return Accepted')->orWhere('status', 'Return Rejected')->where('active', 'Yes');

        return Datatables::of($StockReturnRequests)
            ->addColumn('show_id', 'SIRR-{{$stock_item_return_request_group_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIRR-', stock_item_return_request_group_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockReturnRequest) use ($user) {

                //only if use has this level within this project
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-success edit-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-edit"></i> </button>';
                
                
            })
            ->rawColumns(['action']) 
            ->make(true);

    }




    public function getPurchaseEnquiriesPerType(Request $request)
    {
        $user = $request->user();

        if($request->get('RequestType') == "PE"){ // Purchase Enquiry Details
            $PurchaseEnquiries = PurchaseEnquiry::with('item', 'company', 'item.itemTemplate')->where('enquiry_type', $request->get('PEType'))->where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('status', 'like', '%Sent for Request For Proposal%')->orWhere('status', 'like', '%Send for a New Request for Proposals%')->get();
        } elseif ($request->get('RequestType') == "RC") { // Rate Contract Details
            $PurchaseEnquiries = RateContractRequest::with('item', 'company', 'item.itemTemplate')->where('company_id', $user->company_id)->where('project_id', $request->get('ProjectId'))->where('status', 'like', '%Sent for Request For Proposal%')->get();
        } else {
            $PurchaseEnquiries = "An error has happended please contact technical team. No PE/RC selection detected";
        }
        

        return $PurchaseEnquiries;
    }


    public function getStockItemRequestForCreation(Request $request)
    {
        $user = $request->user();

        $StockItemRequests = StockItemRequest::with('project', 'item', 'item.itemTemplate')->where('company_id', $user->company_id)->where('status', 'like', '%sent for stock creation%')->get();

        return $StockItemRequests;
    }




    /* Vendor Data Getters */

    public function getVendorsList(Request $request)
    {
        $user = $request->user();
        $vendors = $user->company->vendors->load('users')->toArray();
        /* Get only The vendors with users */
        // foreach ($temp as $key => $vendor) {
        //     if(count($vendor['users'])){
        //         $vendors[] = $vendor;
        //     }  
        // }
        return $vendors;
    }

    public function getVendorsDatatable(Request $request)
    {
        $user = $request->user();
        $now = Carbon::now();
        $VendorsList = Vendor::with('users')->where('company_id', $user->company_id);
        // $VendorsList = $user->company->vendors;
        // $VendorsList = $user->company->vendors->load('users');

        return Datatables::of($VendorsList)
            ->editColumn('lic_expiry_date', function ($Vendor) {
                if($Vendor->lic_expiry_date){
                    return $Vendor->lic_expiry_date->format('d.M.Y');
                }
            })
            ->editColumn('active', function ($Vendor) {
                $now = Carbon::now();
                $UpdatedAt = Carbon::createFromFormat('d.M.Y - (H:i:s)', $Vendor->updated_at);
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return '<b>'.$Vendor->active. '</b>, <i>Since '.$DifferenceInMinutes.' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$Vendor->active. '</b>, <i>Since '.$DifferenceInHours[0].' Hours(s) '.$RemainingMinutes[0].' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    //return $DifferenceInDays[0].' Day(s)<br>'.$RemainingHours[0].' Hour(s)<br>'.$RemainingMinutes[0].' Minute(s) Ago';
                    return '<b>'.$Vendor->active. '</b>, <i>Since '.$DifferenceInDays[0].' Day(s) and<br>'.$RemainingHours[0].' Hour(s)</i>';
                }
            })
            ->editColumn('status', function ($Vendor) {
                $now = Carbon::now();
                $UpdatedAt = $Vendor->lic_expiry_date;
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return '<b>'.$Vendor->status. '</b>, <i>Since '.$DifferenceInMinutes.' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$Vendor->status. '</b>, <i>Since '.$DifferenceInHours[0].' Hours(s) '.$RemainingMinutes[0].' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$Vendor->status. '</b>, <i>Since '.$DifferenceInDays[0].' Day(s) and<br>'.$RemainingHours[0].' Hour(s)</i>';
                }
            })
            ->addColumn('vendor_users', function ($Vendor) {
                if(count($Vendor->users)){
                    $UsersList = "";
                    foreach ($Vendor->users as $key => $user) {
                        $UsersList = $UsersList.'<b>Name:</b> '.$user->name.'<br>';
                        $UsersList = $UsersList.'<b>Email:</b> '.$user->email.'<br>';
                        $UsersList = $UsersList.'<b>Bidding Access:</b> '.$user->pivot->sbm_role.'<br>';
                        $UsersList = $UsersList.'<b>Invoicing Access:</b> '.$user->pivot->sim_role.'<br>';
                        $UsersList = $UsersList.'<hr>';
                    }
                    return $UsersList;
                } else {
                    return 'Not Avaialble';
                } 
            })
            ->filterColumn('vendor_users', function($query, $keyword) {

                $query->whereHas('users', function ($query1) use ($keyword) {
                    $sql = "CONCAT(name,' ',email,' ','Bidding Access ', 'Invoicing Access ') like ?";
                    $query1->whereRaw($sql, '%'.$keyword.'%');
                });

            })
            ->addColumn('action', function ($Vendor) use ($now) {

                    if($Vendor->active == "Yes"){
                        return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="Vendor"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-recordid="'.$Vendor->id.'" data-elquentClass="Vendor" title="Edit Info"><i class="fa fa-edit"></i> </button>  <button class="btn btn-xs btn-danger activations-placeholder" data-recordid="'.$Vendor->id.'" data-elquentClass="Vendor" title="Deactivate Vendor"><i class="mdi mdi-eye-off"></i> </button>';
                    } else {

                        if($Vendor->lic_expiry_date->lt($now)){
                            return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="Vendor"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-recordid="'.$Vendor->id.'" data-elquentClass="Vendor" title="Edit Info"><i class="fa fa-edit"></i> </button>';
                        } else {
                            return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="Vendor"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-recordid="'.$Vendor->id.'" data-elquentClass="Vendor" title="Edit Info"><i class="fa fa-edit"></i> </button> <button class="btn btn-xs btn-warning activations-placeholder" data-recordid="'.$Vendor->id.'" data-elquentClass="Vendor" title="Activate Vendor"><i class="mdi mdi-eye"></i> </button>';
                        }
                        
                    }

                    
                
            })
            ->rawColumns(['action', 'vendor_users', 'status', 'active']) 
            ->make(true);
    }


    public function getVendorDetails(Request $request)
    {
        return Vendor::findOrFail($request->get('VendorID'))->load('creator', 'users', 'itemTemplates', 'qualificationDocuments');
    }

    public function getVendorUsersDatatable(Request $request)
    {
        $user = $request->user();

        $VendorsUsersList = VendorUser::with(['vendors' => function ($query1) use ($user) {
            $query1->whereHas('company', function ($query2) use ($user) {
                $query2->where('id', $user->company_id);
            });
        }])->whereHas('vendors', function ($query3) use ($user) {
            $query3->where('company_id', $user->company_id);
        });

        // dd($VendorsUsersList);

        return Datatables::of($VendorsUsersList)
            ->addColumn('action', function ($VendorUser) {
                if($VendorUser->active == "Yes"){
                    return '<button class="btn btn-xs btn-danger UserDeactivate" title="Deactivate" data-vendoruserid="'.$VendorUser->id.'"><i class="mdi mdi-eye-off"></i> </button> <button class="btn btn-xs btn-danger UserDelete" title="Delete" data-vendoruserid="'.$VendorUser->id.'"><i class="mdi mdi-account-remove"></i> </button>';
                } else {
                    return '</button> <button class="btn btn-xs btn-success UserReactivate" title="Reactivate" data-vendoruserid="'.$VendorUser->id.'"><i class="mdi mdi-eye"></i> </button> <button class="btn btn-xs btn-danger UserDelete" title="Delete" data-vendoruserid="'.$VendorUser->id.'"><i class="mdi mdi-account-remove"></i> </button>';
                }
                
            })
            ->editColumn('active', function ($VendorUser) {
                
                $now = Carbon::now();
                $UpdatedAt = Carbon::createFromFormat('d.M.Y - (H:i:s)', $VendorUser->updated_at);
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return '<b>'.$VendorUser->active. '</b>, <i>Since '.$DifferenceInMinutes.' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$VendorUser->active. '</b>, <i>Since '.$DifferenceInHours[0].' Hours(s) '.$RemainingMinutes[0].' Minute(s)</i>';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    return '<b>'.$VendorUser->active. '</b>, <i>Since '.$DifferenceInDays[0].' Day(s) and<br>'.$RemainingHours[0].' Hour(s)</i>';
                }
                
            })
            ->editColumn('sbm_role', function ($VendorUser) {
                if($VendorUser->vendors[0]->pivot->sbm_role == 'Yes'){
                    return 'Yes';
                }else {
                    return 'No';
                }
            })
            ->editColumn('sim_role', function ($VendorUser) {
                if($VendorUser->vendors[0]->pivot->sim_role == 'Yes'){
                    return 'Yes';
                }else {
                    return 'No';
                }
            })
            ->rawColumns(['action', 'active']) 
            ->make(true);
    }


    public function getQuotationsDatatable(Request $request)
    {
        $user = $request->user();

        // Get the purchase enquiries with cancelled status

        // Search by Quotation requests and refractor by Purchase Enquiry
        $QuotationRequests = QuotationRequest::with([
            'rfis',
            'purchaseEnquiriesAllActive.company',
            'purchaseEnquiriesAllActive.project',
            'purchaseEnquiriesAllActive.rfis',
            'purchaseEnquiriesAllActive.commericalEvaluations',
            'purchaseEnquiriesAllActive.creator',
            'purchaseEnquiriesAllActive.item.itemTemplate'])
            ->where('company_id', $user->company_id)
            ->where('active', 'Yes')
            ->get();
        
        $PurchaseEnquiriesFinal = [];

        foreach ($QuotationRequests as $key1 => $QuotationRequest) {
            foreach ($QuotationRequest->purchaseEnquiriesAllActive as $key2 => $purchaseEnquiryFromActive) {
                $purchaseEnquiryFromActive->current_quotation_id = $QuotationRequest->id;
                $PurchaseEnquiriesFinal[] = $purchaseEnquiryFromActive;
            }
        }

        return Datatables::of($PurchaseEnquiriesFinal)
            ->addColumn('show_id', function ($PurchaseEnquiry) use ($user) {
                if($PurchaseEnquiry->company->pe_prefix == ''){
                    return 'PE-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                } else {
                    return $PurchaseEnquiry->company->pe_prefix.'-'.$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id;
                }
            })
            // ->filterColumn('show_id', function($query, $keyword) {
            //     $sql = "CONCAT(purchase_enquiry_group_id,'-',purchase_enquiry_ingroup_id) like ?";
            //     $query->whereRaw($sql, ["%{$keyword}%"]);
            // })
            ->editColumn('item.description', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->item_id == null){
                    return $PurchaseEnquiry->item_description;
                } else {
                    return $PurchaseEnquiry->item->description;
                }
                
            })
            ->editColumn('sourcing_type', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->sourcing_type;
            })
            ->editColumn('rfp_name', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->rfp_name;
            })
            ->editColumn('commerical_evaluation_group_id', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->commericalEvaluations->where('quotation_id', $PurchaseEnquiry->current_quotation_id)->first()){
                    // dd($PurchaseEnquiry->current_quotation_id);
                    return $PurchaseEnquiry->commericalEvaluations->where('quotation_id', $PurchaseEnquiry->current_quotation_id)->first()->commerical_evaluation_group_id;
                }
                return 'N/A';
            })
            ->editColumn('commerical_evaluation_group_id_created_at', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->commericalEvaluations->where('quotation_id', $PurchaseEnquiry->current_quotation_id)->first()){
                    return $PurchaseEnquiry->commericalEvaluations->where('quotation_id', $PurchaseEnquiry->current_quotation_id)->first()->created_at;
                }
                return 'N/A';
            })
            ->editColumn('creator_name', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->creator->name;
            })
            ->editColumn('quotations_created_at', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->created_at;
            })
            ->editColumn('quotations_start_date', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->start_date;
            })
            ->editColumn('quotations_end_date', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->end_date;
            })
            ->editColumn('quotations_rfi_start_date', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->rfi_start_date;
            })
            ->editColumn('quotations_rfi_end_date', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->rfi_end_date;
            })
            ->editColumn('quotations_status', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status;
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('service_description', '{!! str_limit($service_description, 60) !!}')
            ->addColumn('quotation_grouping', function ($PurchaseEnquiry) {
                return $PurchaseEnquiry->current_quotation_id;
            })
            ->addColumn('consulted_vendors', function ($PurchaseEnquiry) {
                $vendorsList = "";
                foreach ($PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->vendors as $key => $vendor) {
                    $vendorsList .= ($key+1).'. '.$vendor->name.'-ID#'.$vendor->id.'<br>';
                }
                return $vendorsList;
            })
            ->editColumn('retention_percentage', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->retention_percentage == 0){
                    return 'No Applicable';
                } else {
                    return $PurchaseEnquiry->retention_percentage.'% | '.$PurchaseEnquiry->retention_days.' Day(s) From The Date Of Full Delivery.' ;
                }
                
            })
            ->addColumn('complete_description_with_headers', function ($PurchaseEnquiry) { 
                if(@$PurchaseEnquiry->item->template_id != null){
                    // dd($PurchaseEnquiry->company);
                    if($PurchaseEnquiry->company->lom_prefix == ''){
                        $FinalDescription = '<b>LoM-'.$PurchaseEnquiry->item->item_group_id.'-'.$PurchaseEnquiry->item->item_ingroup_id.'</b><br>';
                    } else {
                        $FinalDescription = '<b>'.$PurchaseEnquiry->company->lom_prefix.'-'.$PurchaseEnquiry->item->item_group_id.'-'.$PurchaseEnquiry->item->item_ingroup_id.'</b><br>';
                    }

                    for ($i=1; $i <= 20; $i++) { 
                        if($PurchaseEnquiry->item->itemTemplate['field_'.$i] != 'Ogeo-None'){
                            $FinalDescription .= '<b>'.$PurchaseEnquiry->item->itemTemplate['field_'.$i].':</b> '.$PurchaseEnquiry->item['field_'.$i].'<b> | </b>';
                        }
                    }
                    return $FinalDescription;
                } else {
                    return $PurchaseEnquiry->item->description;
                }
            })
            // ->filterColumn('complete_description_with_headers', function($query, $keyword) use ($user) {
            //     //$sql = "item.description like ?";
            //     $query->whereHas('item', function ($query1) use ($keyword, $user) {
            //         if($user->company->lom_prefix == ''){
            //             $sql = "CONCAT('LoM-',item_group_id,'-',item_ingroup_id,' ',description) like ?";
            //         } else {
            //             $sql = "CONCAT('".$user->company->lom_prefix."-',item_group_id,'-',item_ingroup_id,' ',description) like ?";
            //         }
            //         $query1->whereRaw($sql, '%'.$keyword.'%');
            //     });
            // })
            ->addColumn('updated_at_human', function ($PurchaseEnquiry) {
                $now = Carbon::now();
                $UpdatedAt = Carbon::createFromFormat('d.M.Y - (H:i:s)', $PurchaseEnquiry->updated_at);
                $DifferenceInMinutes = $now->diffInMinutes($UpdatedAt);
                if($DifferenceInMinutes < 60){
                    return round($DifferenceInMinutes, 2).' Minute(s) Ago';
                } else if ($DifferenceInMinutes > 60 && $DifferenceInMinutes < 1440) {
                    $DifferenceInHours = $DifferenceInMinutes/60;
                    $DifferenceInHours = explode('.', $DifferenceInHours,2);
                    $RemainingMinutes = ('0.'.$DifferenceInHours[1]) * 60;
                    return $DifferenceInHours[0].' Hours(s) '.round($RemainingMinutes, 2).' Minute(s) Ago';
                } else if ($DifferenceInMinutes > 1440) {
                    $DifferenceInDays = $DifferenceInMinutes/60/24;
                    $DifferenceInDays = explode('.', $DifferenceInDays,2);
                    $RemainingHours = ('0.'.$DifferenceInDays[1]) * 24;
                    $RemainingHours = explode('.', $RemainingHours,2);
                    $RemainingMinutes = ('0.'.$RemainingHours[1]) * 60;
                    $RemainingMinutes = explode('.', $RemainingMinutes,2);
                    //return $DifferenceInDays[0].' Day(s)<br>'.$RemainingHours[0].' Hour(s)<br>'.$RemainingMinutes[0].' Minute(s) Ago';
                    return $DifferenceInDays[0].' Day(s) and<br>'.round($RemainingHours[0],2).' Hour(s) Ago';
                }
            })
            ->addColumn('action', function ($PurchaseEnquiry) use ($user) {

                if($PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status == "Commercial Evaluation Submitted" || $PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status == "Request for Proposals cancelled"){

                    // these button are hidden because they will not show line wise but will be grouped based on RFP
                    return '<button style="display:none" class="btn btn-xs btn-warning view-placeholder" data-quotationstatus="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->id.'" data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'"><i class="fa fa-pencil"></i> </button> <button style="display:none" class="btn btn-xs btn-warning  edit-placeholder" data-elquentClass="QuotationRequest" data-companyid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->company_id.'" data-recordid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->id.'" disabled data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'"><i class="fa fa-edit"></i> </button>' . (count($PurchaseEnquiry->rfis->where('pe_id', $PurchaseEnquiry->id)->where('quotation_id', $PurchaseEnquiry->current_quotation_id)) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationstatus="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'">RFI </button>' : '');
                } else {
                    return '<button style="display:none" class="btn btn-xs btn-warning view-placeholder" data-quotationstatus="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->id.'" data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'"><i class="fa fa-pencil"></i> </button> <button style="display:none" class="btn btn-xs btn-warning  edit-placeholder" data-elquentClass="QuotationRequest" data-companyid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->company_id.'" data-recordid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->id.'" data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'"><i class="fa fa-edit"></i> </button>' . (count($PurchaseEnquiry->rfis->where('pe_id', $PurchaseEnquiry->id)->where('quotation_id', $PurchaseEnquiry->current_quotation_id)) ? '<button class="btn btn-xs btn-success view-rfi" data-quotationstatus="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->status.'" data-elquentClass="QuotationRequest" data-recordid="'.$PurchaseEnquiry->id.'" data-recordtype="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->quotation_for.'" data-quotationid="'.$PurchaseEnquiry->quotations->where('id', $PurchaseEnquiry->current_quotation_id)->first()->id.'">RFI </button>' : '');
                }
                
            })
            ->rawColumns(['action', 'updated_at_human', 'consulted_vendors', 'complete_description_with_headers']) 
            ->make();
    }


    public function getQuotationDetails(ViewRFPDetailsRequest $request)
    {
        // $testArray = [
        //     'person' => 
        //         [
        //             [
        //                 'title' => 'muazmalas@gmail.com',
        //                 'body' => 'Muaz Malas'
        //             ],
        //             [
        //                 'title' => 'muazmalas@gmail.com',
        //             ]
        //         ]
        // ];

        // $validator = Validator::make($testArray, [
        //     'person.*.title' => 'required|max:255',
        //     'person.*.body' => 'required',
        // ]);

        // dd($validator->fails());


        $validated = $request->validated();

        //dd($validated);

        if($request->get('QuotationType') == "PE"){
            return QuotationRequest::with([
                'trackers',
                'project',
                'creator',
                'rfis',
                'commericalEvaluation.evaluator',
                'purchaseEnquiriesAllActive.item.itemTemplate',
                'purchaseEnquiriesAllActive.uploadedDocs',
                'purchaseEnquiriesAllActive.rfis',
                'purchaseEnquiriesAllActive.vendorResponses' => function($query) use ($request){
                    $query->where('quotation_responses.quotation_id', $request->get('QuotationId'));
                },
                'Vendors.quotationResponses' => function ($query) use ($request) {
                    $query->where('quotation_responses.quotation_id', $request->get('QuotationId'));
                }])
                ->findOrFail($request->get('QuotationId'));
        }

        if($request->get('QuotationType') == "RC"){
            return QuotationRequest::with(['trackers', 'project', 'creator', 'rfis', 'commericalEvaluation.evaluator', 'rateContractRequests.item', 'rateContractRequests.uploadedDocs', 'rateContractRequests.rfis', 'rateContractRequests.vendorResponses', 'Vendors.quotationRCResponses' => function ($query) use ($request) {
                $query->where('rate_contract_quotation_responses.quotation_id', $request->get('QuotationId'));
            }])->findOrFail($request->get('QuotationId'));
        }
        
    }


    public function getRateContractItemRequestsList(Request $request)
    {

        $user = $request->user();

        //Get purchase enquiries per company
        $RateContractItemRequests = RateContractRequest::with('creator', 'item')->where('company_id', $user->company_id)->where('active', 'Yes')->select('rate_contract_requests.*');


        return Datatables::of($RateContractItemRequests)
            ->addColumn('show_id', 'PE-{{$rate_contract_request_group_id}}-{{$rate_contract_request_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('PE-', rate_contract_request_group_id,'-','rate_contract_request_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($RateContractItemRequest) {
                if($RateContractItemRequest->item_id == null){
                    return $RateContractItemRequest->item_description;
                } else {
                    return $RateContractItemRequest->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->addColumn('action', function ($RateContractItemRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $RateContractItemRequest->project->roles->where('role_name', 'RCCV')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($RateContractItemRequest->approval_level, $UserApprovalLevel) && strpos($RateContractItemRequest->status, 'Created') !== false) || (in_array($RateContractItemRequest->approval_level, $UserApprovalLevel) && strpos($RateContractItemRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContractItemRequest" data-recordid="'.$RateContractItemRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="RateContractItemRequest" data-recordid="'.$RateContractItemRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContractItemRequest" data-recordid="'.$RateContractItemRequest->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="RateContractItemRequest"><i class="fa fa-edit" data-recordid="'.$RateContractItemRequest->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);

    }


    public function getRateContractItemRequestDetails(Request $request)
    {

        $recordID = $request->all()[1];
        $RecordInfo = RateContractRequest::findOrFail($recordID);

        return $RecordInfo->load('creator', 'item', 'history.currentActionBy');

    }



    public function getStockItemRequestsList(Request $request)
    {

        $user = $request->user();

        //Get purchase enquiries per company
        $StockItemRequests = StockItemRequest::with('creator', 'item')->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_item_requests.*');


        return Datatables::of($StockItemRequests)
            ->addColumn('show_id', 'SIR-{{$stock_item_request_group_id}}-{{$stock_item_request_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIR-', stock_item_request_group_id,'-','stock_item_request_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($StockItemRequest) {
                if($StockItemRequest->item_id == null){
                    return $StockItemRequest->item_description;
                } else {
                    return $StockItemRequest->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->addColumn('action', function ($StockItemRequest) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $StockItemRequest->project->roles->where('role_name', 'ATSI')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.

                //only if use has this level within this project
                if((in_array($StockItemRequest->approval_level, $UserApprovalLevel) && strpos($StockItemRequest->status, 'Created') !== false) || (in_array($StockItemRequest->approval_level, $UserApprovalLevel) && strpos($StockItemRequest->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="StockItemRequest"><i class="fa fa-edit" data-recordid="'.$StockItemRequest->id.'"></i> </button>';
                }
                
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);

    }


    public function getStockItemRequestDetails(Request $request)
    {

        $recordID = $request->all()[1];
        $RecordInfo = StockItemRequest::findOrFail($recordID);

        return $RecordInfo->load('creator', 'item', 'history.currentActionBy');

    }




    public function getStockItemList(Request $request)
    {

        $user = $request->user();

        //Get purchase enquiries per company
        $StockItems = StockItem::with('creator', 'item', 'project')->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_items.*');


        return Datatables::of($StockItems)
            ->addColumn('show_id', 'SID-{{$stock_item_group_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SID-', stock_item_group_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($StockItem) {
                if($StockItem->item_id == null){
                    return $StockItem->item_description;
                } else {
                    return $StockItem->item->description;
                }
            })
            ->addColumn('action', function ($StockItem) {
                return '<div class="row">
                            <div class="col-lg-12">
                                <button title="View Info" class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItem->id.'"><i class="fa fa-info"></i> </button> 
                                <button title="Replenish Stocks" class=" btn btn-xs btn-ogeo replenish-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItem->id.'"><i class="fa fa-retweet"></i> </button> 
                            </div>
                            <div class="col-lg-12"> 
                                <button title="Edit Details" class="m-t-5 btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItem->id.'"><i class="fa fa-edit"></i> </button>
                                <button title="Adjust Quantity" class="m-t-5 btn btn-xs btn-warning adjustquantity-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItem->id.'"><i class="fa fa-cubes"></i> </button>
                            </div>
                            <div class="col-lg-12"> 
                                <button title="Stock Receiving" class="m-t-5 btn btn-xs btn-success stockreceiving-placeholder" data-elquentClass="StockItemRequest" data-recordid="'.$StockItem->id.'">R</button>
                            </div>
                        </div>';
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);

    }

    public function getStockItemDetails(Request $request)
    {

        $recordID = $request->all()[1];
        $RecordInfo = StockItem::findOrFail($recordID);

        return $RecordInfo->load('creator', 'item', 'project');

    }


    public function getStockItemWithReceivingDetails(Request $request)
    {
        $recordID = $request->all()[1];
        $RecordInfo = StockItem::findOrFail($recordID);

        return $RecordInfo->load('creator', 'item', 'project', 'purchaseEnquiries.purchaseOrders.receiptNotes.receivingRecords.storeReceiver');
    }



    public function getCompaniesDatatable(Request $request)
    {

        $Companies = Company::with('users', 'projects', 'vendors', 'purchaseEnquiries', 'quotationRequests', 'itemCreationRequests', 'items', 'vendors.users')->select('companies.*');

        return Datatables::of($Companies)
            ->addColumn('users_count', function ($Company) {
                return $Company->users->count();
            })
            ->addColumn('projects_count', function ($Company) {
                if($Company->setup_mode == "Company Wide"){
                    return 'Company Wide';
                } else {
                    return $Company->projects->count();
                }
            })
            ->addColumn('item_creation_requests_count', function ($Company) {
                return $Company->itemCreationRequests->count();
            })
            ->addColumn('items_count', function ($Company) {
                return $Company->items->count();
            })
            ->addColumn('purchase_enquiries_count', function ($Company) {
                return $Company->purchaseEnquiries->count();
            })
            ->addColumn('quotation_requests_count', function ($Company) {
                return $Company->quotationRequests->count();
            })
            ->addColumn('vendors_count', function ($Company) {
                return $Company->vendors->count();
            })
            ->addColumn('vendor_users_count', function ($Company) {
                $vendorUsersCount = 0;
                foreach ($Company->vendors as $key => $vendor) {
                    $vendorUsersCount = $vendorUsersCount + $vendor->users->count();
                }
                return $vendorUsersCount;
            })
            ->addColumn('action', function ($Company) {
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="Company"><i class="fa fa-info"></i> </button>';
                
            })
            ->rawColumns(['action'])
            ->make(true);

    }


    public function getUsersNotCompletedSetupDatatable(Request $request)
    {

        $Users = User::where('company_id', 0)->select('users.*');

        return Datatables::of($Users)
            ->rawColumns(['action'])
            ->make(true);

    }


    public function getCompanyCompleteDetails(Request $request)
    {
        $user = $request->user();

        return Company::findOrFail($request->get('companyID'));
    }


    public function getPERFIDetails(Request $request)
    {
        if( $request->get('QuotationType') == "PE"){
            return RFICommunication::with([
                'user',
                'vendorUser',
                'company',
                'quotation.trackers' => function($query) use ($request){
                    $query->where('vendor_id', $request->get('VendorId'));
                }])
                ->where('pe_id', $request->get('PEId'))
                ->get();
        }
        if( $request->get('QuotationType') == "RC"){
            return RCRFICommunication::with(['user', 'vendorUser', 'company', 'quotation.trackers' => function($query) use ($request){
                $query->where('vendor_id', $request->get('VendorId'));
            }])->where('rc_id', $request->get('PEId'))->get();
        }
    }

    public function getAllPERFIDetails(Request $request)
    {
        if( $request->get('QuotationType') == "PE"){
            return RFICommunication::with([
                'user',
                'vendorUser',
                'company',
                'quotation.trackers',
                "purchaseEnquiry"])
                ->where('pe_id', $request->get('PEId'))
                ->get();
        }
        if( $request->get('QuotationType') == "RC"){
            return RCRFICommunication::with([
                'user',
                'vendorUser',
                'company',
                'quotation.trackers',
                "purchaseEnquiry"])
                ->where('rc_id', $request->get('PEId'))
                ->get();
        }
        
    }


    public function getVendorsListWithoutExisting(Request $request)
    {
        $user = $request->user();

        $QuotationRequest = QuotationRequest::findOrFail($request->get('QuotationID'));
        $ExistingVendorList = $QuotationRequest->Vendors->pluck('id');
        return $user->company->vendors->whereNotIn('id', $ExistingVendorList)->toArray();
    }


    public function getCommericalEvaluationsDatatable(Request $request)
    {
        $user = $request->user();

        //$CommercialEvaluations = CommercialEvaluation::with('evaluator', 'quotation.Vendors', 'company')->where('company_id', $user->company_id)->where('status', 'Commercial Evaluation Submitted')->orWhere('status', 'Commerical Evaluation Re-Opened After Vendor Rejection')->orWhere('status', 'like', '%PO Created%')->select('quotation_commerical_evaluations.*');
        
        // $CommercialEvaluations = CommercialEvaluation::with('evaluator', 'quotation.Vendors', 'company')->where('company_id', $user->company_id)->select('quotation_commerical_evaluations.*');

        $CommercialEvaluations = CommercialEvaluation::with(
            'quotation.project',
            'evaluator',
            'purchaseEnquiries.company',
            'purchaseEnquiries.purchaseOrders',
            'purchaseOrders.company',
            'quotation.Vendors',
            'company',
            'quotation.trackers.vendor')
            ->whereHas('quotation', function ($query1) {
                $query1->where('quotation_requests.quotation_for', 'PE');
            })
            ->where('company_id', $user->company_id)
            ->select('quotation_commerical_evaluations.*');


        $datatableReturn = Datatables::of($CommercialEvaluations)
            ->editColumn('commerical_evaluation_group_id', function ($CommercialEvaluation) {
                if($CommercialEvaluation->company->ce_prefix == ''){
                    return 'CE-'.$CommercialEvaluation->commerical_evaluation_group_id;;
                }else {
                    return $CommercialEvaluation->company->ce_prefix.'-'.$CommercialEvaluation->commerical_evaluation_group_id;;
                }
            })
            ->editColumn('rfi_full_id', function ($CommercialEvaluation) {
                if($CommercialEvaluation->company->rfp_prefix == ''){
                    return 'RFP-'.$CommercialEvaluation->quotation->id.'<br>('.$CommercialEvaluation->quotation->rfp_name.')';
                }else {
                    return $CommercialEvaluation->company->rfp_prefix.'-'.$CommercialEvaluation->quotation->id.'<br>('.$CommercialEvaluation->quotation->rfp_name.')';
                }
            })
            ->editColumn('start_date', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->start_date->format('d.M.Y');
            })
            ->editColumn('end_date', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->end_date->format('d.M.Y');
            })
            ->addColumn('evaluator', function ($CommercialEvaluation) {
                return $CommercialEvaluation->evaluator->name;
            })
            ->addColumn('pe_lines', function ($CommercialEvaluation) {
                $PEList = "";
                

                

                foreach ($CommercialEvaluation->purchaseEnquiries as $key => $PurchaseEnquiry) {

                    //dd($PurchaseEnquiry->purchaseOrderActive->first()->status);

                    if($PurchaseEnquiry->company->pe_prefix == ''){
                        $PEList .= "PE-".$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id.' ('.
                            ($PurchaseEnquiry->purchaseOrderActive->first() ? ($PurchaseEnquiry->company->po_prefix == '' ? "PO-" : $PurchaseEnquiry->company->po_prefix.'-') . $PurchaseEnquiry->purchaseOrderActive->first()->purchase_order_group_id : 'No PO')
                            .')'.'<br>';
                    } else {
                        $PEList .= $PurchaseEnquiry->company->pe_prefix."-".$PurchaseEnquiry->purchase_enquiry_group_id.'-'.$PurchaseEnquiry->purchase_enquiry_ingroup_id.' ('.
                            ($PurchaseEnquiry->purchaseOrderActive->first() ? ($PurchaseEnquiry->company->po_prefix == '' ? "PO-" : $PurchaseEnquiry->company->po_prefix.'-') . $PurchaseEnquiry->purchaseOrderActive->first()->purchase_order_group_id : 'No PO')
                            .')'.'<br>';
                    }
                }
                return $PEList;
                // return $CommercialEvaluation->purchaseEnquiries->count();
            })
            ->addColumn('po_line', function ($CommercialEvaluation) {
                $PEList = "";
                foreach ($CommercialEvaluation->purchaseOrders as $key => $purchaseOrder) {
                    if($purchaseOrder->company->po_prefix == ''){
                        $PEList .= "PO-".$purchaseOrder->purchase_order_group_id.'<br>';
                    } else {
                        $PEList .= $purchaseOrder->company->po_prefix."-".$purchaseOrder->purchase_order_group_id.'<br>';
                    }
                }
                return $PEList;
                // return $CommercialEvaluation->purchaseEnquiries->count();
            })
            // ->addColumn('vendors_count', function ($CommercialEvaluation) {
            //     return $CommercialEvaluation->quotation->trackers->where('status', 'Commercial Evaluation Submitted')->count();
            // })
            ->editColumn('status', function ($CommercialEvaluation) {
                return '<b>'.$CommercialEvaluation->status.'<b>';
            })
            ->addColumn('action', function ($CommercialEvaluation) {
                if($CommercialEvaluation->status == "Commercial Evaluation fully executed"){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="QuotationRequest" data-recordid="'.$CommercialEvaluation->quotation->id.'"><i class="fa fa-info"></i> </button> ';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="QuotationRequest" data-recordid="'.$CommercialEvaluation->quotation->id.'"><i class="fa fa-info"></i> </button> '.' <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="QuotationRequest" data-recordid="'.$CommercialEvaluation->quotation->id.'"><i class="fa fa-edit"></i> </button>';
                }
                
                
            })
            ->addColumn('vendors_count', function ($CommercialEvaluation) {
                $vendorsList = "";
                foreach ($CommercialEvaluation->quotation->trackers->where('status', 'FABO Submitted') as $key => $tracker) {
                    $vendorsList .= ($key+1).'. '.$tracker->vendor->name.'-ID#'.$tracker->vendor->id.'<br>';
                }
                //return count($PurchaseEnquiry->quotations[0]->vendors);
                return $vendorsList;
            })
            ->rawColumns(['action', 'vendors_count', 'pe_lines', 'po_line', 'status', 'rfi_full_id']);

        return $datatableReturn->make(true);
    }

    public function getCommericalEvaluationDetails(Request $request)
    {

        $user = $request->user();

        //For purchaseEnquiries.purchaseOrders we should find that all Purchase Orders are Having 'Rejected By Vendor' status (in other word we should not have any other status)
        $QuotationRequest = QuotationRequest::with('commericalEvaluation')->findOrFail($request->get('QuotationId'));

        return QuotationRequest::with([
            'company',
            'project',
            'trackers',
            'commericalEvaluation.evaluator',
            'purchaseEnquiries.item.itemTemplate',
            'purchaseEnquiries.purchaseOrders',
            'purchaseEnquiries.uploadedDocs',
            'purchaseEnquiries.rfis',
            'purchaseEnquiries.commericalEvaluations' => function ($query) use ($QuotationRequest) {
                $query->with('evaluator')->wherePivot('commerical_evaluation_id', $QuotationRequest->commericalEvaluation->id);
            },
            'purchaseEnquiries.vendorResponses',
            'Vendors' => function ($query) use ($request) {
                $query->wherePivot('status', 'Commercial Evaluation Submitted');
            }, 'Vendors.quotationResponses' => function ($query) use ($request) {
                $query->with('purchaseOrders')->where('quotation_responses.quotation_id', $request->get('QuotationId'));
            }])
            ->whereHas('trackers', function ($query1) {
                $query1->where('quotation_response_tracker.status', 'FABO Submitted');
            })
            ->whereHas('Vendors.quotationResponses')
            ->findOrFail($request->get('QuotationId'));

    }


    public function getRCCommericalEvaluationsDatatable(Request $request)
    {
        $user = $request->user();

        $CommercialEvaluations = CommercialEvaluation::with('evaluator', 'quotation.Vendors', 'company')
            ->whereHas('quotation', function ($query1) {
                $query1->where('quotation_requests.quotation_for', 'RC');
            })
            ->where('company_id', $user->company_id)->select('quotation_commerical_evaluations.*');


        $datatableReturn = Datatables::of($CommercialEvaluations)
            ->editColumn('id', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->id;
            })
            ->editColumn('start_date', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->start_date->format('d.M.Y');
            })
            ->editColumn('end_date', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->end_date->format('d.M.Y');
            })
            ->addColumn('evaluator', function ($CommercialEvaluation) {
                return $CommercialEvaluation->evaluator->name;
            })
            ->addColumn('linesCount', function ($CommercialEvaluation) {
                return $CommercialEvaluation->rateContractRequests->count();
            })
            ->addColumn('vendors_count', function ($CommercialEvaluation) {
                return $CommercialEvaluation->quotation->trackers->where('status', 'Commercial Evaluation Submitted')->count();
            })
            ->addColumn('action', function ($CommercialEvaluation) {
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="QuotationRequest" data-recordid="'.$CommercialEvaluation->quotation->id.'"><i class="fa fa-edit"></i> </button>';
                
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);
    }


    public function getRCCommericalEvaluationDetails(Request $request)
    {

        $user = $request->user();

        //For rateContractRequests.rateContracts we should find all Rate Rate are Having 'Rejected By Vendor' status (in other word we should not have any other status)

        return QuotationRequest::with(['trackers', 'rateContractRequests.item', 'rateContractRequests.rateContracts', 'rateContractRequests.uploadedDocs', 'rateContractRequests.rfis', 'rateContractRequests.commericalEvaluations', 'rateContractRequests.vendorResponses', 'Vendors' => function ($query) use ($request) {
                $query->wherePivot('status', 'Commercial Evaluation Submitted');
            }, 'Vendors.quotationRCResponses' => function ($query) use ($request) {
                $query->with('rateContracts')->where('rate_contract_quotation_responses.quotation_id', $request->get('QuotationId'));
            }])->whereHas('trackers', function ($query1) {
                $query1->where('quotation_response_tracker.status', 'Commercial Evaluation Submitted');
            })->whereHas('Vendors.quotationRCResponses')->findOrFail($request->get('QuotationId'));

    }


    public function getPurchaseOrderDataTable(Request $request)
    {
        $user = $request->user();

        $PurchaseOrders = PurchaseOrder::with(['creator', 'company', 'vendor', 'purchaseEnquiries', 'vendorResponses', 'history'])->where('purchase_orders.company_id', $user->company_id)->select('purchase_orders.*');
        
        $datatableReturn = Datatables::of($PurchaseOrders)
            ->addColumn('po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries->count();
            })
            ->addColumn('approved_po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('rejected_po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Rejected By%')->count();
            })
            ->addColumn('action', function ($PurchaseOrder) use ($user) {

                $UserApprovalLevel = Role::where('company_id', $user->company_id)->where('role_name', 'POV')->where('user_id', $user->id)->pluck('role_level')->toArray();

                //in_array($PurchaseOrder->approval_level, $UserApprovalLevel)
                if( $PurchaseOrder->status == 'Approvals Fully Completed - PO Sent To Vendor' || ($PurchaseOrder->status == 'Fully Rejected') || ($PurchaseOrder->status == 'Rejected By Vendor') || !in_array($PurchaseOrder->approval_level, $UserApprovalLevel) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning disabled" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder"  data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="PurchaseOrder"  data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-edit"></i> </button>';
                }
                
                
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);
    }

    public function getPurchaseOrderDetails(Request $request)
    {
        $user = $request->user();
        
        $PODetails = PurchaseOrder::findOrFail($request->get('POId'));


        return PurchaseOrder::with([
            'creator',
            'company',
            'project',
            'vendor',
            'quotation.Vendors',
            'commercialEvaluation',
            'history.currentActionBy',
            'purchaseEnquiries.uploadedDocs',
            'purchaseEnquiries.item.itemTemplate',
            'vendorResponses' => function ($query1) {
                $query1->with(['purchaseEnquiry.item.itemTemplate', 'purchaseEnquiry.purchaseOrders' => function ($query2) {
                    $query2->where('purchase_order_purchase_enquiries_pivot.status', 'NOT LIKE', '%Rejected%')->where('purchase_order_purchase_enquiries_pivot.status', 'NOT LIKE', '%Final Approval%');
                    }])->whereHas('purchaseEnquiry', function ($query2) {
                        $query2->whereHas('purchaseOrders', function ($query4){
                            $query4->with('purchaseOrders')->where('purchase_order_purchase_enquiries_pivot.status', 'NOT LIKE', '%Rejected%')->where('purchase_order_purchase_enquiries_pivot.status', 'NOT LIKE', '%Final Approval%');
                    });
                });
            },
            'vendorResponses.purchaseEnquiry.rfis' => function ($query2) use ($PODetails) {
                $query2->where('quotation_pe_rfi_communication.vendor_id', $PODetails->vendor_id);
            },
            'vendorResponses.purchaseEnquiry.uploadedDocs' => function ($query3) use ($PODetails) {
                $query3->where('purchase_enquiry_vendor_uploaded_docs.vendor_id', $PODetails->vendor_id);
            },
            'vendorResponses.purchaseEnquiry.item'])
            ->findOrFail($request->get('POId'));
    }


    public function getRateContractApprovalDataTable(Request $request)
    {
        $user = $request->user();

        $RateContracts = RateContract::with(['creator', 'company', 'vendor', 'rateContractRequests', 'vendorResponses', 'history'])->where('rate_contracts.company_id', $user->company_id)->select('rate_contracts.*');
        
        $datatableReturn = Datatables::of($RateContracts)
            ->addColumn('rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests->count();
            })
            ->addColumn('approved_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('rejected_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Rejected By%')->count();
            })
            ->addColumn('action', function ($RateContract) use ($user) {

                $UserApprovalLevel = Role::where('company_id', $user->company_id)->where('role_name', 'RCV')->where('user_id', $user->id)->pluck('role_level')->toArray();

                //in_array($RateContract->approval_level, $UserApprovalLevel)
                if( $RateContract->status == 'Approvals Fully Completed - RC Sent To Vendor' || ($RateContract->status == 'Fully Rejected') || ($RateContract->status == 'Rejected By Vendor') || !in_array($RateContract->approval_level, $UserApprovalLevel) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContract" data-recordid="'.$RateContract->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning disabled" data-elquentClass="RateContract" data-recordid="'.$RateContract->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContract"  data-recordid="'.$RateContract->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="RateContract"  data-recordid="'.$RateContract->id.'"><i class="fa fa-edit"></i> </button>';
                }
                
                
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);
    }


    public function getRateContractDataTable(Request $request)
    {
        $user = $request->user();

        $RateContracts = RateContract::with(['creator', 'company', 'vendor', 'rateContractRequests', 'vendorResponses', 'history'])->where('rate_contracts.company_id', $user->company_id)->where('status', 'Accepted By Vendor')->select('rate_contracts.*');
        
        $datatableReturn = Datatables::of($RateContracts)
            ->addColumn('rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests->count();
            })
            ->addColumn('approved_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('rejected_rc_line_count', function ($RateContract) {
                return $RateContract->rateContractRequests()->wherePivot('status', 'LIKE', '%Rejected By%')->count();
            })
            ->addColumn('action', function ($RateContract) use ($user) {

                $UserApprovalLevel = Role::where('company_id', $user->company_id)->where('role_name', 'RCV')->where('user_id', $user->id)->pluck('role_level')->toArray();

                //in_array($RateContract->approval_level, $UserApprovalLevel)
                if( $RateContract->status == 'Approvals Fully Completed - RC Sent To Vendor' || ($RateContract->status == 'Fully Rejected') || ($RateContract->status == 'Rejected By Vendor') || !in_array($RateContract->approval_level, $UserApprovalLevel) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContract" data-recordid="'.$RateContract->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning disabled" data-elquentClass="RateContract" data-recordid="'.$RateContract->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RateContract"  data-recordid="'.$RateContract->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="RateContract"  data-recordid="'.$RateContract->id.'"><i class="fa fa-edit"></i> </button>';
                }
                
                
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);
    }


    public function getRateContractDetails(Request $request)
    {
        $user = $request->user();
        
        $RCDetails = RateContract::findOrFail($request->get('RCId'));


        return RateContract::with(['creator', 'company', 'vendor', 'history.currentActionBy', 'rateContractRequests.uploadedDocs'
            , 'vendorResponses' => function ($query1) {
                $query1->with(['rateContractRequest.rateContracts' => function ($query2) {
                    $query2->where('rate_contract_rate_contract_request_pivot.status', 'NOT LIKE', '%Rejected%')->where('rate_contract_rate_contract_request_pivot.status', 'NOT LIKE', '%Final Approval%');
                    }])->whereHas('rateContractRequest', function ($query2) {
                        $query2->whereHas('rateContracts', function ($query4){
                            $query4->with('rateContracts')->where('rate_contract_rate_contract_request_pivot.status', 'NOT LIKE', '%Rejected%')->where('rate_contract_rate_contract_request_pivot.status', 'NOT LIKE', '%Final Approval%');
                    });
                });
            }, 'vendorResponses.rateContractRequest.rfis' => function ($query2) use ($RCDetails) {
                $query2->where('quotation_rc_rfi_communication.vendor_id', $RCDetails->vendor_id);
            }, 'vendorResponses.rateContractRequest.uploadedDocs' => function ($query3) use ($RCDetails) {
                $query3->where('rate_contract_request_vendor_uploaded_docs.vendor_id', $RCDetails->vendor_id);
            }, 'vendorResponses.rateContractRequest.item'])->findOrFail($request->get('RCId'));
    }


    public function getPOLineRFIDetails(Request $request)
    {
        return POLineRFICommunication::with('user', 'company', 'purchaseOrder', 'purchaseEnquiry')->where('pe_id', $request->get('PEId'))->get();
    }

    public function getRCLineRFIDetails(Request $request)
    {
        return RCLineRFICommunication::with('user', 'company', 'rateContract', 'rateContractRequest')->where('rc_id', $request->get('RCId'))->get();
    }

    public function getUserPurchaseOrderDataTable(Request $request)
    {
        $user = $request->user();

        $PurchaseOrders = PurchaseOrder::with(['creator', 'company', 'vendor', 'purchaseEnquiries', 'vendorResponses', 'history'])->whereHas('purchaseEnquiries', function ($query) use ($user) {
                $query->where('purchase_enquiries.created_by', $user->id);
            })->where('purchase_orders.company_id', $user->company_id)->select('purchase_orders.*');


        $datatableReturn = Datatables::of($PurchaseOrders)
            ->addColumn('po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries->count();
            })
            ->addColumn('action', function ($PurchaseOrder) {
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="PurchaseOrder"><i class="fa fa-edit"></i> </button>';
                
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);
    }


    public function getPORNsDatatable(Request $request)
    {

        $user = $request->user();

        $PurchaseOrders = PurchaseOrder::with(['receiptNotes', 'company', 'vendor', 'purchaseEnquiries', 'vendorResponses', 'history'])->where('company_id', $user->company_id)->where('status', 'Accepted By Vendor')->select('purchase_orders.*');

        $datatableReturn = Datatables::of($PurchaseOrders)
            ->addColumn('po_line_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries->count();
            })
            ->addColumn('total_po_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->purchaseEnquiries()->wherePivot('status', 'LIKE', '%Final Approval%')->count();
            })
            ->addColumn('partially_received_not_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Partially Received Not Approved')->orWhere('status', 'Partially Shipped')->orWhere('status', 'Fully Shipped')->count();
            })
            ->addColumn('partially_received_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Partially Received And Approved')->count();
            })
            ->addColumn('fully_received_not_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Fully Received Not Approved')->count();
            })
            ->addColumn('fully_received_approved_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'Fully Received And Approved')->count();
            })
            ->addColumn('canceled_po_lines_count', function ($PurchaseOrder) {
                return $PurchaseOrder->receiptNotes()->where('status', 'PO Line Cancelled')->count();
            })
            ->addColumn('action', function ($PurchaseOrder) {
                
                return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="PurchaseOrder" data-recordid="'.$PurchaseOrder->id.'"><i class="fa fa-edit"></i> </button>';
            
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);

    }


    public function getPORNsDetails(Request $request)
    {
        $ResultData = [];
        $PendingQuantity = array();
        $ReceivedQuantity = array();

        $ActiveReceivedNotes = ReceiptNote::with(['purchaseOrder', 'purchaseEnquiry', 'receivingRecords' => function ($query){
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        }])->where('po_id', $request->get('POId'))->get();

        foreach ($ActiveReceivedNotes as $ReceiptNoteID => $ActiveReceivedNote) {
            $ReceivedQuantity[$ReceiptNoteID] = 0;
            foreach ($ActiveReceivedNote->receivingRecords as $key => $receivingRecord) {
                $ReceivedQuantity[$ReceiptNoteID] = $ReceivedQuantity[$ReceiptNoteID] + $receivingRecord->received_quantity;
            }

            $PendingQuantity[$ReceiptNoteID] = $ActiveReceivedNote->purchaseEnquiry->quantity  - $ReceivedQuantity[$ReceiptNoteID];
        }



        $ReceiptNote =  ReceiptNote::with(['purchaseOrder', 'receivingRecords', 'purchaseEnquiry.item', 'quotationReponse'])->where('po_id', $request->get('POId'))->get();

        $ResultData[0] = $ReceiptNote;
        $ResultData['ReceivedQuantity'] = $ReceivedQuantity;
        $ResultData['PendingQuantity'] = $PendingQuantity;

        return $ResultData;
    }


    public function getPORNsApprovalsDatatable(Request $request)
    {

        $user = $request->user();
        $RNVUserAssignedProjectIds = $user->roles->where('role_name', 'RNV')->pluck('project_id');
        $RNVUserAssignedLevels = Role::where('company_id', $user->company_id)->where('role_name', 'RNV')->where('user_id', $user->id)->pluck('role_level')->toArray();


        $RNReceivings = RNReceiving::with('receiver', 'receiptNote.purchaseOrder', 'receiptNote.purchaseEnquiry', 'receiptNote.vendor', 'receiptNote.quotationReponse')->whereHas('receiptNote', function ($query) use ($RNVUserAssignedProjectIds, $user) {
            $query->where('company_id', $user->company_id)->whereIn('project_id', $RNVUserAssignedProjectIds);
        })->select('receipt_note_receivings.*');

        $datatableReturn = Datatables::of($RNReceivings)
            ->addColumn('po_line_id', function ($RNReceiving) {
                return $RNReceiving->receiptNote->receipt_note_group_id.'-'.$RNReceiving->receiptNote->receipt_note_ingroup_id;
            })
            ->addColumn('action', function ($RNReceiving) use ($RNVUserAssignedLevels) {

                if(strpos($RNReceiving->status, 'Receiving Completely Rejected') !== false || strpos($RNReceiving->status, 'Final Approval - ') !== false || !in_array($RNReceiving->current_approval_level, $RNVUserAssignedLevels)){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RNReceiving" data-recordid="'.$RNReceiving->id.'"><i class="fa fa-info"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="RNReceiving" data-recordid="'.$RNReceiving->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-warning edit-placeholder" data-elquentClass="RNReceiving" data-recordid="'.$RNReceiving->id.'"><i class="fa fa-edit"></i> </button>';
                }
                
                
            
            })
            ->rawColumns(['action']);

        return $datatableReturn->make(true);

    }


    public function receivingDetailsForApproval(Request $request)
    {
        $user = $request->user();
        $ReceivingInfo = RNReceiving::findOrFail($request->get('ReceivingId'));
        return $ReceivingInfo->load('receiptNote.quotationReponse', 'receiver', 'history.currentActionBy');

    }

    public function getPOInvoicingDetails(Request $request)
    {
        $ResultData = [];
        $PendingQuantity = array();
        $ReceivedQuantity = array();
        $InvoicableQuantity = array();
        $InvoicableAmount = array();
        $InvoicedAmount = array();

        $ActiveReceivedNotes = ReceiptNote::with(['purchaseEnquiry', 'invoices' => function ($query) {
            $query->where('status', '!=', 'Invoice Rejected');
        }, 'receivingRecords' => function ($query){
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        }])->whereHas('receivingRecords', function ($query) {
            $query->where('status', 'NOT LIKE', '%Receiving Completely Rejected %');
        })->get();

        foreach ($ActiveReceivedNotes as $ReceiptNoteID => $ActiveReceivedNote) {
            $ReceivedQuantity[$ReceiptNoteID] = 0;
            $InvoicableQuantity[$ReceiptNoteID] = 0;
            $InvoicableAmount[$ReceiptNoteID] = 0;
            $InvoicedAmount[$ReceiptNoteID] = 0;
            foreach ($ActiveReceivedNote->receivingRecords as $key => $receivingRecord) {
                $ReceivedQuantity[$ReceiptNoteID] = $ReceivedQuantity[$ReceiptNoteID] + $receivingRecord->received_quantity;
                if(strpos($receivingRecord->status, 'Final Approva') == false){
                    $InvoicableQuantity[$ReceiptNoteID] = $InvoicableQuantity[$ReceiptNoteID] + $receivingRecord->received_quantity;
                    $InvoicableAmount[$ReceiptNoteID] = $InvoicableAmount[$ReceiptNoteID] + $receivingRecord->value_of_received_quantity;
                }
            }

            //Get Invoiced Amount
            foreach ($ActiveReceivedNote->invoices as $key => $vendorInvoice) {
                $InvoicedAmount[$ReceiptNoteID] = $InvoicedAmount[$ReceiptNoteID] + $vendorInvoice->invoice_amount;
            }

            $PendingQuantity[$ReceiptNoteID] = $ActiveReceivedNote->purchaseEnquiry->quantity  - $ReceivedQuantity[$ReceiptNoteID];
        }



        $ReceiptNote =  ReceiptNote::with(['invoices', 'receivingRecords', 'purchaseEnquiry.item', 'quotationReponse'])->where('po_id', $request->get('POId'))->get();

        $ResultData[0] = $ReceiptNote;
        $ResultData['ReceivedQuantity'] = $ReceivedQuantity;
        $ResultData['PendingQuantity'] = $PendingQuantity;
        $ResultData['InvoicableQuantity'] = $InvoicableQuantity;
        $ResultData['InvoicableAmount'] = $InvoicableAmount;
        $ResultData['InvoicedAmount'] = $InvoicedAmount;

        return $ResultData;
    }


    public function getUserRecentActivitiesDataTable(Request $request)
    {
        $user = $request->user();

        //$activities = $user->actions->sortBy('id'); // Everything done BY the user
        $activities = $user->activity->sortBy('id'); // Everything done To the user

        $datatableReturn = Datatables::of($activities)
            ->editColumn('created_at', function ($activity) {
                return $activity->created_at ? with(new Carbon($activity->created_at))->format('d.M.Y - (H:i:s)') : '';
            })
            ->editColumn('subject_type', function ($activity) {
                if ($activity->subject_type == 'App\User') {
                    return 'Self';
                } else if("App\PurchaseEnquiry"){
                    return 'Purchase Enquiry';
                } else {
                    return $activity->subject_type;
                }
            })
            ->editColumn('subject_id', function ($activity) {
                return 'ID# '.$activity->subject_id;
            })
            ->editColumn('properties', function ($activity) {
                if(count($activity->properties)){
                    return $activity->properties;
                } else {
                    return 'N/A';
                }
            });
        return $datatableReturn->make(true);
    }


    public function getItemRateContractDetails(Request $request)
    {
        $user = $request->user();

        $RateContract = RateContract::with(['vendorResponses' => function ($query1) use ($request, $user) {
            $query1->with('rateContractRequest')->where('item_id', $request->get('ItemId'))->where('company_id',  $user->company_id);
        }])->whereHas('rateContractRequests', function ($query) use ($request, $user) {
            $query->where('item_id', $request->get('ItemId'))->where('company_id',  $user->company_id);
        })->get();

        return $RateContract;

    }
    public function chectItemRateContractDetails(Request $request)
    {
        $user = $request->user();

        $RateContract = RateContract::with(['vendorResponses' => function ($query1) use ($request, $user) {
            $query1->with('rateContractRequest')->where('item_id', $request->get('ItemId'))->where('company_id',  $user->company_id);
        }])->whereHas('rateContractRequests', function ($query) use ($request, $user) {
            $query->where('item_id', $request->get('ItemId'))->where('company_id',  $user->company_id);
        })->get();

        return $RateContract;

    }

    public function getCompaniesList(Request $request)
    {
        $companies = Company::select('id', 'name')->get();
        return $companies;
    }

    public function getCompanyUsersList(Request $request)
    {

        $companyUsers = User::select('id', 'name')->where('company_id', $request->get('CompanyId'))->get();
        return $companyUsers;
    }


    public function getStockItemApprovalList(Request $request)
    {


        $user = $request->user();

        //Get purchase enquiries per company
        $StockItems = StockItem::with('creator', 'item')->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_items.*');


        return Datatables::of($StockItems)
            ->addColumn('show_id', 'SID-{{$stock_item_group_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SID-', stock_item_group_id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($StockItem) {
                if($StockItem->item_id == null){
                    return $StockItem->item_description;
                } else {
                    return $StockItem->item->description;
                }
            })
            ->addColumn('action', function ($StockItem) use ($user) {

                //get the level of approvals allowed to this item' project for this user
                $UserApprovalLevel = $StockItem->project->roles->where('role_name', 'ASTMGR')->where('user_id', $user->id)->pluck('role_level')->toArray();
                $UserApprovalLevel[] = "0"; //adding rejected item with 0 level.
                
                if((in_array($StockItem->approval_level, $UserApprovalLevel) && strpos($StockItem->status, 'Created') !== false) || (in_array($StockItem->approval_level, $UserApprovalLevel) && strpos($StockItem->status, 'for approval') !== false) ){
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItem" data-recordid="'.$StockItem->id.'"><i class="fa fa-info"></i> </button> <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="StockItem" data-recordid="'.$StockItem->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-warning view-placeholder" data-elquentClass="StockItem" data-recordid="'.$StockItem->id.'"><i class="fa fa-info"></i> </button> <button disabled class="btn btn-xs btn-primary" data-elquentClass="StockItem"><i class="fa fa-edit" data-recordid="'.$StockItem->id.'"></i> </button>';
                };
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);

       

                

                //only if use has this level within this project
                // 

    }



    public function getUserDashboardReports(Request $request)
    {
        $user = $request->user();
        $now = Carbon::now();
        $finalReports = [];
        $allReports = Chart::all();

        foreach ($allReports as $reportNumber => $report) {


            $SQLQuery = $report->sql_query;
            $ChartOptions = $report->chart_options;
            $FilterationVariables = $report->filteration_variables;
            $FormatedDataSet = [];

            /* SQL Query Massaging */
            $SQLQuery = str_replace('$GetLoggedInUserId', ''.$user->id.'', $SQLQuery); //''.$user->id.''
            $SQLQuery = str_replace('$now(0)', ''.$now->format('Y-m-d').'', $SQLQuery);

        
            /* Handling Fixed Dates */
            for ($i=0; $i < 10; $i++) { 
                $value = getBetween($SQLQuery, '$now(', ')');
                if (!is_int($value) && $value < 1) {
                    $NumberOnly = substr($value, 1);
                    $SQLQuery = str_replace('$now('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
                } else if (!is_int($value) && $value > 1){
                    $SQLQuery = str_replace('$now('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
                }
            }

            /* Handling "FROM" Variable Dates */
            for ($i=1; $i <= 10; $i++) { 
                $value = getBetween($SQLQuery, '$dateRange'.$i.'FromNow(', ')');
                $now = Carbon::now();
                if($value == 0) {
                    $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->format('Y-m-d').'', $SQLQuery);
                } else if (!is_int($value) && $value < 1) {
                    $NumberOnly = substr($value, 1);
                    $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
                } else if (!is_int($value) && $value > 1){
                    $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
                }
            }

            /* Handling "TO" Variable Dates */
            for ($x=1; $x <= 10; $x++) {
                $value = getBetween($SQLQuery, '$dateRange'.$x.'ToNow(', ')');
                $now = Carbon::now(); 
                if($value == 0) {
                    $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->format('Y-m-d').'', $SQLQuery);
                } else if (!is_int($value) && $value < 1) {
                    $NumberOnly = substr($value, 1);
                    $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
                } else if (!is_int($value) && $value > 1){
                    $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
                }
            }


            /* Convert Each $Filter# to The First Value Encountered in Varaibles List */
            foreach ($FilterationVariables as $key => $Filter) {

                if($Filter['FilterData'] != 'FilterDataDateRangePicker'){
                
                    if(is_array($Filter['FilterData'])){
                            $SQLQuery = str_replace($Filter["FilterNumber"], "'".$Filter['FilterData'][0]['id']."'", $SQLQuery);
                    } else {
                        //Run SQL Query and get the first value...
                        
                        $OptionsDropDownSQLQuery = str_replace('$GetLoggedInUserId', ''.$user->id.'', $Filter['FilterData']); //''.$user->id.''
                        $getListOfOptions = DB::select(DB::raw($OptionsDropDownSQLQuery));
                        $getListOfOptions = json_decode(json_encode($getListOfOptions), true);
                        if(count($getListOfOptions)){
                            $SQLQuery = str_replace($Filter["FilterNumber"], "'".$getListOfOptions[0]['id']."'", $SQLQuery);
                        }

                        $FilterationVariables[$key]['FilterData'] = $getListOfOptions;
                    }
                }
            }

            // Check if valid $SQLQuery then execute and store chart data else the user may not have any access to the selected filters so skip
            if(strpos($SQLQuery, '$Filter') === false){

                /* Get data based on the sql query and decode json */
                $SQLQueryResults = DB::select(DB::raw($SQLQuery));
                $SQLQueryResults = json_decode(json_encode($SQLQueryResults), true);


                /* Assign First Row (This is Headers Row)*/
                if(count($SQLQueryResults)){
                    $FormatedDataSet[0] = array_keys($SQLQueryResults[0]);

                    /* Convert $SQLQueryResults into two dimensional array for Correct Representation into Dataset: source: field */
                    foreach ($SQLQueryResults as $key => $DBRow) {
                        foreach ($FormatedDataSet[0] as $index => $Header) {
                            $FormatedDataSet[$key+1][] = $DBRow[$Header];
                        }
                    }

                    /* Assign data set to chart options */
                    $ChartOptions['dataset']['source'] = $FormatedDataSet;
                } else {
                    $ChartOptions['dataset']['source'] = [];
                }

            
                $finalReports[$reportNumber]['SQLQueryResults']      = $SQLQueryResults;
                $finalReports[$reportNumber]['ChartOptions']         = $ChartOptions;
                $finalReports[$reportNumber]['FilterationVariables'] = $FilterationVariables;
                $finalReports[$reportNumber]['ColumnWidth']          = $report->chart_col_width;
                $finalReports[$reportNumber]['ChartID']              = $report->id;    
            
            }

        }
        
        return $finalReports;

    }



    public function updateChartData(Request $request)
    {
        $user = $request->user();
        $now = Carbon::now();
        
        $ChartID = $request->get('ChartID');
        $FiltersValues = $request->get('FiltersValues');
        $FilterValue = $request->get('FilterValue');
        $report = Chart::findOrFail($ChartID);

        $SQLQuery = $report->sql_query;
        $ChartOptions = $report->chart_options;
        $FilterationVariables = $report->filteration_variables;
        $FormatedDataSet = [];

        $daysValues = [];

        /* SQL Query Massaging */
        $SQLQuery = str_replace('$GetLoggedInUserId', ''.$user->id.'', $SQLQuery); //''.$user->id.''
        $SQLQuery = str_replace('$now(0)', ''.$now->format('Y-m-d').'', $SQLQuery);
        
        /* Handling Fixed Dates */
        for ($i=0; $i < 10; $i++) { 
            $value = getBetween($SQLQuery, '$now(', ')');
            if (!is_int($value) && $value < 1) {
                $NumberOnly = substr($value, 1);
                $SQLQuery = str_replace('$now('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
            } else if (!is_int($value) && $value > 1){
                $SQLQuery = str_replace('$now('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
            }
        }


        //return $SQLQuery;
        

        /* Convert Each $Filter# to The First Value Encountered in Varaibles List */
        foreach ($FiltersValues as $FilterNumber => $FilterValue) {
        
            /* Check if the $FilterNumber does not include the word "$Filter" */
            if(strpos($FilterNumber, '$Filter') === false){
                 
                if(!array_key_exists('isTrusted', $FilterValue)){

                    $dateRangeNumber = substr($FilterNumber, -1);
                    $fromDate = $FilterValue[0];
                    $toDate =$FilterValue[1];

                    $value = getBetween($SQLQuery, '$dateRange'.$dateRangeNumber.'FromNow(', ')');
                    $SQLQuery = str_replace('$dateRange'.$dateRangeNumber.'FromNow('.$value.')', ''.$fromDate.'', $SQLQuery);
                    $value = getBetween($SQLQuery, '$dateRange'.$dateRangeNumber.'ToNow(', ')');
                    $SQLQuery = str_replace('$dateRange'.$dateRangeNumber.'ToNow('.$value.')', ''.$toDate.'', $SQLQuery);

                } else {
                    /* Handling "FROM" Variable Dates */
                    for ($i=1; $i <= 10; $i++) { 
                        $value = getBetween($SQLQuery, '$dateRange'.$i.'FromNow(', ')');
                        $now = Carbon::now();
                        if($value == 0) {
                            $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->format('Y-m-d').'', $SQLQuery);
                        } else if (!is_int($value) && $value < 1) {
                            $NumberOnly = substr($value, 1);
                            $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
                        } else if (!is_int($value) && $value > 1){
                            $SQLQuery = str_replace('$dateRange'.$i.'FromNow('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
                        }
                    }

                    /* Handling "TO" Variable Dates */
                    for ($x=1; $x <= 10; $x++) {
                        $value = getBetween($SQLQuery, '$dateRange'.$x.'ToNow(', ')');
                        $now = Carbon::now(); 
                        if($value == 0) {
                            $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->format('Y-m-d').'', $SQLQuery);
                        } else if (!is_int($value) && $value < 1) {
                            $NumberOnly = substr($value, 1);
                            $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->subDays($NumberOnly)->format('Y-m-d').'', $SQLQuery);
                        } else if (!is_int($value) && $value > 1){
                            $SQLQuery = str_replace('$dateRange'.$x.'ToNow('.$value.')', ''.$now->addDays($value)->format('Y-m-d').'', $SQLQuery);
                        }
                    }
                }
                

            } else {
                $SQLQuery = str_replace($FilterNumber, "'".$FilterValue."'", $SQLQuery);
            }
            
        }

        /* Get data based on the sql query and decode json */
        $SQLQueryResults = DB::select(DB::raw($SQLQuery));
        $SQLQueryResults = json_decode(json_encode($SQLQueryResults), true);


        if(count($SQLQueryResults)){
            /* Assign First Row (This is Headers Row)*/
            $FormatedDataSet[0] = array_keys($SQLQueryResults[0]);

            /* Convert $SQLQueryResults into two dimensional array for Correct Representation into Dataset: source: field */
            foreach ($SQLQueryResults as $key => $DBRow) {
                foreach ($FormatedDataSet[0] as $index => $Header) {
                    $FormatedDataSet[$key+1][] = $DBRow[$Header];
                }
            }
            
            /* Assign data set to chart options */
            $ChartOptions['dataset']['source'] = $FormatedDataSet;
        } else {
            $ChartOptions['dataset']['source'] = [];
        }

       return response()->json([
            "ChartOptions" => $ChartOptions
        ], 200);
        

    }


}
