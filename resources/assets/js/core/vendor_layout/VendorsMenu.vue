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
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-bar-chart-o"></i><span class="hide-menu">Dashboards </span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/vendors/dashboards">Dashboards</router-link></li>
                        </ul>
                    </li>



                    <li v-if="currentVendor.hasOwnProperty('SBM')">
                        <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-legal"></i><span class="hide-menu">Offers Management</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/vendors/bidding_management">Offers Management</router-link></li>
                        </ul>
                    </li>
                    <li v-if="currentVendor.hasOwnProperty('SBM') || currentVendor.hasOwnProperty('SIM')">
                        <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-money"></i><span class="hide-menu">POs & Invoices Management</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><router-link to="/vendors/po_n_invoice_management">POs & Invoices Management</router-link></li>
                        </ul>
                    </li>
                    <li></li>

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
        name: 'VendorMenu',
        data(){
            return{
                
            }
        },
        computed: {
            currentVendor(){
                return this.$store.getters.currentVendor;
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