<?php

namespace App\Notifications;

use App\ItemCreationRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ItemCreationRequestRejectedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $item_creation_request;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ItemCreationRequest $item_creation_request)
    {
        $this->item_creation_request = $item_creation_request;
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
                    ->subject('Item Creation Request Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('You item creation request has been rejected and available for your action.')
                    ->action('Take Action', url('/app/profile/item_creation_requests'))
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
            'creator_id' =>$this->item_creation_request->requester_id,
            'item_creation_request_id' => $this->item_creation_request->id,
            'class_name' => 'ItemCreationRequest',
            'notification_name' => 'Item Creation Request Rejection',
        ];
    }
}
