<?php

return array(

    'pdf' => array(
        'enabled' => true,
        'binary'  => env('SNAPPY_PDF', '/home/master/applications/mfhzwumyap/public_html/wkhtmltox/bin/wkhtmltopdf'),
        'timeout' => false,
        'options' => array(),
        'env'     => array(),
    ),
    'image' => array(
        'enabled' => true,
        'binary'  => env('SNAPPY_IMAGE', '/home/master/applications/mfhzwumyap/public_html/wkhtmltox/bin/wkhtmltoimage'),
        'timeout' => false,
        'options' => array(),
        'env'     => array(),
    ),

);
