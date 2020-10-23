<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Bidding Dashboard</h4>
                </div>
                <div class="card-body">
                    <p>Bidding Dashboard List Will Be Here...</p>
                </div>
            </div>
        </div>
    </div>

</template>

<script>

    import validateJs from 'validate.js';

    export default {
        name: "bidding-dashboard",
        data() {
            return {

            }
        },
        computed: {
            
        },
        methods: {

        },
        mounted(){
            
        },
        beforeRouteEnter (to, from, next) {
            let currentVendor = JSON.parse(localStorage.getItem("vendor"));

            if(currentVendor.hasOwnProperty('SBM')){
                //check with the backend if user has SAD privileges
                axios.get('/api/vendors/get_vendor_user_details')
                    .then(response => {
                        //console.log(response.data);
                        if(response.data.hasOwnProperty('SBM')){
                            next();
                        } else {
                            
                            Swal("High Fraud Offence", "You do not have the right to access this page, this instance will be reported. \n. ("+ currentVendor.Name +")" , 'error');

                            //this instance must be reported to since there is fraud envolved.

                            next('/vendors/login');
                        }
                    })

            } else {

                //instance can be reported to backend here
                if(from.path != '/'){
                    /*$.toast({
                        heading: 'No Access Rights.',
                        text: 'You do not have the privilege to access this menu.',
                        position: 'top-right',
                        loaderBg:'#ff6849',
                        icon: 'error',
                        hideAfter: 3000, 
                        stack: 6
                    });*/
                    Swal("Access Denied", "You do not have the right to access this page", 'error');
                }

                

                next('/vendors/login');
            }       
        }
    }
</script>