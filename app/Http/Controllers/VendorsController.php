<?php

namespace App\Http\Controllers;

use App\Http\Requests\ChangePasswordRequest;
use App\Http\Requests\VendorCreationRequest;
use App\Notifications\VendorAddedToCompanyNotification;
use App\Notifications\VendorCreatedNotification;
use App\Vendor;
use App\VendorQualificationDocs;
use App\VendorUser;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Lcobucci\JWT\Parser;
use yajra\Datatables\Datatables;


class VendorsController extends Controller
{

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


    public function getVendorUserDetails(Request $request)
    {
        $UserRoles = [];
        $user = $request->user();

        //$VendorDetails['VendorId'] = $request->user()->vendor_id;
        $VendorDetails['Name'] = $request->user()->name;
        $VendorDetails['Email'] = $request->user()->email;
        foreach ($request->user()->vendors as $key => $vendor) {
            if($vendor->pivot->sbm_role != null){
               $VendorDetails['SBM'] = $vendor->pivot->sbm_role; 
            }
            if($vendor->pivot->sim_role != null){
               $VendorDetails['SIM'] = $vendor->pivot->sim_role; 
            }
        }  
        $VendorDetails['Picture'] = $request->user()->picture;
        $VendorDetails['Phone'] = $request->user()->phone_number;
        $VendorDetails['Address'] = $request->user()->address;

        return $VendorDetails;
    }

    public function createNewVendor(VendorCreationRequest $request)
    {
    	$user = $request->user();
    	$FileUploads = $request->file('FileUploads');

        $Vendor = Vendor::create([
            'company_id'            => $user->company_id,
            'created_by'            => $user->id,
            'name'                  => $request->get('VendorName'),
            'rep_name'              => $request->get('VendorRepName'),
            'rep_title'             => $request->get('VendorRepTitle'),
            'address'               => $request->get('VendorAddress'),
            'po_box'                => $request->get('VendorPOBOX'),
            'phone'                 => $request->get('VendorPhone'),
            'mobile'                => $request->get('VendorMobile'),
            'url'                   => $request->get('VendorURL'),
            'lic_num'               => $request->get('VendorLicenseNumber'),
            'lic_expiry_date'       => $request->get('VendorLicenseExpiryDate'),
            'provided_service'      => $request->get('VendorProvidedServices'),
            'city'                  => $request->get('VendorCity'),
            'country'               => $request->get('VendorCountry'),
            'officer_name'          => $request->get('VendorHighestRankingOfficerName'),
            'officer_phone'         => $request->get('VendorHighestRankingOfficerPhoneNumber'),
            'bank_name'             => $request->get('VendorBankName'),
            'bank_iban'             => $request->get('VendorBankIBAN'),
            'turnover'              => $request->get('VendorTurnover'),
            'open_since'            => $request->get('VendorOpenSince'),
            'sold_brands'           => $request->get('VendorSoldBrands'),
            'exculsive_brands'      => $request->get('VendorExclusiveBrands'),
            'vendor_type'           => $request->get('VendorType'),
            'notes'                 => $request->get('VendorNotes'),
        ]);

        $Vendor->itemTemplates()->sync($request->get('SelectedItemTemplates'));
    	
    	// validate Docuement Size before upload
        if(!empty($FileUploads)){
            foreach ($FileUploads as $key => $FileDocument) {
                if ($FileDocument)
                {
                    $filecontents       = file_get_contents($FileDocument);
                    $fileName           = $FileDocument->getClientOriginalName();
                    $extension          = $FileDocument->getClientOriginalExtension() ?: 'png';
                    $folderName         = '/public/uploads/vendorsQualificationDocs/';
                    $destinationPath    = base_path() . $folderName;
                    $safeName           = time().$fileName;
                    $FileDocument->move($destinationPath, $safeName);

                    VendorQualificationDocs::create([
                        'created_by'            => $user->id,
                        'company_id'            => $user->company_id,
                        'vendor_id'             => $Vendor->id,
                        'document_name'         => $fileName,
                        'auto_generated_name'   => $safeName,
                    ]);
                }
            }
        }


    	

    	return response()->json([
            "messageTitle"  => 'Vendor Created Successfully.',
            "message"       => 'The Vendor Will Be Selectable for Request For Proposals Once Users Are Assigned Roles on Ogéo.',
            "messageType"   => 'success'
        ], 200);
    }




    public function checkVendorNameDuplicates(Request $request)
    {

        $DuplicatedVendor = Vendor::where('name', $request->get('name'))->get();

        if(count($DuplicatedVendor)){
            return 'Yes';
        } else {
            return 'No';
        }

    }

    public function editVendorDetails(Request $request)
    {
        $now = Carbon::now();
        $FileUploads = $request->file('FileUploads');
        $EditModalInfo = json_decode($request->get('EditModalInfo'), true);
        $SelectedItemTemplatesIds = [];

        $Vendor = Vendor::FindorFail($EditModalInfo['id']);


        if(count($EditModalInfo['item_templates'])){
            if($EditModalInfo['item_templates'][0]['template_name']){
                /* Get the IDs selected from the item templates */
                foreach($EditModalInfo['item_templates'] as $SelectedTemplates) {
                    $SelectedItemTemplatesIds[] = $SelectedTemplates['id'];
                }
            } else {
                /* the items are sent as array of ids only */
                $SelectedItemTemplatesIds = $EditModalInfo['item_templates'];
            }
        } else {
            $SelectedItemTemplatesIds = $EditModalInfo['item_templates'];
        }
        

        /* Update the vendor */
        $updated = $Vendor->update([
            'name'                  => $EditModalInfo['name'],
            'rep_name'              => $EditModalInfo['rep_name'],
            'rep_title'             => $EditModalInfo['rep_title'],
            'address'               => $EditModalInfo['address'],
            'po_box'                => $EditModalInfo['po_box'],
            'phone'                 => $EditModalInfo['phone'],
            'mobile'                => $EditModalInfo['mobile'],
            'url'                   => $EditModalInfo['url'],
            'lic_num'               => $EditModalInfo['lic_num'],
            'lic_expiry_date'       => $EditModalInfo['lic_expiry_date'],
            'provided_service'      => implode(",", $EditModalInfo['provided_service']),
            'city'                  => $EditModalInfo['city'],
            'country'               => $EditModalInfo['country'],
            'officer_name'          => $EditModalInfo['officer_name'],
            'officer_phone'         => $EditModalInfo['officer_phone'],
            'bank_name'             => $EditModalInfo['bank_name'],
            'bank_iban'             => $EditModalInfo['bank_iban'],
            'turnover'              => $EditModalInfo['turnover'],
            'open_since'            => $EditModalInfo['open_since'],
            'sold_brands'           => $EditModalInfo['sold_brands'],
            'exculsive_brands'      => $EditModalInfo['exculsive_brands'],
            'vendor_type'           => $EditModalInfo['vendor_type'],
            'notes'                 => $EditModalInfo['notes'],
        ]);

        $Vendor->itemTemplates()->sync($SelectedItemTemplatesIds);

        if($Vendor->lic_expiry_date->gt($now)){
            $Vendor->update([
                'status' => 'Valid Vendor Qualification',
            ]);
        }

        if($updated){
            return response()->json([
                "messageTitle"  => 'Vendor Details Edited Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ], 200); 
        } else {
            return response()->json([
                "messageTitle"  => 'Vendor Details Edited Error.',
                "message"       => 'An Error Has Occured Please Contact Your System Administrator.',
                "messageType"   => 'success'
            ], 200); 
        }
        
    }


    public function createVendorUser(Request $request)
    {
    	$user = $request->user();
    	$company = $user->company;
        $UserExistsWithVendorList = false;

    	//check if the vendor user already exists
    	//if the vendor user is created by another company just add the access to the use company and notify
        $existingVendorUser = VendorUser::where('email', $request->get('VendorUserEmail'))->get()->first();

        
        if(empty($existingVendorUser)){
            //we are here because the use does not exists in the table
            

            //Create Vendor User
            $randomPassword = str_random(8);
            $randomPasswordHased = Hash::make($randomPassword);
            $VendorUser = VendorUser::create([
                'name'          => $request->get('VendorUserName'), 
                'email'         => $request->get('VendorUserEmail'),
                'password'      => $randomPasswordHased
            ]);


            $VendorUser->vendors()->attach([
                $request->get('VendorId') => [
                    'sbm_role' => in_array("SBM", $request->get('VendorUserRole')) ? 'Yes' : 'No',
                    'sim_role' => in_array("SIM", $request->get('VendorUserRole')) ? 'Yes' : 'No'
                ],
            ]);

            # Send User Email Notification with the new Access Cridentials
            $VendorUser->notify(new VendorCreatedNotification($randomPassword, $company));


            return response()->json([
                "messageTitle"  => 'User Created.',
                "message"       => 'User created successfully. Email notification is sent to user with credential detials.',
                "messageType"   => 'success'
            ], 200);

        } else {
            //we are here because the use exists in the table

            
            //check if the user available under this company with different vendor and prevent creation and display issue message (You Cannot Have Duplicated Emails Under Different Vendors Within the Same Company)
            $vendorsList = $company->vendors;

            foreach ($vendorsList as $key => $vendor) {
                foreach ($vendor->users as $index => $user) {
                    if($user['email'] == $request->get('VendorUserEmail')){
                        $UserExistsWithVendorList = true;
                        break;
                    }
                }
            }            


            if($UserExistsWithVendorList){
                //we are here because there is a duplication of emails between existing vendors within the same company

                return response()->json([
                    "messageTitle"  => 'Unable to Assign User.',
                    "message"       => 'This Email is Assigned to a Vendor User Within Your Vendors List. Please Use Another Email for This Vendor User to Grant Access.' ,
                    "messageType"   => 'warning'
                ], 200);

            } else {

                //we are here because there is NO duplication of emails between existing vendors within the same company
                $existingVendorUser->vendors()->attach([
                    $request->get('VendorId') => [
                        'sbm_role' => in_array("SBM", $request->get('VendorUserRole')) ? 'Yes' : 'No',
                        'sim_role' => in_array("SIM", $request->get('VendorUserRole')) ? 'Yes' : 'No'
                    ],
                ]);

                # Send User Email Notification with the existing Access detials
                $existingVendorUser->notify(new VendorAddedToCompanyNotification($company));

                return response()->json([
                    "messageTitle"  => 'User Created.',
                    "message"       => 'User created successfully. Email notification is sent to user with credential detials. Email: ' .$existingVendorUser->email.' and the existing name under: ' .$existingVendorUser->name. '' ,
                    "messageType"   => 'success'
                ], 200);
            }

            
        }

    	
        
    }

    public function deactivateVendorUser(Request $request)
    {

        // check if the user has the right to deactivate this user

    	VendorUser::FindOrFail($request->all()[0])->update(['active' => 'No']);

    	return response()->json([
            "messageTitle"  => 'User Deactivated Successfully.',
            "message"       => 'The User Can No Longer Access the System.',
            "messageType"   => 'success'
        ], 200);	
    }


    public function deleteVendorUser(Request $request)
    {

        // check if the user has the right to deactivate this user

        $userVendor = VendorUser::FindOrFail($request->all()[0]);

        DB::table('pivot_vendor_vendorusers')->where('vendoruser_id', $userVendor->id)->delete();
        VendorUser::FindOrFail($request->all()[0])->delete();

        return response()->json([
            "messageTitle"  => 'User Deleted Successfully.',
            "message"       => 'The User Can No Longer Access the System.',
            "messageType"   => 'success'
        ], 200);    
    }


    public function reactivateVendorUser(Request $request)
    {
        // check if the user has the right to reactivate this user

    	VendorUser::FindOrFail($request->all()[0])->update(['active' => 'Yes']);

    	return response()->json([
            "messageTitle"  => 'User Reactivated Successfully.',
            "message"       => 'User Reactivated Successfully. The user can re-access the system at anytime.',
            "messageType"   => 'success'
        ], 200);	
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


    public function getVendorUserRole(Request $request)
    {
        $vendorUser = $request->user();
        //dd($vendorUser->vendors);
        $vendorsWithRoles = $vendorUser->vendors->load('company', 'creator');

        return Datatables::of($vendorUser->vendors)
            ->make(true);
    }


    public function updateVendorProfileDetails(Request $request)
    {
        $vendor = $request->user();

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
            $vendor->picture = $safeName;
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
            $vendor->login_image = $safeName;
        }

        if($vendor->phone_number !== $PersonalDetails['phone'] && $PersonalDetails['phone'] != ""){
            $vendor->phone_number = $PersonalDetails['phone'];
        }

        if ($vendor->address !== $PersonalDetails['address'] && $PersonalDetails['address'] != ""){
            $vendor->address = $PersonalDetails['address'];
        }

        $vendor->update();

        /*Send Feedback To Vendor*/
        return response()->json([
            "messageTitle"      => 'Profile Updated Successfully.',
            "message"           => 'You detailed are now updated successfully. You changes will take effect the next time you login. Thanks',
            "messageType"       => 'success',
            "imageSafeName"     => $vendor->picture,
            "loginImageName"     => $vendor->login_image,
            "Phone"             => $vendor->phone_number,
            "Address"           => $vendor->address
        ], 200);


    }


    public function toggleVendorActivation(Request $request)
    {
        // check if the user has the right to reactivate this user

        $vendor = Vendor::FindOrFail($request->get('VendorID'));

        if($vendor->active == 'Yes'){
            $vendor->update(['active' => 'No']);

            return response()->json([
                "messageTitle"  => 'Vendor Deactivated Successfully.',
                "message"       => 'Deactivated Vendor Can Be Selected For Request For Proposals.',
                "messageType"   => 'success'
            ], 200);  

        } else {

            $vendor->update(['active' => 'Yes']);

            return response()->json([
                "messageTitle"  => 'Vendor Reactivated Successfully.',
                "message"       => 'Activate Vendors Can Be Selected For Request For Proposals.',
                "messageType"   => 'success'
            ], 200);  

            
        }

          
    }

    public function removeQualificationDoc(Request $request)
    {
        VendorQualificationDocs::FindOrFail($request->get('DocumentId'))->delete();

        return response()->json([
                "messageTitle"  => 'Qualification Document Deleted Successfully.',
                "message"       => '',
                "messageType"   => 'success'
            ], 200);  
    }
}
