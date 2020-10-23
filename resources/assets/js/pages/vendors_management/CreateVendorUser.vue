<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Create Vendor Access</h4>
                </div>
                <div class="card-body">
                    <el-form :model="VendorCreationInfo" class="demo-form-inline" :rules="rules" ref="VendorUserCreationForm">

                        <el-row :gutter="24">
                            
                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorId">
                                        <span slot="label"><b>Select A Vendor to Create User</b></span>
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="VendorCreationInfo.VendorId" placeholder="Select A Vendor to Create User">
                                            <el-option v-for="vendor in VendorsList" :key="vendor.id" :label="vendor.name" :value="vendor.id"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorUserName">
                                        <span slot="label"><b>Enter User First & Last Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorUserName" placeholder="Enter User Name"
                                            ></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>
                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorUserEmail">
                                        <span slot="label"><b>Enter User Email</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorUserEmail" placeholder="Enter User Email"
                                            ></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorUserRole">
                                        <span slot="label"><b>Select User Role</b></span>
                                        <el-select filterable multiple style="width: 100%; padding: 0px;" v-model="VendorCreationInfo.VendorUserRole" placeholder="Select User Role">
                                            <el-option label="Vendor’s Bid Manager" value="SBM"></el-option> 
                                            <el-option label="Vendor’s Invoicing Manager" value="SIM"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24">
                                <hr>
                                <button type="button" @click="SubmitVendorUserCreationForm" class="btn btn-success btn-block waves-effect text-center">Create Vendor User</button>
                            </el-col>

                        </el-row>
                    </el-form>

                </div>
            </div>
            
        </div>

        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Vendor Users List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="VendorUsersList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Vendor Name</th>
                                <th>User Name</th>
                                <th>User Email</th>
                                <th>Vendor’s Bid Manager Role</th>
                                <th>Vendor’s Invoicing Manager Role</th>
                                <th>Created At</th>
                                <th>Active</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

    </div>
            
</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'vendor-user-creation',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                ViewModalInfo: {},
                VendorsList: {},
                VendorCreationInfo: {
                    VendorId: "",
                    VendorUserName: "",
                    VendorUserEmail: "",
                    VendorUserRole: [],
                },
                rules: {
                    VendorId: [{
                        required: true,
                        message: "Please Select A Vendor",
                        trigger: ["blur"]
                    }],
                    VendorUserName: [{
                        required: true,
                        message: "Please Enter User Name",
                        trigger: "blur"
                    }],
                    VendorUserEmail: [{
                        required: true,
                        message: "Please Enter User Email",
                        trigger: "blur"
                    }],
                    VendorUserRole: [{
                        required: true,
                        message: "Please Select Vendor Role",
                        trigger: ["blur"]
                    }],
                }
            }
        },
        methods: {

            SubmitVendorUserCreationForm: function(){
                
                let self = this;

                this.$refs.VendorUserCreationForm.validate((validation) => {

                    if(validation){

                        axios.post( '/api/vendors_management/created_vendor_user', this.VendorCreationInfo)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 15000
                                });

                                self.VendorCreationInfo.VendorId = "";
                                self.VendorCreationInfo.VendorUserName = "";
                                self.VendorCreationInfo.VendorUserEmail = "";
                                self.VendorCreationInfo.VendorUserRole = [];

                                self.DataTable.ajax.reload( null, false );

                                
                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (CreatingNewVendorUser) CODE:001', 'error');
                            });

                    }

                });
                
            },
        },
        mounted(){

            const self = this;

            axios.get('/api/data/get_vendors_list')
                    .then((response) => {
                        this.VendorsList = response.data;                  
                    });

            const table = $('#VendorUsersList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_vendor_users_datatable',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'vendors[0].name', name: 'vendors[0].name' },
                    { data: 'name', name: 'name' },
                    { data: 'email', name: 'email' },
                    { data: 'sbm_role', name: 'sbm_role' },
                    { data: 'sim_role', name: 'sim_role' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'active', name: 'active' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 3 },
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

            
            self.DataTable = table;

            $('tbody', this.$refs.table).on('click', '.UserDeactivate', function(){
                var $this = $(this);
                var UserID = $(this).data('vendoruserid');

                axios.post('/api/vendors_management/deactivate_vendor_user', [UserID])
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        self.DataTable.ajax.reload( null, false );
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                
            });


            $('tbody', this.$refs.table).on('click', '.UserReactivate', function(){
                var $this = $(this);
                var UserID = $(this).data('vendoruserid');

                axios.post('/api/vendors_management/reactivate_vendor_user', [UserID])
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        self.DataTable.ajax.reload( null, false );
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                
            });

            $('tbody', this.$refs.table).on('click', '.UserDelete', function(){
                var $this = $(this);
                var UserID = $(this).data('vendoruserid');

                axios.post('/api/vendors_management/delete_vendor_user', [UserID])
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        self.DataTable.ajax.reload( null, false );
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                
            });

            

        },
    }

</script>