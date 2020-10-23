<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>System Master Data Reset</h4>
                </div>
                <div class="card-body">
                	<div class="row">
                		<div class="col-lg-12">
                            <div class="col-lg-12">
                                <hr>
                                <button type="button" @click="SystemPartialDataReset" class="btn btn-danger btn-block waves-effect text-center">System Partial Data Reset</button>
                                <hr>
                            </div>
                			<div class="col-lg-12">
                                <hr>
                                <button type="button" @click="SystemMasterDataReset" class="btn btn-danger btn-block waves-effect text-center">System Master Data Reset (Fresh Start)</button>
                                <hr>
                            </div>
                		</div>
                	</div>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>General System Information</h4>
                </div>
                <div class="card-body">
                	<div class="row">
                		<div class="col-lg-12">
                            <table ref="table" id="CompaniesList" class="display responsive table table-bordered table-hover" style="width:100%">
		                        <thead>
		                            <tr>
		                                <th>ID</th>
		                                <th>Name</th>
		                                <th>Total Users</th>
		                                <th>Total Projects</th>
		                                <th>Total Item Creation Requests</th>
		                                <th>Total Approved Items</th>
		                                <th>Total Purchase Enquiries</th>
		                                <th>Total Quotation Requests</th>
		                                <th>Total Vendors</th>
		                                <th>Total Vendor Users</th>
		                                <th>Created At</th>
		                                <th>Action</th>
		                            </tr>
		                        </thead>
		                    </table>
                		</div>
                	</div>
                </div>
            </div>
        </div>


        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Registered User Not Completed The Setup</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <table ref="users_table" id="UserNotCompletedSetup" class="display responsive table table-bordered table-hover" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>User Name</th>
                                        <th>User Email</th>
                                        <th>User Designation</th>
                                        <th>Created At</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="CompanyDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="CompanyDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Company Details:</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                            	<p>Company Name: {{ ViewModalInfo.name }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</template>

<script>

	import validateJs from 'validate.js';

	export default {
		name: "system-information",
		data() {
			return{
                DataTable: "",
                UserDataTable: "",
                viewDataLoaded: false,
                ViewModalInfo: {},
            }
		},
		methods: {

			showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_company_details', {companyID: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#CompanyDetailsModal').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },

			SystemPartialDataReset(){
                let self = this;
            	if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This Will Remove Partial Data From the System Premenently. Only Users, Roles, Companies, Projects Will Remain.",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Reset and Remove Data!'
                }).then((result) => {
                    if (result.value) {
                        
                        axios.post('/api/system_management/system_partial_data_system_reset')
                            .then((response) => {

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 15000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                    }

                    

                })

            },


            SystemMasterDataReset(){
                if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This Will Remove All Data From the System Premenently. Only System Admin Creditials Will Remain.",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Reset System Data!'
                }).then((result) => {
                    if (result.value) {
                        
                        axios.post('/api/system_management/system_master_data_system_reset')
            				.then((response) => {

			                    Swal({ 
			                        type: response.data.messageType, 
			                        title: response.data.messageTitle, 
			                        text: response.data.message,
			                        showConfirmButton: true,
			                        timer: 15000
			                    });

                                self.DataTable.ajax.reload( null, false );

			                })
                    }
                    
                })

			}
		},
		mounted(){

			const table = $('#CompaniesList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_companies_datatable',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'users_count', name: 'users_count' },
                    { data: 'projects_count', name: 'projects_count' },
                    { data: 'item_creation_requests_count', name: 'item_creation_requests_count' },
                    { data: 'items_count', name: 'items_count' },
                    { data: 'purchase_enquiries_count', name: 'purchase_enquiries_count' },
                    { data: 'quotation_requests_count', name: 'quotation_requests_count' },
                    { data: 'vendors_count', name: 'vendors_count' },
                    { data: 'vendor_users_count', name: 'vendor_users_count' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 11 },
                    { responsivePriority: 2, targets: 1 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, "ASC" ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemMasterList' },
                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
                    {
                        text: '<i class="fa fa-refresh"></i>',
                        className: 'btn btn-success',
                        action: function ( e, dt, node, config ) {
                            dt.ajax.reload();
                        }
                    },
                ],
                "language": {
                    processing: 'Loading Data... <i class="fa fa-spinner fa-spin fa-fw"></i>'
                },    
            });

            const self = this

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showViewModal(RecordID);
            });

            self.DataTable = table;



            const UsersTable = $('#UserNotCompletedSetup').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_users_not_completed_setup_datatable',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'email', name: 'email' },
                    { data: 'designation', name: 'designation' },
                    { data: 'created_at', name: 'created_at' },
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 1 },
                    { responsivePriority: 2, targets: 2 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, "ASC" ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemMasterList' },
                    { extend: 'pdf', className: 'btn btn-success', title: 'ItemMasterList' },
                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                ],
                "language": {
                    processing: 'Loading Data... <i class="fa fa-spinner fa-spin fa-fw"></i>'
                },    
            });



            self.UserDataTable = UsersTable;
			
		}
	}
</script>


<style scoped>
    
    .font-500{
        font-weight: 500;
    }

    #CompanyDetailsModal .modal-dialog {
        min-width:80%;
    }

</style>