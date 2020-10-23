<?php

namespace App\Notifications;

use App\RateContract;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RateContractVendorApprovedNotification extends Notification implements ShouldQueue
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
        return ['mail'];
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
                    ->subject('Vendor Accepted Rate Contract.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Rate Contract has been accepted by the Vendor.')
                    ->action('Take Action', url('/app/login'))
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
            //
        ];
    }
}
