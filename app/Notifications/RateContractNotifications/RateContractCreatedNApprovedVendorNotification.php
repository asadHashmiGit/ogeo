<?php

namespace App\Notifications;

use App\RateContract;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractCreatedNApprovedVendorNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $RateContract;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(RateContract $RateContract)
    {
        $this->RateContract = $RateContract;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $greeting = sprintf('Hello %s,', $notifiable->name);

        return (new MailMessage)
                    ->subject('New Rate Contract Created.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new Rate Contract has been created and requiring your acceptance.')
                    ->action('Take Action', url('/app/vendors/login'))
                    ->line('Thank you for using Ogéo platform!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'rate_contract_id' => $this->RateContract->id,
            'class_name' => 'RateContract',
            'notification_name' => 'Rate Contract Approved',
        ];
    }
}
