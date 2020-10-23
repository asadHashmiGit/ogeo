<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

# For testing Charts
// Route::get('/charts', 'LavaChartsController@Charts');

// Auth::routes();

// Route::get('vendors/login','VendorAuth\VendorLoginController@showLoginForm')->name('vendors.login');
// Route::post('vendors/login','VendorAuth\VendorLoginController@login');
// Route::get('vendors/logout','VendorAuth\VendorLoginController@logout')->name('vendors.logout');

// Route::get('vendors/password/reset','VendorAuth\VendorForgotPasswordController@showLinkRequestForm')->name('vendors.password.request');
// Route::post('vendors/password/reset','VendorAuth\VendorResetPasswordController@reset');
// Route::get('vendors/password/reset/{token}','VendorAuth\VendorResetPasswordController@showResetForm')->name('vendors.password.reset');
// Route::post('vendors/password/email','VendorAuth\VendorForgotPasswordController@sendResetLinkEmail')->name('vendors.password.email');

// Route::group(array('prefix' => 'app', 'middleware' => 'auth'), function () {
//     Route::get('{any}', 'HomeController@index')->where('any', '[\/\w\.-]*');
// });

// Route::group(array('prefix' => 'vendors', 'middleware' => 'auth:vendor'), function () {
//     Route::get('{any}', 'VendorController@index')->where('any', '[\/\w\.-]*');
// });

Route::get('/{any}', 'SpaController@welcome')->where('any', '.*');


