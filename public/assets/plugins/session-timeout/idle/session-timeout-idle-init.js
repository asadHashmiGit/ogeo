var UIIdleTimeout = function() {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    return {
        init: function() {
            var o;
            $("body").append(""), $.idleTimeout("#idle-timeout-dialog", ".modal-content button:last", {
                idleAfter: 86400,
                warningLength: 120,
                timeout: 600,
                pollingInterval: 900000000,
                keepAliveURL: "/logout",
                serverResponseEquals: "OK",
                onTimeout: function() {
                    
                    localStorage.removeItem('user');
                    $.post( "/logout", function() {
                        localStorage.removeItem('user');
                        location.reload();
                    });
    
                },
                onIdle: function() {
                    $("#idle-timeout-dialog").modal("show"), o = $("#idle-timeout-counter"), $("#idle-timeout-dialog-keepalive").on("click", function() {
                        $("#idle-timeout-dialog").modal("hide")
                    })
                },
                onCountdown: function(e) {
                    o.html(e)
                }
            })
        }
    }
}();