<?php

namespace App\Notifications;

use App\Company;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class newCompanyCreationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $company;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Company $company)
    {
        $this->company = $company;
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
        $name = sprintf('Name: %s', $this->company->name);
        $setupMode = sprintf('Setup Mode: %s', $this->company->setup_mode);
        $employees = sprintf('Employees: %s', $this->company->employees_range);

        return (new MailMessage)
                    ->subject('New Company Creation.')
                    ->line('A New Company Has Been Created On Your Application.')
                    ->line($name)
                    ->line($setupMode)
                    ->line($employees)
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
