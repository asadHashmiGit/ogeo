<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>PO Receipt Notes List</h4>
                </div>
                <div class="card-body">
                    <table ref="PORNsList" id="PORNsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>PO #</th>
                                <th>Company Name</th>
                                <th>Total PO Lines Count</th>
                                <th>Partially Recieved Not Approved Lines</th>
                                <th>Partially Recieved Approved Lines</th>
                                <th>Fully Recieved Not Approved Lines</th>
                                <th>Fully Recieved Approved Lines</th>
                                <th>Cancelled PO Lines</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="PurchaseOrderValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderValidationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ ViewModalInfo[0][0]['purchase_order'].purchase_order_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="POViewDetailsTable" id="POViewDetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>RN #</th>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Advanced %</th>
                                                <th>Rentention %</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th style="min-width: 250px">Receivings</th>
                                                <th>Last Update</th>
                                                <th style="min-width: 100px">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(RNLine, index) in ViewModalInfo[0]">
                                                <td>{{ RNLine.receipt_note_group_id  }} - {{ RNLine.receipt_note_ingroup_id  }}</td>
                                                <td v-if="RNLine.purchase_enquiry.item_id" style="min-width: 150px;">{{ RNLine.purchase_enquiry.item.description }}</td>
                                                <td v-else style="min-width: 500px;">{{ RNLine.purchase_enquiry.service_description }}</td>

                                                <td>{{ RNLine.purchase_enquiry.quantity }}</td>
                                                <td>{{ RNLine.quotation_reponse.unit_rate }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td>{{ parseFloat(RNLine.quotation_reponse.unit_rate) * parseFloat(RNLine.purchase_enquiry.quantity) }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td>{{ RNLine.quotation_reponse.advanced_percentage }}% </td>
                                                <td>{{ RNLine.purchase_enquiry.retention_percentage }}% </td>
                                                <td style="min-width: 150px">
                                                    Lead Days: {{ RNLine.quotation_reponse.lead_days }} Days
                                                </td>
                                                <td style="min-width: 250px">

                                                    <div v-for="(ReceivingLine, index) in RNLine.receiving_records">
                                                        <span><b>ID:</b> {{ (index + 1) }}</span><br>
                                                        <span><b>Received Qty:</b> {{ ReceivingLine.received_quantity }}</span><br>
                                                        <span><b>Received Value Of:</b> {{ ReceivingLine.value_of_received_quantity }}</span><br>
                                                        <span><b>Received at:</b> {{ ReceivingLine.created_at }}</span><br>
                                                        <span ><b>Receiving Notes:</b> <span v-if="ReceivingLine.note"> {{ ReceivingLine.note }} </span></span><br>
                                                        <span><b>Status:</b> {{ ReceivingLine.status }}</span>
                                                        <hr v-if="(index + 1) < RNLine.receiving_records.length">
                                                    </div>
                                                </td>
                                                <td>{{ RNLine.updated_at }}</td>
                                                <td style="min-width: 100px">{{ RNLine.status }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                     
                    </div>
                </div>
            </div>
        </div>

        <div id="PurchaseOrderValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="editDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ EditModalInfo[0][0]['purchase_order'].purchase_order_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="PODetailsTable" id="PODetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>RN #</th>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Requested Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Advanced %</th>
                                                <th>Retention %</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th style="min-width: 250px">Receivings</th>
                                                <th>Last Update</th>
                                                <th style="min-width: 100px">Status</th>
                                                <th>Requested Quantity</th>
                                                <th>Received Quantity</th>
                                                <th>Pending Quantity</th>
                                                <th style="min-width: 150px">Receiving Updates</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(RNLine, index) in EditModalInfo[0]">
                                                <td>{{ RNLine.receipt_note_group_id  }} - {{ RNLine.receipt_note_ingroup_id  }}</td>
                                                <td v-if="RNLine.purchase_enquiry.item_id" style="min-width: 150px;">{{ RNLine.purchase_enquiry.item.description }}</td>
                                                <td v-else style="min-width: 500px;">{{ RNLine.purchase_enquiry.service_description }}</td>
                                                <td>{{ RNLine.purchase_enquiry.quantity }}</td>
                                                <td>{{ RNLine.quotation_reponse.unit_rate }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td>{{ parseFloat(RNLine.quotation_reponse.unit_rate) * parseFloat(RNLine.purchase_enquiry.quantity) }} {{ RNLine.quotation_reponse.currency }}</td>
                                                
                                                <td>{{ RNLine.quotation_reponse.advanced_percentage }}% </td>
                                                <td>{{ RNLine.purchase_enquiry.retention_percentage }}% </td>
                                                <td style="min-width: 150px">
                                                    Lead Days: {{ RNLine.quotation_reponse.lead_days }} Days
                                                </td>
                                                <td style="min-width: 250px">

                                                    <div v-for="(ReceivingLine, index) in RNLine.receiving_records">
                                                        <span><b>ID:</b> {{ (index + 1) }}</span><br>
                                                        <span><b>Received Qty:</b> {{ ReceivingLine.received_quantity }}</span><br>
                                                        <span><b>Received Value Of:</b> {{ ReceivingLine.value_of_received_quantity }}</span><br>
                                                        <span><b>Received at:</b> {{ ReceivingLine.created_at }}</span><br>
                                                        <span ><b>Receiving Notes:</b> <span v-if="ReceivingLine.note"> {{ ReceivingLine.note }} </span></span><br>
                                                        <span><b>Status:</b> {{ ReceivingLine.status }}</span>
                                                        <hr v-if="(index + 1) < RNLine.receiving_records.length">
                                                    </div>
                                                </td>
                                                <td>{{ RNLine.updated_at }}</td>
                                                <td style="min-width: 100px">{{ RNLine.status }}</td>
                                                <td>{{ RNLine.purchase_enquiry.quantity }}</td>
                                                <td>{{ EditModalInfo['ReceivedQuantity'][index] }}</td>
                                                <td>{{ EditModalInfo['PendingQuantity'][index] }}</td>

                                                <td style="min-width: 150px">
                                                    <template v-if="EditModalInfo['PendingQuantity'][index] != 0">
                                                        <!-- Check If We Have Previous Receivings -->
                                                        <template v-if="RNLine.receiving_records.length">
                                                            <input :disabled=" RNLine.status == 'PO Line Cancelled'" :id="'RNLine_'+RNLine.id+'_ReceivedQuantity'" type="number" class="form-control" placeholder="Enter Quantity" @change="CheckMaxQuantity(RNLine.id, EditModalInfo['PendingQuantity'][index] )"><br>
                                                            <el-input
                                                               :disabled=" RNLine.status == 'PO Line Cancelled'"
                                                               :id="'RNLine_'+RNLine.id+'_Receiving_Notes'"
                                                               style="min-width: 100%; font-size:12px"
                                                               type="textarea"
                                                               class="m-t-5"
                                                               rows="3"
                                                               placeholder="Receiving Notes">
                                                            </el-input><br>
                                                            <button :disabled=" RNLine.status == 'PO Line Cancelled'" :id="'RNLine_'+RNLine.id+'_ReceivedQuantitySubmit'" type="button" class="btn btn-block btn-success m-t-5" @click="SubmitLineReceiving(RNLine.id, index, RNLine.purchase_enquiry.quantity, EditModalInfo['PendingQuantity'][index], EditModalInfo['ReceivedQuantity'][index] )">Submit</button>
                                                        </template>
                                                        <template v-else>
                                                            <!-- We are here because no previous receivings -->
                                                            <input :disabled=" RNLine.status == 'PO Line Cancelled'" :id="'RNLine_'+RNLine.id+'_ReceivedQuantity'" type="number" class="form-control" :max="RNLine.purchase_enquiry.quantity" placeholder="Enter Quantity" @change="CheckMaxQuantity(RNLine.id, RNLine.purchase_enquiry.quantity)" ><br>
                                                            <el-input
                                                               :id="'RNLine_'+RNLine.id+'_Receiving_Notes'"
                                                               :disabled=" RNLine.status == 'PO Line Cancelled'"
                                                               style="min-width: 100%; font-size:12px"
                                                               type="textarea"
                                                               class="m-t-5"
                                                               rows="3"
                                                               placeholder="Receiving Notes">
                                                            </el-input><br>
                                                            <button :disabled=" RNLine.status == 'PO Line Cancelled'" :id="'RNLine_'+RNLine.id+'_ReceivedQuantitySubmit'" type="button" class="btn btn-block btn-success m-t-5" @click="SubmitLineReceiving(RNLine.id, index, RNLine.purchase_enquiry.quantity, 0, EditModalInfo['ReceivedQuantity'][index])">Submit</button>
                                                        </template>
                                                    </template>
                                                    <template v-else>
                                                        <input type="number" class="form-control" placeholder="Fully Received" disabled="disabled">
                                                    </template>
                                                </td>
                                            </tr>
                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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
                RNLinesTable: "",
                editDataLoaded: false,
                EditModalInfo: {},
                viewDataLoaded: false,
                ViewModalInfo: {},
            }
        },
        methods: {
            CheckMaxQuantity(RNLineId, MaxQuantity){
                if($('#RNLine_'+RNLineId+'_ReceivedQuantity').val() > MaxQuantity){
                    Swal('Check Entered Quantity', 'The Maximum Receieved Quantity Cannot Exceed Qty: ('+MaxQuantity+')', 'warning');
                    $('#RNLine_'+RNLineId+'_ReceivedQuantity').val(MaxQuantity);
                }
            },
            SubmitLineReceiving(RNLineId, RowIndex, OriginalRequestedQty, CurrentPendingQty, CurrentReceivedQuantity){
                let self = this;
                let ReceivedQuantity = parseFloat($('#RNLine_'+RNLineId+'_ReceivedQuantity').val());
                let ReceivingNotes = $('#RNLine_'+RNLineId+'_Receiving_Notes').val();
                let NewStatus = "";
                console.log(RNLineId, RowIndex, OriginalRequestedQty, CurrentPendingQty, ReceivedQuantity);

                if(isNaN(ReceivedQuantity) || ReceivedQuantity == 0){
                    Swal('Zero Receiving is Not Allowed', 'Zero Receiving is Not Allowed Please Enter Some Quantity', 'warning');
                    return false;
                }
                
                if(!isNaN(ReceivedQuantity) && ReceivedQuantity !== 0){
                    let NewPendingQty = Math.abs(OriginalRequestedQty - CurrentReceivedQuantity - ReceivedQuantity);
                    let NewRecievedQty = CurrentReceivedQuantity + ReceivedQuantity;

                    if(NewPendingQty == 0){
                        NewStatus = "Fully Received Not Approved";
                    } else {
                        NewStatus = "Partially Received Not Approved";
                    }

                    Swal({
                      title: 'Confirm Qty of ('+ ReceivedQuantity +') Received?',
                      type: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Confirm',
                      cancelButtonText: 'Cancel'
                    }).then((result) => {

                        if (result.value) {

                            var table = this.RNLinesTable;
                            var row = table.row(RowIndex).node();
                            table.cell({row: RowIndex, column: 10}).data(NewStatus); //Status
                            table.cell({row: RowIndex, column: 12}).data(NewRecievedQty); //Received Qty
                            table.cell({row: RowIndex, column: 13}).data(NewPendingQty); //Pending Qty
                            $('#RNLine_'+RNLineId+'_ReceivedQuantity').attr('disabled', 'disabled');
                            $('#RNLine_'+RNLineId+'_ReceivedQuantitySubmit').removeClass('btn-success').addClass('btn-default').attr('disabled', 'disabled');
                            $('#RNLine_'+RNLineId+'_Receiving_Notes').attr('disabled', 'disabled');

                            // We are here after agreeing to submit some empty prices
                            axios.post('/api/receipt_notes_management/rn_line_receiving', {RNLineId: RNLineId, ReceivedQuantity: ReceivedQuantity, NewStatus: NewStatus, NewPendingQty: NewPendingQty, ReceivingNotes: ReceivingNotes })
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
                                .catch(function(){
                                    Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (New Receiving Batch Error)', 'error');
                                });
                        }
                        
                    });
                }
            },
            showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_po_rns_details', {POId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#PurchaseOrderValidationModalView').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#POViewDetailsTable').DataTable({
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 10,
                                columnDefs: [
                                    { width: "300px" }
                                ],
                                lengthMenu: [
                                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                                ],
                                order: [[ 0, "ASC" ]],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            });

                        });

                        

                    })

                this.viewDataLoaded = false;

            },
            showEditModal(recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_po_rns_details', {POId: recordId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#PurchaseOrderValidationModalEdit').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#PODetailsTable').DataTable({
                                fixedHeader: {
                                    header: true,
                                    headerOffset: 50
                                },
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 10,
                                columnDefs: [
                                    { width: "300px" }
                                ],
                                lengthMenu: [
                                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                                ],
                                order: [[ 0, "ASC" ]],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            });

                            const self = this;

                            self.RNLinesTable = table;

                        });

                        

                    })

                this.editDataLoaded = false;
            }

        },
        mounted(){

            const table = $('#PORNsList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_po_rns_list',
                columns: [
                    { data: 'purchase_order_group_id', name: 'purchase_order_group_id' },
                    { data: 'company.name', name: 'company.name' },
                    { data: 'total_po_lines_count', name: 'total_po_lines_count' },
                    { data: 'partially_received_not_approved_lines_count', name: 'partially_received_not_approved_lines_count' },
                    { data: 'partially_received_approved_lines_count', name: 'partially_received_approved_lines_count' },
                    { data: 'fully_received_not_approved_lines_count', name: 'fully_received_not_approved_lines_count' },
                    { data: 'fully_received_approved_lines_count', name: 'fully_received_approved_lines_count' },
                    { data: 'canceled_po_lines_count', name: 'canceled_po_lines_count' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 0 },
                    { responsivePriority: 2, targets: 5 },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'POReceivingList' },
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
                    if(data.status.indexOf('Approvals Fully Completed') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Accepted By Vendor') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.1)')
                    } else {
                        $(row).css('background-color', 'rgb(147, 111, 237, 0.1)');                    
                    }
                } 
            });

            const self = this;

            $('tbody', this.$refs.PORNsList).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.PORNsList).on('click', '.edit-placeholder', function(){
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

    #PurchaseOrderValidationModalEdit .modal-dialog {
        min-width:90%;
    }

    #PurchaseOrderValidationModalView .modal-dialog {
        min-width:90%;
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>