<?php

namespace App\Notifications;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class newUserRegisterationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $user;
    
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
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

        $name = sprintf('Name: %s', $this->user->name);
        $email = sprintf('Email: %s', $this->user->email);
        $designation = sprintf('Designation: %s', $this->user->designation);

        return (new MailMessage)
                    ->subject('New User Registeration.')
                    ->line('A New User Registered On Your Application.')
                    ->line($name)
                    ->line($email)
                    ->line($designation)
                    ->action('Login To Ogéo Platform', url('/app/system_management'))
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
            //
        ];
    }
}
