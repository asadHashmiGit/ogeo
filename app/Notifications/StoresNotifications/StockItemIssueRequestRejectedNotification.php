<?php

namespace App\Notifications;

use App\StockItemIssueRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemIssueRequestRejectedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $StockItemIssueRequest;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(StockItemIssueRequest $StockItemIssueRequest)
    {
        $this->StockItemIssueRequest = $StockItemIssueRequest;
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
                    ->subject('Stock Item Issue Request Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Your Stock Item Issue Request has been rejected.')
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
            'stock_item_issue_request_id' => $this->StockItemIssueRequest->id,
            'class_name' => 'StockItemIssueRequest',
            'notification_name' => 'Stock Item Issue Request Rejection',
        ];
    }
}
