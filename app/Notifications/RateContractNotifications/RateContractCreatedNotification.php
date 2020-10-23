<?php

namespace App\Notifications;

use App\RateContract;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractCreatedNotification extends Notification implements ShouldQueue
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
                    ->subject('New Rate Contract Approval Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new rate contract has been created and requiring your approval.')
                    ->action('Take Action', url('/app/rate_contracts/rate_contract_creation_approvals'))
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
            'notification_name' => 'Rate Contract Approval',
        ];
    }
}
