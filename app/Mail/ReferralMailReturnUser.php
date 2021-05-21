<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ReferralMailReturnUser extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $user;
    public $recommend;
    public $link;
    public function __construct($user, $recommend, $link)
    {
        $this->User = $user;
        $this->Link = $link;
        $this->RecommendUser = $recommend;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $User = $this->User;
        $Link = $this->Link;
        $RecommendUser = $this->RecommendUser;

        return $this->from('ogeo@org.com')
                    ->subject('Ogeo')
                    ->view('referral-mail-return-user')
                    ->with([
                        'User' => $User,
                        'Link' => $Link,
                        'RecommededUser' => $RecommendUser,
                    ]);
    }
}
