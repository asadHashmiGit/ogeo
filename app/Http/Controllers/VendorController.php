<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VendorController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:vendor');
    }

    /**
     * Show the vendors dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('vendors_access');
    }
}
