<template>

    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">

                <div id="breadcrumb-title" class="col-md-12 col-lg-5 col-xlg-5 animated">
                    <h3 class="text-themecolor m-b-0 m-t-0">{{ $route.name }}</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">System Management</a></li>
                        <li class="breadcrumb-item active">{{ $route.name }}</li>
                    </ol>
                </div>


                <div class="col-md-4 col-lg-7 col-xlg-7">
    
                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management"> System Info</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management/frequently_asked_questions"> Frequently Asked Questions</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management/system_errors_log"> Errors Log</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management/broadcast_center"> Broadcast Center</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management/charts_creation"> Charts Creation</router-link>
                    </div>

                    <div style="padding: 1px 1px 1px 1px" class="col-lg-4 float-left">
                        <router-link style="margin: 1px 0px 1px 0px" class="btn btn-block waves-effect btn-success text-white" to="/app/system_management/available_charts"> Available Charts</router-link>
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
            <!-- End PAge Content -->
            <!-- ============================================================== -->

        </div>
    </div>


</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'system-management',
        data(){
            return{
            	RouteChanged: false,
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
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
			let currentUser = JSON.parse(localStorage.getItem("user"));

			if(currentUser.hasOwnProperty('SAD')){
				//check with the backend if user has SAD privileges
	            axios.get('/api/users/get_user_details')
	                .then(response => {
	                	console.log(response.data);
	                    if(!response.data.hasOwnProperty('SAD')){
	                    	Swal("High Fraud Offence", "The page you requested is meant only for system administorators, this instance will be reported \n. ("+ currentUser.name +")" , 'error');

	                    	//this instance must be reported to since there is fraud envolved.

	                    	next('/login');
	                    } else {
	                    	next();
	                    }
	                })

			} else {
				Swal("Entering Restricted Area", "The page you requested is meant only for system administorators, this instance will be reported \n. ("+ currentUser.name +")" , 'error');

				//instance can be reported to backend here


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