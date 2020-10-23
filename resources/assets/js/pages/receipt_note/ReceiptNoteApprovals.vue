<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Receipt Note Approvals List</h4>
                </div>
                <div class="card-body">
                    <table ref="RNReceivingApprovals" id="RNReceivingApprovals" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Receiving Batch #</th>
                                <th>PO #</th>
                                <th>PO Line #</th>
                                <th>Receiving Batch ID</th>
                                <th>Received By</th>
                                <th>Vendor Name</th>
                                <th>Requested Qty</th>
                                <th>Advanced %</th>
                                <th>Retention %</th>
                                <th>Unit Rate</th>
                                <th>Received Qty</th>
                                <th>Receiving Value At Advanced</th>
                                <th>Retention Value</th>
                                <th>Approval Level</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="ReceivingModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ReceivingModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Receiving Batch ID: {{ ViewModalInfo.rn_receiving_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Receiving Batch ID: (ID):</b></td>
                                        <td>{{ ViewModalInfo.id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received By: </b></td>
                                        <td>{{ ViewModalInfo.receiver.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received Date: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.current_approval_level }}</td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Received Qty:</b></td>
                                        <td>{{ ViewModalInfo.received_quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40%"><b>Unit Rate:</b></td>
                                        <td>{{ ViewModalInfo.receipt_note.quotation_reponse.unit_rate }} {{ ViewModalInfo.receipt_note.quotation_reponse.currency }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Value of Received Qty: </b></td>
                                        <td>{{ ViewModalInfo.value_of_received_quantity }} {{ ViewModalInfo.receipt_note.quotation_reponse.currency }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Quantity To Complete: </b></td>
                                        <td>{{ ViewModalInfo.quantity_to_complete_receiving }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Receiveing Notes: </b></td>
                                        <td>{{ ViewModalInfo.note }}</td>
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



        <div id="ReceivingApprovalModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ReceivingApprovalModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Receiving Batch Number: {{ EditModalInfo.rn_receiving_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Receiving Batch ID: (ID):</b></td>
                                        <td>{{ EditModalInfo.id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received By: </b></td>
                                        <td>{{ EditModalInfo.receiver.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Received Date: </b></td>
                                        <td>{{ EditModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ EditModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ EditModalInfo.current_approval_level }}</td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Received Qty:</b></td>
                                        <td>{{ EditModalInfo.received_quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40%"><b>Unit Rate:</b></td>
                                        <td>{{ EditModalInfo.receipt_note.quotation_reponse.unit_rate }} {{ EditModalInfo.receipt_note.quotation_reponse.currency }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Value of Received Qty: </b></td>
                                        <td>{{ EditModalInfo.value_of_received_quantity }} {{ EditModalInfo.receipt_note.quotation_reponse.currency }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Quantity To Complete: </b></td>
                                        <td>{{ EditModalInfo.quantity_to_complete_receiving }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Receiveing Notes: </b></td>
                                        <td>{{ EditModalInfo.note }}</td>
                                    </tr>
                                    
                                    
                                    
                                </table>
                            </div>
                        </div>
                        <el-form :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="ReceiptNoteValidationForm">
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
        name: 'purchase-enquiry-list',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                ValidationInfo: {
                    RNReceivingId: "",
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
            showViewModal(ReceivingId){
                this.ViewModalInfo = {};
                axios.post('/api/data/receiving_details_for_approval', {ReceivingId: ReceivingId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#ReceivingModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(ReceivingId){
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                axios.post('/api/data/receiving_details_for_approval', {ReceivingId: ReceivingId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.ValidationInfo.RNReceivingId = this.EditModalInfo.id;
                        this.editDataLoaded = true;
                        $('#ReceivingApprovalModal').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/receipt_notes_management/validate_receipt_note_creation', this.ValidationInfo)
                    .then(function(response){

                        self.DataTable.ajax.reload( null, false );
                        self.rules.DecisionNotes[0].required = false;

                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 10000
                        });

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ReceivingDecision)', 'error');
                    });

                    $('#ReceivingApprovalModal').modal('toggle');


                


            },
            DecisionReject(){
                let self = this;
                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.ReceiptNoteValidationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/receipt_notes_management/validate_receipt_note_creation', this.ValidationInfo)
                            .then(function(response){

                                self.DataTable.ajax.reload( null, false );
                                self.rules.DecisionNotes[0].required = false;

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });
                                
                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                            });

                            $('#ReceivingApprovalModal').modal('toggle');

                        // this.$nextTick(() => {
                        //     this.DataTable.draw('full-hold');
                        // });

                    }
                })
            },
        },
        mounted(){

            const table = $('#RNReceivingApprovals').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_po_rns_approval_list',
                columns: [
                    { data: 'rn_receiving_group_id', name: 'rn_receiving_group_id' },
                    { data: 'receipt_note.purchase_order.id', name: 'receipt_note.purchase_order.id' },
                    { data: 'po_line_id', name: 'po_line_id' },
                    { data: 'id', name: 'id' },
                    { data: 'receiver.name', name: 'receiver.name' },
                    { data: 'receipt_note.vendor.name', name: 'receipt_note.vendor.name' },
                    { data: 'receipt_note.purchase_enquiry.quantity', name: 'receipt_note.purchase_enquiry.quantity' },
                    { data: 'receipt_note.quotation_reponse.advanced_percentage', name: 'receipt_note.quotation_reponse.advanced_percentage' },
                    { data: 'receipt_note.purchase_enquiry.retention_percentage', name: 'receipt_note.purchase_enquiry.retention_percentage' },
                    { data: 'receipt_note.quotation_reponse.unit_rate', name: 'receipt_note.quotation_reponse.unit_rate' },
                    { data: 'received_quantity', name: 'received_quantity' },
                    { data: 'value_of_received_quantity', name: 'value_of_received_quantity' },
                    { data: 'receiving_rentention_amount', name: 'receiving_rentention_amount' },
                    { data: 'current_approval_level', name: 'current_approval_level' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 0 },
                    { responsivePriority: 2, targets: 14 },
                    {
                        targets: 6,
                        render: function ( data, type, row ) {
                            return data +'%';
                        },
                    },
                    {
                        targets: 7,
                        render: function ( data, type, row ) {
                            return data +'%';
                        },
                    },
                    {
                        targets: 10,
                        render: function ( data, type, row ) {
                            return data +' '+row['receipt_note']['quotation_reponse']['currency'];
                        },
                    },
                    {
                        targets: 11,
                        render: function ( data, type, row ) {
                            return data +' '+row['receipt_note']['quotation_reponse']['currency'];
                        },
                    }
                    
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 100,
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
                    console.log(data.status);
                    if(data.status.indexOf('Received Not Approved') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Final Approval - ') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.1)')
                    } else {
                        $(row).css('background-color', 'rgb(147, 111, 237, 0.1)');                    
                    }
                } 
            });

            const self = this;

            $('tbody', this.$refs.RNReceivingApprovals).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.RNReceivingApprovals).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped="scoped">

    #ReceivingModalView .modal-dialog {
        min-width:80%;
    }

    #ReceivingApprovalModal .modal-dialog {
        min-width:90%;
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>