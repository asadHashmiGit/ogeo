<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class RegisterMail extends Mailable
{
    use Queueable, SerializesModels;
    protected $user;
    protected $getReferuser;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $getReferuser)
    {
        $this->user=$user;
        $this->getReferuser=$getReferuser;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('ogeo@org.com')->markdown('registermail')->with([
            'getReferuser' => $this->getReferuser,
            'user' => $this->user,
           
        ]);
    }
}
