<?php

namespace App\Notifications;

use App\POCancellationRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PurchaseOrderCancellationRejectedNotification extends Notification implements ShouldQueue
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
                    ->subject('Purchase Order Line Cancellation Request Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Your Purchase Order Line Cancellation Request has been rejected.')
                    ->action('Take Action', url('/app/purchase_orders/purchase_orders_list'))
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
            'purchase_order_cancellation_request_id' => $this->POCancellationRequest->id,
            'class_name' => 'POCancellationRequest',
            'notification_name' => 'Purchase Order Cancellation Request Rejection',
        ];
    }
}
