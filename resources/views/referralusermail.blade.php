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

    <h2>Dear {{$RecommededUser->name}}</h2> 
        
    <p>Mr.{{$User->name}} currently uses Ogeo, and thinks that your organization will equally benefit from adopting it.</p>

    <ul>
        <li>Click <a href="http://ogeo.onlinemazdoor.com/">Ogeo </a> to know more, or</li>
        <li><p>Directly start onboarding your business on <a href="http://localhost:8000/registration">Ogeo</a>. Using this <a href="{{$Link}}"></a> reference during the onboarding will help you say "Thanks you to {{$User->name}}"</p></li>
    </ul>

    
    <p>Looking forward to soon count you among our awesome Customers.</p>


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


