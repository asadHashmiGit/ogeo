<?php

namespace App\Notifications;

use App\ItemMaster;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ItemCreationLMARejectedNotification extends Notification implements ShouldQueue
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
                    ->subject('Item Creation Rejected.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('The item you created has been rejected and available for your action.')
                    ->action('Take Action', url('/app/items_master/list'))
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
            'item_creator_id' => $this->item->created_by,
            'class_name' => 'ItemMaster',
            'notification_name' => 'Item Creation Rejected',
        ];
    }
}
