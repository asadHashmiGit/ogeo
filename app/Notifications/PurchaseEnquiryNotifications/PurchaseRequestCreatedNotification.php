<?php

namespace App\Notifications;

use App\PurchaseEnquiry;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PurchaseRequestCreatedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $purchaseEnquiry;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(PurchaseEnquiry $purchaseEnquiry)
    {
        $this->purchaseEnquiry = $purchaseEnquiry;
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
                    ->subject('New Purchase Enquiry Notification.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new purchase enquiry has been created and requiring your approval.')
                    ->action('Take Action', url('/app/purchase_enquiry/approvals'))
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
            'purchase_request_grouping_id' => $this->purchaseEnquiry->grouping_id,
            'class_name' => 'PurchaseEnquiry',
            'notification_name' => 'Purchase Enquiry Approval',
        ];
    }
}
