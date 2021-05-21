<?php

namespace App\Notifications;

use App\BudgetCreationRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class BudgetCreationRequestNotifications extends Notification implements ShouldQueue
{
    use Queueable;

    protected $budget_creation_request;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(BudgetCreationRequest $budget_creation_request)
    {
        $this->budget_creation_request = $budget_creation_request;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'mail']; //
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
                    ->subject('Set-up Budget Creation Request Notification.')
                    ->greeting($greeting)
                    ->salutation('Kind Regards,')
                    ->line('New Set-up Budget creation request is available for your action.')
                    ->action('Take Action', url('/app/set_up_budget/budget_requests_list'))
                    ->line('Thank you for using Ogéo platform!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            'creator_id' =>$this->budget_creation_request->requester_id,
            'budget_creation_request_id' => $this->budget_creation_request->id,
            'class_name' => 'BudgetCreationRequest',
            'notification_name' => 'Budget Creation Request',
        ];
    }
}
