<?php

namespace App\Notifications;

use App\StockIssuanceRecord;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemIssuanceRecordCreatedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockIssuanceRecord;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockIssuanceRecord $StockIssuanceRecord)
    {
        $this->StockIssuanceRecord = $StockIssuanceRecord;
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
                    ->subject('New Stock Issuance Record Created.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new Stock Issuance Record has been Created for your kind info.')
                    ->action('Take Action', url('/app/profile/user_stock_issuance_requests'))
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
            'stock_issuance_record_id' => $this->StockIssuanceRecord->grouping_id,
            'class_name' => 'StockIssuanceRecord',
            'notification_name' => 'Stock Issuance Record Created',
        ];
    }
}
