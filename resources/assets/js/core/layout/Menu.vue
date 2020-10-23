<template>
	
	<!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <!-- <li class="nav-small-cap">PERSONAL</li> -->
                    <li v-if="currentUser.hasOwnProperty('SAD')">
                        <a style="cursor: auto" class="has-arrow " href="#" aria-expanded="false"><i class="fa fa-gears"></i><span class="hide-menu">System Management</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/app/system_management"> System Info</router-link></li>
                            <li><router-link to="/app/system_management/frequently_asked_questions"> Frequently Asked Questions</router-link></li>
                            <li><router-link to="/app/system_management/system_errors_log"> Errors Log</router-link></li>
                            <li><router-link to="/app/system_management/broadcast_center"> Broadcast Center</router-link></li>
                            <li><router-link to="/app/system_management/charts_creation"> Charts Creation</router-link></li>
                            <li><router-link to="/app/system_management/available_charts"> Available Charts</router-link></li>
                        </ul>
                    </li>
    

                    <!-- <li v-if="currentUser.CompanyId == null">
                        <a style="cursor: auto" class="has-arrow" href="/app/account_settings" aria-expanded="false"><i class="fa fa-gears"></i><span>Account Settings </span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/app/account_settings">Account Settings</router-link></li>
                        </ul>
                    </li> -->

                    <li v-if="currentUser.CompanyId != null">
                        <a style="cursor: auto" class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-bar-chart-o"></i><span class="hide-menu">Dashboard </span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/app/dashboard">Personal Dashboard</router-link></li>
                        </ul>
                    </li>

                    <li v-if="currentUser.CompanyId != null">
                        <a style="cursor: auto" class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-navicon"></i><span class="hide-menu">System Modules </span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link :class="[currentUser.hasOwnProperty('LMA') || currentUser.hasOwnProperty('ALMV') || currentUser.hasOwnProperty('ALMR') ? '' : 'fadedMenu']" to="/app/items_master">Library Of Materials (LoM)</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('PRO') || currentUser.hasOwnProperty('PRV') ? '' : 'fadedMenu']" to="/app/purchase_enquiry">Purchase Enquiry</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('RFQM') ? '' : 'fadedMenu']" to="/app/quotations">Request For Proposals</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('POO') || currentUser.hasOwnProperty('POV') ? '' : 'fadedMenu']" to="/app/purchase_orders">Purchase Orders</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('RNO') || currentUser.hasOwnProperty('RNV') ? '' : 'fadedMenu']" to="/app/receipt_notes">Receipt Notes</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('SLM') || currentUser.hasOwnProperty('INV') ? '' : 'fadedMenu']" to="/app/vendors_management">Vendors Management</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('RCCO') || currentUser.hasOwnProperty('RCCV') || currentUser.hasOwnProperty('RCO') || currentUser.hasOwnProperty('RCV') ? '' : 'fadedMenu']" to="/app/rate_contracts">Rate Contracts</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('ASTMGR') || currentUser.hasOwnProperty('SIIRPT') ? '' : 'fadedMenu']" to="/app/stores_management">Store Management</router-link></li>
                            <li><router-link :class="[currentUser.hasOwnProperty('RTIRS') || currentUser.hasOwnProperty('ATSIRS') || currentUser.hasOwnProperty('RTSI') || currentUser.hasOwnProperty('ATSI') ? '' : 'fadedMenu']" to="/app/store_requests">Store Requests</router-link></li>
                        </ul>
                    </li>


                    <li v-if="currentUser.CompanyId != null" class="float-right">
                        <a style="cursor: auto" class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-book"></i><span class="hide-menu"> FAQs </span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/app/process_faqs">Process FAQs </router-link></li>
                            <li><router-link to="/app/dashboard_faqs">Dashboard FAQs </router-link></li>
                            <li><router-link to="/app/system_access_faqs">System Access FAQs </router-link></li>
                            <li><router-link to="/app/purchase_enquiry_faqs">Purchase Enquiry FAQs </router-link></li>
                            <li><router-link to="/app/item_master_faqs">Items Master FAQs </router-link></li>
                            <li><router-link to="/app/quotations_faqs">Quotations FAQs </router-link></li>
                            <li><router-link to="/app/purchase_orders_faqs">Purchase Orders FAQs </router-link></li>
                            <li><router-link to="/app/receipt_notes_faqs">Receipt Notes FAQs </router-link></li>
                            <li><router-link to="/app/suppliers_faqs">Suppliers FAQs </router-link></li>
                            <li><router-link to="/app/rate_contract_faqs">Rate Contracts FAQs </router-link></li>
                        </ul>
                    </li>

                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->

</template>


<script>

	export default{
        name: 'Menu',
        data(){
            return{
                
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted(){

        }
        
	}
</script>


<style scoped>
    
    .router-link-active{
        font-weight: 900;
        text-decoration: underline;
    }

    .fadedMenu{
        font-weight: 400;
        color: #DBDBDB;
        cursor: not-allowed;
    }

</style>