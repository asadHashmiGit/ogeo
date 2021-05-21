<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>List Of Requests To Update Set-up Budget</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewBudgetCreationRequests" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Set-up</th>
                                <th>Request Orginator</th>
                                <th>Created At</th>
                                <th>Last Updated At</th>
                                <th>Current End Date</th>
                                <th>Requested New End Date</th>
                                <th>Initial Budget</th>
                                <th>Available Budget</th>
                                <th>Requested New Available Budget</th>
                                <th>Initial End Date</th>
                                <th>Reason for the Request</th>
                                <!-- <th>Description</th> -->
                                <!-- <th>URL</th> -->
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

                        <h4 class="modal-title ogeo-text" style="color: #FF2F2F">Request To update The Set-up Budget ID# {{ ViewModalInfo.budget_request_group_id }} </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body w-100" v-if="viewDataLoaded">
                        <div class="row w-100">
                        <div class="col">
                            <div class="row" align="center">
                                <div class="col"></div>
                                <div class="col"><center><img style="width: 50%;" :src="'/uploads/Logos/'+ViewModalInfo.company.logo"></center></div>
                                <div class="col"></div>
                                
                                
                            
                            </div><br><br>
                            <!-- <h4 style="color: #FF2F2F">Request Details</h4> -->
                            <table class="table">
                                <tr>
                                    <td width="40%"><b>Requester Name: </b></td>
                                    <td>{{ ViewModalInfo.requester.name }}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Set-up Name: </b></td>
                                    <td>{{ ViewModalInfo.project.title }}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Set-up Initial Budget: </b></td>
                                    <td>{{ViewModalInfo.project.f_initial_value}}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Set-up Initial End Date: </b></td>
                                    <td>{{ViewModalInfo.project.initial_end_date | formatDateNoTime}}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Set-up Available Budget <i>( At the time of the Request ):</i> </b></td>
                                    <td>{{ViewModalInfo.f_very_first_initial_amount}}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Set-up End Date <i>( At the time of the Request ):</i> </b></td>
                                    <td>{{ViewModalInfo.very_first_initial_end_date | formatDateNoTime}}</td>
                                </tr>
                                <tr v-if="ViewModalInfo.first_request_amount">
                                    <td width="40%"><b>Requested New Set-up Available Budget: </b><sup style="color:red;">Change</sup></td>
                                    <td>{{ViewModalInfo.f_first_request_amount}}</td>
                                </tr>
                                <tr v-if="ViewModalInfo.first_end_date">
                                    <td width="40%"><b>Requested New Set-up End Date: </b><sup style="color:red">Change</sup></td>
                                    <td>{{ViewModalInfo.first_end_date | formatDateNoTime}}</td>
                                </tr>
                                <tr style="color:red" v-if="ViewModalInfo.first_request_amount - ViewModalInfo.request_amount != 0">
                                    <td width="40%"><b>The New Set-up Available Budget Has Been Changed To: </b></td>
                                    <td>{{ViewModalInfo.f_request_amount}}</td>
                                </tr>
                                <tr style="color:red" v-if="ViewModalInfo.request_end_date > ViewModalInfo.first_end_date">
                                    <td width="40%"><b>The New Set-up End Date Has Been Changed To: </b></td>
                                    <td>{{ViewModalInfo.request_end_date | formatDateNoTime}}</td>
                                </tr>
                                <tr>
                                    <td width="40%"><b>Reason for the Request </b></td>
                                    <td>{{ViewModalInfo.budget_description}}</td>
                                </tr>
                                <!-- <tr>
                                    <td><b>Available Files: </b></td>
                                    <td>
                                        <a v-if="ViewModalInfo.file1" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+ViewModalInfo.file1" download> File 1</a>
                                        <a v-if="ViewModalInfo.file2" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+ViewModalInfo.file2" download>File 2</a>
                                        <a v-if="ViewModalInfo.file3" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+ViewModalInfo.file3" download>File 3</a>
                                    </td>
                                </tr> -->
                                <tr>
                                    <td width="40%"><b>Status: </b></td>
                                    <td><b>{{ ViewModalInfo.status }}</b></td>
                                </tr>
                            </table>
                        </div>


                    
                        <!-- <div class="col-lg-12" v-if="ViewModalInfo.item">
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
                        </div> -->
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
                                        <th style="background-color: rgb(252, 51, 23, 0.2);"><b>Next Action By</b></th>
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
                            <span><b>By:</b> {{ currentUser.Name }}</span><button class="btn btn-success ml-3" onclick="window.print()">Download PDF</button><br><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div id="ItemCreationRequestModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemCreationRequestModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title ogeo-text" style="color: #FF2F2F">Request To update The Set-up ID# {{ EditModalInfo.budget_request_group_id }} </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body"  v-if="editDataLoaded">
                        <div class="row">
                            <div class="col w-100">
                                <!-- <h4 style="color: #FF2F2F">Request Details</h4> -->
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Requester Name: </b></td>
                                        <td>{{ EditModalInfo.requester.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Set-up Name: </b></td>
                                        <td>{{ EditModalInfo.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Set-up Initial Budget: </b></td>
                                        <td>{{EditModalInfo.project.f_initial_value}}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Set-up Initial End Date: </b></td>
                                        <td>{{EditModalInfo.project.initial_end_date | formatDateNoTime}}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Set-up Available Budget <i>( At the time of the Request ):</i> </b></td>
                                        <td>{{EditModalInfo.f_very_first_initial_amount}}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Set-up End Date <i>( At the time of the Request ):</i></b></td>
                                        <td>{{EditModalInfo.very_first_initial_end_date | formatDateNoTime}}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.first_request_amount">
                                        <td><b>Requested New Set-up Available Budget: </b><sup style="color:red;">Change</sup></td>
                                        <td>{{EditModalInfo.f_first_request_amount}}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.request_end_date">
                                        <td><b>Requested New Set-up End Date: </b><sup style="color:red">Change</sup></td>
                                        <td>{{EditModalInfo.first_end_date | formatDateNoTime}}</td>
                                    </tr>
                                    <tr style="color:red" v-if="EditModalInfo.first_request_amount - EditModalInfo.request_amount != 0">
                                        <td><b>The New Set-up Available Budget Has Been Changed To: </b></td>
                                        <td>{{EditModalInfo.f_request_amount}}</td>
                                    </tr>
                                    <tr style="color:red" v-if="EditModalInfo.request_end_date > EditModalInfo.first_end_date">
                                        <td><b>The New Set-up End Date Has Been Changed To: </b></td>
                                        <td>{{EditModalInfo.request_end_date | formatDateNoTime}}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Reason for the Request </b></td>
                                        <td>{{EditModalInfo.budget_description}}</td>
                                    </tr>
                                    <!-- <tr>
                                        <td><b>Available Files: </b></td>
                                        <td>
                                            <a v-if="EditModalInfo.file1" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+EditModalInfo.file1" download> File 1</a>
                                            <a v-if="EditModalInfo.file2" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+EditModalInfo.file2" download>File 2</a>
                                            <a v-if="EditModalInfo.file3" class="btn btn-success" :href="'/uploads/NewBudgetCreationRequests/'+EditModalInfo.file3" download>File 3</a>
                                        </td>
                                    </tr> -->
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td><b>{{ EditModalInfo.status }}</b></td>
                                    </tr>
                                </table>
                            </div>

                        
                            <!-- <div class="col-lg-12" v-if="EditModalInfo.item">
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
                            </div> -->

                            <div class="col-lg-12 b-l" v-if="EditModalInfo.status.indexOf('Created and Assigned to the Library of Materials Administrator') !== -1 || EditModalInfo.status.indexOf('Resubmitted and Assigned') !== -1">
                                <hr>
                                <!-- <h4 style="color: #FF2F2F">Create New Request To Update The Library Of Materials</h4>
                                    
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

                                    </div> -->

                                    

                                    <!-- <div class="row">

                                        <div class="col-lg-12">
                                            
                                            <button type="button" @click="SubmitNewItemCreation" class="btn btn-success btn-block waves-effect text-center">Approve</button>

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
                                    </div> -->
                                <!-- </el-form> -->
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
                                                    <span slot="label"><b>Enter Reason for Request to update Setup Budget</b></span>

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
                                                        placeholder="Enter Reason for Request to update Setup Budget."
                                                        v-model="ItemCreationResubmission.ItemDescription">
                                                    </el-input>
                                                    
                                                </el-form-item>
                                            </div>

                                            <!-- <div class="grid-content">
                                                <el-form-item label="temp" prop="ItemLink">
                                                    <span slot="label"><b>Enter Item Link (If Available)</b></span>
                                                    <el-input v-model="ItemCreationResubmission.ItemLink" placeholder="http://www.itemsinfo.com/itemlink/232/wsd"></el-input>
                                                </el-form-item>
                                            </div> -->

                                            
                                            <!-- <div style="width: 100%" class="grid-content">
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

                                                

                                            </div> -->

                        
                                        </el-col>


                                        
                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="SubmitBudgetCreationRequestResubmit" class="btn btn-success btn-block waves-effect text-center">Create New Request To Update The Set-up Budget</button>
                                        </el-col>


                                        <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="CancelBudgetCreationRequestResubmit" class="btn btn-danger btn-block waves-effect text-center">Cancel Request To Update The Set-up Budget</button>
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
                // TemplateDetailsLoaded: false,
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
            CancelBudgetCreationRequestResubmit(){

                let self = this;

                axios.post( '/api/users/cancel_budget_request_by_originator', {ItemRequestId: this.ItemCreationResubmission.ItemCreationRequestId})
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

            SubmitBudgetCreationRequestResubmit: function(){
                let self = this;

                if (event) event.preventDefault();

                this.$refs.ItemCreationRequestForm.validate((validation) => {

                    if(validation){

                        let formData = new FormData();

                        
                        // console.log(this.ItemCreationResubmission.ItemCreationRequestId);
                        
                        formData.append('ProjectId', this.ItemCreationResubmission.ProjectId);
                        formData.append('ItemId', this.ItemCreationResubmission.ItemCreationRequestId);
                        formData.append('ItemDescription', this.ItemCreationResubmission.ItemDescription);
                        formData.append('ItemLink', this.ItemCreationResubmission.ItemLink);

                        axios.post( '/api/users/new_set_up_budget_creation_request',
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
                    // this.TemplateDetailsLoaded = true;
                    
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

                let formData = new FormData();

                formData.append('NewItemInfo', JSON.stringify(this.NewItemInfo));

                axios.post( '/api/users/budget_master_creation',
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
                
            },
            handleExceedItemCreation(files, fileList) {
                Swal('The Limit is ' + fileList.length + ' Picture', 'The limit is ' + fileList.length + ' picture per item, if you would like to upload more than one image please Ogéo support team', 'warning')
                
            },
            handleRemove(file, fileList) {
                // console.log(file, fileList);
            },
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_budget_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true;
                        if(this.ViewModalInfo.first_request_amount - this.ViewModalInfo.request_amount !== 0){
                            this.ViewModalInfo.f_request_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.ViewModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.ViewModalInfo.request_amount);
                        }
                        this.ViewModalInfo.project.f_initial_value = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.ViewModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.ViewModalInfo.project.initial_value);
                        this.ViewModalInfo.f_very_first_initial_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.ViewModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.ViewModalInfo.very_first_initial_amount);
                        if(this.ViewModalInfo.first_request_amount){
                            this.ViewModalInfo.f_first_request_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.ViewModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.ViewModalInfo.first_request_amount);
                        }

                        $('#ItemCreationRequestModalView').modal('toggle');
                    })

                    // console.log(this.ViewModalInfo);

                this.viewDataLoaded = false;
                
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                this.ValidationInfo.Decision= "";
                this.ValidationInfo.DecisionNotes= "";
                axios.post('/api/data/get_budget_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.NewItemInfo.ItemRequestId = this.EditModalInfo.id;
                        this.NewItemInfo.ItemRequestProjectId = this.EditModalInfo.project_id;
                        if(this.EditModalInfo.first_request_amount - this.EditModalInfo.request_amount !== 0){
                            this.EditModalInfo.f_request_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.EditModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.EditModalInfo.request_amount);
                        }
                        this.EditModalInfo.project.f_initial_value = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.EditModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.EditModalInfo.project.initial_value);
                        this.EditModalInfo.f_very_first_initial_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.EditModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.EditModalInfo.very_first_initial_amount);
                        if(this.EditModalInfo.first_request_amount){
                            this.EditModalInfo.f_first_request_amount = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.EditModalInfo.project.currency, maximumFractionDigits: 2, }).format(this.EditModalInfo.first_request_amount);
                        }

                        
                        
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
                axios.post('/api/users/validate_budget_creation', this.ValidationInfo)
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
                        axios.post('/api/users/validate_budget_creation', this.ValidationInfo)
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
            axios.get('/api/data/get_user_projects_list_bus')
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

            
            // axios.get('/api/data/get_budget_templates_list')
            //     .then((response) => {
            //         this.TemplatesList = response.data;
            //     });

            setTimeout(() => {
                
                const table = $('#NewBudgetCreationRequests').DataTable({
                    stateSave:  false,
                    responsive: true,
                    colReorder: true,
                    processing: true,
                    serverSide: true,
                    ajax: 'http://' + window.location.host + '/api/data/get_new_budget_requests_list',
                    columns: [
                        { data: 'budget_request_group_id', name: 'budget_request_group_id' },
                        { data: 'project.title', name: 'project.title' },
                        { data: 'requester.name', name: 'requester.name' },
                        { data: 'created_at', name: 'created_at' },
                        { data: 'updated_at', name: 'updated_at' },
                        { data: 'end_date', render: function(data){
                                return moment(data, 'YYYY-MM-DD').format('DD.MMM.YYYY');
                        }, orderable: false, searchable: false },
                        { data: 'request_end_date', render: function(data){
                            if(data == null) {
                                return "unchanged";
                            }
                            else {
                                return moment(data, 'YYYY-MM-DD').format('DD.MMM.YYYY');
                            }
                        } },
                        { data: 'initial_value', render: function(data, type, row){

                                var cccdata = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: row.currency, maximumFractionDigits: 2, }).format(data);
                                return cccdata;

                        }, orderable: false, searchable: false },
                        { data: 'available_budget', render: function(data, type, row){

                                var cccdata = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: row.currency, maximumFractionDigits: 2, }).format(data);
                                return cccdata;

                        }, orderable: false, searchable: false},
                        { data: 'request_amount', render: function(data, type, row){
                            if(data == 0 || data == null) {
                                return "unchanged";
                            }
                            else {
                                var cccdata = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: row.currency, maximumFractionDigits: 2, }).format(data);
                                return cccdata;
                            }
                        } },
                        { data: 'initial_end_date', render: function(data){
                                return moment(data, 'YYYY-MM-DD').format('DD.MMM.YYYY');
                        }, orderable: false, searchable: false },
                        { data: 'reason_for_the_request', name: 'budget_description' },
                        // { data: 'budget_description', name: 'budget_description' },
                        // { data: 'budget_link', name: 'budget_link' },
                        { data: 'status', name: 'status' },
                        { data: 'action', name: 'action', orderable: false, searchable: false }
                    ],
                    
                    columnDefs: [
                        { responsivePriority: 1, targets: -1 },
                        { responsivePriority: 2, targets: -2 },
                        // { responsivePriority: 3, targets: 12 },
                        // { responsivePriority: 1, targets: 8 },
                        // { responsivePriority: 8, targets: 5 },
                    ],
                    dom: '<"html5buttons">Brfgtip',
                    pageLength: 15,
                    lengthMenu: [
                        [ 10, 25, 50, 100, 500, 1000, -1 ],
                        [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                    ],
                    order: [[ 0, "ASC" ]],
                    buttons: [
                        { extend: 'pageLength', className: 'btn btn-success' },
                        { extend: 'copy', className: 'btn btn-success' },
                        { extend: 'excel', className: 'btn btn-success', title: 'NewBudgetCreationRequests' },
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

<style>

@media print {
  body * {
    visibility: hidden;
  }
  #ItemCreationRequestModalView, #ItemCreationRequestModalView * {
    visibility: visible;
  }
  #ItemCreationRequestModalView {
    position: absolute;
    left: 0;
    top: 0;
  }
}



</style>