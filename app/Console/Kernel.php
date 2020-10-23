<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        # Clean up activity log
        $schedule->command('activitylog:clean')->daily();

        //$schedule->call('App\Http\Controllers\ScheduleController@TestSchedule')->everyMinute();
        //$schedule->call('App\Http\Controllers\ScheduleController@SendNotification')->everyMinute();
        $schedule->call('App\Http\Controllers\ScheduleController@GenerateRetentionInvoices')->daily(); // At Midnight
        $schedule->call('App\Http\Controllers\ScheduleController@UpdateVendorQualificationValidity')->daily(); // At Midnight
        $schedule->call('App\Http\Controllers\ScheduleController@UpdatePendingRfPStatusToFloated')->everyMinute(); // every minute
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
