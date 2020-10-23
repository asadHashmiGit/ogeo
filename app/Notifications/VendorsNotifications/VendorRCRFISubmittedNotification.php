<?php

namespace App\Notifications;

use App\RCRFICommunication;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class VendorRCRFISubmittedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $RFIDetails;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(RCRFICommunication $RFIDetails)
    {
        $this->RFIDetails = $RFIDetails;
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

        $greeting = sprintf('Hi %s,', $notifiable->name);
        $contents = sprintf('The Following Message Has Been Submitted By Vendor: %s', $this->RFIDetails->message);

        return (new MailMessage)
                    ->subject('Request For Information Submitted.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line($contents)
                    ->action('View RFI', url('/login'))
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
            'RFIDetails' => $this->RFIDetails->id,
            'class_name' => 'RFICommunication',
            'notification_name' => 'Request For Information',
        ];
    }
}
