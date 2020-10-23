<?php

namespace App\Notifications;

use App\PurchaseEnquiry;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PurchaseRequestValidationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $purchase_enquiry;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(PurchaseEnquiry $purchase_enquiry)
    {
        $this->purchase_enquiry = $purchase_enquiry;
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
                    ->subject('Purchase Enquiry Validation Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A purchase enquiry has been approved and requiring your validation.')
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
            'purchase_request_id' =>$this->purchase_enquiry->id,
            'class_name' => 'PurchaseEnquiry',
            'notification_name' => 'Purchase Enquiry Validation',
        ];
    }
}
