<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/images/favicon.png') }}">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Ogéo Platform</title>

        <!-- Fonts -->
        <link rel="dns-prefetch" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Grand+Hotel" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Quicksand" rel="stylesheet" type="text/css" />


        <!-- Styles -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
        {{-- <link href="{{ asset('assets/plugins/jasny-bootstrap/jasny-bootstrap.min.css') }}" rel="stylesheet"> --}}
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <!-- toast CSS -->
        <link href="{{ asset('assets/plugins/toast-master/css/jquery.toast.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/plugins/icheck/skins/all.css') }}" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="{{ asset('css/style.css') }}" rel="stylesheet">

        <!-- You can change the theme colors from here -->
        <link href="{{ asset('css/colors/blue.css') }}" id="theme" rel="stylesheet">
        <link href="{{ asset('assets/plugins/switchery/dist/switchery.min.css') }}" rel="stylesheet" />
        <!-- Date picker plugins css -->
        <link href="{{ asset('assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css') }}" rel="stylesheet"/>
        <!-- Daterange picker plugins css -->
        <link href="{{ asset('assets/plugins/timepicker/bootstrap-timepicker.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/plugins/bootstrap-daterangepicker/daterangepicker.css') }}" rel="stylesheet">
        {{-- <link href="{{ asset('assets/plugins/completeDataTables/css/dataTables.bootstrap4.css') }}" type="text/css" rel="stylesheet"/> --}}
        <link href="{{ asset('assets/plugins/completeDataTables/css/datatables.css') }}" type="text/css" rel="stylesheet"/>
        <link href="{{ asset('assets/plugins/completeDataTables/css/fixedHeader.dataTables.min.css') }}" type="text/css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/fixedheader/3.1.5/css/fixedHeader.bootstrap.css" type="text/css" rel="stylesheet"/>


        <link href="{{ asset('assets/plugins/dualListbox/bootstrap-duallistbox.min.css') }}" rel="stylesheet" type="text/css" />


        {{-- Code Mirror Formating TextArea --}}
        <script src="{{ asset('js/codemirror.js') }}"></script>
        <link href="{{ asset('css/codemirror.css') }}" rel="stylesheet">
        <link href="{{ asset('css/codemirrorthemes/dracula.css') }}" rel="stylesheet">
        <script src="{{ asset('js/codemirrormodes/javascript/javascript.js') }}"></script>
        <script src="{{ asset('js/codemirrormodes/xml/xml.js') }}"></script>
        <script src="{{ asset('js/codemirrormodes/sql/sql.js') }}"></script>
        <script src="{{ asset('js/codemirroraddon/edit/closetag.js') }}"></script>
        <script src="{{ asset('js/codemirroraddon/lint/javascript-lint.js') }}"></script>
        <script src="{{ asset('js/codemirroraddon/lint/json-lint.js') }}"></script>
        <link href="{{ asset('js/codemirroraddon/lint/lint.css') }}" rel="stylesheet" type="text/css"/>

        <!-- Styles -->
        <style>
            .links > a {
                color: #FF2F2F;
                padding: 0 25px;
                font-size: 12px;
                font-weight: bolder;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body class="fix-header fix-sidebar card-no-border logo-center" style="background-color: white">  {{-- class="fix-header fix-sidebar card-no-border logo-center" --}}

        <div id="app">

            <div class="preloader">
                <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
                </svg>
            </div>

            <main-app></main-app>

        </div>

        <!-- Latest compiled JavaScript -->
        <!-- <script src="//{{ Request::getHost() }}:6001/socket.io/socket.io.js"></script> -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBTsP2eg3LbFgsJ4FclIlFdbsvmiVFKd20"></script>
        <!-- <script src="{{ asset('js/app.js') }}"></script> -->

        <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCg2myYxkVIuXkBRDLObU5j_lRHzYvjpYI"></script>  -->
        <script src="{{ mix('js/app.js') }}"></script>

        <script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.js') }}" type="text/javascript"></script>
        <script src="{{ asset('js/js.cookie.js') }}"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="{{ asset('js/jquery.slimscroll.js') }}"></script>
        <!--Wave Effects -->
        <script src="{{ asset('js/waves.js') }}"></script>
        <!--Mask Input Effects -->
        {{-- <script src="{{ asset('js/mask.js') }}"></script> --}}
        <!--Menu sidebar -->
        <script src="{{ asset('js/sidebarmenu.js') }}"></script>
        <!--stickey kit -->
        <script src="{{ asset('assets/plugins/sticky-kit-master/dist/sticky-kit.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/sparkline/jquery.sparkline.min.js') }}"></script>

        <script src="{{ asset('assets/plugins/icheck/icheck.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/icheck/icheck.init.js') }}"></script>


        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <!--c3 JavaScript -->
        <script src="{{ asset('assets/plugins/d3/d3.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/c3-master/c3.min.js') }}"></script>

        <!-- Session-timeout-idle -->
        {{-- <script src="{{ asset('assets/plugins/session-timeout/idle/jquery.idletimeout.js') }}"></script>
        <script src="{{ asset('assets/plugins/session-timeout/idle/jquery.idletimer.js') }}"></script>
        <script src="{{ asset('assets/plugins/session-timeout/idle/session-timeout-idle-init.js') }}"></script> --}}

        <script src="{{ asset('assets/plugins/moment/min/moment.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/switchery/dist/switchery.min.js') }}"></script>

        <!-- Date Picker Plugin JavaScript -->
        <script src="{{ asset('assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js') }}"></script>
        <!-- Date range Plugin JavaScript -->
        <script src="{{ asset('assets/plugins/timepicker/bootstrap-timepicker.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/bootstrap-daterangepicker/daterangepicker.js') }}"></script>

        <script src="{{ asset('assets/plugins/toast-master/js/jquery.toast.js') }}"></script>
        <!-- ============================================================== -->
        {{-- <script src="{{ asset('assets/plugins/jasny-bootstrap/jasny-bootstrap.min.js') }}"></script> --}}
        <!-- Style switcher -->
        <!-- ============================================================== -->
        <script src="{{ asset('assets/plugins/styleswitcher/jQuery.style.switcher.js') }}"></script>
        <script src="{{ asset('assets/plugins/completeDataTables/js/pdfmake.js') }}" type="text/javascript" ></script>
        <script src="{{ asset('assets/plugins/completeDataTables/js/vfs_fonts.js') }}" type="text/javascript" ></script>
        <script src="{{ asset('assets/plugins/completeDataTables/js/datatables.js') }}" type="text/javascript" ></script>
        <script src="{{ asset('assets/plugins/completeDataTables/js/dataTables.fixedHeader.min.js') }}" type="text/javascript" ></script>

        <script src="{{ asset('assets/plugins/dualListbox/jquery.bootstrap-duallistbox.js') }}" type="text/javascript" ></script>






        <script type="text/javascript">

            $(document).ready(function(){

                $(function () {
                    $(".preloader").fadeOut();
                });

                // $(document).ajaxStart(function(){
                //     $("#wait").css("display", "block");
                //     alert('test');
                // });
                // $(document).ajaxComplete(function(){
                //     $("#wait").css("display", "none");
                // });

                // $(document).ajaxStart(function(){
                //     $("body").addClass('ajaxLoading');
                // });
                // $(document).ajaxStop(function(){
                //     $("body").removeClass('ajaxLoading');
                // });

            });
        </script>

    </body>
</html>
