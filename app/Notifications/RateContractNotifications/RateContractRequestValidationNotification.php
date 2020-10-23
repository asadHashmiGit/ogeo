<?php

namespace App\Notifications;

use App\RateContractRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractRequestValidationNotification extends Notification implements ShouldQueue
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
                    ->subject('Rate Contract Request Validation Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A rate contract request has been approved and requiring your validation.')
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
            'rate_contract_request_id' =>$this->RateContractRequest->id,
            'class_name' => 'RateContractRequest',
            'notification_name' => 'Rate Contract Request Validation',
        ];
    }
}
