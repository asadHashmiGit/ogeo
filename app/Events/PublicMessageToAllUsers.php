<?php

namespace App\Events;

use App\User;
use Carbon\Carbon;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

//class PublicMessageToAllUsers implements ShouldBroadcastNow
class PublicMessageToAllUsers implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Information about the shipping status update.
     *
     * @var string
     */
    protected $user;
    protected $title;
    protected $body;
    protected $timestamp;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(User $user, $title, $body, Carbon $timestamp)
    {
        $this->user = $user;
        $this->title = $title;
        $this->body = $body;
        $this->timestamp = $timestamp;
    }

    public function broadcastAs()
    {
        return 'newMessage';
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */

    public function broadcastOn()
    {
        return new Channel('MessageToAllSystemUsers');
    }


    public function broadcastWith()
    {
        // This must always be an array. Since it will be parsed with json_encode()
        return [
            'username' => $this->user->name,
            'title' => $this->title,
            'body' => $this->body,
            'timestamp' => $this->timestamp->format('jS.M - h:i:s'),
        ];
    }

}
