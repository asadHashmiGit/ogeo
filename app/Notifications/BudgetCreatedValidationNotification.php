<?php

namespace App\Notifications;

use App\BudgetMaster;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class BudgetCreatedValidationNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $budget;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(BudgetMaster $budget)
    {
        $this->budget = $budget;
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
                    ->subject('Budget Creation Validation Required.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('A new budget has been created and requiring your validation.')
                    ->action('Take Action', url('/app/budget_master/approval'))
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
            'budget_master_id' =>$this->budget->id,
            'budget_creation_request_id' => $this->budget->creation_request_id,
            'class_name' => 'BudgetMaster',
            'notification_name' => 'Budget Creation Validation',
        ];
    }
}
