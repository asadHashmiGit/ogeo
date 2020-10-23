<template>
	
	<div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">
                
                <div id="breadcrumb-title" class="col-md-12 col-lg-5 col-xlg-5 animated">
                    <h3 class="text-themecolor m-b-0 m-t-0">{{ $route.name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Library of Materials (LoM)</a></li>
                        <li class="breadcrumb-item active">{{ $route.name }}</li>
                    </ol>
                </div>
               
                
                
                <div class="col-md-4 col-lg-7 col-xlg-7">

                    <div v-if="currentUser.hasOwnProperty('ALMR')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master"> Request To Update The <br> Libray of Materials</router-link>
                    </div>

                    <div v-if="currentUser.hasOwnProperty('ALMR') || currentUser.hasOwnProperty('ALMV') || currentUser.hasOwnProperty('LMA')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <div class="numberCircle"><span>{{ userPendingTasks.PendingItemCreationRequestsLMA + userPendingTasks.PendingItemCreationRequestsALMV + userPendingTasks.RejectedItemCreationsRequests}}</span></div>
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master/requests_list"> List Of Requests To <br>Update Libray of Materials</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master/items_list"> Library of <br>Materials </router-link>
                    </div>

                    <!-- <div v-if="currentUser.hasOwnProperty('ALMV')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master/approval"> Item Creation Approvals <br><br></router-link>
                    </div> -->

                    <div v-if="currentUser.hasOwnProperty('LMA')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master/template_setup"> Template <br>Creation </router-link>
                    </div>

                    <!-- <div v-if="currentUser.hasOwnProperty('LMA')" style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/items_master/new_item_creation"> New Item Creation <br><br></router-link>
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
            <!-- End Page Content -->
            <!-- ============================================================== -->  
            

                
            
        </div>
    </div>

</template>

<script>

    import {CustomJs} from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'purchase-enquiry',
        data(){
            return{
                RouteChanged: false
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

            this.RouteChanged = true;

            CustomJs();

        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));

            if(currentUser.hasOwnProperty('ALMR') || currentUser.hasOwnProperty('LMA') || currentUser.hasOwnProperty('ALMV')){
                //check with the backend if user has SAD privileges
                axios.get('/api/users/get_user_details')
                    .then(response => {
                        //console.log(response.data);
                        if(response.data.hasOwnProperty('ALMR') || response.data.hasOwnProperty('LMA') || response.data.hasOwnProperty('ALMV')){
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

                

                next('/login');
            }       
        }
    }

</script>


<style scoped>

    .numberCircle {
        position: absolute;
        top: 8px;
        left: 85%;

        line-height:0px;
        display:inline-block;
        
        border-radius:50%;
        border:1px solid;
        
        font-size:10px;
        font-weight: bold;
        color: white;
        background-color: rgb(252, 51, 23, 0.9);
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