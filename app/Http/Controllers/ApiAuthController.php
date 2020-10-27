<?php

namespace App\Http\Controllers;

use DB;
use App\Mail\RegisterMail;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Role;
use App\User;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Notifications\WelcomeEmailNotification;

class ApiAuthController extends Controller
{

	public $successStatus = 200;
    public function deleteUser(Request $request){

        $credentials = $request->only('email', 'password');
        $user = User::where('email', $credentials['email'])->first();
        if($user){
            $user->delete();
            return response([
                'status' => 'success',
                'message' => 'User deleted successfully',
            ], $this->successStatus);
        }
    }
    public function emailLogin(Request $request){
        $credentials = $request->only('email', 'password');
        
        $user = User::where('email', $credentials['email'])->first();
        if($user)  {
            Auth::loginUsingId($user->id);
            $user = Auth::user(); 
            $success['username'] =  $user->first_name .' '. $user->last_name; 
            $success['token'] =  $user->createToken('LaraPassport')->accessToken; 


            /* Get User Details */
            $UserRoles = [];
            $user = $request->user();

            $UserDetails['userId'] = $request->user()->id;
            $UserDetails['CompanyId'] = $request->user()->company_id;
            $UserDetails['Name'] = $request->user()->name;
            $UserDetails['Email'] = $request->user()->email;
            $UserDetails['Picture'] = $request->user()->picture;
            $UserDetails['LoginImage'] = $request->user()->login_image;
            $UserDetails['Designation'] = $request->user()->designation;
            $UserDetails['Phone'] = $request->user()->phone_number;
            $UserDetails['Address'] = $request->user()->address;
            $UserDetails['onboarding'] = $request->user()->onboarding;
            $UserDetails['step'] = $request->user()->step;

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
            return response([
                'status' => 'success',
                'message' => 'User Logged In Successfully',
                'token' => $success['token'],
                'UserDetails' => $UserDetails
            ], $this->successStatus);
        }
    }
    public function ClientLogin(Request $request)
	{

		$credentials = $request->only('email', 'password');
  
        if(Auth::attempt($credentials)){
            $user = Auth::user(); 
            $success['username'] =  $user->first_name .' '. $user->last_name; 
            $success['token'] =  $user->createToken('LaraPassport')->accessToken; 


            /* Get User Details */
            $UserRoles = [];
            $user = $request->user();

            $UserDetails['userId'] = $request->user()->id;
            $UserDetails['CompanyId'] = $request->user()->company_id;
            $UserDetails['Name'] = $request->user()->name;
            $UserDetails['Email'] = $request->user()->email;
            $UserDetails['Picture'] = $request->user()->picture;
            $UserDetails['LoginImage'] = $request->user()->login_image;
            $UserDetails['Designation'] = $request->user()->designation;
            $UserDetails['Phone'] = $request->user()->phone_number;
            $UserDetails['Address'] = $request->user()->address;
            $UserDetails['onboarding'] = $request->user()->onboarding;
            $UserDetails['step'] = $request->user()->step;

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
    

            return response([
                'status' => 'success',
                'message' => 'User Logged In Successfully',
                'token' => $success['token'],
                'UserDetails' => $UserDetails
            ], $this->successStatus);

            
        } else{ 
            return response([
                'status' => 'error',
                'message' => 'Invalid Credentials.'
            ], 400); 
        }

	}


    public function VendorLogin(Request $request)
    {

        $credentials = $request->only('email', 'password');
  
        if(Auth::guard('vendor')->attempt($credentials)) {
            $user = Auth::guard('vendor')->user(); 
            $success['username'] =  $user->name; 
            $success['token'] =  $user->createToken('LaraPassportVendor')->accessToken; 


            $UserRoles = [];

            //$VendorDetails['VendorId'] = $request->user()->vendor_id;
            $VendorDetails['Name'] = $user->name;
            $VendorDetails['Email'] = $user->email;
            foreach ($user->vendors as $key => $vendor) {
                if($vendor->pivot->sbm_role != null){
                   $VendorDetails['SBM'] = $vendor->pivot->sbm_role; 
                }
                if($vendor->pivot->sim_role != null){
                   $VendorDetails['SIM'] = $vendor->pivot->sim_role; 
                }
            }  
            $VendorDetails['Picture'] = $user->picture;
            $VendorDetails['LoginImage'] = $user->login_image;
            $VendorDetails['Phone'] = $user->phone_number;
            $VendorDetails['Address'] = $user->address;
            $VendorDetails['step'] = $user->step;

            return response([
                'status' => 'success',
                'message' => 'User Logged In Successfully',
                'token' => $success['token'],
                'VendorDetails' => $VendorDetails
            ], $this->successStatus);

            
        } else{ 
            return response([
                'status' => 'error',
                'message' => 'Invalid Credentials.'
            ], 400); 
        }

    }



    public function register(Request $request)
    {
        $email = $request->get('email');
        $u = User::where('email',$email)->first();
        if($u !== null){
            if($u->onboarding == 1 && $u->step < 4){
                return response([
                    'status' => 'incomplete',
                    'message' => 'Incomplete Registration',
                    // 'token' => $success['token'],
                ], $this->successStatus);
            }
        }
        
        /* Validate User Input */
        $this->validator($request->all())->validate();
            //Create User
            $user = User::create([
                'name' => $request->get('name'),
                'designation' => $request->get('designation'),
                'email' => $request->get('email'),
                'picture' => 'user_image.png',
                'password' => Hash::make($request->get('password')),
                'ref_id'=>$request->get('ref_id'),
                'onboarding'=>1
            ]);

            //Create Company Administrator Director (CAD)
            Role::create([
                'created_by' => 1,
                'user_id' => $user->id,
                'role_name' => 'CAD',
                'role_level' => 1
            ]);
             if($request->get('ref_id')!="" && $request->get('ref_id')!=null){
                $touser=User::find($request->get('ref_id'));

                Mail::to($touser->email)->send(new RegisterMail($user));
    
             }
           

            //We Should send welcome email
       // $user->notify(new WelcomeEmailNotification());


            /* Get User Details */
            $success['username'] = $user->name;

            $success['token'] = $user->createToken('LaraPassport')->accessToken;



            /* Get User Details */
            $UserRoles = [];

            $UserDetails['userId'] = $user->id;
            $UserDetails['CompanyId'] = $user->company_id;
            $UserDetails['Name'] = $user->name;
            $UserDetails['Email'] = $user->email;
            $UserDetails['Picture'] = $user->picture;
            $UserDetails['Designation'] = $user->designation;
            $UserDetails['Phone'] = $user->phone_number;
            $UserDetails['Address'] = $user->address;
            $UserDetails['onboarding'] = $user->onboarding;
            $UserDetails['step'] = $user->step;

            $UserDetails['LoginImage'] = "";
            
            $UserRolesDB = $user->roles;

            foreach ($UserRolesDB as $key => $value) {
                $UserDetails[$value['role_name']] = $value['role_name'];
            }

            // If the company does not required LOM then remove these roles from the list
            if ($user->company()->exists()) { //Check if we are not logged in as system admin
                if ($user->company->lom_manditory == "FreeText") {
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

            return response([
                'status' => 'success',
                'message' => 'User Registed Successfully',
                'token' => $success['token'],
                'UserDetails' => $UserDetails
            ], $this->successStatus);


    }




    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'designation' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }


    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        //Create User
        $user =  User::create([
            'name' => $data['name'],
            'designation' => $data['designation'],
            'email' => $data['email'],
            'picture' => 'user_image.png',
            'password' => Hash::make($data['password']),
        ]);

        //Create Company Administrator Director (CAD) 
        Role::create([
            'created_by' => 1,
            'user_id' => $user->id,
            'role_name' => 'CAD',
            'role_level' => 1
        ]);

        //We Should send welcome email
        $user->notify(new WelcomeEmailNotification());

        return $user;
    }


}
