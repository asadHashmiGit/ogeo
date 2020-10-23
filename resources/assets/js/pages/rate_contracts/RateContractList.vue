<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Rate Contract Approval List</h4>
                </div>
                <div class="card-body">
                    <table ref="RateContractList" id="RateContractList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>RC #</th>
                                <th>Created By</th>
                                <th>Vendor</th>
                                <th>Total RC Line Count</th>
                                <th>Fully Approved RC Lines</th>
                                <th>Rejected RC Lines</th>
                                <th>Created</th>
                                <th>Last Updated</th>
                                <th>Current Approval Level</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="RateContractValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RateContractValidationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Rate Contract #: {{ ViewModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Rate Contract (ID):</b></td>
                                        <td>{{ ViewModalInfo.id }}</td>
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
                                        <th>Previous Approval Level</th>
                                        <th>Previous Action By</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                        <th>Next Approval Level</th>
                                        <th>Next Action By</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ item.description }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td v-if="item.current_action_owner_id.match(/[a-z]/i)">{{ item.current_action_owner_id }}</td>
                                        <td v-else>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.decision }}</td>
                                        <td>{{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                        <td>{{ item.next_approval_level }}</td>
                                        <td>{{ item.next_action_owners }}</td>
                                    </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="RateContractValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RateContractValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Rate Contract Number: {{ EditModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="RCDetailsTable" id="RCDetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>PE Id</th>
                                                <th style="min-width: 150px;">Item Details</th>
                                                <th>Expected Consumption</th>
                                                <th>Unit Rate</th>
                                                <th>Total Price</th>
                                                <th>Currency</th>
                                                <th style="min-width: 150px">Delivery</th>
                                                <th style="min-width: 240px">Additional Docs</th>
                                                <th>Line Status</th>
                                                <th>Created At</th>
                                                <th style="min-width: 150px">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(PEResponse, index) in EditModalInfo.vendor_responses">
                                                <td>{{ PEResponse.rate_contract_request.id }}</td>
                                                
                                                <td v-if="PEResponse.rate_contract_request.item_id" style="min-width: 150px;">{{ PEResponse.rate_contract_request.item.description }}</td>

                                                <td v-if="PEResponse.rate_contract_request.item_id">
                                                    <el-input
                                                       :id="'PEline_'+PEResponse.rate_contract_request.id+'_Quantity'"
                                                       style="min-width: 100%;"
                                                       type="number"
                                                       v-on:input="UpdateLinePrice(EditModalInfo.id, PEResponse.rate_contract_request.id, index)"
                                                       :value="PEResponse.rate_contract_request.quantity"
                                                       readonly
                                                       placeholder="Quantity">
                                                    </el-input>
                                                </td>
                                                <td v-else>
                                                    <el-input
                                                        :id="'PEline_'+PEResponse.rate_contract_request.id+'_Quantity'"
                                                        style="min-width: 100%;"
                                                        type="number"
                                                        disabled
                                                        value="1">
                                                    </el-input>
                                                </td>

                                                <td>{{ PEResponse.unit_rate }}</td>
                                                
                                                <td v-if="PEResponse.rate_contract_request.item_id">{{ parseFloat(PEResponse.unit_rate) * parseFloat(PEResponse.rate_contract_request.quantity) }} </td>
                                                <td v-else>{{ parseFloat(PEResponse.unit_rate) * 1 }} </td>

                                                <td>{{ PEResponse.currency }} </td>
                                                <td style="min-width: 150px">
                                                    <span><b>Lead Days:</b> {{ PEResponse.lead_days }} Days</span><br>
                                                    <span><b>Advanced Percentage:</b> {{ PEResponse.advanced_percentage }}%</span><br>
                                                    <span v-if="PEResponse.notes">Vednor Notes: 
                                                        <span>{{ PEResponse.notes }}</span>
                                                    </span>
                                                </td>
                                                <td style="min-width: 240px;">
                                                    <!-- RFI Review -->
                                                    <template v-if="PEResponse.rate_contract_request.rfis.length">
                                                        <button type="button" @click="showRFIModal(PEResponse.rate_contract_request.id, PEResponse.rate_contract_request.rfis[0].vendor_id, PEResponse.rate_contract_request.quotation_for)" class="btn btn-info">View RFIs <div v-if="PEResponse.rate_contract_request.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.rate_contract_request.rfis.length }}</span></div></button>
                                                    </template>
                                                    <template v-else>
                                                        <button type="button" class="btn btn-info disabled">No RFI</button>
                                                    </template>

                                                    <!-- Uploaded Files Review -->
                                                    <template v-if="PEResponse.rate_contract_request.uploaded_docs.length">
                                                        <button class="btn btn-info required-docs-placeholder">View Files <div v-if="PEResponse.rate_contract_request.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.rate_contract_request.uploaded_docs.length }}</span></div></button>
                                                    </template>
                                                    <template v-else>
                                                        <button type="button" class="btn btn-info disabled">No Files</button>
                                                    </template>
                                                </td>
                                                <td>{{ PEResponse.rate_contract_request.rate_contracts[0].pivot.status }}</td>
                                                <td>{{ EditModalInfo.created_at }}</td>
                                                <td style="min-width: 150px">
                                                    <el-input
                                                       :id="'PEline_'+PEResponse.rate_contract_request.id+'_Decision_Notes'"
                                                       style="min-width: 100%; font-size:12px"
                                                       type="textarea"
                                                       rows="3"
                                                       placeholder="Decision Notes">
                                                    </el-input><br>
                                                    <div class="m-t-10">
                                                        <button @click="RejectRCLine(EditModalInfo.id, PEResponse.rate_contract_request.id, index)" style="width: 45%" type="button" class="btn btn-sm btn-danger pull-left">Reject</button> 
                                                        <button @click="ApproveRCLine(EditModalInfo.id, PEResponse.rate_contract_request.id, index)" style="width: 45%" type="button" class="btn btn-sm btn-success pull-right">Approve</button>
                                                        <!-- <button @click="RequestRCLineInfo(EditModalInfo.id, PEResponse.rate_contract_request.id, index)" style="width: 100%; margin-top: 2px;" type="button" class="btn btn-sm btn-primary pull-right">Request Clarification</button> -->
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <hr><button type="button" @click="SubmitRCDecision(EditModalInfo.id)" class="btn btn-block btn-success"> Submit Decisions</button>
                            </div>
                        </div>
                                     
                    </div>
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
                    </div>
                </div>
            </div>
        </div>


        <div id="RequiredDocsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RequiredDocsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Required Documents Upload</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="RequiredDocsDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <p>Upload The Following Files:</p>
                                <table class="table table-bordered">
                                    <tr v-if="RequiredDocsDetails" v-for="(Document, index) in RequiredDocsDetails">
                                        <td valign="middle" align="center">{{ index+1 }}</td>
                                        <td valign="middle" align="center"><span style="font-size: 15px">{{ Document }}</span></td>
                                        <td valign="middle" align="center" v-if="PRVendorUploadedFiles">
                                            <div v-for="uploadedFile in PRVendorUploadedFiles">
                                                <template v-if="uploadedFile.required_doc_name == Document">
                                                    <a :href="URL+uploadedFile.document_name" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> File {{ index+1 }} Download </a><br>
                                                </template>
                                                <template v-else>
                                                    <span>No Files Uploaded</span>
                                                </template>
                                            </div>
                                        </td>
                                        <td valign="middle" align="center" v-else>
                                            <span>No Files Uploaded Yet</span>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="RCLineRFIDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RCLineRFIDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">RC Line Additional Information Request</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="RCLineRFIDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <table ref="RCLineRFITable" id="RCLineRFITable" class="display responsive table table-bordered table-hover" style="width:100%">
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
                                        <tr v-for="message in RCLineRFIDetails">
                                            <th>{{ message.id }}</th>
                                            <th>{{ message.user.designation }}</th>         
                                            <th>{{ message.user.name }}</th>
                                            <th>{{ message.message }}</th>
                                            <th>{{ message.created_at }}</th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                                <h4>Send Message</h4>
                                <el-input
                                    type="textarea"
                                    rows="6"
                                    placeholder="Enter Your Request For Information..."
                                    v-model="RCLineRFImessage">
                                </el-input>
                            </div>
                            <div class="col-lg-12">
                                <br>
                            </div>
                            <div class="col-lg-12">
                                <button type="button" class="btn btn-block btn-success" @click="SubmitRCLineRFI()">Send Message</button>
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
                QuantityChange: [],
                HasBeenEdited: false,
                PEId: "",
                RCId: "",
                ApprovedLines: [],
                RejectedLines: [],
                HideModal: false,
                URL: '/uploads/PEVendorUploadsRequiredDocs/',
                RCLinesTable: "",
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                RFIDataLoaded: false,
                RCLineRFIDataLoaded: false,
                RequiredDocsDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                RFIDetails: [],
                RCLineRFIDetails: [],
                RCLineRFImessage: "",
                RequiredRFIId: "",
                RequiredFilesId: "",
                RequiredDocsDetails: [],
            }
        },
        methods: {
            SubmitRCDecision(RCId){

                var self = this;

                if(this.EditModalInfo.vendor_responses.length > (this.ApprovedLines.length + this.RejectedLines)){
                    Swal('Decision Incomplete', 'Please complete descision for all lines', 'warning');
                } else {
                    //Adding Generic value which is added when the approver changes the quantity
                    $.each(self.EditModalInfo.vendor_responses, function(RowIndex, vendor_response) {
                        //update object which will be submitted
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('RCId')){
                            self.EditModalInfo.vendor_responses[RowIndex].RCId = self.EditModalInfo.id;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('PEId')){
                            self.EditModalInfo.vendor_responses[RowIndex].PEId = self.EditModalInfo.vendor_responses[RowIndex].rate_contract_request_id;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('OldPrice')){
                            self.EditModalInfo.vendor_responses[RowIndex].OldPrice = self.EditModalInfo.vendor_responses[RowIndex].price;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('NewPrice')){
                            self.EditModalInfo.vendor_responses[RowIndex].NewPrice = parseFloat(self.EditModalInfo.vendor_responses[RowIndex]['rate_contract_request'].quantity) * self.EditModalInfo.vendor_responses[RowIndex].unit_rate;
                        }
                        //this is only if we are dealing with materials 
                        if(self.EditModalInfo.vendor_responses[RowIndex].rate_contract_request.item_id != null){
                           if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('OldQuantity')){
                                self.EditModalInfo.vendor_responses[RowIndex].OldQuantity = self.EditModalInfo.vendor_responses[RowIndex]['rate_contract_request'].quantity;
                            }
                            if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('NewQuantity')){
                                self.EditModalInfo.vendor_responses[RowIndex].NewQuantity = parseFloat($('#PEline_'+self.EditModalInfo.vendor_responses[RowIndex].PEId+'_Quantity').val());
                            } 
                        } else {
                            //we are here because its a service request
                            self.EditModalInfo.vendor_responses[RowIndex].OldQuantity = 1;
                            self.EditModalInfo.vendor_responses[RowIndex].NewQuantity = 1;
                        }
                        


                    });

                    axios.post('/api/rate_contracts/rate_contract_approval', {RCId: RCId, RCResponseDetails: self.EditModalInfo.vendor_responses, ApprovedLines: self.ApprovedLines, RejectedLines: self.RejectedLines, ProjectId: self.EditModalInfo.project_id, CompanyId: self.EditModalInfo.company_id, RCApprovalLevel: self.EditModalInfo.approval_level, Currency: self.EditModalInfo.vendor_responses[0].currency})
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                        });
                        self.DataTable.ajax.reload( null, false );
                       
                    })

                    this.HasBeenEdited = false;
                    $('#RateContractValidationModalEdit').modal('toggle');
                    self.DataTable.ajax.reload( null, false );
                    
                }
                
            },
            UpdateLinePrice(RCId, PEId, RowIndex){
                var table = this.RCLinesTable;
                var quantity = parseFloat($('#PEline_'+PEId+'_Quantity').val());
                var unitRate = parseFloat(table.cell({row: RowIndex, column: 3}).data());
                var NewPrice = quantity * unitRate;

                //update table
                table.cell({row: RowIndex, column: 4}).data(NewPrice);

                //update object which will be submitted
                this.EditModalInfo.vendor_responses[RowIndex].RCId = RCId;
                this.EditModalInfo.vendor_responses[RowIndex].PEId = PEId;
                this.EditModalInfo.vendor_responses[RowIndex].OldPrice = this.EditModalInfo.vendor_responses[RowIndex].price;
                this.EditModalInfo.vendor_responses[RowIndex].NewPrice = NewPrice;
                this.EditModalInfo.vendor_responses[RowIndex].OldQuantity = this.EditModalInfo.purchase_enquiries[RowIndex].quantity;
                this.EditModalInfo.vendor_responses[RowIndex].NewQuantity = quantity;

            },
            RejectRCLine(RCId, PEId, RowIndex){

                if($('#PEline_'+PEId+'_Quantity').val() == 0 || $('#PEline_'+PEId+'_Quantity').val() == ''){
                    Swal('Quantity Required', 'Quantity Required Before Making a Decision', 'warning');
                    return false;
                }
                
                //check if decision notes are entered...
                if($('#PEline_'+PEId+'_Decision_Notes').val() == ""){
                    Swal('Notes Required', 'All Rejections Require Notes', 'warning');
                } else {

                    var table = this.RCLinesTable;
                    var row = table.row(RowIndex).node();
                    $(row).removeClass('poline-approved');
                    $(row).addClass('poline-rejected');

                    table.cell({row: RowIndex, column: 8}).data('Rejected');

                    this.HasBeenEdited = true;

                    var index = this.ApprovedLines.indexOf(PEId);
                    if (index > -1) {
                      this.ApprovedLines.splice(index, 1);
                    }

                    this.RejectedLines.push(PEId);
                    
                }

            },
            ApproveRCLine(RCId, PEId, RowIndex){

                if($('#PEline_'+PEId+'_Quantity').val() == 0 || $('#PEline_'+PEId+'_Quantity').val() == ''){
                    Swal('Quantity Required', 'Quantity Required Before Making a Decision', 'warning');
                    return false;
                }

                var table = this.RCLinesTable;
                var row = table.row(RowIndex).node();
                $(row).removeClass('poline-rejected');
                $(row).addClass('poline-approved');

                table.cell({row: RowIndex, column: 8}).data('Approved');

                this.HasBeenEdited = true;

                var index = this.RejectedLines.indexOf(PEId);
                if (index > -1) {
                  this.RejectedLines.splice(index, 1);
                }

                this.ApprovedLines.push(PEId);

            },
            RequestRCLineInfo(RCId, PEId, RowIndex){

                this.PEId = PEId;
                this.RCId = RCId;

                this.RCLineRFIDetails = [];
                axios.post('/api/data/get_rc_line_rfi_details', {RCId: RCId, RCRId: PEId})
                    .then((response) => {
                        this.RCLineRFIDetails = response.data;
                        this.RCLineRFIDataLoaded = true;
                        console.log(this.RCLineRFIDetails);

                        $('#RCLineRFIDetailsModal').modal('toggle');

                        this.$nextTick(() => {
                            $('#RCLineRFITable').DataTable({
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
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            }); 
                        });

                    });

                this.RCLineRFIDataLoaded = false;

               
            },
            SubmitRCLineRFI(){

                //check if message is empty
                if(this.RCLineRFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                    
                } else {
                    axios.post('/api/rate_contracts/create_rc_line_rfi', {RCLineRFImessage: this.RCLineRFImessage, RCRId: this.PEId, RCId: this.RCId, By: "Requester"})
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });
                        })

                    this.RCLineRFImessage = "";
                    $('#RCLineRFIDetailsModal').modal('toggle');

                }   
            },
            showRequiredDocsModal(recordId) {
                function isRequiredPE(PR){
                    return PR.id == recordId;
                }

                //reset previous values and uploaded files
                this.RequiredFilesId = "";
                this.RequiredDocsDetails = [];

                //store the selected PE Id
                this.RequiredFilesId = recordId;
                
                //get the list of document required for the selected PE
                let PR = this.EditModalInfo.rate_contract_requests.find(isRequiredPE);
                console.log(PR);
                this.RequiredDocsDetails = PR.required_documents.split(",");
                this.PRVendorUploadedFiles = PR.uploaded_docs;

                //Show the modal
                this.RequiredDocsDataLoaded = true;
                $('#RequiredDocsModal').modal('toggle');

                this.RequiredDocsDataLoaded = true;
            },
            showRFIModal(recordId, VendorId) {
                this.RFIDetails = [];
                axios.post('/api/data/get_pe_rfi_details', {PEId: recordId, VendorId: VendorId, QuotationType: "RC" })
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
                                order: [[ 4, "DESC" ]],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            }); 
                        });

                    });

                this.RFIDataLoaded = false;
            },
            showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_rc_details', {RCId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#RateContractValidationModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_rc_details', {RCId: recordId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#RateContractValidationModalEdit').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#RCDetailsTable').DataTable({
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

                            // table.rows( function ( idx, data, node ) {
                            //     return data[8].includes("Rejected");
                            // }).remove().draw();


                            const self = this;

                            $('tbody', this.$refs.RCDetailsTable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                console.log(RecordID);
                                self.showRequiredDocsModal(RecordID);
                            });

                            self.RCLinesTable = table;

                        });

                        

                    })

                this.editDataLoaded = false;
            }
        },
        mounted(){

            const table = $('#RateContractList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_rate_contract_list',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'vendor.name', name: 'vendor.name' },
                    { data: 'rc_line_count', name: 'rc_line_count' },
                    { data: 'approved_rc_line_count', name: 'approved_rc_line_count' },
                    { data: 'rejected_rc_line_count', name: 'rejected_rc_line_count' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'updated_at', name: 'updated_at' },
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
                    console.log(data.status);
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

            $('tbody', this.$refs.RateContractList).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.RateContractList).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });

            $('.QuantityField').keypress(function() {
              alert( "Handler for .keydown() called." );
            });


            $('#RateContractValidationModalEdit').on('hide.bs.modal', function (e) {

                if(self.HasBeenEdited == true){

                    if(self.HideModal == true){
                        self.HasBeenEdited = false;
                        self.HideModal = false;
                    } else {

                        e.preventDefault();
                        e.stopImmediatePropagation();

                        Swal({
                          title: 'Closing?',
                          text: "You will lose all of the entered details",
                          type: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: 'Close',
                          cancelButtonText: 'Cancel'
                        }).then((result) => {

                            if (result.value) {
                                // We are here after agreeing to submit some empty prices                        
                                self.HideModal = true;
                                self.ApprovedLines = [];
                                self.RejectedLines = [];
                                $("#RateContractValidationModalEdit").modal('hide');
                            }

                            if(result.dismiss == "cancel"){
                            }

                            if(result.dismiss == "overlay"){
                            }
                            
                        });
                    }
                }

                
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>
    

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

    #RateContractValidationModalView .modal-dialog {
        min-width:80%;
    }

    #RateContractValidationModalEdit .modal-dialog {
        min-width:90%;
    }

    #RFIModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    #RequiredDocsModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    #RCLineRFIDetailsModal .modal-dialog {
        top: 3%;
        min-width:75%;
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