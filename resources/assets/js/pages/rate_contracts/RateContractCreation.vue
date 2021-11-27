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