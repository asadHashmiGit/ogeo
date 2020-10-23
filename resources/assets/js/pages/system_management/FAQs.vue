<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Frequently Asked Questions</h4>
                </div>
                <div class="card-body">
                	<el-form :model="FAQDetails" class="demo-form-inline" :rules="FormRules" ref="FAQCreationForm">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Select Question Category" prop="question_category">
                                        <el-select style="width: 100%; padding: 0px;" v-model="FAQDetails.question_category" placeholder="Select Question Cateogry">
                                            <el-option label="Process FAQs" value="Process FAQs"></el-option> 
                                            <el-option label="Dashboard FAQs" value="Dashboard FAQs"></el-option> 
                                            <el-option label="System Access FAQs" value="System Access FAQs"></el-option> 
                                            <el-option label="Purchase Enquiry FAQs" value="Purchase Enquiry FAQs"></el-option> 
                                            <el-option label="Item Master FAQs" value="Item Master FAQs"></el-option> 
                                            <el-option label="Quotations FAQs" value="Quotations FAQs"></el-option> 
                                            <el-option label="Purchase Orders FAQs" value="Purchase Orders FAQs"></el-option> 
                                            <el-option label="Receipt Notes FAQs" value="Receipt Notes FAQs"></el-option> 
                                            <el-option label="Suppliers FAQs" value="Suppliers FAQs"></el-option> 
                                            <el-option label="Rate Contract FAQs" value="Rate Contract FAQs"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Question Title" prop="question_title">
                                        <el-input v-model="FAQDetails.question_title" placeholder="Enter Question Title"></el-input>
                                    </el-form-item>
                                </div>
                            </div>
							
							<div class="col-lg-12">
                                <div class="grid-content">
		                            <el-form-item label="Enter Descriptive Explanation" prop="question_description">
		                                
		                                <el-input
		                                    type="textarea"
		                                    :rows="5"
		                                    placeholder="Enter Descriptive Explanation."
		                                    v-model="FAQDetails.question_description">
		                                </el-input>
		                                
		                            </el-form-item>
		                        </div>
		                    </div>

		                    <div class="col-lg-12">
								<hr>
                                <button type="button" @click="SubmitFAQCreation" class="btn btn-success btn-block waves-effect text-center">Create FAQ</button>
		                    </div>
		                </div>
		            </el-form>
                </div>
            </div>
        </div>


        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Frequently Asked Questions List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="FAQsTable" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Visible</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="FAQModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="FAQModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Question Number: {{ ViewModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">

                                <el-form :model="FAQDetailsModal" class="demo-form-inline" :rules="FormRules" ref="FAQEditForm">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="grid-content">
                                                <el-form-item label="Select Question Category" prop="edit_question_category">
                                                    <el-select style="width: 100%; padding: 0px;" v-model="FAQDetailsModal.edit_question_category" placeholder="Select Question Cateogry">
                                                        <el-option label="Process FAQs" value="Process FAQs"></el-option> 
                                                        <el-option label="Dashboard FAQs" value="Dashboard FAQs"></el-option> 
                                                        <el-option label="System Access FAQs" value="System Access FAQs"></el-option> 
                                                        <el-option label="Purchase Enquiry FAQs" value="Purchase Enquiry FAQs"></el-option> 
                                                        <el-option label="Item Master FAQs" value="Item Master FAQs"></el-option> 
                                                        <el-option label="Quotations FAQs" value="Quotations FAQs"></el-option> 
                                                        <el-option label="Purchase Orders FAQs" value="Purchase Orders FAQs"></el-option> 
                                                        <el-option label="Receipt Notes FAQs" value="Receipt Notes FAQs"></el-option> 
                                                        <el-option label="Suppliers FAQs" value="Suppliers FAQs"></el-option> 
                                                        <el-option label="Rate Contract FAQs" value="Rate Contract FAQs"></el-option> 
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="grid-content">
                                                <el-form-item label="Question Title" prop="edit_question_title">
                                                    <el-input v-model="FAQDetailsModal.edit_question_title" placeholder="Enter Question Title"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            <div class="grid-content">
                                                <el-form-item label="Enter Descriptive Explanation" prop="edit_question_description">
                                                    
                                                    <el-input
                                                        type="textarea"
                                                        :rows="5"
                                                        placeholder="Enter Descriptive Explanation."
                                                        v-model="FAQDetailsModal.edit_question_description">
                                                    </el-input>
                                                    
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <hr>
                                            <button type="button" @click="SubmitFAQEdit" class="btn btn-success btn-block waves-effect text-center">Edit FAQ</button>
                                        </div>
                                    </div>
                                </el-form>
                            	<!-- <h4><b>Question Category:</b> <br><br><span class="text-muted">- {{ ViewModalInfo.question_category }}</span></h4><hr>
                            	<h4><b>Question Title:</b> <br><br><span class="text-muted">- {{ ViewModalInfo.question_title }}</span></h4><hr>
                            	<h4><b>Question Description:</b> </h4><p class="text-muted" v-html="ViewModalInfo.question_description"></p> -->
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
		name: "frequently-asked-questions",
		data() {
			return {
				DataTable: "",
				viewDataLoaded: false,
				ViewModalInfo: {},
				FAQDetails:{
                    question_category: "",
                    question_title: "",
                    question_description: "",
                },
                FAQDetailsModal:{
                    edit_question_id: "",
					edit_question_category: "",
					edit_question_title: "",
					edit_question_description: "",
				},
				FormRules: {
                    question_category: [{
                        required: true,
                        message: "Question Category",
                        trigger: ["blur", "change"]
                    }],
                    question_title: [{
                        required: true,
                        message: "Question Title is required",
                        trigger: ["blur", "change"]
                    }],
                    question_description: [{
                        required: true,
                        message: "Description is required.",
                        trigger: ["blur", "change"]
                    }],
				}
			}
		},
        computed: {
            
        },
		methods: {

			showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/system_management/get_faq_record_details', {recordId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.FAQDetailsModal.edit_question_id = this.ViewModalInfo.id;
                        this.FAQDetailsModal.edit_question_category = this.ViewModalInfo.question_category;
                        this.FAQDetailsModal.edit_question_title = this.ViewModalInfo.question_title;

                        this.FAQDetailsModal.edit_question_description = this.ViewModalInfo.question_description.replace(/<br>/g,'\r\n');

                        this.viewDataLoaded = true;
                        $('#FAQModalEdit').modal('toggle');
                    })

                this.viewDataLoaded = false;  
            },

			SubmitFAQCreation(){
                this.$refs.FAQCreationForm.validate((validation) => {

                    if(validation){

                        this.FAQDetails.question_description = this.FAQDetails.question_description.replace(/\r\n|\r|\n/g,'<br>');

                        axios.post('/api/system_management/create_frequently_asked_question', this.FAQDetails)
                            .then((response) => {
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                this.FAQDetails.question_category = "";
                                this.FAQDetails.question_title = "";
                                this.FAQDetails.question_description = "";

                                this.DataTable.draw('full-hold');

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                            });
                        
                    }

                })
            },

            SubmitFAQEdit(){
				this.$refs.FAQEditForm.validate((validation) => {

                    if(validation){

                    	this.FAQDetailsModal.edit_question_description = this.FAQDetailsModal.edit_question_description.replace(/\r\n|\r|\n/g,'<br>');

                    	axios.post('/api/system_management/edit_frequently_asked_question', this.FAQDetailsModal)
                            .then((response) => {
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                this.FAQDetailsModal.edit_question_id = "";
                                this.FAQDetailsModal.edit_question_category = "";
								this.FAQDetailsModal.edit_question_title = "";
								this.FAQDetailsModal.edit_question_description = "";

								this.DataTable.draw('full-hold');

                                $('#FAQModalEdit').modal('toggle');

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                            });
						
                    }

                })
			}
		},
		mounted(){

			const table = $('#FAQsTable').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/system_management/get_faqs_list',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'question_category', name: 'question_category' },
                    { data: 'question_title', name: 'question_title' },
                    { 
                    	data: 'question_description', 
                    	name: 'question_description', 
	              //       render: function(data, type, row){
			            // 	return data.split("<br/>").join("<br>");
			            // }
		        	},
                    { data: 'active', name: 'active' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 1, 'ASC' ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    // {  extend: 'csv', text:   '<i class="fa fa-file-text-o"></i>', title:  'NewItemApprovals' },
                    { extend: 'excel', className: 'btn btn-success', title: 'FAQsList' },
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
                } 
            });

            const self = this

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showViewModal(RecordID);
            });

            self.DataTable = table;


            $('tbody', this.$refs.table).on('click', '.FAQDeactivate', function(){
                var $this = $(this);
                var FAQID = $(this).data('faqid');

                axios.post('/api/system_management/deactivate_frequently_asked_question', [FAQID])
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        table.draw('full-hold');
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                
            });


            $('tbody', this.$refs.table).on('click', '.FAQReactivate', function(){
                var $this = $(this);
                var FAQID = $(this).data('faqid');

                axios.post('/api/system_management/reactivate_frequently_asked_question', [FAQID])
                    .then((response) => {
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        table.draw('full-hold');
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                
            });
			
		}
	}
</script>


<style>
	
	.el-select-dropdown__wrap {
        max-height: 1000px !important;
    }

    .el-select-dropdown {
        min-width: 60% !important
    }

    .font-500{
        font-weight: 500;
    }

    #FAQModalEdit .modal-dialog {
        min-width:80%;
    }

</style>