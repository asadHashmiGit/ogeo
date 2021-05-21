<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body style="margin: 0;font-family: Avenir, Helvetica, sans-serif;">

<div style="background-color: #f5f8fa;text-align: center;box-sizing: border-box; padding: 25px 0;">
    <span style="font-family: Avenir, Helvetica, sans-serif;">
        <a style="font-family: Avenir, Helvetica, sans-serif; box-sizing: border-box; color: #bbbfc3; font-size: 19px; font-weight: bold; text-decoration: none; text-shadow: 0 1px 0 white;">
            Ogeo
        </a>
    </span>
</div>

<div style="margin: 25px;">

    <h2>Dear {{$User->name}}</h2> 
        
    <p>We are very gratefull that you like using Ogeo and opted to recommend it to Mr.{{$RecommededUser->name}}</p>

    <p>Thank You vey much !!</p>


    <p>We will reach out to you to let you know, once the organization you kindly referred to us gets its first full month incovice</p>
   
   <p>Your referral number is {{$User->id}}</p>

   <p>We are very pround to count you as one of our awesome customers.</p>
    

   <pre>
    
    
   The Ogeo Team


   This is auto-generated email.
   </pre>
</div>

<div style="background-color: #f5f8fa;text-align: center;box-sizing: border-box; padding: 25px 0;">
    <span style="font-family: Avenir, Helvetica, sans-serif;">
        <a style="font-family: Avenir, Helvetica, sans-serif; box-sizing: border-box; color: #bbbfc3;  text-decoration: none; text-shadow: 0 1px 0 white;">
            &copy; {{date('Y')}} Ogeo. All Rights Reserved
        </a>
    </span>
</div>

</body>
</html>


