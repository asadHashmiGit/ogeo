<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>List Of Requests To Update Library of Materials</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewItemCreationRequests" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Set-up</th>
                                <th>Requester</th>
                                <th>Description</th>
                                <th>URL</th>
                                <th>Created At</th>
                                <th>Last Updated At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <!-- <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tfoot> -->
                    </table>
                    
                </div>
            </div>
        </div>


        <div id="ItemCreationRequestModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationRequestModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Request To Update The Library Of Materials ID: {{ ViewModalInfo.item_request_group_id }} </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        
                        <div class="col-lg-6">
                            <h4 style="color: #FF2F2F">Request Details</h4>
                            <table class="table">
                                <tr>
                                    <td><b>Set-up Name: </b></td>
                                    <td>{{ ViewModalInfo.project.title }}</td>
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
                                    <td><b>Item Request Description: </b></td>
                                    <td>{{ ViewModalInfo.item_description }}</td>
                                </tr>
                                <tr>
                                    <td><b>Available Files: </b></td>
                                    <td>
                                        <a v-if="ViewModalInfo.file1" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+ViewModalInfo.file1" download> File 1</a>
                                        <a v-if="ViewModalInfo.file2" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+ViewModalInfo.file2" download>File 2</a>
                                        <a v-if="ViewModalInfo.file3" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+ViewModalInfo.file3" download>File 3</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Status: </b></td>
                                    <td>{{ ViewModalInfo.status }}</td>
                                </tr>
                            </table>
                        </div>

                    
                        <div class="col-lg-12" v-if="ViewModalInfo.item">
                            <hr> 
                            <h4 style="color: #FF2F2F">Suggested Listing Details <i style="font-size: 14px">(When It Was Recommened for Addition to The Library of Materials)</i></h4>
                            <table class="table">
                                <tr>
                                    <td><b>Created Item Description: </b></td>
                                    <td>
                                        <template v-for="index in 20">    
                                            <span v-if="ViewModalInfo.item.item_template['field_'+(index)] !== 'Ogeo-None'">
                                                <b>{{ ViewModalInfo.item.item_template['field_'+(index)] }}:</b> {{ ViewModalInfo.item['field_'+(index)] }} | 
                                            </span>
                                        </template>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Created At: </b></td>
                                    <td>{{ ViewModalInfo.item.created_at }}</td>
                                </tr>
                            </table>
                        </div>


                        <div class="col-lg-12">
                            <hr>
                            <h4 style="color: #FF2F2F">History</h4>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th><b>#</b></th>
                                        <th><b>Action Description</b></th>
                                        <th><b>Action By</b></th>
                                        <th><b>Action Level</b></th>
                                        <th><b>Desision - Notes</b></th>
                                        <th><b>Action Date</b></th>
                                        <th><b>Time Span Between Action</b></th>
                                        <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Description</b></th>
                                        <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Action By</b></th>
                                        <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Approval Level</b></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ item.current_action_description }}</td>
                                        <td>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td>{{ item.decision }} - {{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                        <td v-if="key == 0">Not Applicable</td>
                                        <!-- <td v-else>{{ item.created_at }}</td> -->
                                        <td v-else>{{ item.created_at | getDifference(ViewModalInfo.history[key-1].created_at) }}</td>
                                        <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_action_description }}</td>
                                        <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_action_owners }}</td>
                                        <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_approval_level }}</td>
                                        
                                    </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>


                        <div class="col-lg-12">
                            <hr>
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <span><b>By:</b> {{ currentUser.Name }}</span><br><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div id="ItemCreationRequestModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationRequestModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Request To Update The Library Of Materials ID: {{ EditModalInfo.item_request_group_id }} </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body"  v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <h4 style="color: #FF2F2F">Request Details</h4>
                                <table class="table">
                                    <tr>
                                        <td><b>Set-up Name: </b></td>
                                        <td>{{ EditModalInfo.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requester Name: </b></td>
                                        <td>{{ EditModalInfo.requester.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Link: </b></td>
                                        <td><a target="_blank" :href="EditModalInfo.item_link">Item Link</a></td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Request Description: </b></td>
                                        <td>{{ EditModalInfo.item_description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Available Files: </b></td>
                                        <td>
                                            <a v-if="EditModalInfo.file1" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+EditModalInfo.file1" download> File 1</a>
                                            <a v-if="EditModalInfo.file2" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+EditModalInfo.file2" download>File 2</a>
                                            <a v-if="EditModalInfo.file3" class="btn btn-success" :href="'/uploads/NewItemCreationRequests/'+EditModalInfo.file3" download>File 3</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                </table>
                            </div>

                        
                            <div class="col-lg-12" v-if="EditModalInfo.item">
                                <hr> 
                                <h4 style="color: #FF2F2F">Suggested Listing Details <i style="font-size: 14px">(In Case The Addition to The Library of Materials is Approved)</i></h4>
                                <table class="table">
                                    <tr>
                                        <td><b>Created Item Description: </b></td>
                                        <td>
                                            <template v-for="index in 20">    
                                                <span v-if="EditModalInfo.item.item_template['field_'+(index)] !== 'Ogeo-None'">
                                                    <b>{{ EditModalInfo.item.item_template['field_'+(index)] }}:</b> {{ EditModalInfo.item['field_'+(index)] }} | 
                                                </span>
                                            </template>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Created At: </b></td>
                                        <td>{{ EditModalInfo.item.created_at }}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-12 b-l" v-if="EditModalInfo.status.indexOf('Created and Assigned to the Library of Materials Administrator') !== -1 || EditModalInfo.status.indexOf('Resubmitted and Assigned') !== -1">
                                <hr>
                                <h4 style="color: #FF2F2F">Create New Request To Update The Library Of Materials</h4>
                                    
                                <el-form :model="NewItemInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationForm">
                                    <div class="row">
                                        
                                        <div class="col-lg-12">
                                            <div class="grid-content">
                                                <el-form-item label="temp">
                                                    <span slot="label"><b>Select A Template To Create The Item</b></span>
                                                    <el-select style="width: 100%; padding: 0px;"
                                                        v-model="NewItemInfo.TemplateID" 
                                                        filterable
                                                        @change="GetTemplateStructure"
                                                        placeholder="Select A Template">

                                                        <el-option v-for="(option, key) in TemplatesList" 
                                                            :key="key" 
                                                            :label="option" 
                                                            :value="key">
                                                        </el-option>
                                                        
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </div>

                                    </div>

                                    

                                    <div class="row" v-if="TemplateDetailsLoaded">


                                        <div class="col-lg-4">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="UnitOfMeasure">
                                                    <span slot="label"><b>Unit of Measure</b></span>
                                                    <el-input ref="UnitOfMeasure" v-model="NewItemInfo.UnitOfMeasure" placeholder="Enter Unit of Measure"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_1 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_1">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_1 }}</b></span>
                                                    <el-input ref="Template_Name" v-model="NewItemInfo.ItemField_1" :placeholder="'Enter '+ItemMasterSetupInfo.field_1"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_2 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_2">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_2 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_2" :placeholder="'Enter '+ItemMasterSetupInfo.field_2"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_3 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_3">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_3 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_3" :placeholder="'Enter '+ItemMasterSetupInfo.field_3"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_4 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_4">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_4 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_4" :placeholder="'Enter '+ItemMasterSetupInfo.field_4"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_5 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_5">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_5 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_5" :placeholder="'Enter '+ItemMasterSetupInfo.field_5"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_6 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_6">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_6 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_6" :placeholder="'Enter '+ItemMasterSetupInfo.field_6"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_7 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_7">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_7 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_7" :placeholder="'Enter '+ItemMasterSetupInfo.field_7"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_8 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_8">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_8 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_8" :placeholder="'Enter '+ItemMasterSetupInfo.field_8"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_9 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_9">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_9 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_9" :placeholder="'Enter '+ItemMasterSetupInfo.field_9"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_10 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_10">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_10 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_10" :placeholder="'Enter '+ItemMasterSetupInfo.field_10"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_11 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_11">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_11 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_11" :placeholder="'Enter '+ItemMasterSetupInfo.field_11"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_12 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_12">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_12 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_12" :placeholder="'Enter '+ItemMasterSetupInfo.field_12"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_13 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_13">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_13 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_13" :placeholder="'Enter '+ItemMasterSetupInfo.field_13"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_14 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_14">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_14 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_14" :placeholder="'Enter '+ItemMasterSetupInfo.field_14"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_15 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_15">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_15 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_15" :placeholder="'Enter '+ItemMasterSetupInfo.field_15"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_16 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_16">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_16 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_16" :placeholder="'Enter '+ItemMasterSetupInfo.field_16"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_17 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_17">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_17 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_17" :placeholder="'Enter '+ItemMasterSetupInfo.field_17"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_18 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_18">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_18 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_18" :placeholder="'Enter '+ItemMasterSetupInfo.field_18"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_19 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_19">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_19 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_19" :placeholder="'Enter '+ItemMasterSetupInfo.field_19"></el-input>
                                                </el-form-item>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_20 != 'Ogeo-None'">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemField_20">
                                                    <span slot="label"><b>Enter {{ ItemMasterSetupInfo.field_20 }}</b></span>
                                                    <el-input  v-model="NewItemInfo.ItemField_20" :placeholder="'Enter '+ItemMasterSetupInfo.field_20"></el-input>
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
                                                :on-exceed="handleExceedItemCreation"
                                                :on-remove="handleRemove">
                                                <i class="el-icon-plus"></i>
                                            </el-upload>
                                            <span>You can upload maximum of 3 images per item.</span>
                                        </div>


                                        <div class="col-lg-12">
                                            
                                            <button type="button" @click="SubmitNewItemCreation" class="btn btn-success btn-block waves-effect text-center">Approve and Assign to Validator</button>

                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-lg-12">
                                            <br>
                                            <button type="button" @click="ShowRejectionForm" :class="[ShowRejectionNotes ? 'btn-primary' : 'btn-danger' ]" class="btn  btn-block waves-effect text-center">{{ RejectionButton }}</button>
                                            
                                            <br><br>
                                            
                                            <div v-if="ShowRejectionNotes" class="grid-content">
                                                
                                                <el-input
                                                    type="textarea"
                                                    :rows="4"
                                                    placeholder="Enter Rejection Notes"
                                                    v-model="ItemRejectionNote">
                                                </el-input>

                                            <br><br>

                                            <button type="button" @click="RejectItemRequest" class="btn btn-danger btn-block waves-effect text-center">Submit Rejection</button>

                                            </div>
                                        </div>
                                    </div>


                                </el-form>
                            </div> 

                            <div class="col-lg-12" v-if="EditModalInfo.status.indexOf('Rejected By') !== -1">
                                <el-form :model="ItemCreationResubmission" class="demo-form-inline" :rules="ItemCreationResubmissionRules" ref="ItemCreationRequestForm">

                                    <el-row :gutter="24">

                                        <transition v-if="CompanyDetails.setup_mode == 'Project Wise'">
                                            <el-col :span="24">
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="ProjectId">
                                                        <span slot="label"><b>Select Set-up</b></span>

                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="ItemCreationResubmission.ProjectId" placeholder="Select Set-up">
                                                            
                                                            <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Project Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </transition>


                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemDescription">
                                                    <span slot="label"><b>Enter Description of The Required Item</b></span>

                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                            
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
                                                        v-model="ItemCreationResubmission.ItemDescription">
                                                    </el-input>
                                                    
                                                </el-form-item>
                                            </div>

                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemLink">
                                                    <span slot="label"><b>Enter Item Link (If Available)</b></span>
                                                    <el-input v-model="ItemCreationResubmission.ItemLink" placeholder="http://www.itemsinfo.com/itemlink/232/wsd"></el-input>
                                                </el-form-item>
                                            </div>

                                            
                                            <div style="width: 100%" class="grid-content">
                                                <el-form-item style="margin-bottom: 0px;" label="temp" prop="ItemDocuments">
                                                    <span slot="label"><b>Upload Item's Related Documents</b></span>
                                                </el-form-item>

                                                    <el-upload
                                                        class="upload-demo"
                                                        id='UploadDocumentsResubmit'
                                                        :auto-upload="false"
                                                        ref="UploadDocumentsResubmit"
                                                        multiple
                                                        action="#"
                                                        :limit="3"
                                                        :on-exceed="handleExceedResubmittion"
                                                        :file-list="ItemCreationResubmission.ItemDocuments">

                                                        <button type="button" slot="trigger" class="btn btn-success">Select File</button>
                                                      
                                                        <div class="el-upload__tip" slot="tip">Any file type is accepted with a size less than 3Mb (Max 3 Files)</div>
                                                    </el-upload>

                                                

                                            </div>

                        
                                        </el-col>


                                        
                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="SubmitItemCreationRequestResubmit" class="btn btn-success btn-block waves-effect text-center">Create New Request To Update The Library Of Materials</button>
                                        </el-col>


                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="CancelItemCreationRequestResubmit" class="btn btn-danger btn-block waves-effect text-center">Cancel Request To Update The Library Of Materials</button>
                                        </el-col>

                                    </el-row>
                                </el-form>
                            </div>





                            <div class="col-lg-12" v-if="EditModalInfo.status.indexOf('Assigned to Validator') !== -1">
                                <hr>
                                <h4 style="color: #FF2F2F">Validator Decision</h4>
                                <el-form :model="ValidationInfo" class="demo-form-inline" :rules="ItemApprovalRules" ref="ItemCreationValidationForm">
                            
                                    <div class="col-lg-12">
                                        <div class="grid-content">
                                            <el-form-item label="temp" prop="DecisionNotes">
                                                <span slot="label"><b>Enter Decision Notes</b></span>
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
                            
                                    
                                </el-form>
                            </div>
                        

                            <div class="col-lg-12">
                                <hr>
                                <h4 style="color: #FF2F2F">History</h4>   
                                <table class="display table table-bordered">
                                    <thead>
                                        <tr>
                                            <th><b>#</b></th>
                                            <th><b>Action Description</b></th>
                                            <th><b>Action By</b></th>
                                            <th><b>Action Level</b></th>
                                            <th><b>Desision - Notes</b></th>
                                            <th><b>Action Date</b></th>
                                            <th><b>Time Span Between Action</b></th>
                                            <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Description</b></th>
                                            <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Action By</b></th>
                                            <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action Approval Level</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <template>
                                        <tr v-for="(item, key) in EditModalInfo.history" :key="item.id">
                                            <td>{{ key + 1 }}</td>
                                            <td>{{ item.current_action_description }}</td>
                                            <td>{{ item.current_action_by.name }}</td>
                                            <td>{{ item.current_approval_level }}</td>
                                            <td>{{ item.decision }} - {{ item.decision_notes }}</td>
                                            <td>{{ item.created_at }}</td>
                                            <td v-if="key == 0">Not Applicable</td>
                                            <!-- <td v-else>{{ item.created_at }}</td> -->
                                            <td v-else>{{ item.created_at | getDifference(EditModalInfo.history[key-1].created_at) }}</td>
                                            <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_action_description }}</td>
                                            <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_action_owners }}</td>
                                            <td style="background-color: rgb(252, 51, 23, 0.2);">{{ item.next_approval_level }}</td>
                                            
                                        </tr>
                                        </template>
                                    </tbody>
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

    import validate from 'validate.js';

    export default {
        name: 'item-creation-requests',
        data(){

            var CheckURL = (rule, value, callback) => {
                if (this.isUrlValid(value)) {
                    callback();
                } else {

                    if(value == '' || value == null){
                        callback();
                    } else {
                        callback(new Error('Please Enter Valide URL. (e.g. http://ogeo.me/example Or http://www.ogeo.me/example)'));
                    }
                    
                }
            };

            return{
                DataTable: "",
                TemplatesList: {},
                JobNumbers: {},
                CompanyDetails: {},
                TemplateDetailsLoaded: false,
                ItemMasterSetupInfo: {},
                ShowRejectionNotes: false,
                ItemRejectionNote: "",
                RejectionButton: "Reject Request",
                editDataLoaded: false,
                viewDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                NewItemInfo: {
                    OldProjectId: "",
                    ItemRequestProjectId: "",
                    ItemRequestId: "",
                    ExistingItemId: "",
                    UnitOfMeasure: "",
                    TemplateID: "",
                    ItemField_1: "",
                    ItemField_2: "",
                    ItemField_3: "",
                    ItemField_4: "",
                    ItemField_5: "",
                    ItemField_6: "",
                    ItemField_7: "",
                    ItemField_8: "",
                    ItemField_9: "",
                    ItemField_10: "",
                    ItemField_11: "",
                    ItemField_12: "",
                    ItemField_13: "",
                    ItemField_14: "",
                    ItemField_15: "",
                    ItemField_16: "",
                    ItemField_17: "",
                    ItemField_18: "",
                    ItemField_19: "",
                    ItemField_20: "",
                },
                rules: {
                    TemplateID: [{
                        required: true,
                        message: "Please Select Template",
                        trigger: "blur"
                    }],
                    UnitOfMeasure: [{
                        required: true,
                        message: "Please Enter Unit of Measure",
                        trigger: "blur"
                    }],
                    ItemField_1: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_2: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_3: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_4: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_5: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_6: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_7: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_8: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_9: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_10: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_11: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_12: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_13: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_14: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_15: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_16: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_17: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_18: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_19: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                    ItemField_20: [{
                        required: false,
                        message: "Required Field",
                        trigger: "blur"
                    }],
                },
                ValidationInfo: {
                    ItemId: "",
                    Decision: "",
                    DecisionNotes: "",
                },
                ItemApprovalRules: {
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
                ItemCreationResubmission: {
                    ProjectId: "",
                    ItemCreationRequestId: "",
                    ItemId: "",
                    ItemDescription: "",
                    ItemLink: "",
                    ItemDocuments: []
                },
                ItemCreationResubmissionRules: {
                    ProjectId: [{
                        required: true,
                        message: "Please Select Set-up",
                        trigger: ["blur"]
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
                } 

            }
        },
        methods: {
            CancelItemCreationRequestResubmit(){

                let self = this;

                axios.post( '/api/users/cancel_item_request_by_originator', {ItemRequestId: this.ItemCreationResubmission.ItemCreationRequestId})
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        self.DataTable.ajax.reload( null, false );

                        self.$store.dispatch("update_user_pending_tasks")


                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                  
                    $('#ItemCreationRequestModalEdit').modal('toggle');
                   


            },  

            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },

            SubmitItemCreationRequestResubmit: function(){
                let self = this;

                if (event) event.preventDefault();

                this.$refs.ItemCreationRequestForm.validate((validation) => {

                    if(validation){

                        let formData = new FormData();

                        for( var i = 0; i < this.$refs.UploadDocumentsResubmit.uploadFiles.length; i++ ){
                            let file = this.$refs.UploadDocumentsResubmit.uploadFiles[i].raw;
                            formData.append('FileUploads['+i+']', file);
                        }
                        
                        // console.log(this.ItemCreationResubmission.ItemCreationRequestId);
                        
                        formData.append('ProjectId', this.ItemCreationResubmission.ProjectId);
                        formData.append('ItemId', this.ItemCreationResubmission.ItemCreationRequestId);
                        formData.append('ItemDescription', this.ItemCreationResubmission.ItemDescription);
                        formData.append('ItemLink', this.ItemCreationResubmission.ItemLink);

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

                            self.DataTable.ajax.reload( null, false );
                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                        });

                        $('#ItemCreationRequestModalEdit').modal('toggle');



                        this.ItemCreationResubmission.ProjectId = "";
                        this.ItemCreationResubmission.ItemCreationRequestId = "";
                        this.ItemCreationResubmission.ItemDescription = "";
                        this.ItemCreationResubmission.ItemLink = "";

                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.ItemCreationResubmission.ProjectId = Object.keys(this.JobNumbers)[0];
                        }

                    }

                });
                
            },
            handleExceedResubmittion(files, fileList) {
                Swal('The Limit is 3 Files', 'The limit is 3 files per request, you selected ' + files.length + ' file(s) this time, adding up to '+ parseInt(files.length + fileList.length) + ' totally', 'warning')
                
            },


            GetTemplateStructure(templateId){

                axios.post('/api/data/get_item_master_template_details', {TemplateID: templateId})
                .then((response) => {

                    this.ItemMasterSetupInfo = response.data;
                    this.TemplateDetailsLoaded = true;
                    
                    if(this.ItemMasterSetupInfo.field_1_required == 'Yes'){
                        this.rules.ItemField_1[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_2_required == 'Yes'){
                        this.rules.ItemField_2[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_3_required == 'Yes'){
                        this.rules.ItemField_3[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_4_required == 'Yes'){
                        this.rules.ItemField_4[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_5_required == 'Yes'){
                        this.rules.ItemField_5[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_6_required == 'Yes'){
                        this.rules.ItemField_6[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_7_required == 'Yes'){
                        this.rules.ItemField_7[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_8_required == 'Yes'){
                        this.rules.ItemField_8[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_9_required == 'Yes'){
                        this.rules.ItemField_9[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_10_required == 'Yes'){
                        this.rules.ItemField_10[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_11_required == 'Yes'){
                        this.rules.ItemField_11[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_12_required == 'Yes'){
                        this.rules.ItemField_12[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_13_required == 'Yes'){
                        this.rules.ItemField_13[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_14_required == 'Yes'){
                        this.rules.ItemField_14[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_15_required == 'Yes'){
                        this.rules.ItemField_15[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_16_required == 'Yes'){
                        this.rules.ItemField_16[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_17_required == 'Yes'){
                        this.rules.ItemField_17[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_18_required == 'Yes'){
                        this.rules.ItemField_18[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_19_required == 'Yes'){
                        this.rules.ItemField_19[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_20_required == 'Yes'){
                        this.rules.ItemField_20[0].required = true;
                    }

                })
                
            },

            ShowRejectionForm(){
                if(this.ShowRejectionNotes == false){
                    this.ShowRejectionNotes = true;
                    this.RejectionButton = "Close Rejection Form";
                } else {
                    this.ShowRejectionNotes = false;
                    this.ItemRejectionNote = "";
                    this.RejectionButton = "Reject Request";
                }
                
            },
            RejectItemRequest(){

                let self = this;

                if(this.ItemRejectionNote == ""){
                    Swal('Rejection Notes Are Required', 'Rejected Notes are required for successful rejection', 'warning');
                    return false;
                }

                axios.post('/api/users/reject_item_request_by_lma', {RejectionNotes: this.ItemRejectionNote, ItemRequestId: this.NewItemInfo.ItemRequestId})
                    .then(function(response){

                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                       
                        self.DataTable.ajax.reload( null, false );

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                    });

                    
                    $('#ItemCreationRequestModalEdit').modal('toggle');
                    

                    this.ItemRejectionNote = '';
                    this.ShowRejectionNotes = false;
               
               
            },

            SubmitNewItemCreation() {

                let self = this;

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
                                timer: 5000
                            });

                            self.DataTable.ajax.reload( null, false );
                            

                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm Code:001)', 'error');
                        });

                        
                        $('#ItemCreationRequestModalEdit').modal('toggle');
                        
                    }

                })

                
            },
            handleExceedItemCreation(files, fileList) {
                Swal('The Limit is ' + fileList.length + ' Picture', 'The limit is ' + fileList.length + ' picture per item, if you would like to upload more than one image please Ogéo support team', 'warning')
                
            },
            handleRemove(file, fileList) {
                // console.log(file, fileList);
            },
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#ItemCreationRequestModalView').modal('toggle');
                    })

                    // console.log(this.ViewModalInfo);

                this.viewDataLoaded = false;
                
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.NewItemInfo.ItemRequestId = this.EditModalInfo.id;
                        this.NewItemInfo.ItemRequestProjectId = this.EditModalInfo.project_id;
                        
                        if(this.EditModalInfo.item){
                            this.NewItemInfo.OldProjectId = this.EditModalInfo.project_id;
                            this.NewItemInfo.ExistingItemId = this.EditModalInfo.item.id;
                            this.ValidationInfo.ItemId = this.EditModalInfo.item.id;
                            this.ItemCreationResubmission.ItemId = this.EditModalInfo.item.id;
                        }


                        if(this.EditModalInfo.status.indexOf('Rejected By') !== -1){
                            
                            this.ItemCreationResubmission.ProjectId = this.EditModalInfo.project_id;
                            this.ItemCreationResubmission.ItemCreationRequestId = this.EditModalInfo.id;
                            this.ItemCreationResubmission.ItemDescription = this.EditModalInfo.item_description;
                            this.ItemCreationResubmission.ItemLink = this.EditModalInfo.item_link;
                            if(this.EditModalInfo.file1){
                                this.ItemCreationResubmission.ItemDocuments.push(this.EditModalInfo.file1);
                            }
                            if(this.EditModalInfo.file2){
                                this.ItemCreationResubmission.ItemDocuments.push(this.EditModalInfo.file2);
                            }
                            if(this.EditModalInfo.file3){
                                this.ItemCreationResubmission.ItemDocuments.push(this.EditModalInfo.file3);
                            }
                            
                        }
                        this.editDataLoaded = true

                        $('#ItemCreationRequestModalEdit').modal('toggle');
                    })

                    this.editDataLoaded = false

            },
            DecisionApprove(){

                let self = this;

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

                        self.DataTable.ajax.reload( null, false );

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                    });

            
                $('#ItemCreationRequestModalEdit').modal('toggle');
                this.ItemApprovalRules.DecisionNotes[0].required = false;
                    
              

            },
            DecisionReject(){

                let self = this;

                this.ItemApprovalRules.DecisionNotes[0].required = true;
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

                                self.DataTable.ajax.reload( null, false );

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                            });

                        

                      
                        $('#ItemCreationRequestModalEdit').modal('toggle');
                        this.ItemApprovalRules.DecisionNotes[0].required = false;


                    }
                })
            },
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
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
                            this.ItemCreationResubmission.ProjectId = Object.keys(this.JobNumbers)[0];
                        }
                    });
                });

            
            axios.get('/api/data/get_item_templates_list')
                .then((response) => {
                    this.TemplatesList = response.data;
                });

            setTimeout(() => {
                
                const table = $('#NewItemCreationRequests').DataTable({
                    stateSave:  true,
                    responsive: true,
                    colReorder: true,
                    processing: true,
                    serverSide: true,
                    ajax: 'http://' + window.location.host + '/api/data/get_new_item_requests_list',
                    columns: [
                        { data: 'item_request_group_id', name: 'item_request_group_id' },
                        { data: 'project.title', name: 'project.title' },
                        { data: 'requester.name', name: 'requester.name' },
                        { data: 'item_description', name: 'item_description' },
                        { data: 'item_link', name: 'item_link' },
                        { data: 'created_at', name: 'created_at' },
                        { data: 'updated_at', name: 'updated_at' },
                        { data: 'status', name: 'status' },
                        { data: 'action', name: 'action', orderable: false, searchable: false }
                    ],
                    columnDefs: [
                        { responsivePriority: 1, targets: 8 },
                        { responsivePriority: 8, targets: 5 },
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
                        { extend: 'excel', className: 'btn btn-success', title: 'NewItemCreationRequests' },
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

            }, 500);

        },
    }

</script>

<style scoped>
    
    .font-500{
        font-weight: 500;
    }

    #ItemCreationRequestModalView .modal-dialog {
        min-width:80%;
    }

    #ItemCreationRequestModalEdit .modal-dialog {
        min-width:80%;
    }

    .dataTables_wrapper .dataTables_processing {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 30%;
        text-align: center;
        margin-left: -15%;
        margin-top: -25px;
        padding-top: 30px;
        padding-bottom: 50px;
        font-size: 1.5em;
        background-color: none;
    }

</style>