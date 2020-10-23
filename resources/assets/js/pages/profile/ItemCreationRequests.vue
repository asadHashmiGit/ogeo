<template>
		
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>My Requests to Create New Items</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewItemCreationRequests" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Requester</th>
                                <th>Description</th>
                                <th>URL</th>
                                <th>Status</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="ItemCreationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Details | Item Number: {{ ViewModalInfo.id }} (View)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="col-lg-12">
                            <table class="table">
                                <tr>
                                    <td style="width: 30%"><b>Request Number (ID):</b></td>
                                    <td>ICR-{{ ViewModalInfo.id }}</td>
                                </tr>
                                <tr>
                                    <td><b>Requester Name: </b></td>
                                    <td>{{ ViewModalInfo.requester.name }}</td>
                                </tr>
                                <tr>
                                    <td><b>Item Link: </b></td>
                                    <td><a target="_blank" :href="ViewModalInfo.item_link">Item Link</a></td>
                                </tr>
                                <tr>
                                    <td><b>Item Description: </b></td>
                                    <td>{{ ViewModalInfo.item_description }}</td>
                                </tr>
                                <tr>
                                    <td><b>Available Files: </b></td>
                                    <td>
                                        <a v-if="ViewModalInfo.file1" class="btn btn-success" :href="'../uploads/NewItemCreationRequests/'+ViewModalInfo.file1" download> File 1</a>
                                        <a v-if="ViewModalInfo.file2" class="btn btn-success" :href="'../uploads/NewItemCreationRequests/'+ViewModalInfo.file2" download>File 2</a>
                                        <a v-if="ViewModalInfo.file3" class="btn btn-success" :href="'../uploads/NewItemCreationRequests/'+ViewModalInfo.file3" download>File 3</a>
                                    </td>
                                </tr>
                            </table>
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
                                        <th>Item ID</th>
                                        <th>Action Description</th>
                                        <th>Prev Action By</th>
                                        <th>Next Action By</th>
                                        <th>Prev Approval Level</th>
                                        <th>Next Approval Level</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>IM-{{ item.item_id }}</td>
                                        <td>{{ item.description }}</td>
                                        <td>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.next_action_owners }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td>{{ item.next_approval_level }}</td>
                                        <td>{{ item.decision }}</td>
                                        <td>{{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>                      
                    </div>
                </div>
            </div>
        </div>



        <div id="ItemCreationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Creation Request ID: {{ EditModalInfo.id }} (Edit)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body"  v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <el-form :model="ItemCreationInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationRequestForm">

                                    <el-row :gutter="24">


                                        <transition v-if="CompanyDetails.setup_mode == 'Project Wise'">
                                            <el-col :span="24">
                                                <div class="grid-content">
                                                    <el-form-item label="Select Job Number" prop="ProjectId">

                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="ItemCreationInfo.ProjectId" placeholder="Select Job Number">
                                                            
                                                            <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Project Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </transition>


                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="Enter Description of The Required Item" prop="ItemDescription">

                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
                                                            
                                                        </span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2">
                                                                <strong>Quasars</strong> are believed to be powered by accretion of material into supermassive black holes in the nuclei of distant galaxies, making these luminous versions of the general...
                                                            </span>
                                                        </span>
                                                    </span>
                                                    
                                                    <el-input
                                                        type="textarea"
                                                        :rows="4"
                                                        placeholder="Enter Complete Description Of The Required Item."
                                                        v-model="ItemCreationInfo.ItemDescription">
                                                    </el-input>
                                                    
                                                </el-form-item>
                                            </div>

                                            <div class="grid-content">
                                                <el-form-item label="Enter Item Link (If Available)" prop="ItemLink">
                                                    <el-input v-model="ItemCreationInfo.ItemLink" placeholder="http://www.itemsinfo.com/itemlink/232/wsd"></el-input>
                                                </el-form-item>
                                            </div>

                                            
                                            <div style="width: 100%" class="grid-content">
                                                <el-form-item style="margin-bottom: 0px;" label="Upload Item's Related Documents" prop="ItemDocuments"></el-form-item>

                                                <el-upload
                                                    class="upload-demo"
                                                    id='UploadDocumentsResubmit'
                                                    :auto-upload="false"
                                                    ref="UploadDocumentsResubmit"
                                                    multiple
                                                    action="#"
                                                    :limit="3"
                                                    :on-exceed="handleExceed"
                                                    :file-list="ItemCreationInfo.ItemDocuments"
                                                    >

                                                    <button type="button" slot="trigger" class="btn btn-success">Select File</button>
                                                  
                                                    <div class="el-upload__tip" slot="tip">Any file type is accepted with a size less than 3Mb (Max 3 Files)</div>
                                                </el-upload>

                                            </div>

                        
                                        </el-col>


                                        
                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="SubmitItemCreationRequest" class="btn btn-success btn-block waves-effect text-center">Create New Item Creation Request</button>
                                        </el-col>


                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="CancelItemCreationRequest" class="btn btn-danger btn-block waves-effect text-center">Cancel Item Creation Request</button>
                                        </el-col>

                                    </el-row>
                                </el-form>
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
    import {CustomJs} from '../../helpers/custom.js';

	export default {
		name: 'item-creation-requests',
		data(){

            var CheckURL = (rule, value, callback) => {
                if (this.isUrlValid(value)) {
                    callback();
                } else {

                    if(value === ''){
                        callback();
                    } else {
                        callback(new Error('Please Enter Valide URL. (e.g. http://ogeo.me/example Or http://www.ogeo.me/example)'));
                    }
                    
                }
            };

			return{
                DataTable: "",
                viewDataLoaded: false,
				editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                CompanyDetails: {},
                JobNumbers: {},
                ItemCreationInfo: {
                    ProjectId: "",
                    ItemId: "",
                    ItemDescription: "",
                    ItemLink: "",
                    ItemDocuments: []
                },
                rules: {
                    ProjectId: [{
                        required: true,
                        message: "Please Select Job Number",
                        trigger: ["blur", "change"]
                    }],
                    ItemDescription: [{
                        required: true,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    ItemDocuments: [{
                        required: false,
                        message: "Please Upload At least one documenet",
                        trigger: "blur"
                    }],
                    ItemLink: [{
                        validator: CheckURL,
                        trigger: "blur"
                    }],
                },      
			}
		},
		methods: {

            CancelItemCreationRequest(){
                axios.post( '/api/users/cancel_item_request_by_originator', {ItemRequestId: this.ItemCreationInfo.ItemCreationRequestId})
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });


                    this.$nextTick(() => {
                        $('#ItemCreationModalEdit').modal('toggle');
                        this.DataTable.draw('full-hold');
                    });


            },  

            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },

            SubmitItemCreationRequest: function(){
                if (event) event.preventDefault();

                this.$refs.ItemCreationRequestForm.validate((validation) => {

                    if(validation){

                        let formData = new FormData();

                        for( var i = 0; i < this.$refs.UploadDocumentsResubmit.uploadFiles.length; i++ ){
                            let file = this.$refs.UploadDocumentsResubmit.uploadFiles[i].raw;
                            formData.append('FileUploads['+i+']', file);
                        }
                        
                        console.log(this.ItemCreationInfo.ItemCreationRequestId);
                        
                        formData.append('ProjectId', this.ItemCreationInfo.ProjectId);
                        formData.append('ItemId', this.ItemCreationInfo.ItemCreationRequestId);
                        formData.append('ItemDescription', this.ItemCreationInfo.ItemDescription);
                        formData.append('ItemLink', this.ItemCreationInfo.ItemLink);

                        axios.post( '/api/users/new_item_creation_request',
                            formData,
                            {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            }
                        ).then(function(response){
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                                timer: 5000
                            });
                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                        });

                        this.$nextTick(() => {
                            $('#ItemCreationModalEdit').modal('toggle');
                            this.DataTable.draw('full-hold');
                        });


                        this.ItemCreationInfo.ProjectId = "";
                        this.ItemCreationInfo.ItemCreationRequestId = "";
                        this.ItemCreationInfo.ItemDescription = "";
                        this.ItemCreationInfo.ItemLink = "";

                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.ItemCreationInfo.ProjectId = Object.keys(this.JobNumbers)[0];
                        }

                    }

                });
                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is 3 Files', 'The limit is 3 files per request, you selected ' + files.length + ' file(s) this time, adding up to '+ parseInt(files.length + fileList.length) + ' totally', 'warning')
                
            },

			showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#ItemCreationModalView').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        console.log(this.EditModalInfo);
                        this.ItemCreationInfo.ItemCreationRequestId = this.EditModalInfo.id;
                        this.editDataLoaded = true
                        $('#ItemCreationModalEdit').modal('toggle');
                    })

                this.editDataLoaded = false;
            }
		},
		mounted(){

            axios.get('/api/data/get_user_projects_list')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {
                        this.CompanyDetails = SecondResponse.data;
                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.ItemCreationInfo.ProjectId = Object.keys(this.JobNumbers)[0];
                        }
                    });
                });

			const table = $('#NewItemCreationRequests').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_new_item_requests_list',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'requester.name', name: 'requester.name' },
                    { data: 'item_description', name: 'item_description' },
                    { data: 'item_link', name: 'item_link' },
                    { data: 'status', name: 'status' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'updated_at', name: 'updated_at' },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemCreationRequestList' },
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
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showViewModal(elquentClass, RecordID);
            });


            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showEditModal(elquentClass, RecordID);
            });

            self.DataTable = table;

		}
	} 
	
	
</script>


<style>

    .font-500{
        font-weight: 500;
    }

    #ItemCreationModalView .modal-dialog {
        min-width:80%;
    }

    #ItemCreationModalEdit .modal-dialog {
        min-width:80%;
    }

</style>