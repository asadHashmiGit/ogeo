<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Order Receiving List</h4>
                </div>
                <div class="card-body">
                	<table ref="VendorPORNsList" id="VendorPORNsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>PO #</th>
                                <th>Company Name</th>
                                <th>PO Lines Count</th>
                                <th>Partially Recieved Not Approved Lines</th>
                                <th>Partially Recieved Approved Lines</th>
                                <th>Fully Recieved Not Approved Lines</th>
                                <th>Fully Recieved Approved Lines</th>
                                <th style="min-width: 75px">Action</th>
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
                                                <th>Received Qty</th>
                                                <th>Pending Qty</th>
                                                <th>Advanced %</th>
                                                <th>Retention %</th>
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
                                                <td>{{ ViewModalInfo['ReceivedQuantity'][index] }} </td>
                                                <td>{{ ViewModalInfo['PendingQuantity'][index] }} </td>
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
	                                                    <span ><b>Receiving Notes:</b> <span v-if="ReceivingLine.note"> {{ ReceivingLine.note }} </span></span>
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
                                                <th>Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Received Qty</th>
                                                <th>Pending Qty</th>
                                                <th>Advanced %</th>
                                                <th>Retention %</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th style="min-width: 250px">Receivings</th>
                                                <th>Last Update</th>
                                                <th style="min-width: 100px">Status</th>
                                                <th style="min-width: 150px">Update Status</th>
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
                                                <td>{{ EditModalInfo['ReceivedQuantity'][index] }} </td>
                                                <td>{{ EditModalInfo['PendingQuantity'][index] }} </td>
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
	                                                    <span ><b>Receiving Notes:</b> <span v-if="ReceivingLine.note"> {{ ReceivingLine.note }} </span></span>
	                                                    <hr v-if="(index + 1) < RNLine.receiving_records.length">
	                                                </div>
                                                </td>
                                                <td>{{ RNLine.updated_at }}</td>
                                                <td style="min-width: 100px">{{ RNLine.status }}</td>
                                                <td v-if="RNLine.status != 'PO Line Cancelled'" style="min-width: 150px">
                                                	<template v-if="EditModalInfo['PendingQuantity'][index] != 0">
	                                                	<select :id="'RNLine_'+RNLine.id+'_Status'" style="width: 100%; padding: 0px;" @change="UpdateRNLineStatus(RNLine.id, index, RNLine.status)"  class="form-control">
	                                                		<option value="" disabled selected>Select New Status:</option>
														    <option v-if="RNLine.status == 'Partially Shipped' || RNLine.status == 'Fully Shipped'" value="Not Yet Shipped">Not Yet Shipped</option>
														    <option v-if="RNLine.status == 'Partially Shipped' || RNLine.status == 'Fully Shipped' || RNLine.status == 'Not Yet Shipped'" value="Partially Shipped">Partially Shipped</option>
														    <option v-if="RNLine.status == 'Partially Shipped' || RNLine.status == 'Fully Shipped' || RNLine.status == 'Not Yet Shipped'" value="Fully Shipped">Fully Shipped</option>
                                                            <option v-if="RNLine.status != 'Partially Shipped' || RNLine.status != 'Fully Shipped' || RNLine.status != 'Not Yet Shipped'" value="Additional Delivery Notification">Additional Delivery Notification</option>
														</select>
													</template>
													<template v-else>
														<select style="width: 100%; padding: 0px;"class="form-control" disabled="disabled">
															<option value="" disabled selected>Fully Received</option>
														</select>
													</template>
												</td>
                                                <td v-else> PO Line Cancelled By Client </td>
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



        <div id="RNLineInvoicing" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RNLineInvoicing" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="invoicingDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Invoicing For Purchase Order Number: {{ InvoicingModalInfo[0][0]['po_id'] }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="POInvoicingDetailsTable" id="POInvoicingDetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>RN #</th>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Delivered Qty</th>
                                                <th>Pending Qty</th>
                                                <th>Advanced %</th>
                                                <th>Retention %</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <!-- <th style="min-width: 250px">Receivings</th> -->
                                                <th>Last Update</th>
                                                <th style="min-width: 100px">RN Status</th>
                                                <th style="min-width: 100px">Total Recieving Amount After Advanced</th>
                                                <th style="min-width: 100px">Total Invoiced Amount</th>
                                                <th style="min-width: 100px">Retention Amount</th>
                                                <th style="min-width: 100px">Invoicable Amount</th>
                                                <th style="min-width: 100px">Invoicing Status</th>
                                                <th style="min-width: 200px">Invoice Submission</th>
                                                <th style="min-width: 150px">Uploaded Documents</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(RNLine, index) in InvoicingModalInfo[0]">
                                                <td>{{ RNLine.receipt_note_group_id  }} - {{ RNLine.receipt_note_ingroup_id  }}</td>
                                                <td v-if="RNLine.purchase_enquiry.item_id" style="min-width: 150px;">{{ RNLine.purchase_enquiry.item.description }}</td>
                                                <td v-else style="min-width: 500px;">{{ RNLine.purchase_enquiry.service_description }}</td>

                                                <td>{{ RNLine.purchase_enquiry.quantity }}</td>
                                                <td>{{ RNLine.quotation_reponse.unit_rate }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td>{{ parseFloat(RNLine.quotation_reponse.unit_rate) * parseFloat(RNLine.purchase_enquiry.quantity) }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td>{{ InvoicingModalInfo['ReceivedQuantity'][index] }} </td>
                                                <td>{{ InvoicingModalInfo['PendingQuantity'][index] }} </td>
                                                <td>{{ RNLine.quotation_reponse.advanced_percentage }}% </td>
                                                <td>{{ RNLine.purchase_enquiry.retention_percentage }}% </td>
                                                <td style="min-width: 150px">
                                                    Lead Days: {{ RNLine.quotation_reponse.lead_days }} Days
                                                </td>
                                                <!-- <td style="min-width: 250px">
                                                    <div v-for="(ReceivingLine, index) in RNLine.receiving_records">
                                                        <span><b>ID:</b> {{ (index + 1) }}</span><br>
                                                        <span><b>Received Qty:</b> {{ ReceivingLine.received_quantity }}</span><br>
                                                        <span><b>Received Value Of:</b> {{ ReceivingLine.value_of_received_quantity }}</span><br>
                                                        <span><b>Received at:</b> {{ ReceivingLine.created_at }}</span><br>
                                                        <span ><b>Receiving Notes:</b> <span v-if="ReceivingLine.note"> {{ ReceivingLine.note }} </span></span>
                                                        <hr v-if="(index + 1) < RNLine.receiving_records.length">
                                                    </div>
                                                </td> -->
                                                <td>{{ RNLine.updated_at }}</td>
                                                <td style="min-width: 100px">{{ RNLine.status }}</td>
                                                <td style="min-width: 100px">{{ InvoicingModalInfo['InvoicableAmount'][index] + InvoicingModalInfo['RetentionAmount'][index] }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td style="min-width: 150px">{{ InvoicingModalInfo['InvoicedAmount'][index] }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td style="min-width: 150px"><b>Amount: </b>{{ InvoicingModalInfo['RetentionAmount'][index] }} {{ RNLine.quotation_reponse.currency }} <br><b>Due On:</b> {{ InvoicingModalInfo['RetentionDueDate'][index] }}</td>
                                                <td style="min-width: 100px">{{ InvoicingModalInfo['InvoicableAmount'][index] - InvoicingModalInfo['InvoicedAmount'][index] }} {{ RNLine.quotation_reponse.currency }}</td>
                                                <td style="min-width: 100px">{{ RNLine.invoicing_status }}</td>

                                                <td v-if="(InvoicingModalInfo['InvoicableAmount'][index] - InvoicingModalInfo['InvoicedAmount'][index] != 0)" style="min-width: 200px">
                                                    <span style="font-size: 12px"><b>Invoice Amount:</b> (<span class="text-primary" style="cursor: pointer;" @click="UpdateInvoiceAmount((InvoicingModalInfo['InvoicableAmount'][index] - InvoicingModalInfo['InvoicedAmount'][index]), RNLine.id)">Max: {{ InvoicingModalInfo['InvoicableAmount'][index] - InvoicingModalInfo['InvoicedAmount'][index] }} {{ RNLine.quotation_reponse.currency }}</span>)</span>
                                                    <input
                                                        class="form-control"
                                                        style="width: 100%;" 
                                                        type="number"
                                                        :min="1"
                                                        :placeholder="'Enter Invoice Amount'"
                                                        :id="'InvoicingQty_'+RNLine.id"
                                                        :ref="'InvoicingQty_'+RNLine.id">
                                                    </input>
                                                    <hr> 
                                                    <span><b>Invoice Upload</b></span>
                                                    <el-upload
                                                        class="upload-demo"
                                                        action="#"
                                                        multiple
                                                        :id="'RequiredFiles_'+RNLine.id"
                                                        :ref="'RequiredFiles_'+RNLine.id"
                                                        :auto-upload="false">
                                                        <el-button slot="trigger" size="small" type="primary">Select file(s)</el-button>
                                                        <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload(RNLine.id, InvoicingModalInfo['InvoicableAmount'][index]  - InvoicingModalInfo['InvoicedAmount'][index])">Submitt</el-button>
                                                        <div class="el-upload__tip" slot="tip">Any File Type Allow Max Size 3MB</div>
                                                    </el-upload>
                                                </td>
                                                <td v-else>
                                                    Invoicable Amount Fully Submitted
                                                </td>

                                                <td style="min-width: 150px" v-if="RNLine.invoices.length">
                                                    <div v-for="(uploadedFile, index) in RNLine.invoices">
                                                        <span><b>Internal ID:</b> {{ uploadedFile.id }}</span><br>
                                                        <span><b>Invoice Amount:</b> {{ uploadedFile.invoice_amount }} {{ RNLine.quotation_reponse.currency }}</span><br>
                                                        <span><b>Status:</b> {{ uploadedFile.status }}</span><br>
                                                        <span><b>Uploaded Files List:</b></span><br>
                                                        <a v-for="(safeName, index) in uploadedFile.document_safe_name.split(',')" align="center" :href="URL+safeName" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> {{ uploadedFile.vendor_doc_name.split(',')[index] }} </a>
                                                        <hr>
                                                    </div>
                                                </td>
                                                <td style="min-width: 150px" valign="middle" align="center" v-else>
                                                    <span>No Files Uploaded Yet</span>
                                                </td>
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

	import validateJs from 'validate.js';

	export default {
		name: "pending-payment",
		data() {
			return {
                URL: '/uploads/VendorInvoicesUpload/',
				DataTable: "",
				RNLinesTable: "",
				editDataLoaded: false,
				EditModalInfo: {},
				viewDataLoaded: false,
				ViewModalInfo: {},
                invoicingDataLoaded: false,
                InvoicingModalInfo: {},
			}
		},
		methods: {
            submitUpload(RNLineId, MaxInvoicableAmount) {

                //check invoice amount
                let InvoiceValue = parseFloat($('#InvoicingQty_'+RNLineId).val());
                
                // check min quantity
                if(InvoiceValue === 0 || InvoiceValue < 0 || isNaN(InvoiceValue)){
                    Swal('Invoice Amount Required', 'You must enter invoice amount to be greater than zero', 'warning');
                // check max quantity
                } else if (InvoiceValue > MaxInvoicableAmount) {
                    Swal('Check Invoiced Amount', 'The amount of the invoice can not exceed '+MaxInvoicableAmount, 'warning');
                } else {

                    let formData = new FormData();

                    if(!this.$refs['RequiredFiles_'+RNLineId][0].uploadFiles[0]){
                        Swal('Document Required', 'You must select at least one document to upload', 'warning')
                        return false;
                    }

                    for(var i = 0; i < this.$refs['RequiredFiles_'+RNLineId][0].uploadFiles.length; i++ ){
                        let file = this.$refs['RequiredFiles_'+RNLineId][0].uploadFiles[i].raw;
                        formData.append('RequiredFiles['+i+']', file);
                    }

                    formData.append('InvoiceValue', JSON.stringify(InvoiceValue));
                    formData.append('MaxInvoicableAmount', JSON.stringify(MaxInvoicableAmount));
                    formData.append('RNLineId', JSON.stringify(RNLineId));
                    formData.append('CompanyId', JSON.stringify(this.InvoicingModalInfo[0][0].company_id));
                    
                    axios.post( '/api/vendors/pos_n_invoicing_management/vendor_invoice_upload', formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        })
                        .then((response) => {

                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });

                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (RequiredFilesUpload)', 'error');
                        });

                    $('#RNLineInvoicing').modal('toggle');

                }

                

                
            },
            UpdateInvoiceAmount(InvoiceAmount, RNLineId){
                $('#InvoicingQty_'+RNLineId).val(InvoiceAmount);
            },
            showInvoicingModal(recordId){
                this.InvoicingModalInfo = {};
                axios.post('/api/vendors/data/get_vendor_po_rns_details', {POId: recordId})
                    .then((response) => {
                        this.InvoicingModalInfo = response.data;
                        console.log(this.InvoicingModalInfo);
                        this.invoicingDataLoaded = true;
                        $('#RNLineInvoicing').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#POInvoicingDetailsTable').DataTable({
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

                this.invoicingDataLoaded = false;

            },
			UpdateRNLineStatus(RNLineId, RowIndex, CurrentStatus){
				
				let NewStatus = $('#RNLine_'+RNLineId+'_Status option:selected').val();

				if(CurrentStatus != NewStatus){

					var table = this.RNLinesTable;
	                var row = table.row(RowIndex).node();
					table.cell({row: RowIndex, column: 8}).data(NewStatus);

                    if(NewStatus == 'Additional Delivery Notification'){
                        Swal({
                          title: 'Send Notification?',
                          text: "This will send an email notification to client about the delivery.",
                          type: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: 'Confirm',
                          cancelButtonText: 'Cancel'
                        }).then((result) => {

                            if (result.value) {

                                // We are here after agreeing to submit some empty prices
                                axios.post('/api/vendors/pos_n_invoicing_management/vendor_shipment_notification', {RNLineId: RNLineId , NewStatus: NewStatus })
                                    .then((response) => {
                                        Swal({ 
                                            type: response.data.messageType, 
                                            title: response.data.messageTitle, 
                                            text: response.data.message,
                                            showConfirmButton: true,
                                            timer: 15000
                                        });
                                        
                                    }); 
                            }
                        });

                    } else {
                        Swal({
                          title: 'Confirm Change Status?',
                          // text: "Text Can Go Here.",
                          type: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: 'Confirm',
                          cancelButtonText: 'Cancel'
                        }).then((result) => {

                            if (result.value) {

                                // We are here after agreeing to submit some empty prices
                                axios.post('/api/vendors/pos_n_invoicing_management/rn_line_change_status', {RNLineId: RNLineId , NewStatus: NewStatus })
                                    .then((response) => {
                                        Swal({ 
                                            type: response.data.messageType, 
                                            title: response.data.messageTitle, 
                                            text: response.data.message,
                                            showConfirmButton: true,
                                            timer: 15000
                                        });
                                        
                                    });
                            }
                        });
                    }	
				}
			},
			showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/vendors/data/get_vendor_po_rns_details', {POId: recordId})
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
                axios.post('/api/vendors/data/get_vendor_po_rns_details', {POId: recordId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#PurchaseOrderValidationModalEdit').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#PODetailsTable').DataTable({
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
			const table = $('#VendorPORNsList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/vendors/data/get_vendor_po_rns_list',
                columns: [
                    { data: 'purchase_order_group_id', name: 'purchase_order_group_id' },
                    { data: 'company.name', name: 'company.name' },
                    { data: 'total_po_lines_count', name: 'total_po_lines_count' },
                    { data: 'partially_received_not_approved_lines_count', name: 'partially_received_not_approved_lines_count' },
                    { data: 'partially_received_approved_lines_count', name: 'partially_received_approved_lines_count' },
                    { data: 'fully_received_not_approved_lines_count', name: 'fully_received_not_approved_lines_count' },
                    { data: 'fully_received_approved_lines_count', name: 'fully_received_approved_lines_count' },
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

            $('tbody', this.$refs.VendorPORNsList).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.VendorPORNsList).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });


            $('tbody', this.$refs.VendorPORNsList).on('click', '.invoice-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showInvoicingModal(RecordID);
            });

            self.DataTable = table;
		}
	}
</script>


<style>

	.numberCircle {
        position: relative;
        top: -45px;
        left: 10px;

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

    #RNLineInvoicing .modal-dialog {
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