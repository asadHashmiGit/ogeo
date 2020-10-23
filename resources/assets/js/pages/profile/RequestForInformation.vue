<template>
		
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Enquiries Request For Informatin List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="RFIsTable" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>PE #</th>
                                <th>Created By</th>
                                <th>Type</th>
                                <th>Requested Item</th>
                                <th>Service Desc.</th>
                                <th>Quantity</th>
                                <th>UoM</th>
                                <th>Advanced</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="RFIModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFIModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div  class="modal-header">
                            <h4 class="modal-title">Request For Information</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="RFIDataLoaded">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p>Note: this communication will be available for Quotation Manager and the original requester for their comment and reply.  </p>
                                    <table ref="RFITable" id="RFIMessagesTable" class="display responsive table table-bordered table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>By</th>
                                                <th>User Name</th>
                                                <th>Message</th>
                                                <th>Created At</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="message in RFIDetails">
                                                <th>{{ message.id }}</th>
                                                <th>{{ message.user_type }}</th>
                                                <template v-if="message.user_type == 'Vendor'">
                                                    <th>{{ message.vendor_user.name }}</th>
                                                </template>
                                                <template v-else>
                                                    <th>{{ message.user.name }}</th>
                                                </template>
                                                <th>{{ message.message }}</th>
                                                <th>{{ message.created_at }}</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <template v-if="RFIDetails[0].quotation.trackers[0].status == 'RFI Submitted'">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <hr>
                                        <h4>Submit New RFI</h4>
                                        <el-input
                                            type="textarea"
                                            rows="6"
                                            placeholder="Enter Your Request For Information..."
                                            v-model="RFIData.RFImessage">
                                        </el-input>
                                    </div>
                                    <div class="col-lg-12">
                                        <br>
                                    </div>
                                    <div class="col-lg-12">
                                        <button type="button" class="btn btn-block btn-success" @click="SubmitRFI">Submit RFI</button>
                                    </div>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </div>

    </div>
	
</template>


<script>
	
	import validateJs from 'validate.js';

	export default {
		name: 'user-view-request-for-information',
		data(){
			return{
                DataTable: "",
                RFIDataLoaded: false,
                ViewModalInfo: {},
                RFIDetails: [],
                RequiredRFIId: "",
                RFIData: {
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    PEId: "",
                }
			}
		},
		methods: {

            showRFIModal(recordId, VendorId, CompanyId, QuotationId) {
                this.RFIDetails = [];
                this.RFIData.RFImessage = "";
                this.RFIData.PEId = recordId;
                this.RFIData.VendorId = VendorId;
                this.RFIData.CompanyId = CompanyId;
                this.RFIData.QuotationId = QuotationId;
                axios.post('/api/data/get_pe_rfi_details', {PEId: recordId, VendorId: VendorId})
                    .then((response) => {
                        this.RFIDetails = response.data;
                        this.RFIDataLoaded = true;
                        console.log(this.RFIDetails);

                        $('#RFIModal').modal('toggle');

                        this.$nextTick(() => {
                            $('#RFIMessagesTable').DataTable({
                                responsive: true,
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 100,
                                lengthMenu: [
                                    [ 100, 500, 1000, -1 ],
                                    [ '100 Records', '500 Records', '1000 Records', 'All Records' ]
                                ],
                                order: [[ 3, "DESC" ]],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
                                ],
                            }); 
                        });
                    });

                this.RFIDataLoaded = false;
            },
            SubmitRFI(){
                //check if empty
                if(this.RFIData.RFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                    
                } else {
                    axios.post( '/api/users/originator_create_rfi_message', this.RFIData)
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });
                            this.RFIData.PEMessage == "";
                        })

                    $('#RFIModal').modal('toggle');
                    this.DataTable.ajax.reload( null, false );
                }
                
            },
            
		},
		mounted(){

			const table = $('#RFIsTable').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_rfis',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'enquiry_type', name: 'enquiry_type' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'service_description', name: 'service_description' },
                    { data: 'quantity', name: 'quantity' },
                    { data: 'u_o_m', name: 'u_o_m' },
                    { data: 'advanced_payment', name: 'advanced_payment' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 5 },
                    { responsivePriority: 2, targets: 0 },
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
                    // {  extend: 'csv', text:   '<i class="fa fa-file-text-o"></i>', title:  'NewItemApprovals' },
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemCreationRequestList' },
                    { extend: 'pdf', className: 'btn btn-success', title: 'ItemCreationRequestList' },
                    { extend: 'print', className: 'btn btn-success',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                        }
                    },
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
                var VendorId = $(this).data('vendorid');
                var CompanyId = $(this).data('companyid');
                var QuotationId = $(this).data('quotationid');
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showRFIModal(RecordID, VendorId, CompanyId, QuotationId);
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

    .font-500{
        font-weight: 500;
    }

    #RFIModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

</style>