<?php

namespace App\Http\Controllers;

use App\ApprovalItemMasterHistory;
use App\ApprovalBudgetMasterHistory;
use App\Company;
use App\Events\MessageToUserToTakeAction;
use App\FinancialLimit;
use App\Http\Requests\ChangePasswordRequest;
use App\ItemCreationRequest;
use App\BudgetCreationRequest;
use App\ItemCreationRequestHistory;
use App\BudgetCreationRequestHistory;
use Excel;
use Validator;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Auth;
use App\Imports\TemplateImport;
use App\Imports\UsersImport;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Validators\ValidationException;
use Illuminate\Support\Facades\Storage;
use App\ItemMaster;
use App\BudgetMaster;
use App\ExcelUser;
use App\ExcelTamplate;
use App\ItemMasterSetup;
use App\Notifications\CompanyRFIResponseNotification;
use App\Notifications\ItemCreatedFullValidatedNotification;
use App\Notifications\BudgetCreatedFullValidatedNotification;
use App\Notifications\ItemCreatedValidationNotification;
use App\Notifications\BudgetCreatedValidationNotification;
use App\Notifications\ItemCreationLMARejectedNotification;
use App\Notifications\ItemCreationRequestNotifications;
use App\Notifications\BudgetCreationRequestNotifications;
use App\Notifications\ItemCreationRequestRejectedNotification;
use App\Notifications\BudgetCreationRequestRejectedNotification;
use App\Notifications\NewUserCreatedNotifications;
use App\Notifications\newCompanyCreationNotification;
use App\Project;
use App\PurchaseEnquiry;
use App\QuotationRequest;
use App\QuotationResponseTracker;
use App\RFICommunication;
use App\RateContractRequest;
use App\Role;
use App\StockItemIssueRequest;
use App\StockItemRequest;
use App\StockItemReturnRequest;
use App\User;
use Illuminate\Support\Facades\Input;
use App\Vendor;
use App\Country;
use App\City;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use PDF;
use DB;
use Lcobucci\JWT\Parser;
use Twilio;
use yajra\Datatables\Datatables;

class UsersController extends Controller
{  

    public function get_companies(Request $request){
          $companies=Company::where('active','Yes')->get();
          return response()->json(['status'=>true,'companies'=>$companies]);
        }

    public function get_Employees(Request $request){
        $user=User::find($request->user_id);
        if($user->company_id == 0){
            $users=User::select('id','name','email','picture')->get();
        }
        else{
            $users=User::where('company_id',$user->company_id)->where('id','!=',$user->id)->select('id','name','email','picture')->get();
        }
        return response()->json(['status'=>true,'users'=>$users]);
    }
    
    public function get_role(Request $request){
        $user=User::find($request->user_id);
        $role=Role::where('user_id',$user->id)->first();
        return response()->json(['status'=>true,'role'=>$role]);
    }  

    public function update_Employees(Request $request){
        // return $request->all_users;
    DB::beginTransaction();
    try{
        $user=User::find($request->user_id);
        $allusers = User::all();
        $LoginImage = $request->file('LoginImage');

        if ($LoginImage) {
            $filecontents       = file_get_contents($LoginImage);
            $fileName           = $LoginImage->getClientOriginalName();
            $extension          = $LoginImage->getClientOriginalExtension() ?: 'png';
            $folderName         = '/public/uploads/ProfileImages/';
            $destinationPath    = base_path() . $folderName;
            $safeName           = 'image'.rand(100,1000).time().$extension;
            $LoginImage->move($destinationPath, $safeName);
        }


        if($LoginImage){
            if($request->all_users == "true"){
                foreach($allusers as $a_user){
                    // return $a_user;
                    $a_user->login_image = $safeName;
                    $a_user->save();
                }
                
            }
            else{
                $user->login_image = $safeName;
                $user->save();
            }
        }
        DB::commit();

        return response()->json([
            "messageTitle"      => 'LoginImage Updated Successfully.',
            "message"           => 'LoginImage are now updated successfully.',
            "messageType"       => 'success',
        ], 200);

    }catch(\Exception $e){
        DB::rollback();
        return response()->json([
            "messageTitle"      => 'Error',
            "message"           => $e->getMessage(),
            "messageType"       => 'error',
        ], 200);
    }
        

        
    }



    public function get_Referrals(Request $request){
        $users=User::where('ref_id',$request->user_id)->select('name','email','picture')->get();
        return response()->json(['status'=>true,'users'=>$users]);
     }   

    /** 
     * logout api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function logout(Request $request){ 

        // $user = Auth::user(); 
        // $request->user()->token()->revoke();
        // $request->user()->token()->delete();


        $bearerToken = $request->bearerToken();
        $id = (new Parser())->parse($bearerToken)->getHeader('jti');
        
        //$token= $request->user()->tokens->find($id);

        /* Only In Laravel 5.6 */
        /* Log Out From Selected Devices */
        $revoked = DB::table('oauth_access_tokens')
            ->where('id', $id)
            ->update([
                'revoked' => true
            ]);

        /* Log Out From All Devices */
        // DB::table('oauth_access_tokens')
        //     ->where('user_id', Auth::user()->id)
        //     ->update([
        //         'revoked' => true
        //     ]);

        if($revoked){ 
            //return response()->json(['success' => 'Logged Out Successfully.'], $this->successStatus);

            return response([
                'status' => 'success',
                'msg' => 'Logged out Successfully.'
            ], 200);

        } 
        else{ 
            //return response()->json(['error' => 'Unable To Logout Or Access Already Revoked'], 401); 

            return response([
                'status' => 'error',
                'msg' => 'Unable To Logout Or Access Already Revoked.'
            ], 200);
        }

        
        
    }

    public function getUserDetails(Request $request)
    {

        $UserRoles = [];
        $user = $request->user();

        $UserDetails['userId'] = $request->user()->id;
        $UserDetails['CompanyId'] = $request->user()->company_id;
        $UserDetails['Name'] = $request->user()->name;
        $UserDetails['Email'] = $request->user()->email;
        $UserDetails['Picture'] = $request->user()->picture;
        $UserDetails['Designation'] = $request->user()->designation;
        $UserDetails['Phone'] = $request->user()->phone_number;
        $UserDetails['Address'] = $request->user()->address;
        $UserDetails['onboarding'] = $request->user()->onboarding;


        $UserRolesDB = $request->user()->roles;
        foreach ($UserRolesDB as $key => $value) {
            $UserDetails[$value['role_name']] = $value['role_name'];
        }

        // If the company does not required LOM then remove these roles from the list
        if($request->user()->company()->exists()){ //Check if we are not logged in as system admin
            if($request->user()->company->lom_manditory == "FreeText"){
                if (($key = array_search('ALMR', $UserDetails)) !== false) {
                    unset($UserDetails[$key]);
                }
                if (($key = array_search('LMA', $UserDetails)) !== false) {
                    unset($UserDetails[$key]);
                }
                if (($key = array_search('ALMV', $UserDetails)) !== false) {
                    unset($UserDetails[$key]);
                }
            }
        }
        
        return $UserDetails;
    }

	public function ChangePassword(ChangePasswordRequest $request)
    {

        $user = $request->user();

		if(Hash::check($request->get('old'), $user->password)){

    		$user->password = bcrypt($request->get('password'));
    		$user->update();

    		return response()->json([
	    		"message" => 'Password Changed Successfully.'
	    	], 200);
    	}

    	return response()->json([
    		"message" => 'Wrong Old Password.'
    	], 422);
    	
    }
    public function getfirstStep(Request $request){
        $user = $request->user();
        $company_id=$user->company_id;
        if($company_id){
            $company=Company::find($company_id);
            $countriesstring = explode(',', $company->countries);
            foreach($countriesstring as $country)
            {
                $getcountries[] = Country::where('id', $country)->pluck('country_name')->first();
            }
            // return $getcountries;

            $return_arr=array(
                'CompanyLogo'=>$company->logo,
                'companyName'=>$company->name,
                'companyTime'=>$company->company_time,
                'CompanyEmployeeRange'=>$company->employees_range,
                'CompanyIndustry'=>explode(',',$company->industry),
                'CompanyCities'=>explode(',', $company->cities),
                'CompanyCountries'=>$getcountries,
            );
        }else{
            $return_arr=array(
                'CompanyLogo'=>'',
                'companyName'=>'',
                'companyTime'=>'',
                'CompanyEmployeeRange'=>'',
                'CompanyIndustry'=>[],
                'CompanyCountries'=>[],
                'CompanyCities'=>[],
            );
        }
        return response()->json(['status'=>true,'company'=> $return_arr,'step'=>$user->step]); 
    }

    public function setfirstStep(Request $request){
        // return $request;
        DB::beginTransaction();

        try { 
        $user = $request->user();
        $company_id=$user->company_id;
        $FirstStepData = $request->all()['FirstStepData'];
        $FirstStepData = json_decode($FirstStepData, true);
            
        $step=$user->step;
        if($step<1){
            $user->step=1;
            $user->save();
        }

        if($company_id){
            $company=Company::find($company_id);
            
            $CompanyLogo = $request->file('CompanyLogo');
       
            if ($CompanyLogo)
            {
                $filecontents       = file_get_contents($CompanyLogo);
                $fileName           = $CompanyLogo->getClientOriginalName();
                $extension          = $CompanyLogo->getClientOriginalExtension() ?: 'png';
                $folderName         = '/public/uploads/Logos/';
                $destinationPath    = base_path() . $folderName;
                $safeName           = time().$fileName;
                $CompanyLogo->move($destinationPath, $safeName);
                $company->logo=$safeName;
            }
         

      
            $company->name=$FirstStepData['companyName'];
            $company->company_time=$FirstStepData['companyTime'];
            $company->setup_mode='Project Wise';
            $company->employees_range=$FirstStepData['CompanyEmployeeRange'];
            $company->industry= implode(',', $FirstStepData['CompanyIndustry']);
            // $company->cities=$FirstStepData['CompanyCities'];
            $company->countries= implode(',' , $FirstStepData['CompanyCountries']);
            $company->cities= implode(',' , $FirstStepData['CompanyCities']);
        
           $company->save();

           return response()->json(['status'=>true,'message'=>  $company_id]);

        }else{
          $CompanyLogo = $request->file('CompanyLogo');
       
            if ($CompanyLogo)
            {
                $filecontents       = file_get_contents($CompanyLogo);
                $fileName           = $CompanyLogo->getClientOriginalName();
                $extension          = $CompanyLogo->getClientOriginalExtension() ?: 'png';
                $folderName         = '/public/uploads/Logos/';
                $destinationPath    = base_path() . $folderName;
                $safeName           = time().$fileName;
                $CompanyLogo->move($destinationPath, $safeName);
            }
         
            $company=new Company();
            $company->created_by=$user->id;
         
            $company->name=$FirstStepData['companyName'];
            $company->company_time=$FirstStepData['companyTime'];
            $company->setup_mode='Project Wise';
            $company->employees_range=$FirstStepData['CompanyEmployeeRange'];
            $company->industry= implode(',', $FirstStepData['CompanyIndustry']);
            $company->countries= implode(',' , $FirstStepData['CompanyCountries']);
            $company->cities= implode(',' , $FirstStepData['CompanyCities']);
            $company->logo=$safeName;
          
            $company->save();

              //update original User with company ID
            $user->company_id = $company->id;
            $user->update();  

            //update role with (CAD)
            $role = $user->roles->first();
            $role->company_id = $company->id;
            $role->update(); 
            DB::commit();
            return response()->json(['status'=>true,'message'=>'created']);
 
        }
    } catch (\Exception $e) {
        DB::rollback();
        return response()->json(['status'=>false,'message'=>$e->getMessage()]);
    }

    
    }



    public function getsecondStep(Request $request){
        $user = $request->user();
        $company_id=$user->company_id;

            $company=Company::find($company_id);
            if($company){
                $return_arr=array(
                    'companyPEPrefix'=>$company->pe_prefix,
                    'companyRFQPrefix'=>$company->rfq_prefix,
                    'companyRNPrefix'=>$company->rn_prefix,
                    'companyPOPrefix'=>$company->po_prefix,
                    'companyComEvalPrefix'=>$company->ce_prefix,
                    'companyAdditionalField'=>$company->additional_required_1,
                    'companyStoreAdditionalField'=>$company->additional_required_store,
                    'companySTRIPrefix'=>'',
                    'companySTRRPrefix'=>''
                   
                );
            }else{
                $return_arr=array(
                    'companyPEPrefix'=>'',
                    'companyRFQPrefix'=>'',
                    'companyRNPrefix'=>'',
                    'companyPOPrefix'=>'',
                    'companyComEvalPrefix'=>'',
                    'companyAdditionalField'=>'',
                    'companyStoreAdditionalField'=>'',
                    'companySTRIPrefix'=>'',
                    'companySTRRPrefix'=>''
                   
                );
            }

            
       
        return response()->json(['status'=>true,'company'=> $return_arr]); 
    }


    public function setsecondStep(Request $request){
        DB::beginTransaction();

        try { 
            $user = $request->user();
            $company_id=$user->company_id;
            $SecondStepData = $request->all()['SecondStepData'];
            $SecondStepData = json_decode($SecondStepData, true);

            $step=$user->step;
            if($step<2){
                $user->step=2;
                $user->save();
            }


            $company=Company::find($company_id);
            $company->pe_prefix=$SecondStepData['companyPEPrefix'];
            $company->rfq_prefix= $SecondStepData['companyRFQPrefix'];
            $company->rn_prefix= $SecondStepData['companyRNPrefix'];
            $company->po_prefix= $SecondStepData['companyPOPrefix'];
            $company->ce_prefix= $SecondStepData['companyComEvalPrefix'];
            $company->customization_numbering= $SecondStepData['CustomizationNumbering'];
            $company->additional_required_1=$SecondStepData['companyAdditionalField'];
            $company->additional_required_store=$SecondStepData['companyStoreAdditionalField'];
          
            $company->save();
            DB::commit();
            return response()->json(['status'=>true,'message'=> 'Second Step Updated']);
        
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['status'=>false,'message'=>$e->getMessage()]);
        }
    }



    public function getthirdStep(Request $request){
        $user = $request->user();
        $templates=array();
        $company_id=$user->company_id;

        $company=Company::find($company_id);
        if($company){
            $LastestPERecord = ItemMasterSetup::where('company_id', $company->id)->orderBy('template_group_id', 'desc')->get();
            $count=0;
            foreach($LastestPERecord as $item){
                  $ConsolidatedTitles="";
                 if($item->field_1!="Ogeo-None"){
                    $ConsolidatedTitles=$item->field_1;
                 }
                 if($item->field_2!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_2;
                 }
                 if($item->field_3!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_3;
                 }
                 if($item->field_4!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_4;
                 }
                 if($item->field_5!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_5;
                 }
                 if($item->field_6!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_6;
                 }
                 if($item->field_7!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_7;
                 }
                 if($item->field_8!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_8;
                 }
                 if($item->field_9!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_9;
                 }
                 if($item->field_10!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_10;
                 }
                 if($item->field_11!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_11;
                 }
                 if($item->field_12!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_12;
                 }
                 if($item->field_13!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_13;
                 }
                 if($item->field_14!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_14;
                 }
                 if($item->field_15!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_15;
                 }
                 if($item->field_16!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_16;
                 }
                 if($item->field_17!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_17;
                 }
                 if($item->field_18!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_18;
                 }
                 if($item->field_19!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_19;
                 }
                 if($item->field_20!="Ogeo-None"){
                    $ConsolidatedTitles.=" | ".$item->field_20;
                 }
    
                
                $templates[]=array(
                    'ID'=>$count,
                    'Template_Name'=>$item->template_name,
                    'Field_1_Required'=>(($item->field_1!="Ogeo-None") ? true : false),
                    'Field_1_Header'=>$item->field_1,
                    'Field_1_Mandatory'=>$item->field_1_required,
    
                    'Field_2_Required'=>(($item->field_2!="Ogeo-None") ? true : false),
                    'Field_2_Header'=>$item->field_2,
                    'Field_2_Mandatory'=>$item->field_2_required,
    
                    'Field_3_Required'=>(($item->field_3!="Ogeo-None") ? true : false),
                    'Field_3_Header'=>$item->field_3,
                    'Field_3_Mandatory'=>$item->field_3_required,
    
                    'Field_4_Required'=>(($item->field_4!="Ogeo-None") ? true : false),
                    'Field_4_Header'=>$item->field_4,
                    'Field_4_Mandatory'=>$item->field_4_required,
    
                    'Field_5_Required'=>(($item->field_5!="Ogeo-None") ? true : false),
                    'Field_5_Header'=>$item->field_5,
                    'Field_5_Mandatory'=>$item->field_5_required,
    
                    'Field_6_Required'=>(($item->field_6!="Ogeo-None") ? true : false),
                    'Field_6_Header'=>$item->field_6,
                    'Field_6_Mandatory'=>$item->field_6_required,
    
                    'Field_7_Required'=>(($item->field_7!="Ogeo-None") ? true : false),
                    'Field_7_Header'=>$item->field_7,
                    'Field_7_Mandatory'=>$item->field_7_required,
    
                    'Field_8_Required'=>(($item->field_8!="Ogeo-None") ? true : false),
                    'Field_8_Header'=>$item->field_8,
                    'Field_8_Mandatory'=>$item->field_8_required,
    
                    'Field_9_Required'=>(($item->field_9!="Ogeo-None") ? true : false),
                    'Field_9_Header'=>$item->field_9,
                    'Field_9_Mandatory'=>$item->field_9_required,
    
                    'Field_10_Required'=>(($item->field_10!="Ogeo-None") ? true : false),
                    'Field_10_Header'=>$item->field_10,
                    'Field_10_Mandatory'=>$item->field_10_required,
    
                    'Field_11_Required'=>(($item->field_11!="Ogeo-None") ? true : false),
                    'Field_11_Header'=>$item->field_11,
                    'Field_11_Mandatory'=>$item->field_11_required,
    
                    'Field_12_Required'=>(($item->field_12!="Ogeo-None") ? true : false),
                    'Field_12_Header'=>$item->field_12,
                    'Field_12_Mandatory'=>$item->field_12_required,
    
                    'Field_13_Required'=>(($item->field_13!="Ogeo-None") ? true : false),
                    'Field_13_Header'=>$item->field_13,
                    'Field_13_Mandatory'=>$item->field_13_required,
    
                    'Field_14_Required'=>(($item->field_14!="Ogeo-None") ? true : false),
                    'Field_14_Header'=>$item->field_14,
                    'Field_14_Mandatory'=>$item->field_14_required,
    
                    'Field_15_Required'=>(($item->field_15!="Ogeo-None") ? true : false),
                    'Field_15_Header'=>$item->field_15,
                    'Field_15_Mandatory'=>$item->field_15_required,
    
                    'Field_16_Required'=>(($item->field_16!="Ogeo-None") ? true : false),
                    'Field_16_Header'=>$item->field_16,
                    'Field_16_Mandatory'=>$item->field_16_required,
    
                    
                    'Field_17_Required'=>(($item->field_17!="Ogeo-None") ? true : false),
                    'Field_17_Header'=>$item->field_17,
                    'Field_17_Mandatory'=>$item->field_17_required,
    
                    
                    'Field_18_Required'=>(($item->field_18!="Ogeo-None") ? true : false),
                    'Field_18_Header'=>$item->field_18,
                    'Field_18_Mandatory'=>$item->field_18_required,
    
                    
                    'Field_19_Required'=>(($item->field_19!="Ogeo-None") ? true : false),
                    'Field_19_Header'=>$item->field_19,
                    'Field_19_Mandatory'=>$item->field_19_required,
    
                    
                    'Field_20_Required'=>(($item->field_20!="Ogeo-None") ? true : false),
                    'Field_20_Header'=>$item->field_20,
                    'Field_20_Mandatory'=>$item->field_20_required,
    
                    'ConsolidatedTitles'=>$ConsolidatedTitles,
                    
                    'Action'=>'<button type="button" class="btn btn-block btn-danger"><i class="fa fa-remove"></i> </button>'
                   
                   
                );
            }
    
            $return_arr=array(
                'companyLoMManditory'=>$company->lom_manditory,
                'companyLoMPrefix'=>$company->lom_prefix,     
            );

        }else{
            $templates=[];
            $return_arr=array(
                'companyLoMManditory'=>'',
                'companyLoMPrefix'=>'',     
            );
        }
        
       



        return response()->json(['status'=>true,'company'=> $return_arr,'templates'=>$templates]); 
    }

    public function setthirdStep(Request $request){
        DB::beginTransaction();

        try { 

            $user = $request->user();
            $company_id=$user->company_id;
            $ThirdStepData = $request->all()['ThirdStepData'];
            $ThirdStepData = json_decode($ThirdStepData, true);

            $step=$user->step;
            if($step<3){
                $user->step=3;
                $user->save();
            }

            $TemplatesDetails = $request->all()['TemplatesDetails'];
            $TemplatesDetails = json_decode($TemplatesDetails, true);

            $company=Company::find($company_id);
            $company->lom_manditory=$ThirdStepData['companyLoMManditory'];
            $company->lom_prefix=$ThirdStepData['companyLoMPrefix'];
            $company->third_party_vendors=$request->ThirdPartyVendors;

            $company->save();

            if(!empty($TemplatesDetails)){


                //Assing grouping Id Per company
                $LastestPERecord = ItemMasterSetup::where('company_id', $company->id)->orderBy('template_group_id', 'desc')->get();
                foreach($LastestPERecord as $item){
                    $item->delete();
                }

                $GroupId = 1;
                $InGroupId = 1;
              


                foreach ($TemplatesDetails as $key => $ItemMasterSetupData) {

                    ItemMasterSetup::create([
                        'template_group_id'     => $GroupId,
                        'template_ingroup_id'   => $InGroupId,
                        'created_by'        => $user->id,
                        'company_id'        => $company->id,
                        'template_name'     => $ItemMasterSetupData['Template_Name'],
                        'field_1_required'  => ($ItemMasterSetupData['Field_1_Mandatory'] == 'Yes') ? 'Yes' : 'No',
                        'field_2_required'  => $ItemMasterSetupData['Field_2_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_3_required'  => $ItemMasterSetupData['Field_3_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_4_required'  => $ItemMasterSetupData['Field_4_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_5_required'  => $ItemMasterSetupData['Field_5_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_6_required'  => $ItemMasterSetupData['Field_6_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_7_required'  => $ItemMasterSetupData['Field_7_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_8_required'  => $ItemMasterSetupData['Field_8_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_9_required'  => $ItemMasterSetupData['Field_9_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_10_required' => $ItemMasterSetupData['Field_10_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_11_required' => $ItemMasterSetupData['Field_11_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_12_required' => $ItemMasterSetupData['Field_12_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_13_required' => $ItemMasterSetupData['Field_13_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_14_required' => $ItemMasterSetupData['Field_14_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_15_required' => $ItemMasterSetupData['Field_15_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_16_required' => $ItemMasterSetupData['Field_16_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_17_required' => $ItemMasterSetupData['Field_17_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_18_required' => $ItemMasterSetupData['Field_18_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_19_required' => $ItemMasterSetupData['Field_19_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_20_required' => $ItemMasterSetupData['Field_20_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                        'field_1'           => $ItemMasterSetupData['Field_1_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_1_Header'],
                        'field_2'           => $ItemMasterSetupData['Field_2_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_2_Header'],
                        'field_3'           => $ItemMasterSetupData['Field_3_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_3_Header'],
                        'field_4'           => $ItemMasterSetupData['Field_4_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_4_Header'],
                        'field_5'           => $ItemMasterSetupData['Field_5_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_5_Header'],
                        'field_6'           => $ItemMasterSetupData['Field_6_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_6_Header'],
                        'field_7'           => $ItemMasterSetupData['Field_7_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_7_Header'],
                        'field_8'           => $ItemMasterSetupData['Field_8_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_8_Header'],
                        'field_9'           => $ItemMasterSetupData['Field_9_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_9_Header'],
                        'field_10'          => $ItemMasterSetupData['Field_10_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_10_Header'],
                        'field_11'          => $ItemMasterSetupData['Field_11_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_11_Header'],
                        'field_12'          => $ItemMasterSetupData['Field_12_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_12_Header'],
                        'field_13'          => $ItemMasterSetupData['Field_13_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_13_Header'],
                        'field_14'          => $ItemMasterSetupData['Field_14_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_14_Header'],
                        'field_15'          => $ItemMasterSetupData['Field_15_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_15_Header'],
                        'field_16'          => $ItemMasterSetupData['Field_16_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_16_Header'],
                        'field_17'          => $ItemMasterSetupData['Field_17_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_17_Header'],
                        'field_18'          => $ItemMasterSetupData['Field_18_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_18_Header'],
                        'field_19'          => $ItemMasterSetupData['Field_19_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_19_Header'],
                        'field_20'          => $ItemMasterSetupData['Field_20_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_20_Header'],
                    ]);
                }
            }

            DB::commit();
            return response()->json(['status'=>true,'message'=> 'Third Step Updated']);


        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['status'=>false,'message'=>$e->getMessage()]);
        }
    }


    public function getfourthStep(Request $request){

        // return 'fourth step get'; 

        try { 


        $user = $request->user();
        $company_id=$user->company_id;
        $projectDetails=array();
        $company=Company::find($company_id);

       

        if($company){
            $projects=Project::where('company_id',$company->id)->where('created_by',$user->id)->get();
            foreach($projects as $project){
    
                $CAD=array();
                $PRO=array();
                $PRV=array();
                $ALMR=array();
                $LMA=array();
                $ALMV=array();
                $RFQM=array();
                $POO=array();
                $POV=array();
                $RNO=array();
                $RNV=array();
                $SLM=array();
                $SUBO=array();
                $SUBV=array();
                $INV=array();
               
                $RCCO=array();
                $RCCV=array();
                $RCO=array();
                $RCV=array();
                $ASTMGR=array();
                $SIIRPT=array();
                $RTIRS=array();
                $ATSIRS=array();
                $RTSI=array();
                $ATSI=array();
        
        
        
        
                $level1=array();
                $level2=array();
                $level3=array();
                $level4=array();
                $level5=array();
                $level6=array();
                $level7=array();
                $level8=array();
        
                $ASTMGR_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ASTMGR')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $ASTMGR_Number=(string)$roles->count();
                if($ASTMGR_Number==0){
                    $ASTMGR_Number=null;
                }
    
                $ATSIRS_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ATSIRS')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $ATSIRS_Number=(string)$roles->count();
                if($ATSIRS_Number==0){
                    $ATSIRS_Number=null;
                }
    
                $ATSI_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ATSI')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $ATSI_Number=(string)$roles->count();
                if($ATSI_Number==0){
                    $ATSI_Number=null;
                }
    
                $PRV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','PRV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $PRV_Number=(string)$roles->count();
                if($PRV_Number==0){
                    $PRV_Number=null;
                }
    
                $ALMV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ALMV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $ALMV_Number=(string)$roles->count();
                if($ALMV_Number==0){
                    $ALMV_Number=null;
                }
    
    
                $POV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','POV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $POV_Number=(string)$roles->count();
                if($POV_Number==0){
                    $POV_Number=null;
                }

                $SUBV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','SUBV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $SUBV_Number=(string)$roles->count();
                if($SUBV_Number==0){
                    $SUBV_Number=null;
                }
    
                $RNV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RNV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $RNV_Number=(string)$roles->count();
                if($RNV_Number==0){
                    $RNV_Number=null;
                }
    
    
                $RCCV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCCV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $RCCV_Number=(string)$roles->count();
                if($RCCV_Number==0){
                    $RCCV_Number=null;
                }
    
    
                $RCV_Number=null;
                $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCV')->groupBy('role_level') ->select('role_level', DB::raw('count(*) as total'))->get();
                $RCV_Number=(string)$roles->count();
                if($RCV_Number==0){
                    $RCV_Number=null;
                }
    
    
    
                $POV_Financial_Details=array(); 
                $count=0;
                $limits=FinancialLimit::where('company_id',$company->id)->where('project_id',$project->id)->where('limit_type','POV')->get();
                foreach($limits as $limit){
                 
                    $POV_Financial_Details[]=array(
                        'index'=> $count,
                        'POV_Level'=>$limit->level,
                        'Currency'=>$limit->currency,
                        'Limit'=>$limit->limit
                    );
                    $count++;
                }

                $SUBV_Financial_Details=array(); 
                $count=0;
                $limits=FinancialLimit::where('company_id',$company->id)->where('project_id',$project->id)->where('limit_type','SUBV')->get();
                foreach($limits as $limit){
                 
                    $SUBV_Financial_Details[]=array(
                        'index'=> $count,
                        'SUBV_Level'=>$limit->level,
                        'Currency'=>$limit->currency,
                        'Limit'=>$limit->limit
                    );
                    $count++;
                }
    
    
                $RNV_Financial_Details=array(); 
                $count=0;
                $limits=FinancialLimit::where('company_id',$company->id)->where('project_id',$project->id)->where('limit_type','RNV')->get();
                foreach($limits as $limit){
                    $RNV_Financial_Details[]=array(
                        'index'=> $count,
                        'RNV_Level'=>$limit->level,
                        'Currency'=>$limit->currency,
                        'Limit'=>$limit->limit
                    );
                    $count++;
                }
    
    
                $RCV_Financial_Details=array(); 
                $count=0;
                $limits=FinancialLimit::where('company_id',$company->id)->where('project_id',$project->id)->where('limit_type','RCV')->get();
                foreach($limits as $limit){
                    $RCV_Financial_Details[]=array(
                        'index'=> $count,
                        'RCV_Level'=>$limit->level,
                        'Currency'=>$limit->currency,
                        'Limit'=>$limit->limit
                    );
                    $count++;
                }
    
    
               
    
    
    
    
    
    
    
                $cad_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','CAD')->get();
                foreach($cad_roles as $role){
                    $user=User::find($role->user_id);
                    $CAD[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
                $pro_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','PRO')->get();
                foreach($pro_roles as $role){
                    $user=User::find($role->user_id);
                    $PRO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
                $prv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','PRV')->get();
                foreach($prv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $PRV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
                $almv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ALMV')->get();
                foreach($almv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $ALMV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
                $almr_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ALMR')->get();
                foreach($almr_roles as $role){
                    $user=User::find($role->user_id);
                    $ALMR[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
                $lma_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','LMA')->get();
                foreach($lma_roles as $role){
                    $user=User::find($role->user_id);
                    $LMA[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $almv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ALMV')->get();
                foreach($almv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $ALMV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
    
                $rfqm_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RFQM')->get();
                foreach($rfqm_roles as $role){
                    $user=User::find($role->user_id);
                    $RFQM[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $poo_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','POO')->get();
                foreach($poo_roles as $role){
                    $user=User::find($role->user_id);
                    $POO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $pov_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','POV')->get();
                foreach($pov_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $POV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
                
                $subv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','SUBV')->get();
                foreach($subv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $SUBV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];

                $rno_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RNO')->get();
                foreach($rno_roles as $role){
                    $user=User::find($role->user_id);
                    $RNO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $rnv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RNV')->get();
                foreach($rnv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $RNV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
                $slm_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','SLM')->get();
                foreach($slm_roles as $role){
                    $user=User::find($role->user_id);
                    $SLM[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
                $subo_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','SUBO')->get();
                foreach($subo_roles as $role){
                    $user=User::find($role->user_id);
                    $SUBO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $inv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','INV')->get();
                foreach($inv_roles as $role){
                    $user=User::find($role->user_id);
                    $INV[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $rcco_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCCO')->get();
                foreach($rcco_roles as $role){
                    $user=User::find($role->user_id);
                    $RCCO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
    
                $rccv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCCV')->get();
                foreach($rccv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $RCCV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
    
                $rco_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCO')->get();
                foreach($rco_roles as $role){
                    $user=User::find($role->user_id);
                    $RCO[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
    
                $rcv_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RCV')->get();
                foreach($rcv_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $RCV=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
                $astmgr_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ASTMGR')->get();
                foreach($astmgr_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $ASTMGR=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
    
                $siirpt_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','SIIRPT')->get();
                foreach($siirpt_roles as $role){
                    $user=User::find($role->user_id);
                    $SIIRPT[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $rtirs_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RTIRS')->get();
                foreach($rtirs_roles as $role){
                    $user=User::find($role->user_id);
                    $RTIRS[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
                $atsirs_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ATSIRS')->get();
                foreach($atsirs_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $ATSIRS=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
                
    
                $rtsi_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','RTSI')->get();
                foreach($rtsi_roles as $role){
                    $user=User::find($role->user_id);
                    $RTSI[]=array(
                      'fullName'=>$user->name,
                      'email'=>$user->email,
                      'designation'=>$user->designation
                    );
    
                }
    
    
    
                $atsi_roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('role_name','ATSI')->get();
                foreach($atsi_roles as $role){
                    $user=User::find($role->user_id);
    
                    switch ($role->role_level) {
                        case 1:
                          $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                          break;
                        case 2:
                            $level2[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 3:
                            $level3[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                              );
                              break;
                        case 4:
                            $level4[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 5:
                            $level5[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 6:
                            $level6[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 7:
                            $level7[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;  
                        case 8:
                            $level8[]=array(
                                'fullName'=>$user->name,
                                'email'=>$user->email,
                                'designation'=>$user->designation 
                                );
                                break;      
                        default:
                        $level1[]=array(
                            'fullName'=>$user->name,
                            'email'=>$user->email,
                            'designation'=>$user->designation 
                          );
                        
                      }
    
                    
                }
    
                $ATSI=array(
                    'level_1'=>$level1,
                    'level_2'=>$level2,
                    'level_3'=>$level3,
                    'level_4'=>$level4,
                    'level_5'=>$level5,
                    'level_6'=>$level6,
                    'level_7'=>$level7,
                    'level_8'=>$level8,
                );
                $level1=[];
                $level2=[];
                $level3=[];
                $level4=[];
                $level5=[];
                $level6=[];
                $level7=[];
                $level8=[];
    
    
    
                $projectDetails[]=array(
                   'StoreSetup'=>$project->setup_type,
                   'ProjectTitle'=>$project->title,
                   'ProjectPeriod'=>array($project->start_date,$project->end_date),
                   'ProjectValue'=>$project->value,
                   'ProjectPODOACriterion'=>$project->po_doa_criterion,
                   'ProjectRNDOACriterion'=>$project->rn_doa_criterion,
                   'ProjectAuctionType'=>explode(',',$project->auction_types),
                   'ProjectCompanyCurrency'=>$project->currency,
                   'ProjectTsNCs'=>$project->terms_n_conditions,
                    'CAD_List'=>$CAD,
                    'PRO_List'=>$PRO,
                    'PRV_List'=>$PRV,
                    'ALMR_List'=>$ALMR,
                    'LMA_List'=>$LMA,
                    'ALMV_List'=>$ALMV,
                    'RFQM_List'=>$RFQM,
                    'POO_List'=>$POO,
                    'POV_List'=>$POV,
                    'SUBV_List'=>$SUBV,
                    'RNO_List'=>$RNO,
                    'RNV_List'=>$RNV,
                    'SLM_List'=>$SLM,
                    'SUBO_List'=>$SUBO,
                    'INV_List'=>$INV,
                    'RCCO_List'=>$RCCO,
                    'RCCV_List'=>$RCCV,
                    'RCO_List'=>$RCO,
                    'RCV_List'=>$RCV,
                    'POV_Financial_Details'=>$POV_Financial_Details,
                    'SUBV_Financial_Details'=>$SUBV_Financial_Details,
                    'RNV_Financial_Details'=>$RNV_Financial_Details,
                    'ASTMGR_List'=>$ASTMGR,
                    'SIIRPT_List'=>$SIIRPT,
                    'RTIRS_List'=>$RTIRS,
                    'ATSIRS_List'=>$ATSIRS,
                    'RTSI_List'=>$RTSI,
                    'ATSI_List'=>$ATSI,
                    'ASTMGR_Number'=>$ASTMGR_Number,
                    'ATSIRS_Number'=>$ATSIRS_Number,
                    'ATSI_Number'=>$ATSI_Number,
                    'PRV_Number'=>$PRV_Number,
                    'ALMV_Number'=>$ALMV_Number,
                    'POV_Number'=>$POV_Number,
                    'SUBV_Number'=>$SUBV_Number,
                    'RNV_Number'=>$RNV_Number,
                    'RCCV_Number'=>$RCCV_Number,
                    'RCV_Number'=>$RCV_Number,
                    'RCV_Financial_Details'=>$RCV_Financial_Details
                );
            }
        }else{
            $projectDetails=[];
        }
      


        return response()->json(['status'=>true,'projects'=> $projectDetails]); 
    } catch (\Exception $e) {
       
        return response()->json(['status'=>false,'message'=>$e->getMessage()]);
    }

    }


    public function setfourthStep(Request $request){
        // return 'fourth step set';
        // return $request->all();
        DB::beginTransaction();

        try { 


        $user = $request->user();
        $userList = [];
        $RolesList = [];
        $company = Company::find($user->company_id);
        $step=$user->step;
        if($step<4){
            $user->step=4;
            $user->save();
        }

        
        $ProjectsDetails = $request->all()['ProjectsDetails'];
        $ProjectsDetails = json_decode($ProjectsDetails, true);
        $CompanyDetails = $request->all()['AccountSettingForm'];
        $CompanyDetails = json_decode($CompanyDetails, true);

        $projects=Project::where('company_id',$company->id)->get();
        foreach($projects as $project){
            $limits=FinancialLimit::where('company_id',$company->id)->where('project_id',$project->id)->get();
            foreach($limits as $limit){
                $limit->delete();
            }
            $userslist=User::where('company_id',$company->id)->where('id','!=',$user->id)->get();
            foreach($userslist  as $item){
                $item->delete();
            }

            $roles=Role::where('company_id',$company->id)->where('project_id',$project->id)->where('user_id','!=',$user->id)->get();
            foreach($roles as $role){
                $role->delete();
            }
            $project->delete();

        }

        foreach ($ProjectsDetails as $key => $ProjectInfo) {
        
            /* Validated Project Data Before Storing into DB (IF REQUIRED) */


            /* Store Project Details */
            $project = Project::create([
                'created_by'                    => $user->id,
                'company_id'                    => $company->id,
                'title'                         => $ProjectInfo['ProjectTitle'],
                'setup_type'                    => $ProjectInfo['StoreSetup'],
                // 'store_setup_cost'              => $ProjectInfo['StoreSetup'],
                // 'annual_holding_cost_per_unit'  => $ProjectInfo['StoreSetup'],
                'start_date'                    => $ProjectInfo['ProjectPeriod'][0],
                'end_date'                      => $ProjectInfo['ProjectPeriod'][1],
                'initial_end_date'                      => $ProjectInfo['ProjectPeriod'][1],
                'currency'                      => $ProjectInfo['ProjectCompanyCurrency'],
                'value'                         => str_replace( ',', '', $ProjectInfo['ProjectValue']),
                'initial_value'                 => str_replace( ',', '', $ProjectInfo['ProjectValue']),
                'po_doa_criterion'              => $ProjectInfo['ProjectPODOACriterion'],
                'rn_doa_criterion'              => $ProjectInfo['ProjectRNDOACriterion'],
                'auction_types'                 => implode(',', $ProjectInfo['ProjectAuctionType']),
                'terms_n_conditions'            => $ProjectInfo['ProjectTsNCs']
            ]);

            //storing POV financial limits
            foreach ($ProjectInfo['POV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'POV',
                    'level'         => $data['POV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing SUBV financial limits
            foreach ($ProjectInfo['SUBV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'SUBV',
                    'level'         => $data['SUBV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing RNV financial limits
            foreach ($ProjectInfo['RNV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'RNV',
                    'level'         => $data['RNV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing RNV financial limits
            foreach ($ProjectInfo['RCV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'RCV',
                    'level'         => $data['RCV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }
            

            /* Create Users */
            # get list of unique users
            foreach ($ProjectInfo as $ProjectInfoKey => $data) {
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
                        'company_id'    => $company->id, 
                        'name'          => $userDetails['fullName'], 
                        'email'         => $userDetails['email'],
                        'designation'   => $userDetails['designation'],
                        'picture'       => 'user_image.png',
                        'password'      => $randomPasswordHased
                    ]);

                //     # Send User Email Notification with the new Access Cridentials
                 // $NewUser->notify(new NewUserCreatedNotifications($randomPassword));
                 
                 }   
            }

            

            /* Arrange User Roles By Getting User Information (User_ID) */            
            foreach ($ProjectInfo as $ProjectInfoKey => $data) {
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
                            $UserInfo = User::where('email', $ListData['email'])->get()->first();
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
                            'company_id'    => $company->id,
                            'project_id'    => $project->id,
                            'user_id'       => $SingleEmployeeDetails['user_id'],
                            'role_name'     => substr($RoleName, 0, strpos($RoleName, '_')),
                            'role_level'    => substr($levelNumber, -1),
                        ]);
                    }
                }
            }
        }

        DB::commit();
        return response()->json(['status'=>true,'message'=> 'THird Step Updated']);

    } catch (\Exception $e) {
        DB::rollback();
        return response()->json(['status'=>false,'message'=>$e->getMessage()." on line ".$e->getLine()]);
    }


    }


    public function complete_onboading(Request $request){
        $user = $request->user();
        $user->onboarding=0;
        $user->save();

        $UserDetails['userId'] = $user->id;
        $UserDetails['CompanyId'] = $user->company_id;
        $UserDetails['Name'] = $user->name;
        $UserDetails['Email'] = $user->email;
        $UserDetails['Picture'] = $user->picture;
        $UserDetails['Designation'] = $user->designation;
        $UserDetails['Phone'] = $user->phone_number;
        $UserDetails['Address'] = $user->address;
        $UserDetails['onboarding'] = $user->onboarding;

        $UserDetails['LoginImage'] = "";
        

        return $UserDetails;   
    }








    public function UpdateAccountSettings(Request $request)
    {
        //Getting logged in user
        $user = $request->user();
        $userList = [];
        $RolesList = [];
        $safeName = "";
      
        
        //Segregating the values from the request
        $ProjectsDetails = $request->all()['ProjectsDetails'];
        $ProjectsDetails = json_decode($ProjectsDetails, true);
        $CompanyDetails = $request->all()['AccountSettingForm'];
        $CompanyDetails = json_decode($CompanyDetails, true);
        if(isset($request->all()['TemplatesDetails'])){
            $TemplatesDetails = $request->all()['TemplatesDetails'];
            $TemplatesDetails = json_decode($TemplatesDetails, true);
        } else {
            $TemplatesDetails = [];
        }
        $CompanyLogo = $request->file('CompanyLogo');

        //dd($ProjectsDetails);
        //dd($CompanyDetails);
       

        //upload logo
        if ($CompanyLogo)
        {
            $filecontents       = file_get_contents($CompanyLogo);
            $fileName           = $CompanyLogo->getClientOriginalName();
            $extension          = $CompanyLogo->getClientOriginalExtension() ?: 'png';
            $folderName         = '/public/uploads/Logos/';
            $destinationPath    = base_path() . $folderName;
            $safeName           = time().$fileName;
            $CompanyLogo->move($destinationPath, $safeName);
        }
    
        //Removing The default created project at the end of the array
        //array_pop($ProjectsDetails);


        //Validated Company Data Before Storing into DB
        # To be Completed (IF REQUIRED) #
        
        //Storing Company details
        $company = Company::create([
            'created_by'            => $user->id,
            'name'                  => $CompanyDetails['companyName'],
            'company_time'          =>  $CompanyDetails['companyTime'],
            'setup_mode'            => $CompanyDetails['procurementSetupMode'],
            'employees_range'       => $CompanyDetails['CompanyEmployeeRange'],
            'industry'              => implode(',', $CompanyDetails['CompanyIndustry']),
            'cities'                => $CompanyDetails['CompanyCities'],
            'pe_prefix'             => $CompanyDetails['companyPEPrefix'],
            'rfq_prefix'            => $CompanyDetails['companyRFQPrefix'],
            'rn_prefix'             => $CompanyDetails['companyRNPrefix'],
            'po_prefix'             => $CompanyDetails['companyPOPrefix'],
            'ce_prefix'             => $CompanyDetails['companyComEvalPrefix'],
            'additional_required_1' => $CompanyDetails['companyAdditionalField'],
            'additional_required_store' => $CompanyDetails['companyStoreAdditionalField'],
            'lom_manditory'         => $CompanyDetails['companyLoMManditory'],
            'lom_prefix'            => $CompanyDetails['companyLoMPrefix'],
            'logo'                  => $safeName
        ]);

        //update original User with company ID
        $user->company_id = $company->id;
        $user->update();  

        //update role with (CAD)
        $role = $user->roles->first();
        $role->company_id = $company->id;
        $role->update();  


        foreach ($ProjectsDetails as $key => $ProjectInfo) {
        
            /* Validated Project Data Before Storing into DB (IF REQUIRED) */


            /* Store Project Details */
            $project = Project::create([
                'created_by'                    => $user->id,
                'company_id'                    => $company->id,
                'title'                         => $ProjectInfo['ProjectTitle'],
                'setup_type'                    => $ProjectInfo['StoreSetup'],
                // 'store_setup_cost'              => $ProjectInfo['StoreSetup'],
                // 'annual_holding_cost_per_unit'  => $ProjectInfo['StoreSetup'],
                'start_date'                    => $ProjectInfo['ProjectPeriod'][0],
                'end_date'                      => $ProjectInfo['ProjectPeriod'][1],
                'currency'                      => $ProjectInfo['ProjectCompanyCurrency'],
                'value'                         => $ProjectInfo['ProjectValue'],
                'po_doa_criterion'              => $ProjectInfo['ProjectPODOACriterion'],
                'rn_doa_criterion'              => $ProjectInfo['ProjectRNDOACriterion'],
                'auction_types'                 => implode(',', $ProjectInfo['ProjectAuctionType']),
                'terms_n_conditions'            => $ProjectInfo['ProjectTsNCs']
            ]);

            //storing POV financial limits
            foreach ($ProjectInfo['POV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'POV',
                    'level'         => $data['POV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing SUBV financial limits
            foreach ($ProjectInfo['SUBV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'SUBV',
                    'level'         => $data['SUBV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing RNV financial limits
            foreach ($ProjectInfo['RNV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'RNV',
                    'level'         => $data['RNV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }

            //storing RNV financial limits
            foreach ($ProjectInfo['RCV_Financial_Details'] as $index => $data) {
                //return $data;
                FinancialLimit::create([
                    'company_id'    => $company->id,
                    'project_id'    => $project->id,
                    'limit_type'    => 'RCV',
                    'level'         => $data['RCV_Level'],
                    'currency'      => $data['Currency'],
                    'limit'         => $data['Limit']
                ]);
            }
            

            /* Create Users */
            # get list of unique users
            foreach ($ProjectInfo as $ProjectInfoKey => $data) {
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
                        'company_id'    => $company->id, 
                        'name'          => $userDetails['fullName'], 
                        'email'         => $userDetails['email'],
                        'designation'   => $userDetails['designation'],
                        'picture'       => 'user_image.png',
                        'password'      => $randomPasswordHased
                    ]);

                    # Send User Email Notification with the new Access Cridentials
                    $NewUser->notify(new NewUserCreatedNotifications($randomPassword));
                }   
            }

            

            /* Arrange User Roles By Getting User Information (User_ID) */            
            foreach ($ProjectInfo as $ProjectInfoKey => $data) {
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
                            $UserInfo = User::where('email', $ListData['email'])->get()->first();
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
                            'company_id'    => $company->id,
                            'project_id'    => $project->id,
                            'user_id'       => $SingleEmployeeDetails['user_id'],
                            'role_name'     => substr($RoleName, 0, strpos($RoleName, '_')),
                            'role_level'    => substr($levelNumber, -1),
                        ]);
                    }
                }
            }
        }


        /* Item Template Setup Creation */
        if(!empty($TemplatesDetails)){


            //Assing grouping Id Per company
            $LastestPERecord = ItemMasterSetup::where('company_id', $company->id)->orderBy('template_group_id', 'desc')->limit(1)->get()->first();

            //return $LastestPERecord->purchase_enquiry_group_id;
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = 1;
                $InGroupId = 1;
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $LastestPERecord->template_group_id + 1;
                $InGroupId = $LastestPERecord->template_group_id + 1;
            }


            foreach ($TemplatesDetails as $key => $ItemMasterSetupData) {

                ItemMasterSetup::create([
                    'template_group_id'     => $GroupId,
                    'template_ingroup_id'   => $InGroupId,
                    'created_by'        => $user->id,
                    'company_id'        => $company->id,
                    'template_name'     => $ItemMasterSetupData['Template_Name'],
                    'field_1_required'  => ($ItemMasterSetupData['Field_1_Mandatory'] == 'Yes') ? 'Yes' : 'No',
                    'field_2_required'  => $ItemMasterSetupData['Field_2_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_3_required'  => $ItemMasterSetupData['Field_3_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_4_required'  => $ItemMasterSetupData['Field_4_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_5_required'  => $ItemMasterSetupData['Field_5_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_6_required'  => $ItemMasterSetupData['Field_6_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_7_required'  => $ItemMasterSetupData['Field_7_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_8_required'  => $ItemMasterSetupData['Field_8_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_9_required'  => $ItemMasterSetupData['Field_9_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_10_required' => $ItemMasterSetupData['Field_10_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_11_required' => $ItemMasterSetupData['Field_11_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_12_required' => $ItemMasterSetupData['Field_12_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_13_required' => $ItemMasterSetupData['Field_13_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_14_required' => $ItemMasterSetupData['Field_14_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_15_required' => $ItemMasterSetupData['Field_15_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_16_required' => $ItemMasterSetupData['Field_16_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_17_required' => $ItemMasterSetupData['Field_17_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_18_required' => $ItemMasterSetupData['Field_18_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_19_required' => $ItemMasterSetupData['Field_19_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_20_required' => $ItemMasterSetupData['Field_20_Mandatory'] == 'Yes' ? 'Yes' : 'No',
                    'field_1'           => $ItemMasterSetupData['Field_1_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_1_Header'],
                    'field_2'           => $ItemMasterSetupData['Field_2_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_2_Header'],
                    'field_3'           => $ItemMasterSetupData['Field_3_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_3_Header'],
                    'field_4'           => $ItemMasterSetupData['Field_4_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_4_Header'],
                    'field_5'           => $ItemMasterSetupData['Field_5_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_5_Header'],
                    'field_6'           => $ItemMasterSetupData['Field_6_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_6_Header'],
                    'field_7'           => $ItemMasterSetupData['Field_7_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_7_Header'],
                    'field_8'           => $ItemMasterSetupData['Field_8_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_8_Header'],
                    'field_9'           => $ItemMasterSetupData['Field_9_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_9_Header'],
                    'field_10'          => $ItemMasterSetupData['Field_10_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_10_Header'],
                    'field_11'          => $ItemMasterSetupData['Field_11_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_11_Header'],
                    'field_12'          => $ItemMasterSetupData['Field_12_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_12_Header'],
                    'field_13'          => $ItemMasterSetupData['Field_13_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_13_Header'],
                    'field_14'          => $ItemMasterSetupData['Field_14_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_14_Header'],
                    'field_15'          => $ItemMasterSetupData['Field_15_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_15_Header'],
                    'field_16'          => $ItemMasterSetupData['Field_16_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_16_Header'],
                    'field_17'          => $ItemMasterSetupData['Field_17_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_17_Header'],
                    'field_18'          => $ItemMasterSetupData['Field_18_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_18_Header'],
                    'field_19'          => $ItemMasterSetupData['Field_19_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_19_Header'],
                    'field_20'          => $ItemMasterSetupData['Field_20_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_20_Header'],
                ]);
            }
        }

        //Notify admin about company setup completion
        $admin = User::findOrFail(1);
        $admin->notify(new newCompanyCreationNotification($company));


        $UserDetails = [];
        $UserDetails['CompanyId'] = $user->company_id;
        $UserDetails['Name'] = $user->name;
        $UserDetails['Email'] = $user->email;
        $UserDetails['Picture'] = $user->picture;

        return $UserDetails;        

    }

    public function DownloadExcelData()
    {
        // return 'i m here';
        // return Excel::download(new UsersExport, 'users.xlsx');

        // return response()->download(storage_path('/downloads' . '/' . 'users' . '.xls'));
        //PDF file is stored under project/public/download/info.pdf
        $file = public_path(). "\downloads\users.xlsx";
        // return $file;
        // dd($file);
        // return $file;
        $headers = array(
                'Content-Type: application/xlsx',
                );

                // return Storage::download('Appraisal Document.pdf');
                // return Storage::download($file, 'Appraisal Document.pdf', $headers);
        return response()->download($file);
    }

    public function UploadExcelData(Request $request){
        // return $request->all();
        $request->request->add([
            'select_file'       => $request->select_file,

        ]);
        $rules = array(
            'select_file'  => 'required|mimes:csv,txt,xlsx'
        );
        $messages = array(
            'select_file' => 'select xlsx file!',
        );

        $validator = Validator::make(Input::all(), $rules, $messages);
        
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ]);
        } 
        else 
        {
//             $path = $request->file('select_file')->getRealPath();
            $path1 = $request->file('select_file')->store('temp'); 
            $path=storage_path('app').'/'.$path1;  
            // Excel::load($request->file('select_file')->getRealPath(), function ($reader) {
            //     foreach ($reader->toArray() as $key => $row) {
            //         $data['user_id'] = Auth::user()->id;
            //         $data['employee_name'] = $row['employee_name'];
            //         $data['employee_email'] = $row['employee_email'];
            //         $data['employee_designation'] = $row['employee_designation'];

            //         if(!empty($data)) {
            //             DB::table('excel_user')->insert($data);
            //             $getdata = ExcelUser::where('user_id', Auth::user()->id)->get();
            //             $getdatadelete = ExcelUser::truncate();
            //         }
            //     }
            // });
            $import = new UsersImport();
            $import->import($path);
            // $data = Excel::import(new UsersImport, $path);
            $errors = [];    
            foreach ($import->failures() as $failure) {
                $errors[] = $failure->row(); // row that went wrong
                $errors[] = $failure->attribute(); // either heading key (if using heading row concern) or column index
                $errors[] = $failure->errors(); // Actual error messages from Laravel validator
                $errors[] = $failure->values(); // The values of the row that has failed.
            }
            // if($data->count() > 0)
            // {
            //     foreach($data->toArray() as $key => $rows)
            //     {
            //         foreach($rows as $row)
            //         {
            //             $insert_data[] = array(
            //                 'user_id'       =>  Auth::user()->id,
            //                 'employee_name'  => $row['employee_name'],
            //                 'employee_email'   => $row['employee_email'],
            //                 'employee_designation'   => $row['employee_designation'],
            //             );
            //         }
            //     }
            
            //     if(!empty($insert_data))
            //     {
            //         DB::table('excel_user')->insert($insert_data);
            //     }
            // }
            $getdata = ExcelUser::where('user_id', Auth::user()->id)->where('employee_email','!=', NUll)->get();
            $getdatadelete = ExcelUser::truncate();
            return response()->json([
                "message" => 'Success',
                "data"      => $getdata,
                "errors" => $errors,
            ], 200);
        }
    }
    public function UploadExcelDataTamplate(Request $request){
        // return $request->all();
        $request->request->add([
            'select_file_tamplate'       => $request->select_file_tamplate,

        ]);
        $rules = array(
            'select_file_tamplate'  => 'required|mimes:xlsx'
        );
        $messages = array(
            'select_file_tamplate' => 'select xlsx file!',
        );

        $validator = Validator::make(Input::all(), $rules, $messages);
        
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ]);
        } 
        else 
        {
            // $path = $request->file('select_file_tamplate')->getRealPath();
            // $data = Excel::import(new TemplateImport, $path);
            $path1 = $request->file('select_file_tamplate')->store('temp'); 
            $path=storage_path('app').'/'.$path1;  
            $data = \Excel::import(new TemplateImport,$path);
            // if($data->count() > 0)
            // {
            //     foreach($data->toArray() as $key => $rows)
            //     {
            //         foreach($rows as $row)
            //         {
            //             $insert_data[] = array(
            //                 'user_id'          =>  Auth::user()->id,
            //                 'Template_Name'    => $row['template_name'],
            //                 'Field_1_Header'   => $row['field_1_header'],
            //                 'Field_2_Header'   => $row['field_2_header'],
            //                 'Field_3_Header'   => $row['field_3_header'],
            //                 'Field_4_Header'   => $row['field_4_header'],
            //                 'Field_5_Header'   => $row['field_5_header'],
            //                 'Field_6_Header'   => $row['field_6_header'],
            //                 'Field_7_Header'   => $row['field_7_header'],
            //                 'Field_8_Header'   => $row['field_8_header'],
            //                 'Field_9_Header'   => $row['field_9_header'],
            //                 'Field_10_Header'  => $row['field_10_header'],
            //                 'Field_11_Header'  => $row['field_11_header'],
            //                 'Field_12_Header'  => $row['field_12_header'],
            //                 'Field_13_Header'  => $row['field_13_header'],
            //                 'Field_14_Header'  => $row['field_14_header'],
            //                 'Field_15_Header'  => $row['field_15_header'],
            //                 'Field_16_Header'  => $row['field_16_header'],
            //                 'Field_17_Header'  => $row['field_17_header'],
            //                 'Field_18_Header'  => $row['field_18_header'],
            //                 'Field_19_Header'  => $row['field_19_header'],
            //                 'Field_20_Header'  => $row['field_20_header'],
            //             );
            //         }
            //     }
            //     if(!empty($insert_data))
            //     {
            //         DB::table('excel_tamplate')->insert($insert_data);
            //     }
            // }
            $getdata = ExcelTamplate::where('user_id', Auth::user()->id)->get();
            $getdatadelete = ExcelTamplate::truncate();
            return response()->json([
                "message" => 'Success',
                "data"      => $getdata
            ], 200);
        }
    }

    public function UpdateProjectDetails (Request $request)
    {
        // return $request;
        //Getting logged in user
        $user = $request->user();
        $userList = [];
        $RolesList = [];

        //Segregating the values from the request
        $ProjectsDetails = $request->all()[0];

        /* Store Project Details */
        $project = Project::where('id', $ProjectsDetails['ProjectId'])->update([
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

        $project = Project::findOrfail($ProjectsDetails['ProjectId']);
        

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
                $NewUser->notify(new NewUserCreatedNotifications($randomPassword));
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
                        $UserInfo = User::where('email', $ListData['email'])->get()->first();
                        $ListData['user_id'] = $UserInfo->id;
                        $RolesList[$ProjectInfoKey]['level_1'][] = $ListData;

                    }
                }
            }   
        }

        # delete all previous role and restore the new set of roles
        Role::where('project_id', $project->id)->delete();

        //if the setup is store then update all role ASTMGR roles // # delete all previous ASTGR roles
        if($project->setup_type == "Yes"){
            Role::where('company_id', $project->company_id)->where('role_name', 'ASTMGR')->delete();
        }

        # Store Actual new sets of Roles In Database
        foreach ($RolesList as $RoleName => $RoleLevels) {
            foreach ($RoleLevels as $levelNumber => $EmployeeDetails) {
                foreach ($EmployeeDetails as $key => $SingleEmployeeDetails) {
                    Role::create([
                        'created_by'    => $user->id,
                        'company_id'    => $user->company->id,
                        'project_id'    => $ProjectsDetails['ProjectId'],
                        'user_id'       => $SingleEmployeeDetails['user_id'],
                        'role_name'     => substr($RoleName, 0, strpos($RoleName, '_')),
                        'role_level'    => substr($levelNumber, -1),
                    ]);
                }
            }
        }

        /* Copy new ASTMGR for all Projects */
        if($project->setup_type == "Yes"){
            /*Get the ASTMGR Role*/
            $ASTMGR_Roles = Role::where('project_id', $project->id)->where('role_name', 'ASTMGR')->get();
            /*Delete the ASTMGR Role*/
            Role::where('project_id', $project->id)->where('role_name', 'ASTMGR')->delete();
            /*Insert the ASTMGR Role to all projects*/
            foreach ($project->company->projects as $key => $projectDetails) {
                foreach ($ASTMGR_Roles as $key => $ASTMGR_Role) {
                    $New_ASTMGR_Role = $ASTMGR_Role->replicate();
                    $New_ASTMGR_Role->project_id = $projectDetails->id;
                    $New_ASTMGR_Role->save();
                }    
            }
        }


        /*update financial details */
        FinancialLimit::where('project_id', $ProjectsDetails['ProjectId'])->delete();
        
        //storing POV financial limits
        foreach ($ProjectsDetails['POV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $ProjectsDetails['ProjectId'],
                'limit_type'    => 'POV',
                'level'         => $data['POV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }

        //storing SUBV financial limits
        foreach ($ProjectsDetails['SUBV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $ProjectsDetails['ProjectId'],
                'limit_type'    => 'SUBV',
                'level'         => $data['SUBV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }

        //storing RNV financial limits
        foreach ($ProjectsDetails['RNV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $ProjectsDetails['ProjectId'],
                'limit_type'    => 'RNV',
                'level'         => $data['RNV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }

        //storing RNV financial limits
        foreach ($ProjectsDetails['RCV_Financial_Details'] as $index => $data) {
            //return $data;
            FinancialLimit::create([
                'company_id'    => $user->company->id,
                'project_id'    => $ProjectsDetails['ProjectId'],
                'limit_type'    => 'RNV',
                'level'         => $data['RNV_Level'],
                'currency'      => $data['Currency'],
                'limit'         => $data['Limit']
            ]);
        }
        

        //If Success
        return response()->json([
            "message" => 'Project Updated Successfully.'
        ], 200);

    }

    public function NewSetUpBudgetCreationRequest(Request $request)
    {
        $user = $request->user();
        $fileSafeNames = [];
        $BudgetId = $request->get('ItemId');
        $BudgetDescription = $request->get('EnterComments');
        $EnterAmount = $request->get('EnterAmount');
        $EnterEndDate = $request->get('EnterEndDate');
        
        $BudgetLink = $request->get('ItemLink');
        $ProjectId = $request->get('ProjectId');
        $FileUploads = $request->file('FileUploads');
        $projectinfosave = Project::where('id', $ProjectId)->first();
        // return $EnterEndDate;
        // return $ProjectId;
        //Assing grouping Id Per company
        $LastestPERecord = BudgetCreationRequest::where('company_id', $user->company_id)->orderBy('budget_request_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->budget_request_group_id + 1;
            $InGroupId = $LastestPERecord->budget_request_group_id + 1;
        }


        //Send to all unquie LMA users.
        $usersIdsWithLMALevel1 = Role::where('company_id', $user->company_id)->where('project_id', $ProjectId)->where('role_name', 'SUBV')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithLMALevel1 = User::whereIn('id', $usersIdsWithLMALevel1)->get();

        // validate Docuement Size before upload
        if($FileUploads){
            foreach ($FileUploads as $key => $FileDocument) {
                if ($FileDocument)
                {
                    $filecontents       = file_get_contents($FileDocument);
                    $fileName           = $FileDocument->getClientOriginalName();
                    $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/NewBudgetCreationRequests/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $FileDocument->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }
        }

        $getSelectedProjectDetail = Project::where('id', $ProjectId)->first();

        // return $getSelectedProjectDetail;
        
        //check if the item already exists and we are only updating rejected request?
        if($BudgetId == NULL){

            //New Create Item Request
            $BudgetCreationRequest = new BudgetCreationRequest();
            $BudgetCreationRequest->budget_request_group_id         = $GroupId;
            $BudgetCreationRequest->budget_request_ingroup_id       = $InGroupId;
            $BudgetCreationRequest->company_id                      = $user->company_id;
            $BudgetCreationRequest->project_id                      = $ProjectId;
            $BudgetCreationRequest->requester_id                    = $user->id;
            if($EnterEndDate == null || $EnterEndDate == "null"){
                   
            }
            else{

                $BudgetCreationRequest->request_end_date            = $EnterEndDate;

            }
            $BudgetCreationRequest->first_request_amount            = $EnterAmount;
            if($EnterEndDate == null || $EnterEndDate == "null"){
                
            }
            else{
                
                $BudgetCreationRequest->first_end_date                  = $EnterEndDate;

            }
            $BudgetCreationRequest->very_first_initial_end_date     = $projectinfosave['end_date'];
            $BudgetCreationRequest->very_first_initial_amount       = $projectinfosave['value'] - $projectinfosave['consumed_budget'];
            $BudgetCreationRequest->request_amount                  = $EnterAmount;
            $BudgetCreationRequest->pro_ini_value                   = $getSelectedProjectDetail->value;
            $BudgetCreationRequest->pro_ini_consumed_budget         = $getSelectedProjectDetail->consumed_budget;
            $BudgetCreationRequest->budget_description              = $BudgetDescription;
            $BudgetCreationRequest->budget_link                     = $BudgetLink;
            $BudgetCreationRequest->file1                           = isset($fileSafeNames[0]) ? $fileSafeNames[0] : "";
            $BudgetCreationRequest->file2                           = isset($fileSafeNames[1]) ? $fileSafeNames[1] : "";
            $BudgetCreationRequest->file3                           = isset($fileSafeNames[2]) ? $fileSafeNames[2] : "";
            $BudgetCreationRequest->save();
            

            //record item history
            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => $BudgetCreationRequest->id,
                'budget_id'                       => 'Not Yet Created',
                'current_action_description'    => 'Request To Update The Set-Up Budget Raised',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By The Validator',
                'next_action_owners'            => (implode(', ', $usersWithLMALevel1->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


        } else {

            //Update Existing Record which the form is coming from update after rejection
            $BudgetCreationRequest = BudgetCreationRequest::findOrfail($BudgetId);
            $BudgetCreationRequest->budget_description   = $BudgetDescription;
            $BudgetCreationRequest->budget_link          = $BudgetLink;
            $BudgetCreationRequest->file1              = isset($fileSafeNames[0]) ? $fileSafeNames[0] : "";
            $BudgetCreationRequest->file2              = isset($fileSafeNames[1]) ? $fileSafeNames[1] : "";
            $BudgetCreationRequest->file3              = isset($fileSafeNames[2]) ? $fileSafeNames[2] : "";
            $BudgetCreationRequest->status             = 'Resubmitted and Assigned to the Set-up Budget Validator';
            $BudgetCreationRequest->update();
            

            //record item history
            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => $BudgetCreationRequest->id,
                'budget_id'                       => 'Not Yet Created',
                'current_action_description'    => 'Request Under correction By The Request Originator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By The Validator',
                'next_action_owners'            => (implode(', ', $usersWithLMALevel1->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);

        }

        /* This will boardcast message to user and will update the pending number of actions on javascript side */
        $title = 'New Request To Update The Set-up Budget';
        $body = 'You Have New Request To Update The Set-up Budget Pending for Your Action.';
        foreach ($usersWithLMALevel1 as $key => $user) {
            $user->notify(new BudgetcreationRequestNotifications($BudgetCreationRequest));
            event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
        }
        
        // $getenteredLastestPERecord = BudgetCreationRequest::where('company_id', $user->company_id)->orderBy('budget_request_group_id', 'desc')->limit(1)->get()->first();
        

        $checkingrequest = $this->BudgetMasterCreation($request);
        // return $checkingrequest['messageType'];
        if($checkingrequest['messageType'] == 'success'){
            /* Feedback to the user */
            return response()->json([
                "messageTitle"  => 'Request To Update The Set-up Budget Submitted Successfully.',
                "message"       => 'Request To Update The Set-up Budget Submitted Successfully.',
                "messageType"   => 'success'
            ], 200);
        }
        else{
            return $checkingrequest;

        }

        
        
    }



    public function NewItemCreationRequest(Request $request)
    {

        $user = $request->user();

        $fileSafeNames = [];
        $ItemId = $request->get('ItemId');
        $ItemDescription = $request->get('ItemDescription');
        $ItemLink = $request->get('ItemLink');
        $ProjectId = $request->get('ProjectId');
        $FileUploads = $request->file('FileUploads');

        //Assing grouping Id Per company
        $LastestPERecord = ItemCreationRequest::where('company_id', $user->company_id)->orderBy('item_request_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->item_request_group_id + 1;
            $InGroupId = $LastestPERecord->item_request_group_id + 1;
        }


        //Send to all unquie LMA users.
        $usersIdsWithLMALevel1 = Role::where('company_id', $user->company_id)->where('project_id', $ProjectId)->where('role_name', 'LMA')->where('role_level', 1)->distinct()->pluck('user_id');
        $usersWithLMALevel1 = User::whereIn('id', $usersIdsWithLMALevel1)->get();

        // validate Docuement Size before upload
        if($FileUploads){
            foreach ($FileUploads as $key => $FileDocument) {
                if ($FileDocument)
                {
                    $filecontents       = file_get_contents($FileDocument);
                    $fileName           = $FileDocument->getClientOriginalName();
                    $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/NewItemCreationRequests/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $FileDocument->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }
        }


        //check if the item already exists and we are only updating rejected request?
        if($ItemId == NULL){

            //New Create Item Request
            $ItemCreationRequest = ItemCreationRequest::create([
                'item_request_group_id'     => $GroupId,
                'item_request_ingroup_id'   => $InGroupId,
                'company_id'                => $user->company_id,
                'project_id'                => $ProjectId,
                'requester_id'              => $user->id,
                'item_description'          => $ItemDescription,
                'item_link'                 => $ItemLink,
                'file1'                     => isset($fileSafeNames[0]) ? $fileSafeNames[0] : "",
                'file2'                     => isset($fileSafeNames[1]) ? $fileSafeNames[1] : "",
                'file3'                     => isset($fileSafeNames[2]) ? $fileSafeNames[2] : ""
            ]);

            //record item history
            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => $ItemCreationRequest->id,
                'item_id'                       => 'Not Yet Created',
                'current_action_description'    => 'Request To Update The Library of Materials Raised',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By The Administrator',
                'next_action_owners'            => (implode(', ', $usersWithLMALevel1->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


        } else {

            //Update Existing Record which the form is coming from update after rejection
            $ItemCreationRequest = ItemCreationRequest::findOrfail($ItemId);
            $ItemCreationRequest->item_description   = $ItemDescription;
            $ItemCreationRequest->item_link          = $ItemLink;
            $ItemCreationRequest->file1              = isset($fileSafeNames[0]) ? $fileSafeNames[0] : "";
            $ItemCreationRequest->file2              = isset($fileSafeNames[1]) ? $fileSafeNames[1] : "";
            $ItemCreationRequest->file3              = isset($fileSafeNames[2]) ? $fileSafeNames[2] : "";
            $ItemCreationRequest->status             = 'Resubmitted and Assigned to the Library of Materials Administrator';
            $ItemCreationRequest->update();
            

            //record item history
            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => $ItemCreationRequest->id,
                'item_id'                       => 'Not Yet Created',
                'current_action_description'    => 'Request Under correction By The Request Originator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By The Administrator',
                'next_action_owners'            => (implode(', ', $usersWithLMALevel1->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);

        }

        /* This will boardcast message to user and will update the pending number of actions on javascript side */
        $title = 'New Request To Update The Library of Materials';
        $body = 'You Have New Request To Update The Library of Materials Pending for Your Action.';
        foreach ($usersWithLMALevel1 as $key => $user) {
            $user->notify(new ItemCreationRequestNotifications($ItemCreationRequest));
            event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
        }

        /* Feedback to the user */
        return response()->json([
            "messageTitle"  => 'Request To Update The Library of Materials Submitted Successfully.',
            "message"       => 'Request To Update The Library of Materials Submitted Successfully.',
            "messageType"   => 'success'
        ], 200);

        
        
    }



    public function ItemMasterSetup(Request $request)
    {
        $user = $request->user();
        $ItemMasterSetupData = $request->all();

        //Check if the System admin is doing the setup and prevent him.
        if($user->company_id == 0){
            return response()->json([
                "messageTitle"  => 'Not Allowed To Setup.',
                "message"       => 'Ogéo system administrators are not allowed to complete companies item master setup. This setup has to be completed by assigned users within specific company',
                "messageType"   => 'error'
            ], 200);
        }

        //prevent Ogeo-Name from being entered.
        for ($i=1; $i <= 20; $i++) { 
            if(strtolower($ItemMasterSetupData['Field_'.$i.'_Header']) == 'ogeo-none'){
                return response()->json([
                    "messageTitle"  => "Header Naming 'Ogeo-None' is not Allowed.",
                    "message"       => "The Header 'Ogeo-None' is Not Allowed as a Valid Header Name at Header Number ".$i,
                    "messageType"   => 'warning'
                ], 200);
            }
        }

        //check for duplicated headers (later on)
        $templateNameDuplicate = ItemMasterSetup::where('company_id', $user->company_id)->where('template_name', $ItemMasterSetupData['Template_Name'])->get()->first();
        if($templateNameDuplicate){
            return response()->json([
                "messageTitle"  => 'Duplicated Template Name.',
                "message"       => 'Duplicated Template Names are not allowed',
                "messageType"   => 'warning'
            ], 200);
        }


        //Assing grouping Id Per company
        $LastestPERecord = ItemMasterSetup::where('company_id', $user->company_id)->orderBy('template_group_id', 'desc')->limit(1)->get()->first();

        //return $LastestPERecord->purchase_enquiry_group_id;
        if(empty($LastestPERecord)){
            //we are here because there is no previous records available (this is the first PE ever) 
            $GroupId = 1;
            $InGroupId = 1;
        } else {
            //we are here because there is a previous records available and will use the the next sequence number
            $GroupId = $LastestPERecord->template_group_id + 1;
            $InGroupId = $LastestPERecord->template_group_id + 1;
        }


        ItemMasterSetup::create([
            'template_group_id'     => $GroupId,
            'template_ingroup_id'   => $InGroupId,
            'created_by'        => $user->id,
            'company_id'        => $user->company_id,
            'template_name'     => $ItemMasterSetupData['Template_Name'],
            'field_1_required'  => ($ItemMasterSetupData['Field_1_Mandatory'] == 'Yes') ? 'Yes' : 'No',
            'field_2_required'  => $ItemMasterSetupData['Field_2_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_3_required'  => $ItemMasterSetupData['Field_3_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_4_required'  => $ItemMasterSetupData['Field_4_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_5_required'  => $ItemMasterSetupData['Field_5_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_6_required'  => $ItemMasterSetupData['Field_6_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_7_required'  => $ItemMasterSetupData['Field_7_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_8_required'  => $ItemMasterSetupData['Field_8_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_9_required'  => $ItemMasterSetupData['Field_9_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_10_required' => $ItemMasterSetupData['Field_10_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_11_required' => $ItemMasterSetupData['Field_11_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_12_required' => $ItemMasterSetupData['Field_12_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_13_required' => $ItemMasterSetupData['Field_13_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_14_required' => $ItemMasterSetupData['Field_14_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_15_required' => $ItemMasterSetupData['Field_15_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_16_required' => $ItemMasterSetupData['Field_16_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_17_required' => $ItemMasterSetupData['Field_17_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_18_required' => $ItemMasterSetupData['Field_18_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_19_required' => $ItemMasterSetupData['Field_19_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_20_required' => $ItemMasterSetupData['Field_20_Mandatory'] == 'Yes' ? 'Yes' : 'No',
            'field_1'           => $ItemMasterSetupData['Field_1_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_1_Header'],
            'field_2'           => $ItemMasterSetupData['Field_2_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_2_Header'],
            'field_3'           => $ItemMasterSetupData['Field_3_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_3_Header'],
            'field_4'           => $ItemMasterSetupData['Field_4_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_4_Header'],
            'field_5'           => $ItemMasterSetupData['Field_5_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_5_Header'],
            'field_6'           => $ItemMasterSetupData['Field_6_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_6_Header'],
            'field_7'           => $ItemMasterSetupData['Field_7_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_7_Header'],
            'field_8'           => $ItemMasterSetupData['Field_8_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_8_Header'],
            'field_9'           => $ItemMasterSetupData['Field_9_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_9_Header'],
            'field_10'          => $ItemMasterSetupData['Field_10_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_10_Header'],
            'field_11'          => $ItemMasterSetupData['Field_11_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_11_Header'],
            'field_12'          => $ItemMasterSetupData['Field_12_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_12_Header'],
            'field_13'          => $ItemMasterSetupData['Field_13_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_13_Header'],
            'field_14'          => $ItemMasterSetupData['Field_14_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_14_Header'],
            'field_15'          => $ItemMasterSetupData['Field_15_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_15_Header'],
            'field_16'          => $ItemMasterSetupData['Field_16_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_16_Header'],
            'field_17'          => $ItemMasterSetupData['Field_17_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_17_Header'],
            'field_18'          => $ItemMasterSetupData['Field_18_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_18_Header'],
            'field_19'          => $ItemMasterSetupData['Field_19_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_19_Header'],
            'field_20'          => $ItemMasterSetupData['Field_20_Header'] == null ? 'Ogeo-None' : $ItemMasterSetupData['Field_20_Header'],
        ]);
        
        return response()->json([
            "messageTitle"  => 'Library of Materials Template Setup Completed Successfully.',
            "message"       => 'Library of Materials Template Setup Completed Successfully.',
            "messageType"   => 'success'
        ], 200);



        //Check if the company has already item master setup completed.
        /*if($user->company->ItemMasterSetup){
            return response()->json([
                "messageTitle"  => 'Setup Already Completed.',
                "message"       => "You company has already completed the system. Please note that this one time setup and completed by:  \n(" .$user->company->ItemMasterSetup->creator->name. ")",
                "messageType"   => 'error'
            ], 200);
        }*/
       
    }


    public function deleteItemMasterTemplate(Request $request)
    {
        $user = $request->user();
        $TemplateID = $request->get('TemplateID');

        ItemMasterSetup::findOrfail($TemplateID)->update(['active' => 'No']);

        return response()->json([
            "messageTitle"  => 'Template Deleted.',
            "message"       => 'The Selected Template Deleted Successfully.',
            "messageType"   => 'success'
        ], 200);

    }

    public function BudgetMasterCreation(Request $request)
    {
        // return $request;
        //when new request generate else condition 
        $user = $request->user();

        $fileSafeNames = [];
        $BudgetConcatedDescription = "";
        $user = $request->user();
        $ProjectId = $request->get('ProjectId');
        $EnterAmount = $request->get('EnterAmount');
        $EnterEndDate = $request->get('EnterEndDate');
        $BudgetPictures = $request->file('BudgetPictures');
        $NewBudgetInfo = $request->get('NewBudgetInfo');
        // $getNewBudgetInfo = $getenteredLastestPERecord;
        $NewBudgetInfo = json_decode($NewBudgetInfo, true);
        // dd($NewBudgetInfo);

        if(isset($NewBudgetInfo['BudgetProjectId'])){
            

            dd('Never Here Check Error Code: 1001');
            //this will be here if new item is created without previous request

            // This to assign the next group and record id based on company
            $LastestPERecord = BudgetMaster::where('company_id', $user->company_id)->orderBy('item_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            }
            
            //Send to all unique BUSV users.
            $usersIdsWithSUBV = Role::where('company_id', $user->company_id)->where('project_id', $NewBudgetInfo['BudgetProjectId'])->where('role_name', 'BUSV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithSUBV = User::whereIn('id', $usersIdsWithSUBV)->get();


            // validate images size before upload
            foreach ($BudgetPictures as $key => $Picture) {
                if ($Picture){
                    $filecontents       = file_get_contents($Picture);
                    $fileName           = $Picture->getClientOriginalName();
                    $extension          = $Picture->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/BudgetMasterPictures/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $Picture->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }

            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewBudgetInfo["ItemField_".$i] != ""){
                    $BudgetConcatedDescription = $BudgetConcatedDescription. ' | ' .$NewBudgetInfo["ItemField_".$i];
                }
            }
            $BudgetConcatedDescription = $BudgetConcatedDescription. ' |';

            //check for data duplicates and check unit of measure
            $DuplicateItem = BudgetMaster::where('company_id', $user->company_id)->where('description', $BudgetConcatedDescription)->get()->first();
            
            if(!empty($DuplicateItem)){
                if($DuplicateItem->u_o_m == $NewBudgetInfo["UnitOfMeasure"]){
                    return [
                        "messageTitle"  => 'Item Exists.',
                        "message"       => 'Item Already Exists in Database, The item you are trying to create is alreay available under Item Number: ('. $DuplicateItem->id .')',
                        "messageType"   => 'warning'
                    ];
                }                
            }

            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $NewBudget = BudgetMaster::create([
                'budget_group_id'         => $GroupId,
                'budget_ingroup_id'       => $InGroupId,
                'created_by'            => $user->id,
                'company_id'            => $user->company_id,
                'project_id'            => $NewBudgetInfo['BudgetProjectId'],
                'template_id'           => $NewBudgetInfo['TemplateID'],
                'creation_request_id'   => NULL,
                'description'           => $BudgetConcatedDescription,
                'u_o_m'                 => $NewBudgetInfo['UnitOfMeasure'],
                'field_1'               => $NewBudgetInfo['BudgetField_1'],
                'field_2'               => $NewBudgetInfo['BudgetField_2'],
                'field_3'               => $NewBudgetInfo['BudgetField_3'],
                'field_4'               => $NewBudgetInfo['BudgetField_4'],
                'field_5'               => $NewBudgetInfo['BudgetField_5'],
                'field_6'               => $NewBudgetInfo['BudgetField_6'],
                'field_7'               => $NewBudgetInfo['BudgetField_7'],
                'field_8'               => $NewBudgetInfo['BudgetField_8'],
                'field_9'               => $NewBudgetInfo['BudgetField_9'],
                'field_10'              => $NewBudgetInfo['BudgetField_10'],
                'field_11'              => $NewBudgetInfo['BudgetField_11'],
                'field_12'              => $NewBudgetInfo['BudgetField_12'],
                'field_13'              => $NewBudgetInfo['BudgetField_13'],
                'field_14'              => $NewBudgetInfo['BudgetField_14'],
                'field_15'              => $NewBudgetInfo['BudgetField_15'],
                'field_16'              => $NewBudgetInfo['BudgetField_16'],
                'field_17'              => $NewBudgetInfo['BudgetField_17'],
                'field_18'              => $NewBudgetInfo['BudgetField_18'],
                'field_19'              => $NewBudgetInfo['BudgetField_19'],
                'field_20'              => $NewBudgetInfo['BudgetField_20'],
                'picture'               => isset($fileSafeNames[0]) ? $fileSafeNames[0] : "",
            ]);

            //record item history
            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => 'N/A',
                'budget_id'                       => $NewBudget->id,
                'current_action_description'    => 'Budget Created By Set-up Budget and Pending Validation at Level 1',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithSUBV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


            //Send Notification to level 1 approval
            $title = 'New Request to Update Set-up Budget Pending Your Approval';
            $body = 'You Have New Request to Update Set-up Budget Pending Your Approval';
            foreach ($usersWithSUBV as $key => $user) {
                $user->notify(new ItemCreatedValidationNotification($NewBudget));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }


            return [
                "messageTitle"  => 'Request to Update Set-Up Budget Approved Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ];

        } elseif ($NewBudgetInfo['OldProjectId'] != '') {
            //check if we are updating existing record
            
            // This to assign the next group and record id based on company
            $LastestPERecord = BudgetMaster::where('company_id', $user->company_id)->orderBy('budget_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            }

            //Send to all unique ALMV users.
            $usersIdsWithSUBV = Role::where('company_id', $user->company_id)->where('project_id', $NewBudgetInfo['BudgetRequestProjectId'])->where('role_name', 'SUBV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithSUBV = User::whereIn('id', $usersIdsWithSUBV)->get();



            // validate images size before upload
            foreach ($BudgetPictures as $key => $Picture) {
                if ($Picture){
                    $filecontents       = file_get_contents($Picture);
                    $fileName           = $Picture->getClientOriginalName();
                    $extension          = $Picture->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/BudgetMasterPictures/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $Picture->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }

            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewBudgetInfo["BudgetField_".$i] != ""){
                    $BudgetConcatedDescription = $BudgetConcatedDescription. ' | ' .$NewBudgetInfo["BudgetField_".$i];
                }
            }
            $BudgetConcatedDescription = $BudgetConcatedDescription. ' |';
            $getenteredLastestPERecord = BudgetCreationRequest::where('company_id', $user->company_id)->orderBy('budget_request_group_id', 'desc')->limit(1)->get()->first();

            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $UpdatedBudget = BudgetMaster::findOrfail($NewBudgetInfo['ExistingBudgetId']);
            $UpdatedBudget->budget_group_id          = $GroupId;
            $UpdatedBudget->budget_ingroup_id        = $InGroupId;
            $UpdatedBudget->company_id             = $user->company_id;
            $UpdatedBudget->project_id             = $NewBudgetInfo['BudgetRequestProjectId'];
            $UpdatedBudget->description            = $BudgetConcatedDescription;
            $UpdatedBudget->creation_request_id    = $getenteredLastestPERecord->id;
            $UpdatedBudget->field_1                = $NewBudgetInfo['BudgetField_1'];
            $UpdatedBudget->field_2                = $NewBudgetInfo['BudgetField_2'];
            $UpdatedBudget->field_3                = $NewBudgetInfo['BudgetField_3'];
            $UpdatedBudget->field_4                = $NewBudgetInfo['BudgetField_4'];
            $UpdatedBudget->field_5                = $NewBudgetInfo['BudgetField_5'];
            $UpdatedBudget->field_6                = $NewBudgetInfo['BudgetField_6'];
            $UpdatedBudget->field_7                = $NewBudgetInfo['BudgetField_7'];
            $UpdatedBudget->field_8                = $NewBudgetInfo['BudgetField_8'];
            $UpdatedBudget->field_9                = $NewBudgetInfo['BudgetField_9'];
            $UpdatedBudget->field_10               = $NewBudgetInfo['BudgetField_10'];
            $UpdatedBudget->field_11               = $NewBudgetInfo['BudgetField_11'];
            $UpdatedBudget->field_12               = $NewBudgetInfo['BudgetField_12'];
            $UpdatedBudget->field_13               = $NewBudgetInfo['BudgetField_13'];
            $UpdatedBudget->field_14               = $NewBudgetInfo['BudgetField_14'];
            $UpdatedBudget->field_15               = $NewBudgetInfo['BudgetField_15'];
            $UpdatedBudget->field_16               = $NewBudgetInfo['BudgetField_16'];
            $UpdatedBudget->field_17               = $NewBudgetInfo['BudgetField_17'];
            $UpdatedBudget->field_18               = $NewBudgetInfo['BudgetField_18'];
            $UpdatedBudget->field_19               = $NewBudgetInfo['BudgetField_19'];
            $UpdatedBudget->field_20               = $NewBudgetInfo['BudgetField_20'];
            $UpdatedBudget->status                 = "Assigned to Validator Level 1 ";
            $UpdatedBudget->picture                = isset($fileSafeNam2es[0]) ? $fileSafeNames[0] : "";
            $UpdatedBudget->update();

            //update the current status of original item creation request
            if($NewBudgetInfo['BudgetRequestId']){
                BudgetCreationRequest::findOrfail($NewBudgetInfo['BudgetRequestId'])
                    ->update([
                        'status' => 'Assigned to Validator Level 1'
                    ]);
            }

            //record item history
            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => $NewBudgetInfo['BudgetRequestId'],
                'budget_id'                       => $UpdatedBudget->id,
                'current_action_description'    => 'Request Under Review By The Validator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithSUBV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);

            //Send Notification to level 1 approval
            $title = 'New Request to Update Set-up Budget Pending Your Approval';
            $body = 'You Have New Request to Update Set-up Budget Pending Your Approval';
            foreach ($usersWithSUBV as $key => $user) {
                $user->notify(new ItemCreatedValidationNotification($UpdatedBudget));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }

            return [
                "messageTitle"  => 'Request to Update Set-up Budget Approved Successfully.',
                "message"       => 'Request to Update Set-up Budget Approved Successfully and Assigned to Validator Level 1',
                "messageType"   => 'success'
            ];

        } else {
            //we are here if we receive the item creation from the previous item creation request.

            // This to assign the next group and record id based on company
            $LastestPERecord = BudgetMaster::where('company_id', $user->company_id)->orderBy('budget_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewBudgetInfo['TemplateID'];
                $InGroupId = "";
            }


            //Send to all unique SUBV users.
            $usersIdsWithSUBV = Role::where('company_id', $user->company_id)->where('project_id', $ProjectId)->where('role_name', 'SUBV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithSUBV = User::whereIn('id', $usersIdsWithSUBV)->get();
            // return $usersWithSUBV;


            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewBudgetInfo["BudgetField_".$i] != ""){
                    $BudgetConcatedDescription = $BudgetConcatedDescription. ' | ' .$NewBudgetInfo["ItemField_".$i];
                }
            }
            $BudgetConcatedDescription = $BudgetConcatedDescription. ' |';

            //check for data duplicates and check unit of measure
            $DuplicateBudget = BudgetMaster::where('company_id', $user->company_id)->where('description', $BudgetConcatedDescription)->get()->first();

            // if(!empty($DuplicateBudget)){
            //     if($DuplicateBudget->u_o_m == $NewBudgetInfo["UnitOfMeasure"]){
            //         return ([
            //             "messageTitle"  => 'Budget Exists.',
            //             "message"       => 'Budget Already Exists in Database, The item you are trying to create is alreay available under Item Number: ('. $DuplicateBudget->id .')',
            //             "messageType"   => 'warning'
            //         ]);
            //     }
            // }

            $getenteredLastestPERecord = BudgetCreationRequest::where('company_id', $user->company_id)->orderBy('budget_request_group_id', 'desc')->limit(1)->get()->first();
                        
            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $NewBudget = BudgetMaster::create([
                'budget_group_id'         => $GroupId,
                'budget_ingroup_id'       => $InGroupId,
                'created_by'            => $user->id,
                'company_id'            => $user->company_id,
                'project_id'            => $NewBudgetInfo['BudgetRequestProjectId'],
                'template_id'           => $NewBudgetInfo['TemplateID'],
                'creation_request_id'   => $getenteredLastestPERecord->id,
                'description'           => $BudgetConcatedDescription,
                'u_o_m'                 => $NewBudgetInfo['UnitOfMeasure'],
                'field_1'               => $NewBudgetInfo['BudgetField_1'],
                'field_2'               => $NewBudgetInfo['BudgetField_2'],
                'field_3'               => $NewBudgetInfo['BudgetField_3'],
                'field_4'               => $NewBudgetInfo['BudgetField_4'],
                'field_5'               => $NewBudgetInfo['BudgetField_5'],
                'field_6'               => $NewBudgetInfo['BudgetField_6'],
                'field_7'               => $NewBudgetInfo['BudgetField_7'],
                'field_8'               => $NewBudgetInfo['BudgetField_8'],
                'field_9'               => $NewBudgetInfo['BudgetField_9'],
                'field_10'              => $NewBudgetInfo['BudgetField_10'],
                'field_10'              => $NewBudgetInfo['BudgetField_11'],
                'field_10'              => $NewBudgetInfo['BudgetField_12'],
                'field_10'              => $NewBudgetInfo['BudgetField_13'],
                'field_10'              => $NewBudgetInfo['BudgetField_14'],
                'field_10'              => $NewBudgetInfo['BudgetField_15'],
                'field_10'              => $NewBudgetInfo['BudgetField_16'],
                'field_10'              => $NewBudgetInfo['BudgetField_17'],
                'field_10'              => $NewBudgetInfo['BudgetField_18'],
                'field_10'              => $NewBudgetInfo['BudgetField_19'],
                'field_10'              => $NewBudgetInfo['BudgetField_20'],
                'picture'               => isset($fileSafeNames[0]) ? $fileSafeNames[0] : "",
            ]);


            //record item history
            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => $getenteredLastestPERecord->id,
                'budget_id'                       => $NewBudget->id,
                'current_action_description'    => 'Request Under Review By The Validator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithSUBV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


            //update the current status of original item creation request
            if($NewBudgetInfo['BudgetRequestId']){
                BudgetCreationRequest::findOrfail($NewBudgetInfo['BudgetRequestId'])
                    ->update([
                        'status' => 'Assigned to Validator Level 1'
                    ]);
            }


            //Send Notification to level 1 approval and Broadcast
            $title = 'New Request to Update Set-up Budget Pending Your Approval';
            $body = 'You Have New Request to Update Set-up Budget Pending Your Approval';
            foreach ($usersWithSUBV as $key => $user) {
                $user->notify(new BudgetCreatedValidationNotification($NewBudget));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }

            return [
                "messageTitle"  => 'Request to Update Set-up Budget Approved Successfully.',
                "message"       => 'Request to Update Set-up Budget Approved Successfully and Assigned to Validator Level 1',
                "messageType"   => 'success'
            ];

        }

    }
//////////////////////////////////////////////////////////////////////////////////////////

    public function ItemMasterCreation(Request $request)
    {
        $user = $request->user();

        $fileSafeNames = [];
        $ItemConcatedDescription = "";
        $user = $request->user();
        $ItemPictures = $request->file('ItemPictures');
        $NewItemInfo = $request->get('NewItemInfo');
        $NewItemInfo = json_decode($NewItemInfo, true);

        if(isset($NewItemInfo['ItemProjectId'])){

            dd('Never Here Check Error Code: 1001');
            //this will be here if new item is created without previous request

            // This to assign the next group and record id based on company
            $LastestPERecord = ItemMaster::where('company_id', $user->company_id)->orderBy('item_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            }
            
            //Send to all unique ALMV users.
            $usersIdsWithALMV = Role::where('company_id', $user->company_id)->where('project_id', $NewItemInfo['ItemProjectId'])->where('role_name', 'ALMV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithALMV = User::whereIn('id', $usersIdsWithALMV)->get();


            // validate images size before upload
            foreach ($ItemPictures as $key => $Picture) {
                if ($Picture){
                    $filecontents       = file_get_contents($Picture);
                    $fileName           = $Picture->getClientOriginalName();
                    $extension          = $Picture->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/ItemMasterPictures/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $Picture->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }

            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewItemInfo["ItemField_".$i] != ""){
                    $ItemConcatedDescription = $ItemConcatedDescription. ' | ' .$NewItemInfo["ItemField_".$i];
                }
            }
            $ItemConcatedDescription = $ItemConcatedDescription. ' |';

            //check for data duplicates and check unit of measure
            $DuplicateItem = ItemMaster::where('company_id', $user->company_id)->where('description', $ItemConcatedDescription)->get()->first();
            
            if(!empty($DuplicateItem)){
                if($DuplicateItem->u_o_m == $NewItemInfo["UnitOfMeasure"]){
                    return response()->json([
                        "messageTitle"  => 'Item Exists.',
                        "message"       => 'Item Already Exists in Database, The item you are trying to create is alreay available under Item Number: ('. $DuplicateItem->id .')',
                        "messageType"   => 'warning'
                    ], 200);
                }                
            }

            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $NewItem = ItemMaster::create([
                'item_group_id'         => $GroupId,
                'item_ingroup_id'       => $InGroupId,
                'created_by'            => $user->id,
                'company_id'            => $user->company_id,
                'project_id'            => $NewItemInfo['ItemProjectId'],
                'template_id'           => $NewItemInfo['TemplateID'],
                'creation_request_id'   => NULL,
                'description'           => $ItemConcatedDescription,
                'u_o_m'                 => $NewItemInfo['UnitOfMeasure'],
                'field_1'               => $NewItemInfo['ItemField_1'],
                'field_2'               => $NewItemInfo['ItemField_2'],
                'field_3'               => $NewItemInfo['ItemField_3'],
                'field_4'               => $NewItemInfo['ItemField_4'],
                'field_5'               => $NewItemInfo['ItemField_5'],
                'field_6'               => $NewItemInfo['ItemField_6'],
                'field_7'               => $NewItemInfo['ItemField_7'],
                'field_8'               => $NewItemInfo['ItemField_8'],
                'field_9'               => $NewItemInfo['ItemField_9'],
                'field_10'              => $NewItemInfo['ItemField_10'],
                'field_11'              => $NewItemInfo['ItemField_11'],
                'field_12'              => $NewItemInfo['ItemField_12'],
                'field_13'              => $NewItemInfo['ItemField_13'],
                'field_14'              => $NewItemInfo['ItemField_14'],
                'field_15'              => $NewItemInfo['ItemField_15'],
                'field_16'              => $NewItemInfo['ItemField_16'],
                'field_17'              => $NewItemInfo['ItemField_17'],
                'field_18'              => $NewItemInfo['ItemField_18'],
                'field_19'              => $NewItemInfo['ItemField_19'],
                'field_20'              => $NewItemInfo['ItemField_20'],
                'picture'               => isset($fileSafeNames[0]) ? $fileSafeNames[0] : "",
            ]);

            //record item history
            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => 'N/A',
                'item_id'                       => $NewItem->id,
                'current_action_description'    => 'Item Created By Library of Materials Administrator and Pending Validation at Level 1',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithALMV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


            //Send Notification to level 1 approval
            $title = 'New Request to Update Library of Materials Pending Your Approval';
            $body = 'You Have New Request to Update Library of Materials Pending Your Approval';
            foreach ($usersWithALMV as $key => $user) {
                $user->notify(new ItemCreatedValidationNotification($NewItem));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }


            return response()->json([
                "messageTitle"  => 'Request to Update Library of Materials Approved Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ], 200);

        } elseif ($NewItemInfo['OldProjectId'] != '') {
            //check if we are updating existing record
            
            // This to assign the next group and record id based on company
            $LastestPERecord = ItemMaster::where('company_id', $user->company_id)->orderBy('item_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            }

            //Send to all unique ALMV users.
            $usersIdsWithALMV = Role::where('company_id', $user->company_id)->where('project_id', $NewItemInfo['ItemRequestProjectId'])->where('role_name', 'ALMV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithALMV = User::whereIn('id', $usersIdsWithALMV)->get();



            // validate images size before upload
            foreach ($ItemPictures as $key => $Picture) {
                if ($Picture){
                    $filecontents       = file_get_contents($Picture);
                    $fileName           = $Picture->getClientOriginalName();
                    $extension          = $Picture->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/ItemMasterPictures/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $Picture->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }

            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewItemInfo["ItemField_".$i] != ""){
                    $ItemConcatedDescription = $ItemConcatedDescription. ' | ' .$NewItemInfo["ItemField_".$i];
                }
            }
            $ItemConcatedDescription = $ItemConcatedDescription. ' |';


            //check for data duplicates and check unit of measure
            // $DuplicateItem = ItemMaster::where('company_id', $user->company_id)->where('description', $ItemConcatedDescription)->get()->first();
            // if(!empty($DuplicateItem)){
            //     if($DuplicateItem->u_o_m == $NewItemInfo["UnitOfMeasure"]){
            //         return response()->json([
            //             "messageTitle"  => 'Item Exists.',
            //             "message"       => 'Item Already Exists in Database, The item you are trying to create is alreay available under Item Number: ('. $DuplicateItem->id .')',
            //             "messageType"   => 'warning'
            //         ], 200);
            //     }
            // }

            //dd($NewItemInfo['ItemField_1'], $ItemConcatedDescription);

            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $UpdatedItem = ItemMaster::findOrfail($NewItemInfo['ExistingItemId']);
            $UpdatedItem->item_group_id          = $GroupId;
            $UpdatedItem->item_ingroup_id        = $InGroupId;
            $UpdatedItem->company_id             = $user->company_id;
            $UpdatedItem->project_id             = $NewItemInfo['ItemRequestProjectId'];
            $UpdatedItem->description            = $ItemConcatedDescription;
            $UpdatedItem->creation_request_id    = $NewItemInfo['ItemRequestId'];
            $UpdatedItem->field_1                = $NewItemInfo['ItemField_1'];
            $UpdatedItem->field_2                = $NewItemInfo['ItemField_2'];
            $UpdatedItem->field_3                = $NewItemInfo['ItemField_3'];
            $UpdatedItem->field_4                = $NewItemInfo['ItemField_4'];
            $UpdatedItem->field_5                = $NewItemInfo['ItemField_5'];
            $UpdatedItem->field_6                = $NewItemInfo['ItemField_6'];
            $UpdatedItem->field_7                = $NewItemInfo['ItemField_7'];
            $UpdatedItem->field_8                = $NewItemInfo['ItemField_8'];
            $UpdatedItem->field_9                = $NewItemInfo['ItemField_9'];
            $UpdatedItem->field_10               = $NewItemInfo['ItemField_10'];
            $UpdatedItem->field_11               = $NewItemInfo['ItemField_11'];
            $UpdatedItem->field_12               = $NewItemInfo['ItemField_12'];
            $UpdatedItem->field_13               = $NewItemInfo['ItemField_13'];
            $UpdatedItem->field_14               = $NewItemInfo['ItemField_14'];
            $UpdatedItem->field_15               = $NewItemInfo['ItemField_15'];
            $UpdatedItem->field_16               = $NewItemInfo['ItemField_16'];
            $UpdatedItem->field_17               = $NewItemInfo['ItemField_17'];
            $UpdatedItem->field_18               = $NewItemInfo['ItemField_18'];
            $UpdatedItem->field_19               = $NewItemInfo['ItemField_19'];
            $UpdatedItem->field_20               = $NewItemInfo['ItemField_20'];
            $UpdatedItem->status                 = "Assigned to Validator Level 1 ";
            $UpdatedItem->picture                = isset($fileSafeNames[0]) ? $fileSafeNames[0] : "";
            $UpdatedItem->update();

            //update the current status of original item creation request
            if($NewItemInfo['ItemRequestId']){
                ItemCreationRequest::findOrfail($NewItemInfo['ItemRequestId'])
                    ->update([
                        'status' => 'Assigned to Validator Level 1'
                    ]);
            }

            //record item history
            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => $NewItemInfo['ItemRequestId'],
                'item_id'                       => $UpdatedItem->id,
                'current_action_description'    => 'Request Under Review By The Administrator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithALMV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);

            //Send Notification to level 1 approval
            $title = 'New Request to Update Library of Materials Pending Your Approval';
            $body = 'You Have New Request to Update Library of Materials Pending Your Approval';
            foreach ($usersWithALMV as $key => $user) {
                $user->notify(new ItemCreatedValidationNotification($UpdatedItem));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }

            return response()->json([
                "messageTitle"  => 'Request to Update Library of Materials Approved Successfully.',
                "message"       => 'Request to Update Library of Materials Approved Successfully and Assigned to Validator Level 1',
                "messageType"   => 'success'
            ], 200);

        } else {
            //we are here if we receive the item creation from the previous item creation request.

            // This to assign the next group and record id based on company
            $LastestPERecord = ItemMaster::where('company_id', $user->company_id)->orderBy('item_ingroup_id', 'desc')->limit(1)->get()->first();
            if(empty($LastestPERecord)){
                //we are here because there is no previous records available (this is the first PE ever) 
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $GroupId = $NewItemInfo['TemplateID'];
                $InGroupId = "";
            }


            //Send to all unique ALMV users.
            $usersIdsWithALMV = Role::where('company_id', $user->company_id)->where('project_id', $NewItemInfo['ItemRequestProjectId'])->where('role_name', 'ALMV')->where('role_level', 1)->distinct()->pluck('user_id');
            $usersWithALMV = User::whereIn('id', $usersIdsWithALMV)->get();


            // validate images size before upload
            foreach ($ItemPictures as $key => $Picture) {
                if ($Picture){
                    $filecontents       = file_get_contents($Picture);
                    $fileName           = $Picture->getClientOriginalName();
                    $extension          = $Picture->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/ItemMasterPictures/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $Picture->move($destinationPath, $safeName);
                    $fileSafeNames[]    = $safeName;
                }
            }

            //generates item description field
            for ($i=1; $i <= 20; $i++) { 
                if($NewItemInfo["ItemField_".$i] != ""){
                    $ItemConcatedDescription = $ItemConcatedDescription. ' | ' .$NewItemInfo["ItemField_".$i];
                }
            }
            $ItemConcatedDescription = $ItemConcatedDescription. ' |';

            //check for data duplicates and check unit of measure
            $DuplicateItem = ItemMaster::where('company_id', $user->company_id)->where('description', $ItemConcatedDescription)->get()->first();

            if(!empty($DuplicateItem)){
                if($DuplicateItem->u_o_m == $NewItemInfo["UnitOfMeasure"]){
                    return response()->json([
                        "messageTitle"  => 'Item Exists.',
                        "message"       => 'Item Already Exists in Database, The item you are trying to create is alreay available under Item Number: ('. $DuplicateItem->id .')',
                        "messageType"   => 'warning'
                    ], 200);
                }
            }

            
            //Create New Item (approval_level = 1 and status = 'Pending Approval')
            $NewItem = ItemMaster::create([
                'item_group_id'         => $GroupId,
                'item_ingroup_id'       => $InGroupId,
                'created_by'            => $user->id,
                'company_id'            => $user->company_id,
                'project_id'            => $NewItemInfo['ItemRequestProjectId'],
                'template_id'           => $NewItemInfo['TemplateID'],
                'creation_request_id'   => $NewItemInfo['ItemRequestId'],
                'description'           => $ItemConcatedDescription,
                'u_o_m'                 => $NewItemInfo['UnitOfMeasure'],
                'field_1'               => $NewItemInfo['ItemField_1'],
                'field_2'               => $NewItemInfo['ItemField_2'],
                'field_3'               => $NewItemInfo['ItemField_3'],
                'field_4'               => $NewItemInfo['ItemField_4'],
                'field_5'               => $NewItemInfo['ItemField_5'],
                'field_6'               => $NewItemInfo['ItemField_6'],
                'field_7'               => $NewItemInfo['ItemField_7'],
                'field_8'               => $NewItemInfo['ItemField_8'],
                'field_9'               => $NewItemInfo['ItemField_9'],
                'field_10'              => $NewItemInfo['ItemField_10'],
                'field_10'              => $NewItemInfo['ItemField_11'],
                'field_10'              => $NewItemInfo['ItemField_12'],
                'field_10'              => $NewItemInfo['ItemField_13'],
                'field_10'              => $NewItemInfo['ItemField_14'],
                'field_10'              => $NewItemInfo['ItemField_15'],
                'field_10'              => $NewItemInfo['ItemField_16'],
                'field_10'              => $NewItemInfo['ItemField_17'],
                'field_10'              => $NewItemInfo['ItemField_18'],
                'field_10'              => $NewItemInfo['ItemField_19'],
                'field_10'              => $NewItemInfo['ItemField_20'],
                'picture'               => isset($fileSafeNames[0]) ? $fileSafeNames[0] : "",
            ]);


            //record item history
            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => $NewItemInfo['ItemRequestId'],
                'item_id'                       => $NewItem->id,
                'current_action_description'    => 'Request Under Review By The Administrator',
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => 'N/A',
                'decision'                      => 'N/A',
                'decision_notes'                => 'N/A',
                'next_action_description'       => 'Request Under Review By the Validator Level 1',
                'next_action_owners'            => (implode(', ', $usersWithALMV->pluck('name')->toArray())),
                'next_approval_level'           => 1,
            ]);


            //update the current status of original item creation request
            if($NewItemInfo['ItemRequestId']){
                ItemCreationRequest::findOrfail($NewItemInfo['ItemRequestId'])
                    ->update([
                        'status' => 'Assigned to Validator Level 1'
                    ]);
            }


            //Send Notification to level 1 approval and Broadcast
            $title = 'New Request to Update Library of Materials Pending Your Approval';
            $body = 'You Have New Request to Update Library of Materials Pending Your Approval';
            foreach ($usersWithALMV as $key => $user) {
                $user->notify(new ItemCreatedValidationNotification($NewItem));
                event(new MessageToUserToTakeAction($user, $title, $body, Carbon::now(), $user->id));
            }

            return response()->json([
                "messageTitle"  => 'Request to Update Library of Materials Approved Successfully.',
                "message"       => 'Request to Update Library of Materials Approved Successfully and Assigned to Validator Level 1',
                "messageType"   => 'success'
            ], 200);

        }

        

    }



    public function ItemActivations(Request $request)
    {
        $user = $request->user();
        $Item = ItemMaster::findOrFail($request->get('ItemId'));

        if($Item->active == 'Yes'){
            $Item->update(['active' => 'No']);
            $messageTite = 'Item Deactivated Successfully';
            $messageBody = 'Item Deactivated Successfully and Will No Longer Be Available During Purchase Enquiry Selection';
            $messageCurrentAction = 'Item Deactivated';
            $messageNextAction = 'N/A';
        } else {
            $Item->update(['active' => 'Yes']);
            $messageTite = 'Item Activated Successfully';
            $messageBody = 'Item Activated Successfully and It Will Be Available For Purchase Enquiry Selection';
            $messageCurrentAction = 'Item Activated';
            $messageNextAction = 'N/A';
        }

        //record item history
        ApprovalItemMasterHistory::create([
            'company_id'                    => $user->company_id,
            'item_request_id'               => $Item->creation_request_id,
            'item_id'                       => $Item->id,
            'current_action_description'    => $messageCurrentAction,
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 'N/A',
            'decision'                      => 'N/A',
            'decision_notes'                => 'N/A',
            'next_action_description'       => $messageNextAction,
            'next_action_owners'            => 'N/A',
            'next_approval_level'           => 'N/A',
        ]);


        return response()->json([
                "messageTitle"  => $messageTite,
                "message"       => $messageBody,
                "messageType"   => 'success'
            ], 200);


    }


    public function getUsersNewItemRequestList(Request $request)
    {
        $user = $request->user();
        $ItemCreationRequests = ItemCreationRequest::with('requester')->where('requester_id', $user->id)->select('item_requests.*');

        return Datatables::of($ItemCreationRequests)
            ->editColumn('id', 'ICR-{{$id}}')
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('item_link', '<a target="_blank" href="{{ $item_link }}">Item Link</a>')
            ->addColumn('action', function ($ItemCreationRequest) use ($user) {
                if(strpos($ItemCreationRequest->status, 'Rejected') !== false){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="ItemCreationRequest"><i class="fa fa-info"></i> </button>  <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="ItemCreationRequest"><i class="fa fa-info"></i> </button>  <button disabled class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemCreationRequest"><i class="fa fa-edit"></i> </button>';
                }
                
               
                
            })
            ->rawColumns(['item_link', 'action']) 
            ->make(true);
    }


    public function getUsersItemCreationList(Request $request)
    {
        $user = $request->user();
        $ItemCreations = ItemMaster::with('creator')->where('created_by', $user->id)->select('item_master.*');

        return Datatables::of($ItemCreations)
            ->editColumn('id', 'IM-{{$id}}')
            ->editColumn('description', '{!! str_limit($description, 60) !!}')
            ->addColumn('action', function ($ItemCreation) use ($user) {
                if(strpos($ItemCreation->status, 'Rejected') !== false){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="ItemMaster"><i class="fa fa-info"></i> </button>  <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemMaster"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="ItemMaster"><i class="fa fa-info"></i> </button>  <button disabled class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="ItemMaster"><i class="fa fa-edit"></i> </button>';
                }
                
               
                
            })
            ->rawColumns(['action']) 
            ->make(true);
    }


    public function getUsersPurchaseEnquiryList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $PurchaseEnquiries = PurchaseEnquiry::with('creator', 'item')->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->select('purchase_enquiries.*');

        return Datatables::of($PurchaseEnquiries)
            ->addColumn('show_id', 'PE-{{$purchase_enquiry_group_id}}-{{$purchase_enquiry_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('PE-', purchase_enquiry_group_id,'-','purchase_enquiry_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('id', 'PE-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('PE-', id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->item_id == null){
                    return 'N/A';
                } else {
                    return $PurchaseEnquiry->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('service_description', '{!! str_limit($service_description, 60) !!}')
            ->addColumn('action', function ($PurchaseEnquiry) use ($user) {
                if(strpos($PurchaseEnquiry->status, 'Rejected') !== false){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button>  <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-info"></i> </button>  <button disabled class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="PurchaseEnquiry" data-recordid="'.$PurchaseEnquiry->id.'"><i class="fa fa-edit"></i> </button>';
                }
            })
            ->rawColumns(['action', 'show_id']) 
            ->make(true);
    }


    public function getUsersRateContractRequestsList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $RateContractRequests = RateContractRequest::with('creator', 'item')->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->select('rate_contract_requests.*');

        return Datatables::of($RateContractRequests)
            ->editColumn('id', 'RCR-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('PE-', id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($RateContractRequest) {
                if($RateContractRequest->item_id == null){
                    return $RateContractRequest->item_description;
                } else {
                    return $RateContractRequest->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->addColumn('action', function ($RateContractRequest) use ($user) {
                if(strpos($RateContractRequest->status, 'Rejected') !== false){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$RateContractRequest->id.'"><i class="fa fa-info"></i> </button>  <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$RateContractRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$RateContractRequest->id.'"><i class="fa fa-info"></i> </button>  <button disabled class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$RateContractRequest->id.'"><i class="fa fa-edit"></i> </button>';
                }
            })
            ->rawColumns(['action']) 
            ->make(true);
    }


    public function getUsersStockItemRequestsList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockItemRequests = StockItemRequest::with('creator', 'item')->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_item_requests.*');

        return Datatables::of($StockItemRequests)
            ->editColumn('id', 'RCR-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('PE-', id) like ?";
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
                if(strpos($StockItemRequest->status, 'Rejected') !== false){
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-info"></i> </button>  <button class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-edit"></i> </button>';
                } else {
                    return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-info"></i> </button>  <button disabled class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="RateContractRequest" data-recordid="'.$StockItemRequest->id.'"><i class="fa fa-edit"></i> </button>';
                }
            })
            ->rawColumns(['action']) 
            ->make(true);
    }



    public function getUsersStockIssuanceRequestsList(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $StockIssueRequests = StockItemIssueRequest::with(['creator', 'project', 'stockItem.item'])->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->select('stock_item_issue_requests.*');


        return Datatables::of($StockIssueRequests)
            ->addColumn('show_id', 'SIIR-{{$stock_item_issuance_request_group_id}}-{{$stock_item_issuance_request_ingroup_id}}')
            ->filterColumn('show_id', function($query, $keyword) {
                $sql = "CONCAT('SIIR-', stock_item_issuance_request_group_id,'-','stock_item_issuance_request_ingroup_id') like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('id', 'SIIR-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('SIIR-', id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->addColumn('action', function ($StockIssueRequest) use ($user) {
                return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="StockItemIssueRequest" data-recordid="'.$StockIssueRequest->id.'"><i class="fa fa-info"></i> </button>';
            })
            ->rawColumns(['action']) 
            ->make(true);

    }


    public function getUsersStockItemIssueRequestDetails(Request $request)
    {
        $user = $request->user();
        $recordID = $request->all()[1];
        $RecordInfo = StockItemIssueRequest::where('id', $recordID)->where('company_id', $user->company_id)->where('created_by', $user->id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'stockItem.item', 'history.currentActionBy', 'project', 'issuances.creator');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }



    public function getUsersStockReturnRequestsList(Request $request)
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
                return '<button class="btn btn-xs btn-info view-placeholder" data-elquentClass="StockItemReturnRequest" data-recordid="'.$StockReturnRequest->id.'"><i class="fa fa-info"></i> </button>';
            })
            ->rawColumns(['action']) 
            ->make(true);

    }


    public function getUsersStockItemReturnRequestDetails(Request $request)
    {

        $user = $request->user();
        $recordID = $request->all()[1];
        $RecordInfo = StockItemReturnRequest::with('creator')->where('id', $recordID)->where('company_id', $user->company_id)->where('created_by', $user->id)->get()->first();
        if($RecordInfo){
            return $RecordInfo->load('creator', 'stockItemIssueRequest.stockItem.item', 'history.currentActionBy', 'stockItemIssueRequest.project');
        } else {
            return "Unable to retrieve data, you don't have permission to view this record!";
        }

    }


    public function validateBudgetCreation(Request $request)
    {
        

        $user = $request->user();

        $BudgetId = $request->get('ItemId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $budget = BudgetMaster::findOrfail($BudgetId);
        $currentApprovalLevel = $budget->approval_level;
        $nextApprovalLevel = $budget->approval_level + 1;;
        // return $budget;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $budget->approval_level   = 1;
            $budget->status           = "Rejected By Validator at Level ".$currentApprovalLevel;
            $budget->active           = 'No';
            $budget->update();


            //Check if the item creation has requester or it is orginated by LMA role
            if($budget->creation_request_id !== NULL){

                //update the item request with the rejection status levels and status
                $budgetCreationRequest = $budget->budgetCreationRequest;
                $budgetCreationRequest->status = "Rejected By Validator at Level ".$currentApprovalLevel;
                $budgetCreationRequest->update();


                //record item history
                ApprovalBudgetMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'budget_request_id'               => $budget->creation_request_id,
                    'budget_id'                       => $budget->id,
                    'current_action_description'    => 'Request Under Review By the Validator Level '.$currentApprovalLevel,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $nextApprovalLevel - 1,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => 'Request Under Review By The Originator',
                    'next_action_owners'            => $budget->budgetCreationRequest->requester->name,
                    'next_approval_level'           => 'N/A',
                ]);

                //Send Notification to Orginator for his action
                $budgetOriginalRequester = $budget->budgetCreationRequest->requester;
                $budgetOriginalRequester->notify(new BudgetCreationRequestRejectedNotification($budget->budgetCreationRequest));

                /* Send Broadcast Message */
                $title = 'Request To Update The Set-up Budget Has Been Rejected';
                $body = 'Rejection Notes: '.$ValidationDecisionNote;
                event(new MessageToUserToTakeAction($budgetCreationRequest->requester, $title, $body, Carbon::now(), $budgetCreationRequest->requester->id));

            } else {
                //if the originator is not through item request form (Created by LMA directly)

                /* We are never here as the funtionality is no longer required */
                return response()->json([
                    "messageTitle"  => 'Error Occured.',
                    "message"       => 'Please Contact System Administrator. (Error# 9450)',
                    "messageType"   => 'error'
                ], 200);
            }
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Request To Update Set-up Budget Rejected.',
                "message"       => 'A notification is sent to originator for further action.',
                "messageType"   => 'success'
            ], 200);
        }
         
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'SUBV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){
            //dd('we are here');

            //update the item with the approval levels and status
            $budget->status           = "Approved by Validator Level ". $currentApprovalLevel ." and Assigned to Validator Level ". $nextApprovalLevel ." for Approval";
            $budget->approval_level   = $nextApprovalLevel;
            $budget->update();

            //update the item request status
            if($budget->creation_request_id !== NULL){
                $budgetCreationRequest = $budget->budgetCreationRequest;
                $budgetCreationRequest->status = "Approved by Validator Level ". $currentApprovalLevel ." and Assigned to Validator Level ". $nextApprovalLevel ." for Approval";

                $mytime = Carbon::now();
                $today = $mytime->toDateString();
                if($budgetCreationRequest->request_end_date < $today){
                    $budgetCreationRequest->request_end_date = $today;
                }
                $getProjectData = Project::where('id', $budgetCreationRequest->project_id)->first();

                //chenking consumed budget
                $current_avaiable_budget = $getProjectData->value - $getProjectData->consumed_budget;
                $request_time_avaiable_budget = $budgetCreationRequest->pro_ini_value  - $budgetCreationRequest->pro_ini_consumed_budget;
                $calculate_difference =  $request_time_avaiable_budget - $current_avaiable_budget;
                $budgetCreationRequest->request_amount = $budgetCreationRequest->request_amount - $calculate_difference;
                $budgetCreationRequest->pro_ini_consumed_budget = $getProjectData->consumed_budget;
                
                $budgetCreationRequest->update();
            }



            // Find and send notification to next level employees
            $title = 'New Request to Update Setup-Budget Pending Your Approval';
            $body = 'You Have New Request to Update Set-up Budget Pending Your Approval';
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $thisUser) {
                $thisUser->notify(new BudgetCreatedValidationNotification($budget));
                event(new MessageToUserToTakeAction($thisUser, $title, $body, Carbon::now(), $thisUser->id));
            }

    
            //(if request came from itemCreationRequest)
            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();

            ApprovalBudgetMasterHistory::create([
                'company_id'                    => $user->company_id,
                'budget_request_id'               => ($budget->creation_request_id !== NULL ? $budget->creation_request_id : 'N/A' ),
                'budget_id'                       => $budget->id,
                'current_action_description'    => "Request Under Review By the Validator Level ".$currentApprovalLevel,
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => $currentApprovalLevel,
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
                'next_action_description'       => "Request Under Review By the Validator Level ".$nextApprovalLevel,
                'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                'next_approval_level'           => $nextApprovalLevel,
            ]);
            
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Request To Update Set-up Budget Validated Successfully.',
                "message"       => 'The Request Needs to be Approved by Another Level.',
                "messageType"   => 'success'
            ], 200);



        } else {
            //update the item with the approval levels and status
            $budget->status           = "Fully Approved by Validator Level ". $budget->approval_level;
            $budget->active           = "Yes";
            
            /* Update Grouping IDs*/
            $query = "CAST(budget_ingroup_id AS DECIMAL(10,0)) DESC";
            $LastestBudgetByTemplate = BudgetMaster::where('company_id', $user->company_id)->where('template_id', $budget->template_id)->orderByRaw($query)->orderBy('budget_ingroup_id', 'desc')->limit(1)->get()->first();

        
            //return $LastestbudgetByTemplate;
            if($LastestBudgetByTemplate->budget_ingroup_id == ''){
                //we are here because there is no previous records available (this is the first PE ever) 
                $budget->budget_ingroup_id = 1;
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $budget->budget_ingroup_id = $LastestBudgetByTemplate->budget_ingroup_id + 1;
            }

            $budget->update();
 
            //update the budget request status
            $budgetCreationRequest = $budget->budgetCreationRequest;
            $budgetCreationRequest->status = "Fully Approved by Validator Level ". $budget->approval_level. " and the Set-up Budget is Updated";
            $budgetCreationRequest->update();
            

            //notify the original requester 
            //Check if the budget creation has requester or it is orginated by LMA role
            if($budget->creation_request_id !== NULL){

                ApprovalBudgetMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'budget_request_id'               => $budget->creation_request_id,
                    'budget_id'                       => $budget->id,
                    'current_action_description'    => "Request Under Review By the Validator Level ". $budget->approval_level,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $budget->approval_level,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Request is Fully Approved and the Set-up Budget is Updated",
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);


                // Send Notification to Orginator for his action
                $budgetOriginalRequester = $budget->budgetCreationRequest->requester;
                $budgetOriginalRequester->notify(new BudgetCreatedFullValidatedNotification());

                $title = 'Request To Update Set-up Budget Fully Validated Successfully.';
                $body = 'The Set-up Budget has Been Updated as per the Request.';
                event(new MessageToUserToTakeAction($budgetCreationRequest->requester, $title, $body, Carbon::now(), $budgetCreationRequest->requester->id));

            } else {

                ApprovalBudgetMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'budget_request_id'               => "N/A",
                    'budget_id'                       => $budget->id,
                    'current_action_description'    => "Request Under Review By the Validator Level ". $budget->approval_level,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $budget->approval_level,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Request is Fully Approved and the Set-up Budget Updated",
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);


                $budgetOriginalOrginator = $budget->creator;
                $budgetOriginalOrginator->notify(new BudgetCreatedFullValidatedNotification());

                $title = 'Request To Update Set-up Budget Fully Validated Successfully.';
                $body = 'The Set-up Budget has Been Updated as per the Request.';
                event(new MessageToUserToTakeAction($budgetOriginalOrginator->requester, $title, $body, Carbon::now(), $budgetOriginalOrginator->requester->id));

            }

            //Last Validator Approved and data updated at main project table
            // return $budgetCreationRequest;
            $getRequest = BudgetCreationRequest::where('budget_request_group_id', $budgetCreationRequest->budget_request_group_id)->first();
            $getProjectData = Project::where('id', $getRequest->project_id)->first();
            
            //checking consumed budget
            $current_avaiable_budget = $getProjectData->value - $getProjectData->consumed_budget;
            $request_time_avaiable_budget = $budgetCreationRequest->pro_ini_value  - $budgetCreationRequest->pro_ini_consumed_budget;
            $calculate_difference =  $request_time_avaiable_budget - $current_avaiable_budget;
            $budgetCreationRequest->request_amount = $budgetCreationRequest->request_amount - $calculate_difference;
            $budgetCreationRequest->pro_ini_consumed_budget = $getProjectData->consumed_budget;
            $budgetCreationRequest->update();
            
            $getRequest = BudgetCreationRequest::where('budget_request_group_id', $budgetCreationRequest->budget_request_group_id)->first();
            

                $mytime = Carbon::now();
                $today = $mytime->toDateString();
                if($getRequest->request_end_date != null){

                    if($getRequest->request_end_date < $today){
                        $getProjectData->end_date = $today;
                    }
                    else{
                        $getProjectData->end_date = $getRequest->request_end_date;
                    }
                }
                if($getRequest->request_amount != null){

                    $getProjectData->value = $getRequest->request_amount + $getProjectData->consumed_budget; 
                }
                $getRequest->update();
                $getProjectData->update();
            
            return response()->json([
                "messageTitle"  => 'Request To Update Set-up Budget Fully Validated Successfully.',
                "message"       => 'The Set-up Budget has Been Updated as per the Request.',
                "messageType"   => 'success'
            ], 200);

        }
    }

    public function validateItemCreation(Request $request)
    {
        $user = $request->user();

        $ItemId = $request->get('ItemId');
        $ValidationDecision = $request->get('Decision');
        $ValidationDecisionNote = $request->get('DecisionNotes');
        $item = ItemMaster::findOrfail($ItemId);
        $currentApprovalLevel = $item->approval_level;
        $nextApprovalLevel = $item->approval_level + 1;

        //check if item creation is rejected
        if($ValidationDecision == "Rejected"){

            //update the item with the rejection status levels and status
            $item->approval_level   = 1;
            $item->status           = "Rejected By Validator Level ".$currentApprovalLevel;
            $item->active           = 'No';
            $item->update();


            //Check if the item creation has requester or it is orginated by LMA role
            if($item->creation_request_id !== NULL){

                //update the item request with the rejection status levels and status
                $itemCreationRequest = $item->itemCreationRequest;
                $itemCreationRequest->status = "Rejected By Validator Level ".$currentApprovalLevel;
                $itemCreationRequest->update();


                //record item history
                ApprovalItemMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'item_request_id'               => $item->creation_request_id,
                    'item_id'                       => $item->id,
                    'current_action_description'    => 'Request Under Review By the Validator Level '.$currentApprovalLevel,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $nextApprovalLevel - 1,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => 'Request Under Review By The Originator',
                    'next_action_owners'            => $item->itemCreationRequest->requester->name,
                    'next_approval_level'           => 'N/A',
                ]);

                //Send Notification to Orginator for his action
                $itemOriginalRequester = $item->itemCreationRequest->requester;
                $itemOriginalRequester->notify(new ItemCreationRequestRejectedNotification($item->itemCreationRequest));

                /* Send Broadcast Message */
                $title = 'Request To Update The Library of Materials Has Been Rejected';
                $body = 'Rejection Notes: '.$ValidationDecisionNote;
                event(new MessageToUserToTakeAction($itemCreationRequest->requester, $title, $body, Carbon::now(), $itemCreationRequest->requester->id));

            } else {
                //if the originator is not through item request form (Created by LMA directly)

                /* We are never here as the funtionality is no longer required */
                return response()->json([
                    "messageTitle"  => 'Error Occured.',
                    "message"       => 'Please Contact System Administrator. (Error# 9450)',
                    "messageType"   => 'error'
                ], 200);

                //record item history
                // ApprovalItemMasterHistory::create([
                //     'company_id'                => $user->company_id,
                //     'item_request_id'           => 'N/A',
                //     'item_id'                   => $item->id,
                //     'description'               => 'Rejected By '.$user->name. ' (Level ' .$nextApprovalLevel. ')',
                //     'current_action_owner_id'   => $user->id,
                //     'next_action_owners'        => $item->creator->name,
                //     'current_approval_level'    => $nextApprovalLevel,
                //     'next_approval_level'       => 0,
                //     'decision'                  => $ValidationDecision,
                //     'decision_notes'            => $ValidationDecisionNote,
                // ]);

                // $itemOriginalOrginator = $item->creator;
                // $itemOriginalOrginator->notify(new ItemCreationLMARejectedNotification($item));
            }
            
            
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Request To Update Library of Materials Rejected.',
                "message"       => 'A notification is sent to originator for further action.',
                "messageType"   => 'success'
            ], 200);
        }

        
        //find if there is another level of approvals
        $NextApprovalLevelsForConcernedRole = $user->company->roles->where('role_name', 'ALMV')->where('role_level', $nextApprovalLevel)->unique('user_id')->pluck('user_id');

        //check if we will have another approvals level if yes then do the below
        if($NextApprovalLevelsForConcernedRole->count() > 0){

            //dd('we are here');

            //update the item with the approval levels and status
            $item->status           = "Approved by Level ". $currentApprovalLevel ." and Assigned to Validator Level ". $nextApprovalLevel ." for Approval";
            $item->approval_level   = $nextApprovalLevel;
            $item->update();

            //update the item request status
            if($item->creation_request_id !== NULL){
                $itemCreationRequest = $item->itemCreationRequest;
                $itemCreationRequest->status = "Approved by Level ". $currentApprovalLevel ." and Assigned to Validator Level ". $nextApprovalLevel ." for Approval";
                $itemCreationRequest->update();
            }



            // Find and send notification to next level employees
            $title = 'New Request to Update Library of Materials Pending Your Approval';
            $body = 'You Have New Request to Update Library of Materials Pending Your Approval';
            $UsersForNextLevelApproval = User::whereIn('id', $NextApprovalLevelsForConcernedRole)->get();
            foreach ($UsersForNextLevelApproval as $key => $thisUser) {
                $thisUser->notify(new ItemCreatedValidationNotification($item));
                event(new MessageToUserToTakeAction($thisUser, $title, $body, Carbon::now(), $thisUser->id));
            }

    
            //(if request came from itemCreationRequest)
            $NextApprovalLevelNames = $UsersForNextLevelApproval->pluck('name')->toArray();

            ApprovalItemMasterHistory::create([
                'company_id'                    => $user->company_id,
                'item_request_id'               => ($item->creation_request_id !== NULL ? $item->creation_request_id : 'N/A' ),
                'item_id'                       => $item->id,
                'current_action_description'    => "Request Under Review By the Validator Level ".$currentApprovalLevel,
                'current_action_owner_id'       => $user->id,
                'current_approval_level'        => $currentApprovalLevel,
                'decision'                      => $ValidationDecision,
                'decision_notes'                => $ValidationDecisionNote,
                'next_action_description'       => "Request Under Review By the Validator Level ".$nextApprovalLevel,
                'next_action_owners'            => (implode(', ', $NextApprovalLevelNames)),
                'next_approval_level'           => $nextApprovalLevel,
            ]);
            
        
            //send message back to user 
            return response()->json([
                "messageTitle"  => 'Request To Update Library of Materials Validated Successfully.',
                "message"       => 'The Request Needs to be Approved by Another Level.',
                "messageType"   => 'success'
            ], 200);



        } else {

            //update the item with the approval levels and status
            $item->status           = "Fully Approved by Level ". $item->approval_level;
            $item->active           = "Yes";
            
            /* Update Grouping IDs*/
            $query = "CAST(item_ingroup_id AS DECIMAL(10,0)) DESC";
            $LastestItemByTemplate = ItemMaster::where('company_id', $user->company_id)->where('template_id', $item->template_id)->orderByRaw($query)->orderBy('item_ingroup_id', 'desc')->limit(1)->get()->first();

        
            //return $LastestItemByTemplate;
            if($LastestItemByTemplate->item_ingroup_id == ''){
                //we are here because there is no previous records available (this is the first PE ever) 
                $item->item_ingroup_id = 1;
            } else {
                //we are here because there is a previous records available and will use the the next sequence number
                $item->item_ingroup_id = $LastestItemByTemplate->item_ingroup_id + 1;
            }

            $item->update();


            //update the item request status
            $itemCreationRequest = $item->itemCreationRequest;
            $itemCreationRequest->status = "Fully Approved by Level ". $item->approval_level. " and the Library of Materials Updated";
            $itemCreationRequest->update();
            

            //notify the original requester 
            //Check if the item creation has requester or it is orginated by LMA role
            if($item->creation_request_id !== NULL){

                ApprovalItemMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'item_request_id'               => $item->creation_request_id,
                    'item_id'                       => $item->id,
                    'current_action_description'    => "Request Under Review By the Validator Level ". $item->approval_level,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $item->approval_level,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Request is Fully Approved and the Library of Materials Updated",
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);


                //Send Notification to Orginator for his action
                $itemOriginalRequester = $item->itemCreationRequest->requester;
                $itemOriginalRequester->notify(new ItemCreatedFullValidatedNotification());

                $title = 'Request To Update Library of Materials Fully Validated Successfully.';
                $body = 'The Library of Materials has Been Updated as per the Request.';
                event(new MessageToUserToTakeAction($itemCreationRequest->requester, $title, $body, Carbon::now(), $itemCreationRequest->requester->id));

            } else {

                ApprovalItemMasterHistory::create([
                    'company_id'                    => $user->company_id,
                    'item_request_id'               => "N/A",
                    'item_id'                       => $item->id,
                    'current_action_description'    => "Request Under Review By the Validator Level ". $item->approval_level,
                    'current_action_owner_id'       => $user->id,
                    'current_approval_level'        => $item->approval_level,
                    'decision'                      => $ValidationDecision,
                    'decision_notes'                => $ValidationDecisionNote,
                    'next_action_description'       => "Request is Fully Approved and the Library of Materials Updated",
                    'next_action_owners'            => 'N/A',
                    'next_approval_level'           => 'N/A',
                ]);


                $itemOriginalOrginator = $item->creator;
                $itemOriginalOrginator->notify(new ItemCreatedFullValidatedNotification());

                $title = 'Request To Update Library of Materials Fully Validated Successfully.';
                $body = 'The Library of Materials has Been Updated as per the Request.';
                event(new MessageToUserToTakeAction($itemOriginalOrginator->requester, $title, $body, Carbon::now(), $itemOriginalOrginator->requester->id));

            }

            

            return response()->json([
                "messageTitle"  => 'Request To Update Library of Materials Fully Validated Successfully.',
                "message"       => 'The Library of Materials has Been Updated as per the Request.',
                "messageType"   => 'success'
            ], 200);

        }
    }


    public function rejectItemRequestByLMA(Request $request)
    {
        
        $user = $request->user();
        $RejectionNotes = $request->get('RejectionNotes');
        $ItemRequestId = $request->get('ItemRequestId');
        

        //Update Existing Record
        $ItemCreationRequest = ItemCreationRequest::findOrfail($ItemRequestId);
        $ItemCreationRequest->status = 'Rejected By Library of Materials Administrator';
        $ItemCreationRequest->update();
        

        //record item history
        ApprovalItemMasterHistory::create([
            'company_id'                    => $user->company_id,
            'item_request_id'               => $ItemCreationRequest->id,
            'item_id'                       => 'Not Yet Created',
            'current_action_description'    => 'Request Under Review By The Administrator',
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 'N/A',
            'decision'                      => 'Rejected',
            'decision_notes'                => $RejectionNotes,
            'next_action_description'       => 'Request Under Review By The Originator',
            'next_action_owners'            => $ItemCreationRequest->requester->name,
            'next_approval_level'           => 'N/A',
        ]);

        /* Notify By Email */
        $ItemCreationRequest->requester->notify(new ItemCreationRequestRejectedNotification($ItemCreationRequest));

        /* Notify By Boardcast Message */
        $title = 'Request To Update The Library of Materials Has Been Rejected';
        $body = 'Rejection Notes: '.$RejectionNotes;
        event(new MessageToUserToTakeAction($ItemCreationRequest->requester, $title, $body, Carbon::now(), $ItemCreationRequest->requester->id));
      

        return response()->json([
            "messageTitle"  => 'Request To Update The Library of Materials Rejected Successfully.',
            "message"       => 'Request To Update The Library of Materials Rejected Successfully, The Request Will be Sent Back to Orginator.',
            "messageType"   => 'success'
        ], 200);
    }

    public function cancelItemRequestByOriginator(Request $request)
    {

        $user = $request->user();

        $ItemRequestId = $request->get('ItemRequestId');
        $itemRequest = ItemCreationRequest::findOrfail($ItemRequestId);
        $itemRequest->status = "Request Cancelled By Originator";
        $itemRequest->update();

        //record item history
        ApprovalItemMasterHistory::create([
            'company_id'                    => $user->company_id,
            'item_request_id'               => $itemRequest->id,
            'item_id'                       => 'Not Created',
            'current_action_description'    => 'Request Under Review By The Originator',
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 'N/A',
            'decision'                      => 'Cancelled',
            'decision_notes'                => 'N/A',
            'next_action_description'       => 'N/A',
            'next_action_owners'            => 'N/A',
            'next_approval_level'           => 'N/A',
        ]);

        return response()->json([
                "messageTitle"  => 'Request To Update The Library of Materials Cancelled Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ], 200);
    }

    public function cancelBudgetRequestByOriginator(Request $request)
    {
        // return $request;

        $user = $request->user();

        $BudgetRequestId = $request->get('ItemRequestId');
        $budgetRequest = BudgetCreationRequest::findOrfail($BudgetRequestId);
        $budgetRequest->status = "Request Cancelled By Originator";
        $budgetRequest->update();

        //record item history
        ApprovalBudgetMasterHistory::create([
            'company_id'                    => $user->company_id,
            'budget_request_id'               => $budgetRequest->id,
            'budget_id'                       => 'Not Created',
            'current_action_description'    => 'Request Under Review By The Originator',
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 'N/A',
            'decision'                      => 'Cancelled',
            'decision_notes'                => 'N/A',
            'next_action_description'       => 'N/A',
            'next_action_owners'            => 'N/A',
            'next_approval_level'           => 'N/A',
        ]);

        return response()->json([
                "messageTitle"  => 'Request To Update The Set-up Budget Cancelled Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ], 200);
    }

    public function cancelItemCreationByOriginator(Request $request)
    {

        $user = $request->user();

        $ItemId = $request->get('ItemId');
        $item = ItemMaster::findOrfail($ItemId);
        $item->status = "Cancelled By Originator";
        $item->update();

        //record item history
        ApprovalItemMasterHistory::create([
            'company_id'                    => $user->company_id,
            'item_request_id'               => 'N/A',
            'item_id'                       => $item->id,
            'current_action_description'    => 'Cancelled By Originator',
            'current_action_owner_id'       => $user->id,
            'current_approval_level'        => 'N/A',
            'decision'                      => 'Cancelled',
            'decision_notes'                => 'N/A',
            'next_action_description'       => 'N/A',
            'next_action_owners'            => 'N/A',
            'next_approval_level'           => 'N/A',
        ]);

        return response()->json([
                "messageTitle"  => 'Request To Update The Library of Materials Cancelled Successfully.',
                "message"       => 'Request To Update The Library of Materials Cancelled Successfully.',
                "messageType"   => 'success'
            ], 200);
    }


    public function getUsersRFIs(Request $request)
    {
        $user = $request->user();

        //Get purchase enquiries per company
        $PurchaseEnquiries = PurchaseEnquiry::with('creator', 'item')->has('rfis')->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->select('purchase_enquiries.*');

        return Datatables::of($PurchaseEnquiries)
            ->editColumn('id', 'PE-{{$id}}')
            ->filterColumn('id', function($query, $keyword) {
                $sql = "CONCAT('PE-', id) like ?";
                $query->whereRaw($sql, ["%{$keyword}%"]);
            })
            ->editColumn('item.description', function ($PurchaseEnquiry) {
                if($PurchaseEnquiry->item_id == null){
                    return 'N/A';
                } else {
                    return $PurchaseEnquiry->item->description;
                }
                
            })
            ->editColumn('item_description', '{!! str_limit($item_description, 60) !!}')
            ->editColumn('service_description', '{!! str_limit($service_description, 60) !!}')
            ->addColumn('action', function ($PurchaseEnquiry) use ($user) {
                return '<button class="btn btn-block btn-info view-placeholder" data-vendorid='.$PurchaseEnquiry->rfis->first()->vendor_id.' data-companyid='.$PurchaseEnquiry->company_id.' data-quotationid='.$PurchaseEnquiry->rfis->first()->quotation_id.' data-elquentClass="PurchaseEnquiryRFI"><i class="fa fa-comments"></i> </button><div class="numberCircle pull-right"><span>'. $PurchaseEnquiry->rfis->count() .'</span></div>';
            })
            ->rawColumns(['action']) 
            ->make(true);
    }

    public function createUserRFIMessage(Request $request)
    {
        $user = $request->user();
        $VendorId = $request->get('VendorId');

        $RFIDetails = RFICommunication::create([
            'user_id'           => $user->id,
            'user_type'         => "Originator",
            'vendor_id'         => $VendorId,
            'company_id'        => $request->get('CompanyId'),
            'quotation_id'      => $request->get('QuotationId'),
            'pe_id'             => $request->get('PEId'),
            'message'           => $request->get('RFImessage')
        ]);

        //send notification to all vendor users under bidding role for the specific company
        $VendorBiddingUsers = Vendor::where('id', $request->get('VendorId'))->whereHas('users', function ($query) {
            $query->where('sbm_role', 'SBM');
        })->first()->users;
        
        foreach ($VendorBiddingUsers as $key => $VendorUser) {
            $VendorUser->notify(new CompanyRFIResponseNotification($RFIDetails));
        }
        
        //update quotation tracker status
        QuotationRequest::findOrFail($request->get('QuotationId'))->Vendors()->wherePivot('vendor_id', $VendorId)->where('company_id', $request->get('CompanyId'))->updateExistingPivot($VendorId, ['status' => 'RFI Responded']);
        QuotationResponseTracker::where('quotation_id', $request->get('QuotationId'))->where('vendor_id', $VendorId)->where('company_id', $request->get('CompanyId'))->update([
                'status' => 'RFI Responded'
        ]);


        //feedback to user
        return response()->json([
            "messageTitle"  => 'RFI Response Submitted Successfully.',
            "message"       => 'Your Response has been submitted successfully, the vendor is notified by email to view the response.',
            "messageType"   => 'success'
        ], 200);

    
    }


    public function updateProfileDetails(Request $request)
    {
        $user = $request->user();

        $PersonalDetails = json_decode($request->get('PersonalDetails'), true);
        $ProfileImage = $request->file('ProfileImage');

        if ($ProfileImage) {
            $filecontents       = file_get_contents($ProfileImage);
            $fileName           = $ProfileImage->getClientOriginalName();
            $extension          = $ProfileImage->getClientOriginalExtension() ?: 'png';
            $folderName         = '/public/uploads/ProfileImages/';
            $destinationPath    = base_path() . $folderName;
            $safeName           = time().$fileName;
            $ProfileImage->move($destinationPath, $safeName);
        }


        if($ProfileImage){
            $user->picture = $safeName;
        }


        $LoginImage = $request->file('LoginImage');

        if ($LoginImage) {
            $filecontents       = file_get_contents($LoginImage);
            $fileName           = $LoginImage->getClientOriginalName();
            $extension          = $LoginImage->getClientOriginalExtension() ?: 'png';
            $folderName         = '/public/uploads/ProfileImages/';
            $destinationPath    = base_path() . $folderName;
            $safeName           = 'image'.rand(100,1000).time().$extension;
            $LoginImage->move($destinationPath, $safeName);
        }


        if($LoginImage){
            $user->login_image = $safeName;
        }





        if($user->designation !== $PersonalDetails['designation'] && $PersonalDetails['designation'] != ""){
            $user->designation = $PersonalDetails['designation'];
        }

        if($user->phone_number !== $PersonalDetails['phone'] && $PersonalDetails['phone'] != ""){
            $user->phone_number = $PersonalDetails['phone'];
        }

        if ($user->address !== $PersonalDetails['address'] && $PersonalDetails['address'] != ""){
            $user->address = $PersonalDetails['address'];
        }

        $user->update();


        /*Send Feedback To User*/
        return response()->json([
            "messageTitle"      => 'Profile Updated Successfully.',
            "message"           => 'You detailed are now updated successfully.',
            "messageType"       => 'success',
            "imageSafeName"     => $user->picture,
            "loginImageName"     => $user->login_image,
            "Designation"       => $user->designation,
            "Phone"             => $user->phone_number,
            "Address"           => $user->address
        ], 200);

    }


    public function getUserPendingTasks(Request $request)
    {
        $user = $request->user();
        $RejectedItemCreationsRequests = 0;
        $PendingItemCreationRequestsLMA = 0;
        $PendingItemCreationRequestsALMV = 0;
        $PendingPurchaseEnquiries = 0;
        $PendingVendorRFIsCount = 0;
        $PendingPurchaseOrders = 0;
        $PendingRateContractRequests = 0;
        $PendingStockItemRequests = 0;
        $PendingSetUpBudgetRequests = 0;
        $RejectedSetUpBudgetRequests = 0;
        $FoundQuotationIds = [];

        /*  Libarary Of Materials Pending Tasks  */
        //Get Pending Request to Update Library of Materials Assigned to LMA
        $RejectedItemCreationsRequests = ItemCreationRequest::where('status', 'LIKE', '%Rejected%')->where('requester_id', $user->id)->get()->count();
        $userLMAProjects = $user->roles->where('role_name', 'LMA')->pluck('project_id')->toArray();
        $PendingItemCreationRequestsLMA = ItemCreationRequest::where('status', 'LIKE', '%Created and Assigned%')->orWhere('status', 'LIKE', '%Resubmitted and Assigned%')->whereIn('project_id', $userLMAProjects)->get()->count();
        /* Get request Pending approvals base on validator's all level */
        $userALMVProjects = $user->roles->where('role_name', 'ALMV')->pluck('project_id')->toArray();
        $UserApprovalALMVLevel = $user->roles->where('role_name', 'ALMV')->pluck('role_level')->toArray();
        $PendingItemCreationRequestsALMV = ItemCreationRequest::where('status', 'LIKE', '%Assigned to Validator Level%')->whereIn('project_id', $userALMVProjects)->whereHas('item', function ($query) use ($UserApprovalALMVLevel) {
            $query->whereIn('approval_level', $UserApprovalALMVLevel);
        })->get()->count();



        /*  Purchase Enquiry Pending Tasks  */
        $PendingPurchaseEnquiries = PurchaseEnquiry::where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->where('status', 'LIKE', '%Rejected%')->get()->count();
        $PendingVendorRFIs = PurchaseEnquiry::with('quotations.trackers')->where('created_by', $user->id)->where('company_id', $user->company_id)->where('active', 'Yes')->get();
        foreach ($PendingVendorRFIs as $key => $PendingVendorRFI) {
            if($PendingVendorRFI->quotations->count()){
                foreach ($PendingVendorRFI->quotations->first()->trackers as $key => $tracker) {
                    if($tracker->status == "RFI Submitted" && !in_array($tracker->quotation_id, $FoundQuotationIds)){
                        $FoundQuotationIds[] = $tracker->quotation_id;
                        $PendingVendorRFIsCount = $PendingVendorRFIsCount + 1;                        
                    }
                }
            }
        }

        $PendingRateContractRequests = RateContractRequest::where('created_by', $user->id)->where('status', 'LIKE', '%Rejected%')->get()->count();
        $PendingStockItemRequests = StockItemRequest::where('created_by', $user->id)->where('status', 'LIKE', '%Rejected%')->get()->count();
        $userSUBVProjects = $user->roles->where('role_name', 'SUBV')->pluck('project_id')->toArray();
        $userSUBOProjects = $user->roles->pluck('project_id')->toArray();

        $PendingSetUpBudgetRequests = BudgetCreationRequest::where('status', 'LIKE', '%Assigned to Validator level%')->whereIn('project_id', $userSUBVProjects)->get()->count();
        $RejectedSetUpBudgetRequests = BudgetCreationRequest::where('status', 'LIKE', '%Rejected%')->where('project_id', $userSUBOProjects)->get()->count();

        return response()->json([
            "PendingItemCreationRequestsALMV"    => $PendingItemCreationRequestsALMV,
            "PendingItemCreationRequestsLMA"    => $PendingItemCreationRequestsLMA,
            "RejectedItemCreationsRequests"     => $RejectedItemCreationsRequests,
            "PendingVendorRFIs"                 => $PendingVendorRFIsCount,
            "PendingPurchaseEnquiries"          => $PendingPurchaseEnquiries,
            "PendingPurchaseOrders"             => $PendingPurchaseOrders,
            "PendingRateContractRequests"       => $PendingRateContractRequests,
            "PendingStockItemRequests"          => $PendingStockItemRequests,
            "PendingSetUpBudgetRequests"          => $PendingSetUpBudgetRequests,
            "RejectedSetUpBudgetRequests"          => $RejectedSetUpBudgetRequests,
        ], 200);
    }





















    public function createPDFTest(Request $request)
    {
        $user = $request->user();
        $data = [
            'user'          => $user,
            'otherData'     => 'Now We Can Generate PDFs',
        ];


        $pdf = PDF::loadView('pdf.testpdf', $data);
        return $pdf->download('testpdf.pdf');

        /* Below Are the different versions of PDF package usage */

        /*$pdf = App::make('snappy.pdf.wrapper');
        $pdf->loadHTML('<h1>Test</h1>');
        return $pdf->inline();*/

        //return PDF::loadFile('http://www.github.com')->inline('github.pdf');

        /*$snappy = App::make('snappy.pdf');
        $html = '<h1>Bill</h1><p>You owe me money, dude.</p>';
        $snappy->generateFromHtml($html, '/tmp/bill-125.pdf');
        $snappy->generate('http://www.github.com', '/tmp/github1.pdf');
        Or output:
        return new Response(
            $snappy->getOutputFromHtml($html),
            200,
            array(
                'Content-Type'          => 'application/pdf',
                'Content-Disposition'   => 'attachment; filename="file.pdf"'
            )
        );*/

        /*PDF::loadHTML($html)->setPaper('a4')->setOrientation('landscape')->setOption('margin-bottom', 0)->save('myfile.pdf')*/
    }

    public function updateConpanyDetails(Request $request)
    {
        $user = $request->user();

        Company::findOrfail($user->company_id)->update([
            // 'employees_range'           => ,
            // 'industry'                  => ,
            // 'cities'                    => ,
            // 'pe_prefix'                 => ,
            // 'rfq_prefix'                => ,
            // 'rn_prefix'                 => ,
            // 'po_prefix'                 => ,
            // 'ce_prefix'                 => ,
            // 'additional_required_1'     => ,
            // 'lom_prefix'                => ,
            // 'logo'                      => ,
            'lom_manditory'             => $request->get('companyLoMManditory'),
        ]);


        return response()->json([
            "messageTitle"  => 'Company Details Updated Successfully.',
            "message"       => 'Edited Data Has been updated Successfully.',
            "messageType"   => 'success'
        ], 200);
        
    }

    

}
