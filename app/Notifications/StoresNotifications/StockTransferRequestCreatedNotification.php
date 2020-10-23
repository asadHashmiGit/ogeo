<?php

namespace App\Notifications;

use App\StockTransferRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockTransferRequestCreatedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockTransferRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockTransferRequest $StockTransferRequest)
    {
        $this->StockTransferRequest = $StockTransferRequest;
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
                    ->subject('Stock Transfer Request Created.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A Stock Transfer Request created successfully.')
                    ->action('Take Action', url('/app/stores_management/stock_item_transfer_approval'))
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
            'stock_transfer_request_id' => $this->StockTransferRequest->id,
            'class_name' => 'StockTransferRequest',
            'notification_name' => 'Stock Transfer Request Created',
        ];
    }
}
