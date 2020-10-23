<?php

namespace App\Notifications;

use App\RateContractRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractRequestCreatedNotification extends Notification implements ShouldQueue
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
                    ->subject('New Rate Contract Request Notification.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new rate contract has been created and requiring your approval.')
                    ->action('Take Action', url('/app/rate_contracts/rate_contracts_requests_approvals'))
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
            'purchase_request_grouping_id' => $this->RateContractRequest->grouping_id,
            'class_name' => 'RateContract',
            'notification_name' => 'Rate Contract Request Approval',
        ];
    }
}
