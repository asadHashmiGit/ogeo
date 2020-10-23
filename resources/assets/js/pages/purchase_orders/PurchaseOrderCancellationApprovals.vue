<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Order Line Cancellation Request List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="ProjectPOList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Set-up Name</th>
                                <th>PO #</th>
                                <th>PO Line #</th>
                                <th>Request ID</th>
                                <th>Requested Quantity</th>
                                <th>Total Received Quantity</th>
                                <th>Total Pending Quantity</th>
                                <th>Total Invoiced Amount</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th> 
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="PurchaseOrderUpdateModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderUpdateModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ ViewModalInfo.purchase_order.purchase_order_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <td>PO-{{ ViewModalInfo.receipt_note_group_id }}-{{ ViewModalInfo.receipt_note_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <td>PO-{{ ViewModalInfo.receipt_note_group_id }}-{{ ViewModalInfo.receipt_note_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Quantity </b></td>
                                        <td>{{ ViewModalInfo.purchase_enquiry.quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received Quantity </b></td>
                                        <td>{{ ViewModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Pending Quantity </b></td>
                                        <td>{{ ViewModalInfo.purchase_enquiry.quantity - ViewModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                        
  

                        <div v-for="(CancellationRequest, index) in ViewModalInfo.cancellation_requests"  class="col-lg-12">
                            <hr> 
                            <h3>History of Cancellation Request# {{ index + 1 }}</h3>   
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
                                    <tr v-for="(item, key) in CancellationRequest.history" :key="item.id">
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


        <div id="PurchaseOrderUpdateModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderUpdateModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ EditModalInfo.purchase_order.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <td>PO-{{ EditModalInfo.receipt_note_group_id }}-{{ EditModalInfo.receipt_note_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <td>PO-{{ EditModalInfo.receipt_note_group_id }}-{{ EditModalInfo.receipt_note_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Quantity </b></td>
                                        <td>{{ EditModalInfo.purchase_enquiry.quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received Quantity </b></td>
                                        <td>{{ EditModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Pending Quantity </b></td>
                                        <td>{{ EditModalInfo.purchase_enquiry.quantity - EditModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                        <el-form :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="ReceiptNoteCancellationForm">
                            <div class="row">
                                <div class="col-lg-12">
                                    
                                    <!-- <div class="col-lg-12">
                                        <div class="grid-content">
                                            <el-form-item label="Approve Or Reject Request" prop="Decision">
                                                <el-select @change="DecisionSelection" style="width: 100%; padding: 0px;" v-model="ValidationInfo.Decision" placeholder="Select Yes/No">
                                                      <el-option label="Approve" value="Approved"></el-option>
                                                      <el-option label="Reject" value="Rejected"></el-option>
                                                </el-select>
                                            </el-form-item>
                                        </div> 
                                    </div> -->

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

                                    <!-- <div class="col-lg-12">
                                        <button type="button" @click="PurchaseEnquiryDecision" class="btn btn-primary btn-block waves-effect">Submit Decision</button>
                                    </div> -->
                                        
                                    
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
        name: 'purchase-enquiry-list',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {
                    purchase_order: '',
                },
                EditModalInfo: {
                    purchase_order: '',
                },
                ValidationInfo: {
                    ReceiptNoteID: "",
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
                        trigger: ["blur"]
                    }],
                },
            }
        },
        methods: {
            showViewModal(elquentClass, recordId, ReceiptNoteID){
                this.ViewModalInfo = {
                    purchase_order: '',
                };
                axios.post('/api/data/get_po_cancellation_request_details', [elquentClass, recordId, ReceiptNoteID])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        // console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#PurchaseOrderUpdateModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId, ReceiptNoteID){
                this.EditModalInfo = {
                    purchase_order: '',
                };
                axios.post('/api/data/get_po_cancellation_request_details', [elquentClass, recordId, ReceiptNoteID])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.ValidationInfo.ReceiptNoteID = this.EditModalInfo.id;

                        this.editDataLoaded = true;
                        $('#PurchaseOrderUpdateModalEdit').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/receipt_notes_management/validate_po_cancellation_request', this.ValidationInfo)
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 10000
                        });

                        self.DataTable.draw(null, false );

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Order Cancellation Request Approval)', 'error');
                    });

                    $('#PurchaseOrderUpdateModalEdit').modal('toggle');

                this.rules.DecisionNotes[0].required = false;
                
                

            },
            DecisionReject(){
                let self = this;
                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.ReceiptNoteCancellationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/receipt_notes_management/validate_po_cancellation_request', this.ValidationInfo)
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
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Order Cancellation Request Approval)', 'error');
                            });

                            $('#PurchaseOrderUpdateModalEdit').modal('toggle');

                        this.rules.DecisionNotes[0].required = false;

                        

                    }
                })
            },
        },
        mounted(){

            const table = $('#ProjectPOList').DataTable({
                fixedHeader: {
                    header: true,
                    headerOffset: 117
                },
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_po_cancellation_request_list',
                columns: [
                    { data: 'project.title', name: 'project.title' },
                    { data: 'purchase_order.purchase_order_group_id', name: 'purchase_order.purchase_order_group_id' },
                    { data: 'show_id', name: 'show_id' },
                    { data: 'id', name: 'id' },
                    { data: 'receipt_note.purchase_enquiry.quantity', name: 'receipt_note.purchase_enquiry.quantity' },
                    { data: 'total_received_quantity', name: 'total_received_quantity' },
                    { data: 'total_pending_quantity', name: 'total_pending_quantity' },
                    { data: 'total_invoiced_quantity', name: 'total_invoiced_quantity' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 1 },
                    { responsivePriority: 2, targets: 8 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 1, 'ASC' ]],
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
                    // console.log(data.status);
                    if(data.status.indexOf('Created and Assigned to') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('sent for sourcing') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected by ') !== -1) {
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
                var ReceiptNoteID = $(this).data('receiptnoteid');
                self.showViewModal(elquentClass, RecordID, ReceiptNoteID);
            });

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                var ReceiptNoteID = $(this).data('receiptnoteid');
                self.showEditModal(elquentClass, RecordID, ReceiptNoteID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>

    .font-500{
        font-weight: 500;
    }

    #PurchaseOrderUpdateModalView .modal-dialog {
        min-width:80%;
    }

    #PurchaseOrderUpdateModalEdit .modal-dialog {
        min-width:80%;
    }

</style>