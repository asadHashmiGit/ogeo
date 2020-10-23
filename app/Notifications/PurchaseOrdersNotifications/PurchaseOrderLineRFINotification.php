<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use App\POLineRFICommunication;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PurchaseOrderLineRFINotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $POLineRFICommunication;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(POLineRFICommunication $POLineRFICommunication)
    {
        $this->POLineRFICommunication = $POLineRFICommunication;
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
                    ->subject('New PO Line Clarificaiton.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new clarification for purchase order has been created for your action.')
                    ->action('Take Action', url('/app/profile'))
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
            'po_line_rfi_communication_id' => $this->POLineRFICommunication->id,
            'class_name' => 'POLineRFICommunication',
            'notification_name' => 'Purchase Order Clarificaiton',
        ];
    }
}
