<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Order Acceptance List</h4>
                </div>
                <div class="card-body">
                    <table ref="VendorPOsList" id="VendorPOsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>PO #</th>
                                <th>Company Name</th>
                                <th>Total PO Line Count</th>
                                <th>Fully Approved PO Lines</th>
                                <th>Rejected PO Lines</th>
                                <th>Created</th>
                                <th>Last Updated</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="PurchaseOrderValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ EditModalInfo.purchase_order_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="PODetailsTable" id="PODetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Retention Percentage</th>
                                                <th>Currency</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th>Created At</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(PEResponse, index) in EditModalInfo.vendor_responses">

                                                <td v-if="PEResponse.purchase_enquiry.item_id" style="min-width: 150px;">{{ PEResponse.purchase_enquiry.item.description }}</td>
                                                <td v-else style="min-width: 500px;">{{ PEResponse.purchase_enquiry.service_description }}</td>

                                                <td>{{ PEResponse.purchase_enquiry.quantity }}</td>
                                                <td>{{ PEResponse.unit_rate }}</td>
                                                <td>{{ parseFloat(PEResponse.unit_rate) * parseFloat(PEResponse.purchase_enquiry.quantity) }} </td>
                                                <td>{{ PEResponse.purchase_enquiry.retention_percentage }}% </td>
                                                <td>{{ PEResponse.currency }} </td>
                                                <td style="min-width: 150px">
                                                    <span><b>Lead Days:</b> {{ PEResponse.lead_days }} Days</span><br>
                                                    <span><b>Advanced Percentage:</b> {{ PEResponse.advanced_percentage }}%</span><br>
                                                    <span v-if="PEResponse.notes">Vednor Notes: 
                                                        <span>{{ PEResponse.notes }}</span>
                                                    </span>
                                                </td>
                                                <td>{{ EditModalInfo.created_at }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-12">
                            	<hr>
                            	<el-input
                                   :id="'PO_'+EditModalInfo.id+'_Vendor_Decision_Notes'"
                                   style="min-width: 100%"
                                   type="textarea"
                                   rows="3"
                                   placeholder="Decision Notes">
                                </el-input><br><br>
                            	<button @click="RejectPO(EditModalInfo.id)" style="width: 45%" type="button" class="btn btn-danger pull-left">Reject</button> 
                                <button @click="ApprovePO(EditModalInfo.id)" style="width: 45%" type="button" class="btn btn-success pull-right">Approve</button>
                            </div>
                        </div>
                                     
                    </div>
                </div>
            </div>
        </div>

        <div id="PurchaseOrderValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderValidationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ ViewModalInfo.purchase_order_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="POViewDetailsTable" id="POViewDetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Quantity</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Retention Percentage</th>
                                                <th>Currency</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th>Vendor Update</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(PEResponse, index) in ViewModalInfo.vendor_responses">
                                                <td v-if="PEResponse.purchase_enquiry.item_id" style="min-width: 150px;">{{ PEResponse.purchase_enquiry.item.description }}</td>
                                                <td v-else style="min-width: 500px;">{{ PEResponse.purchase_enquiry.service_description }}</td>
                                                
                                                <td>{{ PEResponse.purchase_enquiry.quantity }}</td>
                                                <td>{{ PEResponse.unit_rate }}</td>
                                                <td>{{ parseFloat(PEResponse.unit_rate) * parseFloat(PEResponse.purchase_enquiry.quantity) }} </td>
                                                <td>{{ PEResponse.purchase_enquiry.retention_percentage }}% </td>
                                                <td>{{ PEResponse.currency }} </td>
                                                <td style="min-width: 150px">
                                                    <span><b>Lead Days:</b> {{ PEResponse.lead_days }} Days</span><br>
                                                    <span><b>Advanced Percentage:</b> {{ PEResponse.advanced_percentage }}%</span><br>
                                                    <span v-if="PEResponse.notes">Vednor Notes: 
                                                        <span>{{ PEResponse.notes }}</span>
                                                    </span>
                                                </td>
                                                <td>{{ ViewModalInfo.vendor_approved_at }}</td>
                                                <td>{{ ViewModalInfo.status }}</td>
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
		name: "vendor-pos-management",
		data() {
			return {
				DataTable: "",
				editDataLoaded: false,
				EditModalInfo: {},
				viewDataLoaded: false,
				ViewModalInfo: {},
			}
		},
        computed: {
            
        },
		methods: {
			ApprovePO(POId){
                let self = this;
                axios.post('/api/vendors/pos_n_invoicing_management/po_vendor_approval', {POId: POId, VendorNotes: $('#PO_'+POId+'_Vendor_Decision_Notes').val()})
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });

                            self.DataTable.ajax.reload( null, false );

                        })

                    $('#PurchaseOrderValidationModalEdit').modal('toggle');
                    

			},
			RejectPO(POId){
                let self = this;
				if($('#PO_'+POId+'_Vendor_Decision_Notes').val() == ""){
                    Swal('Notes Required', 'Rejection Require Notes', 'warning');
                } else {

					axios.post('/api/vendors/pos_n_invoicing_management/po_vendor_rejection', {POId: POId, VendorNotes: $('#PO_'+POId+'_Vendor_Decision_Notes').val()})
	                    .then((response) => {
	                    	Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });

                            self.DataTable.ajax.reload( null, false );
	                    })

	                $('#PurchaseOrderValidationModalEdit').modal('toggle');
	                
				}
			},
			showViewModal(recordId){
				this.ViewModalInfo = {};
                axios.post('/api/vendors/data/get_vendor_po_details', {POId: recordId})
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
                axios.post('/api/vendors/data/get_vendor_po_details', {POId: recordId})
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

                        });

                        

                    })

                this.editDataLoaded = false;
            }

		},
		mounted(){
			
			const table = $('#VendorPOsList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/vendors/data/get_vendor_po_list',
                columns: [
                    { data: 'purchase_order_group_id', name: 'purchase_order_group_id' },
                    { data: 'company.name', name: 'company.name' },
                    { data: 'po_line_count', name: 'po_line_count' },
                    { data: 'approved_po_line_count', name: 'approved_po_line_count' },
                    { data: 'rejected_po_line_count', name: 'rejected_po_line_count' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'updated_at', name: 'updated_at' },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'POAcceptanceList' },
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

            $('tbody', this.$refs.VendorPOsList).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.VendorPOsList).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
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