<?php

namespace App\Notifications;

use App\StockItem;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemFullyApprovedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockItem;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockItem $StockItem)
    {
        $this->StockItem = $StockItem;
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
                    ->subject('Stock Item Created As Stock Item.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A Stock Item has been approved and is now available as stock item.')
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
            'stock_item_id' => $this->StockItem->id,
            'class_name' => 'StockItem',
            'notification_name' => 'Stock Item Fully Approved',
        ];
    }
}
