<template>

    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">

                <div id="breadcrumb-title" class="col-md-12 col-lg-5 col-xlg-5 animated">
                    <h3 class="text-themecolor m-b-0 m-t-0">{{ $route.name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Profile</a></li>
                        <li class="breadcrumb-item active">{{ $route.name }}</li>
                    </ol>
                </div>


                <div class="col-md-4 col-lg-7 col-xlg-7">
    
                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile"> Profile Info</router-link>
                    </div>

                    <!-- <div v-if="currentUser.hasOwnProperty('ALMR')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingItemCreationRequests }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/item_creation_requests"> Item Creation Requests</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('LMA')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingItemCreations }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/item_creations"> Item Creations</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('PRO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingPurchaseEnquiries }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_purchase_enquiries"> Purchase Enquiries</router-link>
                    </div> 

                    <div v-if="currentUser.hasOwnProperty('PRO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingVendorRFIs }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_request_for_information">Vendor RFI</router-link>
                    </div> 

                    <div v-if="currentUser.hasOwnProperty('POO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingPurchaseOrders }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/purchase_orders_clarifications">Purchase Orders</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RCCO')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingRateContractRequests }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_rate_contract_requests">Rate Contract Requests</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RTSI')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingStockItemRequests }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_stock_item_requests">Stock Item Requests</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RTIRS')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingRateContractRequests }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_stock_issuance_requests">Stock Issuance Requests</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('RTIRS')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingRateContractRequests }}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/profile/user_stock_return_requests">Stock Return Requests</router-link>
                    </div> -->

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
            <!-- End PAge Content -->
            <!-- ============================================================== -->

        </div>
    </div>


</template>

<script>

    import {CustomJs} from '../../helpers/custom.js';

    export default {
        name: 'user-profile',
        data(){
            return{
            	RouteChanged: false,
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            },
            userPendingTasks(){
                return this.$store.getters.userPendingTasks;
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
            
            CustomJs();
            this.RouteChanged = true;

            
        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));

            //check for anything with the server...
            next();    
        }
    }

</script>

<style scoped>

    .numberCircle {
        position: absolute;
        top: 8px;
        left: 8px;

        line-height:0px;
        display:inline-block;
        
        border-radius:50%;
        border:1px solid;
        
        font-size:10px;
        color: white;
        background-color: rgb(202, 224, 42, 0.7);
        z-index: 10;
    }

    .numberCircle span {
        display:inline-block;
        
        padding-top:50%;
        padding-bottom:50%;
        
        margin-left:8px;
        margin-right:8px;
    }

    .router-link-exact-active {
        font-weight: 600;
        background-color: #2874A6;
        border: 1px solid #2874A6;
    }
</style>