<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Commerical Evaluation List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="CommercialEvaluationList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Commerical Evaluation ID</th>
                                <th>Evaluator</th>
                                <th>Quotation Start Date</th>
                                <th>Quotation End Date</th>
                                <th>Lines Count</th>
                                <th>Submitted Vendors Count</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="QuotationDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Quotations for Rate Contract request #: {{ ViewModalInfo.quotation_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="CommercialEvaluationTable" id="CommercialEvaluationLine" class="responsive table table-bordered cell-border" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>PE Id</th>
                                                <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Item #</th>
                                                <th>Item Description</th>
                                                <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Quantity</th>
                                                <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Advanced Payment</th>
                                                <th style="min-width: 270px" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                    Vendor#{{key+1}}: {{ vendor.name }}
                                                </th>
                                                <th>Evaluator Recommendations</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <template v-for="(RCline, key, index) in ViewModalInfo.rate_contract_requests">
                                                <tr class="po-not-generated" >
                                                    <td>{{ parseInt(RCline.id) }}</td>
                                                    <td v-if="RCline.item_id">{{ RCline.item_id }}</td>
                                                    
                                                    <td v-if="RCline.item_id">{{ RCline.item.description }}</td>

                                                    <td v-if="RCline.item_id">{{ RCline.quantity }}</td>
                                                    <td v-if="RCline.item_id"> N/A <!-- {{ RCline.advanced_payment }} --></td>
                                                    <td style="min-width: 270px;" v-for="(vendor, key, index) in ViewModalInfo.vendors" >
                                                        <!-- v-bind:class="[ViewModalInfo.trackers[key].status == 'Quotation Submitted' ? 'po-generated' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'po-generated' : 'po-not-generated')]" -->
                                                        <template v-if="vendor.quotation_r_c_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_r_c_responses">
                                                                <template v-if="RCline.id == response.rate_contract_request_id">
                                                                    <div v-bind:class="[ validateQuotationPeriod(response.validity_date) ? 'quotation-expired' : 'quotation-not-expired', response.rate_contracts.length > 0 ? 'po-generated' : 'po-not-generated']">
                                                                        <!-- Response Details -->
                                                                        <span><b>Status:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Price:</b> <template v-if="response.unit_rate">   {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> N/A <!-- {{ response.advanced_percentage }} --></template> <template v-else>No Submitted</template></span><br>
                                                                        <template v-if="response.notes != null">
                                                                            <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                        </template>
                                                                        <template v-else>
                                                                            <span><b>Notes:</b> None</span><br>
                                                                        </template>
                                                                        <span><b>Required Files:</b> {{ RCline.required_documents }}</span><hr>
                                                                        

                                                                        <!-- RFI Review -->
                                                                        <template v-if="RCline.rfis.length && vendor.id == RCline.rfis[0].vendor_id">
                                                                            <button type="button" @click="showRFIModal(RCline.id, RCline.rfis[0].vendor_id)" class="btn btn-info">View RFIs <div v-if="RCline.rfis.length > 0" class="numberCircle pull-right"><span>{{ RCline.rfis.length }}</span></div></button>
                                                                        </template>
                                                                        <template v-else>
                                                                            <button type="button" class="btn btn-info disabled">No RFI</button>
                                                                        </template>

                                                                        <!-- Uploaded Files Review -->
                                                                        <template v-if="RCline.uploaded_docs.length">
                                                                            <button @click="showRequiredDocsModal( RCline.id, vendor.id)" class="btn btn-info required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ RCline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
                                                                        </template>
                                                                        <template v-else>
                                                                            <button type="button" class="btn btn-info disabled">No Files</button>
                                                                        </template>

                                                                    </div>
                                                                
                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Status: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> {{ RCline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            <!-- RFI Review -->
                                                            <!-- <template v-if="RCline.rfis.length">
                                                                <button type="button" @click="showRFIModal(RCline.id, RCline.rfis[0].vendor_id)" class="btn btn-info">View RFIs <div v-if="RCline.rfis.length > 0" class="numberCircle pull-right"><span>{{ RCline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No RFI</button>
                                                            </template>
                                                            
                                                            
                                                            Uploaded Files Review
                                                            <template v-if="RCline.uploaded_docs.length > 0">
                                                                <button class="btn btn-info required-docs-placeholder">View Files <div v-if="RCline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ RCline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No Files</button>
                                                            </template> -->

                                                            <button type="button" class="btn btn-info disabled">No RFI</button>

                                                            <button type="button" class="btn btn-info disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td class="alignVertically" align="center">
                                                        <p v-if="RCline.commerical_evaluations[0].pivot.rc_note">{{ RCline.commerical_evaluations[0].pivot.rc_note }}</p>
                                                        <p v-else>No Notes</p>
                                                    </td>
                                                </tr>
                                            </template>
                                            <tr>
                                                <td><span style="display: none">N.A</span></td>
                                                <td v-if="ViewModalInfo.rate_contract_requests[0].item_id"></td>
                                                <td v-if="ViewModalInfo.rate_contract_requests[0].item_id"></td>
                                                <td v-if="ViewModalInfo.rate_contract_requests[0].item_id"></td>
                                                <td></td>
                                                <td v-for="(vendor, key) in ViewModalInfo.vendors">
                                                    <template v-if="vendor.quotation_r_c_responses.length > 0">
                                                        <el-input
                                                            :id="'Vendor_'+vendor.id+'_RC_Notes'"
                                                            type="textarea"
                                                            rows="4"
                                                            placeholder="Rate Contract Notes (Optional)">
                                                        </el-input><hr>

                                                        <button type="button" class="btn btn-block btn-danger" @click="GenerateRateContract(vendor.id, key, ViewModalInfo.id, ViewModalInfo.rate_contract_requests[0].project_id)">Generate Rate Contract To This Vendor</button>
                                                    </template>
                                                    <template v-else>
                                                        No Vendor Response
                                                    </template>
                                                </td>
                                                <td></td>
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
                                        <td valign="middle" align="center" v-if="PEVendorUploadedFiles">
                                            <div v-for="uploadedFile in PEVendorUploadedFiles">
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



    </div>
            
</template>

<script>
    
    import {CustomJs} from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'purchase-enquiry-list',
        data(){
            return{
                URL: '/uploads/PEVendorUploadsRequiredDocs/',
                DataTable: "",
                CEDataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                RFIDataLoaded: false,
                RequiredDocsDataLoaded: false,
                QuotationSubmitStatus: "",
                ViewModalInfo: {},
                RFIDetails: [],
                RequiredRFIId: "",
                RequiredFilesId: "",
                RequiredDocsDetails: [],
                StartColumnIndex: 5,
                StartColumnIndexServices: 2,
                TotalRows: "",
                RFIData: {
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    PEId: "",
                },
            }
        },
        methods: {
            GenerateRateContract(VednorId, ColumnIndex, QuotationId, ProjectId){

                let self = this; 

                if(this.ViewModalInfo.quotation_type == "Service"){
                    var SelectedVendorColumn = ColumnIndex + this.StartColumnIndexServices;
                } else {
                    var SelectedVendorColumn = ColumnIndex + this.StartColumnIndex;
                }
                
                var TotalRows = this.TotalRows - 1;
                var table = this.CEDataTable;
                var SelectedRCIds = [];
                var RCNotes = $('#Vendor_'+VednorId+'_RC_Notes').val();

                for (var i = 0; i <= TotalRows; i++){
                    var selectedCell = table.cell({row: i, column: SelectedVendorColumn}).node();
                    if($(selectedCell).hasClass('selected')){
                        var IdCell = table.cell({row: i, column: 0}).data();


                        $(table.row(i).node()).addClass('po-generated');
                        SelectedRCIds.push(IdCell);
                    }
                }

                if(SelectedRCIds.length == 0){
                    Swal('Selection Error', 'No lines has been selected against this vendor!', 'warning');
                } else {

                    /* you can have a bit of confirmation as this is final */

                    axios.post('/api/rate_contracts/create_rate_contract', {VendorId: VednorId, QuotationId: QuotationId, ProjectId: ProjectId, SelectedRCs: SelectedRCIds, RCNotes: RCNotes})
                            .then((response) => {

                                self.DataTable.ajax.reload( null, false );

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                });
                            })
                            .catch(error => { 
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (RC Generation)', 'error');
                            });

                            $('#QuotationDetailsModal').modal('toggle');
                }

                

            },
            showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_rc_commercial_evaluation_details', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        console.log(this.ViewModalInfo);
                        $('#QuotationDetailsModal').modal('toggle');

                        this.$nextTick(() => {
                            const table = $('#CommercialEvaluationLine').DataTable({
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: -1,
                                order: [[ 0, "asc" ]],
                                columnDefs: [
                                    { width: "300px" }
                                ],
                                lengthMenu: [
                                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                                ],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],   
                            });

                            const self = this;


                            self.$data.TotalRows = table.rows().count() - 1;


                            $('#CommercialEvaluationLine tbody').on('click', 'td', function () {

                                if(self.ViewModalInfo.quotation_type == "Service"){
                                    var StartColumnIndex1 = self.$data.StartColumnIndexServices;
                                } else {
                                    var StartColumnIndex1 = self.$data.StartColumnIndex;
                                }
                                var $this = $(this);
                                var CanBeSelectedPONotGenerated = $this.parent().hasClass('po-not-generated');
                                var NotSubmittedCell = $this.children().first().hasClass('po-generated');
                                var NotSubmittedCellExpiredQuotation = $this.children().first().hasClass('quotation-expired');

                                //if the cell has status po-generate (this is checking if the vendor did not submit price for the item and thus can be selected)
                                if(NotSubmittedCell){
                                    Swal('Rate Contract Generated', 'This item can not be selected since a rate contract request already created under this vendor.', 'warning');
                                    return false;
                                }

                                if(NotSubmittedCellExpiredQuotation){
                                    Swal('Quotation Validity Expired', 'The Validity Period Of The Quotation Has Expired hence this item can not be selected.', 'warning');
                                    return false;
                                }
                                
                                var TableColumnsIndexLength = table.columns()[0].length - 1;
                                var TableNumberOfRows = table.rows().count() - 1;
                                var rowIdx = table.cell(this).index().row;
                                var columnIdx = table.cell(this).index().column;
                                var ValidColumnsIndexLength = TableColumnsIndexLength - 1; //Exclude Last Column

                                console.log(columnIdx);
                                console.log(StartColumnIndex1);
                                if(columnIdx < StartColumnIndex1){
                                    //Swal('Selection Error', 'This Cell Can Not Be Selected!', 'warning');
                                } else if (TableColumnsIndexLength == columnIdx) {
                                    //Swal('Selection Error', 'This Cell Can Not Be Selected!!', 'warning');
                                }else {

                                    if(CanBeSelectedPONotGenerated){
                                        if($this.hasClass('selected')){
                                            $this.removeClass('selected');
                                        } else {

                                            //check that what we will not select the last row
                                            if (TableNumberOfRows != rowIdx) {
                                                //Remove selected from previously selected Cell
                                                for (var i = StartColumnIndex1; i <= ValidColumnsIndexLength; i++){
                                                    var ToAddClassCell = table.cell({row: rowIdx, column: i}).node();
                                                    if($(ToAddClassCell).hasClass('selected')){
                                                        $(ToAddClassCell).removeClass('selected');
                                                    }
                                                }
                                                //Add Selected To the Clicked Cell
                                                $this.addClass('selected');
                                            }
                                        }
                                    }

                                    
                                }
                            });

                            self.CEDataTable = table;

                        });

                    })

                this.viewDataLoaded = false;            
            },
            showRequiredDocsModal(recordId, VendorId) {
                function isRequiredPE(PE){
                    return PE.id == recordId;
                }

                //console.log(recordId);

                //reset previous values and uploaded files
                this.RequiredFilesId = "";
                this.RequiredDocsDetails = [];

                //store the selected PE Id
                this.RequiredFilesId = recordId;
                
                //get the list of document required for the selected PE
                console.log(this.ViewModalInfo.rate_contract_requests);
                let PE = this.ViewModalInfo.rate_contract_requests.find(isRequiredPE);
                //console.log(PE);
                this.RequiredDocsDetails = PE.required_documents.split(",");
                this.PEVendorUploadedFiles = PE.uploaded_docs.filter( document => document.vendor_id == VendorId );

                //Show the modal
                this.RequiredDocsDataLoaded = true;
                $('#RequiredDocsModal').modal('toggle');

                this.RequiredDocsDataLoaded = true;
            },
            showRFIModal(recordId, VendorId) {
                this.RFIDetails = [];
                this.RFIData.RFImessage = "";
                this.RFIData.PEId = recordId;
                this.RFIData.VendorId = VendorId;
                this.RFIData.QuotationType = this.ViewModalInfo.quotation_for;
                this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                this.RFIData.QuotationId = this.ViewModalInfo.id;
                axios.post('/api/data/get_pe_rfi_details', {PEId: recordId, VendorId: VendorId, QuotationType: this.RFIData.QuotationType})
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
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            }); 
                        });
                    });

                this.RFIDataLoaded = false;
            },
            validateQuotationPeriod(ResponseValidity){
                var Today = new Date();
                var ValidatyPeriod = new Date(ResponseValidity);

                if(Today > ValidatyPeriod){
                    return true;
                } else {
                    return false;
                }

            }
            
        },
        mounted(){

            CustomJs();

            const table = $('#CommercialEvaluationList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_rc_commercial_evaluations_list',
                columns: [
                    { data: 'commerical_evaluation_group_id', name: 'commerical_evaluation_group_id' },
                    { data: 'evaluator', name: 'evaluator' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'linesCount', name: 'linesCount' },
                    { data: 'vendors_count', name: 'vendors_count' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 7 },
                    { responsivePriority: 2, targets: 1 },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemMasterList' },
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
                var RecordID = $(this).data('recordid');
                self.showViewModal(RecordID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>

    td.alignVertically {
      vertical-align: middle;
    }

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

    #QuotationDetailsModal .modal-dialog {
        min-width:80%;
    }

    #RFIModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    #RequiredDocsModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    .quotation-expired {
        background-size: auto auto;
        background-color: rgba(255, 255, 255, 1);
        background-image: repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(0, 0, 0, 0.05) 10px, rgba(0, 0, 0, 0.05) 24px );
        color: black;
    }

    .quotation-not-expired {
        /*background-color: rgb(69, 249, 132, 0.2);*/ 
    }

    .po-generated {
        background-size: auto auto;
        background-color: rgba(255, 255, 255, 1);
        background-image: repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(0, 0, 0, 0.05) 10px, rgba(0, 0, 0, 0.05) 24px );
        color: black;
    }

    .po-not-generated {
        /*background-color: rgb(69, 249, 132, 0.2);*/
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>