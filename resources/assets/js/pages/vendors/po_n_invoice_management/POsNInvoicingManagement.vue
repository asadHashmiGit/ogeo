<template>
	
	<div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">
                
                <div id="breadcrumb-title" class="col-md-12 col-lg-5 col-xlg-5 animated">
                    <h3 class="text-themecolor m-b-0 m-t-0">{{ $route.name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">POs & Invoicing Management</a></li>
                        <li class="breadcrumb-item active">{{ $route.name }}</li>
                    </ol>
                </div>
               
                
                <div class="col-md-4 col-lg-7 col-xlg-7">

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/vendors/po_n_invoice_management"> POs Management</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/vendors/po_n_invoice_management/rate_contract_management"> RCs Managemenet</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/vendors/po_n_invoice_management/pending_payment"> Receiving & Invoicing</router-link>
                    </div>
                    
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <transition
                appear
                mode="out-in"
                :duration="{ enter: 700, leave: 300 }"
                enter-active-class="zoomIn"
                leave-active-class="zoomOut">
            <!-- <transition
                appear
                mode="out-in"
                :duration="{ enter: 500, leave: 300 }"
                enter-active-class="fadeInLeft"
                leave-active-class="fadeOutRight"> -->
                <router-view style="animation-duration: 0.5s;" class="animated"></router-view>
            </transition>    

            <!-- ============================================================== -->
            <!-- End Page Content -->
            <!-- ============================================================== -->  
            

                
            
        </div>
    </div>

</template>

<script>

    import {CustomJs} from '../../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'receiving-n-invoicing',
        data(){
            return{
                RouteChanged: false
            }
        },
        computed: {
            currentVendor(){
                return this.$store.getters.currentVendor;
            }
        },
        methods: {
            ChangingRoute(){

                var $this = $('#breadcrumb-title');
                if ($this.hasClass('animated')){
                    $this.removeClass('animated fadeInDown')
                         .addClass('animated fadeInDown')
                         setTimeout(function(){
                            $this.removeClass('animated fadeInDown');
                        },700);
                } else{
                    $this.removeClass('animated fadeInDown')
                         .addClass('animated fadeInDown')
                         setTimeout(function(){
                            $this.removeClass('animated fadeInDown');
                        },700);
                }
            
            }
        },
        mounted(){

            this.RouteChanged = true;

        },
        beforeRouteEnter (to, from, next) {
            let currentVendor = JSON.parse(localStorage.getItem("vendor"));

            if(currentVendor.hasOwnProperty('SIM') || currentVendor.hasOwnProperty('SBM')){
                //check with the backend if user has SAD privileges
                axios.get('/api/vendors/get_vendor_user_details')
                    .then(response => {
                        //console.log(response.data);
                        if(response.data.hasOwnProperty('SIM') || response.data.hasOwnProperty('SBM')){
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


<style scoped>
    .router-link-exact-active {
        font-weight: 600;
        background-color: #2874A6;
        border: 1px solid #2874A6;
    }
</style>