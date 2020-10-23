<?php

namespace App\Notifications;

use App\ReceiptNoteInvoice;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class InvoiceRejectedByClientNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $ReceiptNoteInvoice;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ReceiptNoteInvoice $ReceiptNoteInvoice)
    {
        $this->ReceiptNoteInvoice = $ReceiptNoteInvoice;
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
                    ->subject('Invoice Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('An Invoice Has Been Rejected By Client.')
                    ->action('Take Action', url('/vendors/login'))
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
