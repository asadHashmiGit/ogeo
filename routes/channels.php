<?php

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/


Broadcast::channel('MessageToAllCompanyUsers.{companyId}', function ($user, $companyId) {
    if($user->company_id == $companyId){
    	return true;
    }
});

Broadcast::channel('MessageToAUser.{userId}', function ($user, $userId) {
    if($user->id == $userId){
    	return true;
    }
});

Broadcast::channel('MessageToUserToTakeAction.{userId}', function ($user, $userId) {
    if($user->id == $userId){
    	return true;
    }
});

