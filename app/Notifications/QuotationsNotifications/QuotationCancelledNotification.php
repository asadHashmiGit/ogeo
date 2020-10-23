<?php

namespace App\Notifications;

use App\QuotationRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class QuotationCancelledNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $QuotationRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(QuotationRequest $QuotationRequest)
    {
        $this->QuotationRequest = $QuotationRequest;
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
        $greeting = sprintf('Hi %s,', $notifiable->name);
        $contents = sprintf('The Request For Proposals ID# (%s) has been cancelled all the information (Price, RfI,....) you submitted will be discarded.', $this->QuotationRequest->id);

        return (new MailMessage)
                    ->subject('Request For Proposals Cancelled.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line($contents)
                    ->action('View Cancelled Request for Proposals', url('/vendors/login'))
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
