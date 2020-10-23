<?php

namespace App\Notifications;

use App\POCancellationRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PurchaseOrderCancellationCreatedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $POCancellationRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(POCancellationRequest $POCancellationRequest)
    {
        $this->POCancellationRequest = $POCancellationRequest;
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
                    ->subject('New Purchase Order Line Cancellation Request Created.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('New Purchase Order Line Cancellation Request Created and Pending Your Approval.')
                    ->action('Take Action', url('/app/purchase_orders/po_cancellation_approvals'))
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
            'purchase_order_cancellation_id' => $this->POCancellationRequest->id,
            'class_name' => 'POCancellationRequest',
            'notification_name' => 'Purchase Order Cancellation Request Created',
        ];
    }
}
