<?php

namespace App\Http\Controllers;

use App\Events\PublicMessageToAllUsers;
use App\ItemCreationRequest;
use App\ReceiptNote;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ScheduleController extends Controller
{
    public function TestSchedule()
    {
    	$ItemCreationRequest = ItemCreationRequest::create([
            'requester_id'      => 1,
            'item_description'  => 'This is a Scheduled Task',
            'item_link'         => 'http://schedule.com',
        ]);
    }


    public function SendNotification()
    {
    	$user = User::FindOrFail(1);
        $title = 'Auto Generated Notification';
        $body = 'This is any text information';
        $now = Carbon::now();
        event(new PublicMessageToAllUsers($user, $title, $body, $now));
    }

    public function GenerateRetentionInvoices()
    {
        Log::stack(['single'])->info('From Schedule: GenerateRetentionInvoices Triggered'); // Recording To Log File
    }

    public function UpdateVendorQualificationValidity()
    {
        $now = Carbon::now();
        Vendor::where('lic_expiry_date', '<', $now)->update([
            'status' => 'Vendor Qualification Expired',
            'active' => 'No',
        ]);

    }

    public function UpdatePendingRfPStatusToFloated()
    {
        $now = Carbon::now();
        QuotationRequest::where('status', 'Request for Proposals Queued')
            ->where('start_date', '<=', $now)
            ->update([
                'status' => 'Request for Proposals Floated',
            ]);

    }

    public function UpdateFloatedRfPStatusToEnded()
    {
        $now = Carbon::now();
        QuotationRequest::where('status', 'Request for Proposals Floated')
            ->where('end_date', '<', $now)
            ->update([
                'status' => 'Request for Proposals Ended',
            ]);

    }
}
