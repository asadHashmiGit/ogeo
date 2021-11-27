<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Rate Contract Item Requests List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewRateContractItemRequestsApprovals" class="display responsive table table-bordered table-hover" style="width: 100%;" >
                        <thead>
                            <tr>
                                <th>Request #</th>
                                <th>GroupID</th>
                                <th>Created By</th>
                                <th>Requested Item</th>
                                <th>Quantity</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="RateContractItemRequestValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RateContractItemRequestValidationModalView" aria-hidden="true" style="display: none;"> 
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Rate Contract Item Request Number: {{ ViewModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Rate Contract Item Request (ID):</b></td>
                                        <td>RCR-{{ ViewModalInfo.rate_contract_request_group_id }}-{{ ViewModalInfo.rate_contract_request_ingroup_id }}</td>
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
                                        <td style="width: 40%"><b>Item Description:</b></td>
                                        <td>{{ ViewModalInfo.item_description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Expected Consumption Quantity </b></td>
                                        <td>{{ ViewModalInfo.quantity }} ({{ ViewModalInfo.u_o_m }})</td>
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
        </div> -->


        <div id="RateContractItemRequestValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RateContractItemRequestValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Rate Contract Item Request Number: {{ EditModalInfo.rate_contract_request_group_id }}-{{ EditModalInfo.rate_contract_request_ingroup_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Rate Contract Item Request Number (ID):</b></td>
                                        <td>RCR-{{ EditModalInfo.rate_contract_request_group_id }}-{{ EditModalInfo.rate_contract_request_ingroup_id }}</td>
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
                                        <td style="width: 40%"><b>Item Description:</b></td>
                                        <td>{{ EditModalInfo.item_description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Expected Consumption Quantity </b></td>
                                        <td>{{ EditModalInfo.quantity }} ({{ EditModalInfo.u_o_m }})</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>{{ EditModalInfo.rc_start_period }} - {{ EditModalInfo.rc_end_period }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Delivery Location: </b></td>
                                        <td>{{ EditModalInfo.location_name }}</td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                        <el-form :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="RateContractItemRequestValidationForm">
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
    //import {CustomJs} from '../../helpers/custom.js';
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
                    RCItemRequestId: "",
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
                        message: "Decision notes are required in case of rejection.",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_rate_contract_requests_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        //this.ViewModalInfo.required_documents_split = this.ViewModalInfo.required_documents.split(",");
                        //console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#RateContractItemRequestValidationModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                console.log('edit modal changes');
                axios.post('/api/data/get_rate_contract_requests_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.ValidationInfo.RCItemRequestId = this.EditModalInfo.id;
                       // this.EditModalInfo.required_documents_split = this.EditModalInfo.required_documents.split(",");
                        this.editDataLoaded = true;
                        $('#RateContractItemRequestValidationModalEdit').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/rate_contracts/validate_rate_contract_item_creation', this.ValidationInfo)
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

                    $('#RateContractItemRequestValidationModalEdit').modal('toggle');

                this.rules.DecisionNotes[0].required = false;

            },
            DecisionReject(){

                let self = this;
                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.RateContractItemRequestValidationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/rate_contracts/validate_rate_contract_item_creation', this.ValidationInfo)
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

                            $('#RateContractItemRequestValidationModalEdit').modal('toggle');

                        this.rules.DecisionNotes[0].required = false;

                    }
                })
            },
        },
        mounted(){
            var groupColumn = 1;
             //$.noConflict();
           //  console.debug('foo2');
             const table = $('#NewRateContractItemRequestsApprovals').DataTable({
                fixedHeader: {
                    header: true,
                    headerOffset: 117
                },
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_rate_contract_item_requests_list',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'rate_contract_request_group_id', name: 'rate_contract_request_group_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'quantity', name: 'quantity' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { visible: false, targets: groupColumn },
                    { responsivePriority: 1, targets: 7 },
                    { responsivePriority: 2, targets: 0 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 8,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ groupColumn, 'ASC' ]],
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
         
                    api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                        if ( last !== group ) {
                            $(rows).eq( i ).before(
                                '<tr class="group"><td colspan="12">Grouping ID: '+group+'</td></tr>'
                            );
         
                            last = group;
                        }
                    } );
                },
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'RateContractRequests' },
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

    #RateContractItemRequestValidationModalView .modal-dialog {
        min-width:80%;
    }

    #RateContractItemRequestValidationModalEdit .modal-dialog {
        min-width:80%;
    }

</style>