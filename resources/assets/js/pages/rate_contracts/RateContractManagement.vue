<template>
	
	<div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 ">
                    <h3 class="text-themecolor m-b-0 m-t-0">{{ $route.name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Rates Contracts</a></li>
                        <li class="breadcrumb-item active">{{ $route.name }}</li>
                    </ol>
                </div>
                <div class="col-md-4 col-lg-7 col-xlg-7">

                    <div v-if="currentUser.hasOwnProperty('RCCO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/rate_contracts"> New Rates Contract Request</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RCCV')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/rate_contracts/rate_contracts_requests_approvals"> Testing R.C. Requests Approvals</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RCO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/rate_contracts/rate_contracts_requests_approvals">Rates Contract Request</router-link>
                    </div>

                    <!-- <div v-if="currentUser.hasOwnProperty('RCV')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/rate_contracts/rate_contract_creation_approvals"> R.C. Creation Approvals</router-link>
                    </div> validator role will be changed after wards -->
                    <!-- <div v-if="currentUser.hasOwnProperty('RCV')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn"> 
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/rate_contracts/rate_contract_creation_approvals"> R.C. Creation Approvals</router-link>
                    </div> -->

                    <div v-if="currentUser.hasOwnProperty('RCO') || currentUser.hasOwnProperty('RCV')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left router-btn">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/purchase_enquiry/library_of_materials"> Libray of Materials </router-link>
                    </div>

                    
                    
                </div>
            </div>

            <hr>

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
                :duration="{ enter: 700, leave: 300 }"
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

    //import {CustomJs} from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'purchase-enquiry',
        data(){
            return{
               pageTitle: ""
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            enter: function (el, done) {
              var delay = 2000
              setTimeout(function () {
                Velocity(
                  el,
                  { opacity: 1, },
                  { complete: done }
                )
              }, delay)
            },
            leave: function (el, done) {
              var delay = 1000
              setTimeout(function () {
                Velocity(
                  el,
                  { opacity: 0, },
                  { complete: done }
                )
              }, delay)
            }
        },
        mounted(){

            //CustomJs();
            // $(function () {
            //     // topbar stickey on scroll
            //     $(".fix-header .topbar").stick_in_parent({
                    
            //     });
            // });
        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));

            if(currentUser.hasOwnProperty('RCCO') || currentUser.hasOwnProperty('RCCV') || currentUser.hasOwnProperty('RCO') || currentUser.hasOwnProperty('RCV')){
                //check with the backend if user has SAD privileges
                axios.get('/api/users/get_user_details')
                    .then(response => {
                        console.log(response.data);
                        if(response.data.hasOwnProperty('RCCO') || response.data.hasOwnProperty('RCCV') || response.data.hasOwnProperty('RCO') || response.data.hasOwnProperty('RCV')){
                            next();

                            
                        } else {

                            Swal("High Fraud Offence", "You do not have the right to access this page, this instance will be reported. \n. ("+ currentUser.name +")" , 'error');

                            //this instance must be reported to since there is fraud envolved.
                            next('/login');
                        }
                    })

            } else {
                //Swal("Access Denied", "You do not have the right to access this page, this instance will be reported. \n. ("+ currentUser.name +")" , 'warning');

                //instance can be reported to backend here
                if(from.path != '/'){
                    Swal("Access Denied", "You do not have the right to access this page", 'error');
                    /*$.toast({
                        heading: 'No Access Rights.',
                        text: 'You do not have the privilege to access this menu.',
                        position: 'top-right',
                        loaderBg:'#ff6849',
                        icon: 'error',
                        hideAfter: 3000, 
                        stack: 6
                    });*/
                }

                

                next('/login');
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