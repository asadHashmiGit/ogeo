<?php

namespace App\Notifications;

use App\RateContractRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractRequestRejectedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $RateContractRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(RateContractRequest $RateContractRequest)
    {
        $this->RateContractRequest = $RateContractRequest;
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
                    ->subject('Rate Contract Item Request Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Your Rate Contract Item Request has been rejected and available for your action.')
                    ->action('Take Action', url('/app/profile/user_rate_contract_requests'))
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
            'RateContractRequest' => $this->RateContractRequest->id,
            'class_name' => 'RateContractRequest',
            'notification_name' => 'Rate Contract Item Request Rejection',
        ];
    }
}
