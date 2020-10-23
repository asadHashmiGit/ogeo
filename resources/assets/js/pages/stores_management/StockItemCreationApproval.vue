<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item Creation Approval List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="StockItemApprovalsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Stock #</th>
                                <th>Created By</th>
                                <th>Requested Item</th>
                                <th>Start Period</th>
                                <th>End Period</th>
                                <th>Replenish Level</th>
                                <th>Replenish Quantity</th>
                                <th>Current Stock Level</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="StockItemModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ ViewModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item (ID):</b></td>
                                        <td>StockID-{{ ViewModalInfo.stock_item_group_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>Period Start: {{ ViewModalInfo.start_date.substring(0,10) }} <br> Period End : {{ ViewModalInfo.end_date.substring(0,10) }}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ ViewModalInfo.item.id }} <br> Item Description:{{ ViewModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ ViewModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ ViewModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ ViewModalInfo.stock_level }} </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                        
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="StockItemModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ EditModalInfo.stock_item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Number (ID):</b></td>
                                        <td>StockID-{{ EditModalInfo.stock_item_group_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ EditModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ EditModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ EditModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>{{ EditModalInfo.start_date }} - {{ EditModalInfo.end_date }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ EditModalInfo.item.id }} <br>Item Description:{{ EditModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ EditModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ EditModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ EditModalInfo.stock_level }} </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                            <el-form :model="EditModalInfo" class="demo-form-inline" :rules="editRules" ref="EditModalFormInfoID">
                                <el-row :gutter="20">
                                    <el-col :span="24">
                                        <div class="grid-content">
                                            <el-form-item label="Select Stock Item Purchase Enquiry Generation Type" prop="pe_generation_type">
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                    <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                                    <span class="tooltip-content4 clearfix">
                                                        <span class="tooltip-text2">Additonal Notes Can Added</span>
                                                    </span>
                                                </span>
                                                <el-select class="font-900" style="width: 100%; padding: 0px;" v-model="EditModalInfo.pe_generation_type" placeholder="Select Purchase Enquiry Generation Type">
                                                    <el-option label="Automatic Generation" value="Automatic"></el-option>  
                                                    <el-option label="Manual Generation" value="Manual"></el-option> 
                                                </el-select>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="12">
                                        <div class="grid-content">
                                            <el-form-item label="Select Stock Start Date" prop="start_date">
                                                
                                            <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                <span class="fa-stack fa-1x">
                                                        <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
                                                        <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
                                                    </span>
                                                <span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
                                                    <span class="tooltip-text2">Something here. </span>
                                                </span>
                                            </span>
                                                
                                                <el-date-picker
                                                  style="width: 100%"
                                                  v-model="EditModalInfo.start_date"
                                                  type="date"
                                                  placeholder="Start date"
                                                  :default-time="['00:00:00']"
                                                  value-format="yyyy-MM-dd HH:mm:ss">
                                                </el-date-picker>
                                                
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="12">
                                        <div class="grid-content">
                                            <el-form-item label="Select Stock End Date" prop="end_date">
                                                
                                            <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                <span class="fa-stack fa-1x">
                                                        <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
                                                        <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
                                                    </span>
                                                <span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
                                                    <span class="tooltip-text2">Something here. </span>
                                                </span>
                                            </span>
                                                
                                                <el-date-picker
                                                  style="width: 100%"
                                                  v-model="EditModalInfo.end_date"
                                                  type="date"
                                                  placeholder="End date"
                                                  :default-time="['23:59:59']"
                                                  value-format="yyyy-MM-dd HH:mm:ss">
                                                </el-date-picker>
                                                
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="12">
                                        <div class="grid-content">

                                            <el-form-item label="Minimum Iventory Level?" prop="replenish_level">
                                                <el-input min='0.0000001' type="number" placeholder="Enter minimum inventory level" v-model="EditModalInfo.replenish_level">
                                                </el-input>
                                            </el-form-item>

                                        </div>
                                    </el-col>


                                    <el-col :span="12">
                                        <div class="grid-content">

                                            <el-form-item label="Optimal Order Quantity" prop="replenish_quantity">
                                                <el-input min='0.0000001' type="number" placeholder="Enter Optimal Order Quantity" v-model="EditModalInfo.replenish_quantity">
                                                </el-input>
                                            </el-form-item>

                                        </div>
                                    </el-col>


                                    <el-col :span="24">
                                        <div class="grid-content">

                                            <el-form-item label="Addtional Notes" prop="notes">
                                                <el-input
                                                    type="textarea"
                                                    :rows="4"
                                                    placeholder="Enter Additional Note."
                                                    v-model="EditModalInfo.notes">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="24">
                                        <hr>
                                        <h4> Item Location: ({{  EditModalInfo.project.title }})</span></h4>
                                    </el-col>
                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Bin Location" prop="Bin">
                                                <el-input placeholder="Enter Bin Location" v-model="EditModalInfo.bin">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Shelf Location" prop="Shelf">
                                                <el-input placeholder="Enter Shelf Location" v-model="EditModalInfo.shelf">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Rack Location" prop="Rack">
                                                <el-input placeholder="Enter Rack Location" v-model="EditModalInfo.rack">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Area Location" prop="Area">
                                                <el-input placeholder="Enter Area Location" v-model="EditModalInfo.area">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Alley Location" prop="Alley">
                                                <el-input placeholder="Enter Alley Location" v-model="EditModalInfo.alley">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="24">
                                        <hr>
                                    </el-col>

                                    <el-col :span="24">
                                        <div class="grid-content">

                                            <el-form-item label="Rejection Notes" prop="notes">
                                                <el-input
                                                    type="textarea"
                                                    :rows="4"
                                                    placeholder="Rejection Notes Required."
                                                    v-model="EditModalInfo.DecisionNotes">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>
                                    

                                    <el-col :span="12">
                                        <button type="button" @click="StockItemApproval('Reject')" class="btn btn-danger btn-block waves-effect">Reject Stock Item Creation</button>
                                    </el-col>

                                    <el-col :span="12">
                                        <button type="button" @click="StockItemApproval('Approve')" class="btn btn-success btn-block waves-effect pull-right">Approve Stock Item Creation</button>
                                    </el-col>
                                    

                                </el-row>

                            </el-form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
            
</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'purchase-enquiry-list',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                EditModalFormInfo: {
                    StoreID: "",
                    StockItemId: "",
                    StockingStartDate: "",
                    StockingEndDate: "",
                    PEGenerationType: "",
                    ReplenishmentQuantity: "",
                    ReplenishmentLevel: "",
                    Bin: "",
                    Shelf: "",
                    Rack: "",
                    Area: "",
                    Alley: "",
                    StockItemNote: "",
                    DecisionNotes: "",
                },
                editRules: {
                    pe_generation_type: [{
                        required: true,
                        message: "Purchase Enquiry Generation Type Required",
                        trigger: ["blur", "change"]
                    }],
                    start_date: [{
                        required: true,
                        message: "Start Date Required",
                        trigger: ["blur", "change"]
                    }],
                    end_date: [{
                        required: true,
                        message: "End Date Requried",
                        trigger: ["blur", "change"]
                    }],
                    replenish_quantity: [{
                        required: true,
                        message: "Replenish Quantity Required",
                        trigger: ["blur", "change"]
                    }],
                    replenish_level: [{
                        required: true,
                        message: "Replenish Level Required",
                        trigger: ["blur", "change"]
                    }],
                    DecisionNotes: [{
                        required: false,
                        message: "Rejection Notes Required",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            StockItemApproval(Decision){

                let self = this;
                console.log(Decision, self.EditModalInfo.DecisionNotes);
                if(Decision == "Reject" && (self.EditModalInfo.DecisionNotes == undefined || self.EditModalInfo.DecisionNotes == "") ){
                    Swal('Note Required', 'Notes Are Required On Rejection', 'error');
                    return false
                }

                this.$refs.EditModalFormInfoID.validate((validation) => {
                    if(validation){

                        console.log(self.EditModalInfo);
                        
                        axios.post('/api/stores/validate_stock_item_creation', {EditModalInfo: self.EditModalInfo, Decision: Decision}) //EditModalInfo
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Stock Item Approval)', 'error');
                            });

                            $('#StockItemModalEdit').modal('toggle');
                                           
                    }
                })

            },
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        //console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#StockItemModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.EditModalFormInfo.StockItemId = this.EditModalInfo.id;
                        this.editDataLoaded = true;
                        $('#StockItemModalEdit').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/purchase_enquiry/validate_purchase_enquiry_creation', this.ValidationInfo)
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 10000
                        });

                        self.DataTable.draw(null, false );
                        //self.DataTable.draw('full-hold');

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                    });

                    $('#PurchaseEquiryValidationModalEdit').modal('toggle');

                this.rules.DecisionNotes[0].required = false;
                
                

            },
            DecisionReject(){
                let self = this;
                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.PurchaseRequestValidationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/purchase_enquiry/validate_purchase_enquiry_creation', this.ValidationInfo)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                            });

                            $('#PurchaseEquiryValidationModalEdit').modal('toggle');

                        this.rules.DecisionNotes[0].required = false;

                        

                    }
                })
            },
            // DecisionSelection(value){
            //     if(value == "Rejected"){
            //         this.rules.DecisionNotes[0].required = true;
            //     } else {
            //         this.rules.DecisionNotes[0].required = false;
            //     }
            // },
            // PurchaseEnquiryDecision(){

            //     this.$refs.PurchaseRequestValidationForm.validate((validation) => {
            //         if(validation){
            //             console.log(this.ValidationInfo);
            //             axios.post('/api/purchase_enquiry/validate_purchase_enquiry_creation', this.ValidationInfo)
            //                 .then(function(response){
            //                     Swal({ 
            //                         type: response.data.messageType, 
            //                         title: response.data.messageTitle, 
            //                         text: response.data.message,
            //                         showConfirmButton: true,
            //                         timer: 10000
            //                     });
            //                 })
            //                 .catch(function(){
            //                     Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
            //                 });

            //                 $('#PurchaseEquiryValidationModalEdit').modal('toggle');

            //             this.$nextTick(() => {
            //                 this.DataTable.draw('full-hold');
            //             });

            //             this.rules.DecisionNotes[0].required = false;

                        

            //         }
            //     })
                
            // },
            
        },
        mounted(){

            const table = $('#StockItemApprovalsList').DataTable({
                fixedHeader: {
                    header: true,
                    headerOffset: 117
                },
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_stock_item_approval_list',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'replenish_level', name: 'replenish_level' },
                    { data: 'replenish_quantity', name: 'replenish_quantity' },
                    { data: 'stock_level', name: 'stock_level' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 10 },
                    { responsivePriority: 2, targets: 0 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, 'ASC' ]],
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
                },
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'PEApprovals' },
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
                "rowCallback": function( row, data, index ) {
                    console.log(data.status);
                    if(data.status.indexOf('Created') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Approved') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.08)')
                    } else {
                        $(row).css('background-color', 'rgb(249, 69, 237, 0.1)')
                    }
                } 
            });

            const self = this;

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showViewModal(elquentClass, RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showEditModal(elquentClass, RecordID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>

    .font-500{
        font-weight: 500; 
    }

    #StockItemModalView .modal-dialog {
        min-width:80%;
    }

    #StockItemModalEdit .modal-dialog {
        min-width:80%;
    }

</style>