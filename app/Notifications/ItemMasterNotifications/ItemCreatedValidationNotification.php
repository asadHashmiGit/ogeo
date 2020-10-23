<?php

namespace App\Notifications;

use App\ItemMaster;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ItemCreatedValidationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $item;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ItemMaster $item)
    {
        $this->item = $item;
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
                    ->subject('Item Creation Validation Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new item has been created and requiring your validation.')
                    ->action('Take Action', url('/app/items_master/approval'))
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
            'item_master_id' =>$this->item->id,
            'item_creation_request_id' => $this->item->creation_request_id,
            'class_name' => 'ItemMaster',
            'notification_name' => 'Item Creation Validation',
        ];
    }
}
