<template>
		
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>My Item Item Creations</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="ItemCreations" class="display responsive table table-bordered table-hover" style="width:100%">
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

        <div id="ItemCreationModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Details | Item Number: {{ ViewModalInfo.id }} (View)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Number (ID):</b></td>
                                        <td>IM-{{ ViewModalInfo.id }}</td>
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
                                        <td><b>Current Approval Level: </b></td>
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
                                    <tr v-if="ViewModalInfo.item_template.field_11 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_11 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_11 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_12 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_12 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_12 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_13 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_13 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_13 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_14 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_14 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_14 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_15 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_15 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_15 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_16 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_16 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_16 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_17 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_17 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_17 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_18 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_18 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_18 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_19 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_19 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_19 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_20 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_20 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_20 }}</td>
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
                                        <th>Action By</th>
                                        <th>Next Action By</th>
                                        <th>Current Approval Level</th>
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



        <div id="ItemCreationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Item Creation Request ID: {{ EditModalInfo.id }} (Edit)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body"  v-if="editDataLoaded">
                        <el-form :model="NewItemInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationForm">
                            <div class="row">


                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_1 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_1" prop="field_1">
                                            <el-input v-model="NewItemInfo.field_1"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_2 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_2" prop="field_2">
                                            <el-input v-model="NewItemInfo.field_2"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_3 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_3" prop="field_3">
                                            <el-input v-model="NewItemInfo.field_3"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_4 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_4" prop="field_4">
                                            <el-input v-model="NewItemInfo.field_4"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_5 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_5" prop="field_5">
                                            <el-input v-model="NewItemInfo.field_5"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_6 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_6" prop="field_6">
                                            <el-input v-model="NewItemInfo.field_6"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_7 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_7" prop="field_7">
                                            <el-input v-model="NewItemInfo.field_7"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_8 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_8" prop="field_8">
                                            <el-input v-model="NewItemInfo.field_8"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_9 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_9" prop="field_9">
                                            <el-input v-model="NewItemInfo.field_9"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_10 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_10" prop="field_10">
                                            <el-input v-model="NewItemInfo.field_10"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_11 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_11" prop="field_11">
                                            <el-input v-model="NewItemInfo.field_11"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_12 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_12" prop="field_12">
                                            <el-input v-model="NewItemInfo.field_12"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_13 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_13" prop="field_13">
                                            <el-input v-model="NewItemInfo.field_13"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_14 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_14" prop="field_14">
                                            <el-input v-model="NewItemInfo.field_14"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_15 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_15" prop="field_15">
                                            <el-input v-model="NewItemInfo.field_15"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_16 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_16" prop="field_16">
                                            <el-input v-model="NewItemInfo.field_16"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_17 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_17" prop="field_17">
                                            <el-input v-model="NewItemInfo.field_17"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_18 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_18" prop="field_18">
                                            <el-input v-model="NewItemInfo.field_18"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_19 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_19" prop="field_19">
                                            <el-input v-model="NewItemInfo.field_19"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>

                                <div class="col-lg-4" v-if="EditModalInfo.item_template.field_20 !== 'Ogeo-None'">
                                    <div class="grid-content">
                                        <el-form-item :label="'1. Select '+EditModalInfo.item_template.field_20" prop="field_20">
                                            <el-input v-model="NewItemInfo.field_20"></el-input>
                                        </el-form-item>
                                    </div>
                                </div>
                                

                                <div class="col-lg-12">
                                    <el-upload
                                        action="#"
                                        list-type="picture-card"
                                        :limit="3"
                                        id='UploadDocuments'
                                        :auto-upload="false"
                                        ref="UploadDocuments"
                                        :on-exceed="handleExceed"
                                        :on-remove="handleRemove">
                                        <i class="el-icon-plus"></i>
                                    </el-upload>
                                    <span>You can upload maximum of 3 images per item.</span>
                                </div>

                                <div class="col-lg-12">
                                    <hr>
                                    <button type="button" @click="SubmitNewItemCreation" class="btn btn-success btn-block waves-effect text-center">Create New Item</button>

                                </div>

                                <el-col :span="24">
                                    <hr>
                                    <button type="button" @click="CancelItemCreation" class="btn btn-danger btn-block waves-effect text-center">Cancel Item Creation</button>
                                </el-col>


                            </div>
                        </el-form>
                    </div>
                </div>
            </div>
        </div>

    </div>
	
</template>


<script>
	
	import validateJs from 'validate.js';

	export default {
		name: 'item-creations',
		data(){

			return{
                DataTable: "",
                viewDataLoaded: false,
				editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                NewItemInfo: {
                    ExistingProjectId: "",
                    ExistingTemplateID: "",
                    ExistingItemId: "",
                    ItemDescription: "",
                    field_1: "",
                    field_2: "",
                    field_3: "",
                    field_4: "",
                    field_5: "",
                    field_6: "",
                    field_7: "",
                    field_8: "",
                    field_9: "",
                    field_10: "",
                    field_11: "",
                    field_12: "",
                    field_13: "",
                    field_14: "",
                    field_15: "",
                    field_16: "",
                    field_17: "",
                    field_18: "",
                    field_19: "",
                    field_20: "",
                },
                rules: {
                    ItemDescription: [{
                        required: true,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    field_1: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_2: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_3: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_4: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_5: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_6: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_7: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_8: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_9: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_10: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_11: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_12: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_13: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_14: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_15: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_16: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_17: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_18: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_19: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    field_20: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                }  
			}
		},
		methods: {

            CancelItemCreation(){
                axios.post( '/api/users/cancel_item_creation_by_originator', {ItemId: this.NewItemInfo.ExistingItemId})
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

                $('#ItemCreationModalEdit').modal('toggle');
                this.DataTable.draw('full-hold');


            },

            SubmitNewItemCreation() {

                this.$refs.ItemCreationForm.validate((validation) => {

                    if(validation){

                        let formData = new FormData();

                        if(!this.$refs.UploadDocuments.uploadFiles[0]){
                            Swal('Item Picture Required', 'You must upload atleast one picutre for the item', 'warning')
                            return false;
                        }

                        for( var i = 0; i < this.$refs.UploadDocuments.uploadFiles.length; i++ ){
                            let file = this.$refs.UploadDocuments.uploadFiles[i].raw;
                            formData.append('ItemPictures['+i+']', file);
                        }

                        //description defining
                        this.NewItemInfo.ItemDescription = this.NewItemInfo.field_1 +' | '+this.NewItemInfo.field_2;

                        formData.append('NewItemInfo', JSON.stringify(this.NewItemInfo));

                        axios.post( '/api/users/item_master_creation',
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
                                timer: 10000
                            });



                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationResubmittionForm)', 'error');
                        });

                        this.DataTable.draw('full-hold');
                        $('#ItemCreationModalEdit').modal('toggle');
                        

                    }

                })

                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is ' + fileList.length + ' Picture', 'The limit is ' + fileList.length + ' picture per item, if you would like to upload more than one image please Ogéo support team', 'warning')
                
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },


			showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
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
                        this.NewItemInfo = response.data;
                        this.NewItemInfo.ExistingProjectId = this.EditModalInfo.project_id;
                        this.NewItemInfo.ExistingItemId = this.EditModalInfo.id;
                        this.editDataLoaded = true

                        console.log(response.data);
                        console.log(this.NewItemInfo);

                        if(this.EditModalInfo.item_template.field_1_required == 'Yes'){
                            this.rules.field_1[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_2_required == 'Yes'){
                            this.rules.field_2[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_3_required == 'Yes'){
                            this.rules.field_3[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_4_required == 'Yes'){
                            this.rules.field_4[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_5_required == 'Yes'){
                            this.rules.field_5[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_6_required == 'Yes'){
                            this.rules.field_6[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_7_required == 'Yes'){
                            this.rules.field_7[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_8_required == 'Yes'){
                            this.rules.field_8[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_9_required == 'Yes'){
                            this.rules.field_9[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_10_required == 'Yes'){
                            this.rules.field_10[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_11_required == 'Yes'){
                            this.rules.field_11[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_12_required == 'Yes'){
                            this.rules.field_12[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_13_required == 'Yes'){
                            this.rules.field_13[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_14_required == 'Yes'){
                            this.rules.field_14[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_15_required == 'Yes'){
                            this.rules.field_15[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_16_required == 'Yes'){
                            this.rules.field_16[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_17_required == 'Yes'){
                            this.rules.field_17[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_18_required == 'Yes'){
                            this.rules.field_18[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_19_required == 'Yes'){
                            this.rules.field_19[0].required = true;
                        }
                        if(this.EditModalInfo.item_template.field_20_required == 'Yes'){
                            this.rules.field_20[0].required = true;
                        }

                        $('#ItemCreationModalEdit').modal('toggle');
                    })

                    this.editDataLoaded = false

            },

            
		},
		mounted(){

			const table = $('#ItemCreations').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_item_creation',
                columns: [
                    { data: 'id', name: 'id' },
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
                    // {  extend: 'csv', text:   '<i class="fa fa-file-text-o"></i>', title:  'NewItemApprovals' },
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemCreationList' },
                    { extend: 'pdf', className: 'btn btn-success', title: 'ItemCreationList' },
                    { extend: 'print', className: 'btn btn-success',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');
                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                        }
                    },
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