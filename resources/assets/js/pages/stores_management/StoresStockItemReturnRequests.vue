<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item Return Request Approvals List</h4>
                </div>
                <div class="card-body">
                    <table ref="StockItemReturnRequestApprovals" id="StockItemReturnRequestApprovals" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Request #</th>
                                <th>Created By</th>
                                <th>From Store</th>
                                <th>Stock Item ID</th>
                                <th>Item Description</th>
                                <th>Returned Quantity</th>
                                <th>Return To Store</th>
                                <th>Requested At</th>
                                <th>Current Approval Level</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="StoreItemReturnRequestValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StoreItemReturnRequestValidationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Return Request#: {{ ViewModalInfo.stock_item_return_request_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Return Request#:</b></td>
                                        <td>{{ ViewModalInfo.stock_item_return_request_group_id }}</td>
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
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td><b>From Store: </b></td>
                                        <td>{{ ViewModalInfo.stock_item_issue_request.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Stock Item ID: </b></td>
                                        <td>{{ ViewModalInfo.stock_item_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Description: </b></td>
                                        <td>{{ ViewModalInfo.stock_item_issue_request.stock_item.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Returned Quantity: </b></td>
                                        <td>{{ ViewModalInfo.returned_quantity }}</td>
                                    </tr>
                                </table>
                            </div>

                        </div>

                        
                        <div class="col-lg-12">
                            <hr> 
                        </div>

                        <div class="col-lg-12">
                            <h3>Approvals History:</h3>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Action Description</th>
                                        <th>Action By</th>
                                        <th>Next Action By</th>
                                        <th>Current Approval Level</th>
                                        <th>Next Approval Level</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ item.description }}</td>
                                        <td>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.next_action_owners }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td>{{ item.next_approval_level }}</td>
                                        <td>{{ item.decision }}</td>
                                        <td>{{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                    </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="StoreItemReturnRequestValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StoreItemReturnRequestValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Return Request#: {{ EditModalInfo.stock_item_return_request_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Return Request#:</b></td>
                                        <td>{{ EditModalInfo.stock_item_return_request_group_id }}</td>
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
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ EditModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td><b>From Store: </b></td>
                                        <td>{{ EditModalInfo.stock_item_issue_request.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Stock Item ID: </b></td>
                                        <td>{{ EditModalInfo.stock_item_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Description: </b></td>
                                        <td>{{ EditModalInfo.stock_item_issue_request.stock_item.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Returned Quantity: </b></td>
                                        <td>{{ EditModalInfo.returned_quantity }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <el-form :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="StockItemReturnRequestValidationForm">
                            <div class="row">
                                <div class="col-lg-12">
                                    
                                    <div class="col-lg-12">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Decision Notes" prop="DecisionNotes">
                                                <el-input
                                                  type="textarea"
                                                  :rows="5"
                                                  placeholder="Enter Decision Notes"
                                                  v-model="ValidationInfo.DecisionNotes">
                                                </el-input>
                                            </el-form-item>
                                        </div> 
                                    </div>

                                    <div class="col-lg-6 float-right">
                                        <button type="button" @click="DecisionApprove" class="btn btn-block btn-success waves-effect">Approve</button>
                                    </div>

                                    <div class="col-lg-6 float-left">
                                        <button type="button" @click="DecisionReject" class="btn btn-block btn-danger waves-effect">Reject</button>
                                    </div>
                                        
                                    
                                </div>
                            </div>
                        </el-form>             
                    </div>
                </div>
            </div>
        </div>


    </div>
            
</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'stock-item-issuance-approval-list',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                IssuedQuantity: 0,
                PendingQuantity: 0,
                ViewModalInfo: {},
                EditModalInfo: {},
                ValidationInfo: {
                    ReturnRequestID: "",
                    Decision: "",
                    DecisionNotes: "",
                },
                rules: {
                    Decision: [{
                        required: true,
                        message: "Please select a approve or reject",
                        trigger: "blur"
                    }],
                    DecisionNotes: [{
                        required: false,
                        message: "Decision Notes are required in case of rejection.",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_stock_item_return_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true;
                        $('#StoreItemReturnRequestValidationModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId){
                let self = this;
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                axios.post('/api/data/get_stock_item_return_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.ValidationInfo.ReturnRequestID = this.EditModalInfo.id;
                        this.editDataLoaded = true;
                        $('#StoreItemReturnRequestValidationModalEdit').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/stores/accept_stock_item_return_request', this.ValidationInfo)
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

                    $('#StoreItemReturnRequestValidationModalEdit').modal('toggle');

                this.rules.DecisionNotes[0].required = false;
                
            },
            DecisionReject(){
                let self = this;
                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.StockItemReturnRequestValidationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/stores/accept_stock_item_return_request', this.ValidationInfo)
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

                            $('#StoreItemReturnRequestValidationModalEdit').modal('toggle');

                        this.rules.DecisionNotes[0].required = false;

                        

                    }
                })
            },
        },
        mounted(){

            const table = $('#StockItemReturnRequestApprovals').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_stock_item_issue_request_list_for_returning',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'stock_item_issue_request.project.title', name: 'stock_item_issue_request.project.title' },
                    { data: 'stock_item_id', name: 'stock_item_id' },
                    { data: 'stock_item_issue_request.stock_item.item.description', name: 'stock_item_issue_request.stock_item.item.description' },
                    { data: 'returned_quantity', name: 'returned_quantity' },
                    { data: 'stock_item_issue_request.project.title', name: 'stock_item_issue_request.project.title' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'approval_level', name: 'approval_level' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 0 },
                    { responsivePriority: 2, targets: 6 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 50,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, 'ASC' ]],
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
                    //console.log(data.status);
                    if(data.status.indexOf('Created Not Approved') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Approvals Fully Completed') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.1)')
                    } else {
                        $(row).css('background-color', 'rgb(147, 111, 237, 0.1)');                    
                    }
                } 
            });

            const self = this;

            $('tbody', this.$refs.StockItemReturnRequestApprovals).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.StockItemReturnRequestApprovals).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>
    

    .numberCircle {
        position: relative;
        top: -2px;
        left: 5px;

        line-height:0px;
        display:inline-block;
        
        border-radius:50%;
        border:2px solid;
        
        font-size:10px;
        color: white;
        background-color: #26c6da;
    }

    .numberCircle span {
        display:inline-block;
        
        padding-top:50%;
        padding-bottom:50%;
        
        margin-left:8px;
        margin-right:8px;
    }

    .font-500{
        font-weight: 500;
    }

    #StoreItemReturnRequestValidationModalView .modal-dialog {
        min-width:80%;
    }

    #StoreItemReturnRequestValidationModalEdit .modal-dialog {
        min-width:90%;
    }


    .poline-approved {
        background-color: rgb(69, 249, 132, 0.1);
    }

    .poline-rejected {
        background-color: rgb(249, 69, 72, 0.08);
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>