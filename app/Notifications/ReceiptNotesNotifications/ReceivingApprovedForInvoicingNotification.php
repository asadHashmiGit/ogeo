<?php

namespace App\Notifications;

use App\ReceiptNote;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ReceivingApprovedForInvoicingNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $ReceiptNote;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ReceiptNote $ReceiptNote)
    {
        $this->ReceiptNote = $ReceiptNote;
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
                    ->subject('Goods Receiving Approved For Invoicing.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Goods Receiving Has Been Approved For Invoicing')
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
            //
        ];
    }
}
