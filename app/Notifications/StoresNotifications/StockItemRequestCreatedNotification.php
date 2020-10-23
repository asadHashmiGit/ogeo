<?php

namespace App\Notifications;

use App\StockItemRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemRequestCreatedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockItemRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockItemRequest $StockItemRequest)
    {
        $this->StockItemRequest = $StockItemRequest;
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
                    ->subject('New Stock Item Request Notification.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new stock item request has been created and requiring your approval.')
                    ->action('Take Action', url('/app/store_requests/stock_item_requests_approvals'))
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
            'stock_item_request_grouping_id' => $this->StockItemRequest->grouping_id,
            'class_name' => 'StockItemRequest',
            'notification_name' => 'Stock Item Request Approval',
        ];
    }
}
