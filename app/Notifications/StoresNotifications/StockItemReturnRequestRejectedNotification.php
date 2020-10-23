<?php

namespace App\Notifications;

use App\StockItemReturnRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemReturnRequestRejectedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockItemReturnRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockItemReturnRequest $StockItemReturnRequest)
    {
        $this->StockItemReturnRequest = $StockItemReturnRequest;
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
                    ->subject('Stock Item Return Request Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Your Stock Item Return Request has been rejected.')
                    ->action('Take Action', url('/app/profile/user_stock_return_requests'))
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
            'stock_item_return_request_id' => $this->StockItemReturnRequest->id,
            'class_name' => 'StockItemReturnRequest',
            'notification_name' => 'Stock Item Return Request Rejection',
        ];
    }
}
