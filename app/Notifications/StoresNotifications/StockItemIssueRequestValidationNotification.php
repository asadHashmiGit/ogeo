<?php

namespace App\Notifications;

use App\StockItemIssueRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class StockItemIssueRequestValidationNotification extends Notification implements ShouldQueue
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
                    ->subject('Stock Issuance Request Validation Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('Uou have one Stock Issuance Request requiring your validation.')
                    ->action('Take Action', url('/app/store_requests/stock_issuance_approvals'))
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
            'stock_item_issue_request_id' =>$this->StockItemIssueRequest->id,
            'class_name' => 'StockItemIssueRequest',
            'notification_name' => 'Stock Item Issue Request Validation',
        ];
    }
}
