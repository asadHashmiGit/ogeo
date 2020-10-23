<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ErrorOccuredNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $formatedError;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(String $formatedError)
    {
        $this->formatedError = $formatedError;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

        $contents = sprintf('Error Description: %s', $this->formatedError);

        return (new MailMessage)
                    ->subject('Error Occurance.')
                    ->line('The Following Error Has Occured:')
                    ->line($contents)
                    ->action('Check Error Log', url('/app/system_management/system_errors_log'))
                    ->line('Thank you for using our application!');
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
            //
        ];
    }
}
