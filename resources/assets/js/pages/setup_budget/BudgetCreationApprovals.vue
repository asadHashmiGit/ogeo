<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Item Creation Approvals</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewItemApprovals" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Item #</th>
                                <th>Created By</th>
                                <th>Description</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="ItemCreationValidationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationValidationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Details | Item Number: {{ ViewModalInfo.item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Number (ID):</b></td>
                                        <td>IM-{{ ViewModalInfo.item_group_id }}</td>
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
                                        <td><b>Creation Request ID: </b></td>
                                        <td v-if="ViewModalInfo.creation_request_id !== null">{{ ViewModalInfo.creation_request_id }}</td>
                                        <td v-else>Not From Request</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Previous Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr v-if="ViewModalInfo.item_template.field_1 !== 'Ogeo-None'">
                                        <td style="width: 30%"><b>{{ ViewModalInfo.item_template.field_1 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_1 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_2 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_2 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_2 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_3 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_3 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_3 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_4 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_4 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_4 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_5 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_5 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_5 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_6 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_6 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_6 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_7 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_7 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_7 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_8 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_8 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_8 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_9 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_9 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_9 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_10 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_10 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_10 }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Description: </b></td>
                                        <td>{{ ViewModalInfo.description }}</td>
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
                                        <th>Item ID</th>
                                        <th>Action Description</th>
                                        <th>Prev Action By</th>
                                        <th>Next Action By</th>
                                        <th>Previous Approval Level</th>
                                        <th>Next Approval Level</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-if="ViewModalInfo.creation_request_id !== null">
                                    <tr v-for="(item, key) in ViewModalInfo.item_creation_request.history" :key="item.id">
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
                                    </template>
                                    <template v-else>
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
                                    </template>
                                </tbody>
                            </table>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="ItemCreationValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Details | Item Number: {{ EditModalInfo.item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Number (ID):</b></td>
                                        <td>IM-{{ EditModalInfo.item_group_id }}</td>
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
                                        <td><b>Creation Request ID: </b></td>
                                        <td v-if="EditModalInfo.creation_request_id !== null">{{ EditModalInfo.creation_request_id }}</td>
                                        <td v-else>Not From Request</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ EditModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Previous Approval Level: </b></td>
                                        <td>{{ EditModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr v-if="EditModalInfo.item_template.field_1 !== 'Ogeo-None'">
                                        <td style="width: 30%"><b>{{ EditModalInfo.item_template.field_1 }}: </b></td>
                                        <td>{{ EditModalInfo.field_1 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_2 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_2 }}: </b></td>
                                        <td>{{ EditModalInfo.field_2 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_3 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_3 }}: </b></td>
                                        <td>{{ EditModalInfo.field_3 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_4 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_4 }}: </b></td>
                                        <td>{{ EditModalInfo.field_4 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_5 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_5 }}: </b></td>
                                        <td>{{ EditModalInfo.field_5 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_6 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_6 }}: </b></td>
                                        <td>{{ EditModalInfo.field_6 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_7 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_7 }}: </b></td>
                                        <td>{{ EditModalInfo.field_7 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_8 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_8 }}: </b></td>
                                        <td>{{ EditModalInfo.field_8 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_9 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_9 }}: </b></td>
                                        <td>{{ EditModalInfo.field_9 }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.item_template.field_10 !== 'Ogeo-None'">
                                        <td><b>{{ EditModalInfo.item_template.field_10 }}: </b></td>
                                        <td>{{ EditModalInfo.field_10 }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Description: </b></td>
                                        <td>{{ EditModalInfo.description }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <el-form :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationValidationForm">

                                   <!--  <div class="col-lg-12">
                                        <div class="grid-content">
                                            <el-form-item label="Approve Or Reject Request" prop="Decision">
                                                <el-select @change="DecisionSelection" style="width: 100%; padding: 0px;" v-model="ValidationInfo.Decision" placeholder="Select Yes/No">
                                                      <el-option label="Approve" value="Approved"></el-option>
                                                      <el-option label="Reject" value="Rejected"></el-option>
                                                </el-select>
                                            </el-form-item>
                                        </div> 
                                    </div> -->

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
                                        <button type="button" @click="ItemCreationDecision" class="btn btn-primary btn-block waves-effect">Submit Decision</button>
                                    </div> -->
                                    
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

    import validate from 'validate.js';

    export default {
        name: 'item-creation-approvals',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                ValidationInfo: {
                    ItemId: "",
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
                        message: "Decision Notes are required in case of rejection.",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true
                        $('#ItemCreationValidationModalView').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.ValidationInfo.ItemId = this.EditModalInfo.id;
                        this.editDataLoaded = true;
                        $('#ItemCreationValidationModalEdit').modal('toggle');
                    })

                this.editDataLoaded = false;
            },
            DecisionApprove(){
                this.ValidationInfo.Decision = "Approved";
                axios.post('/api/users/validate_item_creation', this.ValidationInfo)
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 10000
                        });

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                    });

                this.$nextTick(() => {
                    $('#ItemCreationValidationModalEdit').modal('toggle');
                    this.rules.DecisionNotes[0].required = false;
                    this.DataTable.draw('full-hold');
                });

            },
            DecisionReject(){

                this.rules.DecisionNotes[0].required = true;
                this.ValidationInfo.Decision = "Rejected";
                this.$refs.ItemCreationValidationForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/users/validate_item_creation', this.ValidationInfo)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });
                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                            });

                        

                        this.$nextTick(() => {
                            $('#ItemCreationValidationModalEdit').modal('toggle');
                            this.rules.DecisionNotes[0].required = false;
                            this.DataTable.draw('full-hold');
                        });

                    }
                })
            },
            // DecisionSelection(value){
            //     if(value == "Rejected"){
            //         this.rules.DecisionNotes[0].required = true;
            //     } else {
            //         this.rules.DecisionNotes[0].required = false;
            //     }
            // },
            // ItemCreationDecision(){

            //     this.$refs.ItemCreationValidationForm.validate((validation) => {
            //         if(validation){
            //             axios.post('/api/users/validate_item_creation', this.ValidationInfo)
            //                 .then(function(response){
            //                     Swal({ 
            //                         type: response.data.messageType, 
            //                         title: response.data.messageTitle, 
            //                         text: response.data.message,
            //                         showConfirmButton: true,
            //                         timer: 10000
            //                     });
            //                 })
            //                 .catch(function(){
            //                     Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
            //                 });

            //             this.rules.DecisionNotes[0].required = false;

            //             $('#ItemCreationValidationModalEdit').modal('toggle');
            //             this.DataTable.draw('full-hold');

            //         }
            //     })
                
            // },
        },
        mounted(){

            const table = $('#NewItemApprovals').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_approvers_new_item_validation_list',
                columns: [
                    { data: 'item_group_id', name: 'item_group_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'description', name: 'description' },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'NewItemApprovals' },
                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                ],
                "language": {
                    processing: 'Loading Data... <i class="fa fa-spinner fa-spin fa-fw"></i>'
                },    
            });

            const self = this

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


<style>

    .font-500{
        font-weight: 500;
    }

    #ItemCreationValidationModalView .modal-dialog {
        min-width:80%;
    }

    #ItemCreationValidationModalEdit .modal-dialog {
        min-width:80%;
    }

</style>