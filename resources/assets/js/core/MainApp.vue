<template>
    
    <span class="">
        
        <div v-if="currentUser">
            <AppHeader />
            <AppMenu/>
        </div>

        <div v-else-if="currentVendor">
            <VendorsHeader />
            <VendorsMenu />
        </div>

        <div v-else>
            <HomeHeader/>
        </div>
        
        
        <router-view></router-view>        
        
        <AppFooter/>

        <!-- <PassportClients/> -->
        <!-- <PassportAuthorizedClients/> -->
        <!-- <PassportPersonalAccessTokens/> -->

        <!-- <div id="idle-timeout-dialog" data-backdrop="static" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Your session is expiring soon</h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            <i class="fa fa-warning font-red"></i> You session will be locked in
                            <span id="idle-timeout-counter"></span> seconds.</p>
                        <p> Do you want to continue your session? </p>
                    </div>
                    <div class="modal-footer text-center">
                        <button id="idle-timeout-dialog-keepalive" type="button" class="btn btn-success" data-dismiss="modal">Yes, Keep Working</button>
                    </div>
                </div>
            </div>
        </div> -->
        
    </span>
    
</template>

<script>

    //import {CustomJs} from '../helpers/custom.js';
    import AppHeader from './layout/Header.vue';
    import HomeHeader from './layout/HomeHeader.vue';
    import AppMenu from './layout/Menu.vue';
    import AppFooter from './layout/Footer.vue';
    import VendorsHeader from './vendor_layout/VendorsHeader.vue';
    import VendorsMenu from './vendor_layout/VendorsMenu.vue';
    // import PassportClients from './passport/Clients.vue';
    // import PassportAuthorizedClients from './passport/AuthorizedClients.vue';
    // import PassportPersonalAccessTokens from './passport/PersonalAccessTokens.vue';

    export default {
        name: 'main-app',
        data(){
            return {

            }
        },
        components: {
            AppHeader,
            AppMenu,
            AppFooter,
            HomeHeader,
            VendorsHeader,
            VendorsMenu,
            // PassportClients,
            // PassportAuthorizedClients,
            // PassportPersonalAccessTokens
        },
        computed:{
            currentUser(){
                return this.$store.getters.currentUser
            },
            currentVendor(){
                return this.$store.getters.currentVendor;
            }
        },
        mounted() {

            //CustomJs();
            
        },
        beforeCreate(){

            //console.log('beforeCreateHeader');

            // axios.get('/api/users/get_user_details')
            //     .then(response => {
            //         this.$store.commit('setUser', response.data)
            //     })
            
        }


    }
</script>
