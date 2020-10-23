<?php

namespace App\Http\Controllers\VendorAuth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class VendorLoginController extends Controller
{

    public function __construct()
    {
     	$this->middleware('guest:vendor', ['except' => ['logout']]);
    }
    
    public function showLoginForm()
    {
      	return view('auth.vendors_login');
    }
    
    public function login(Request $request)
    {
		// Validate the form data
		$this->validate($request, [
			'email'   => 'required|email',
			'password' => 'required|min:6'
		]);
      
		// Attempt to log the user in
		if (Auth::guard('vendor')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)){
			// if successful, then redirect to their intended location
			return redirect()->intended('/vendors/dashboards');
		}

        
        throw ValidationException::withMessages([
            'email' => [trans('auth.failed')],
        ]);

		// if unsuccessful, then redirect back to the login with the form data
		//return redirect()->back()->withInput($request->only('email', 'remember'));
    }
    
    public function logout()
    {
        Auth::guard('vendor')->logout();
        return redirect('/vendors/login');
    }

}
