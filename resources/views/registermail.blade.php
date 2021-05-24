@component('mail::message')
# Introduction



Dear {{$getReferuser->name}},

Thank you very much !!!

The referral you have sent to your contact, Mr. {{$user->name}} has registered to Ogeo !!!

 

We are very proud to count you as one of our awesome customers.



The Ogeo Team.

 

This is an auto-generated email.


Thanks,<br>
{{ config('app.name') }}
@endcomponent
