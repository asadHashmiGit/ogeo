<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Enquiries List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="ProjectPEList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th v-if="CompanySetup.pe_prefix == ''">PE #</th>
                                <th v-else>{{ CompanySetup.pe_prefix }} #</th>
                                <th>GroupID</th>
                                <th>Set-up</th>
                                <th>Originated By</th>
                                <th>Sourcing Priority</th>
                                <th>Requested Materials</th>
                                <th>Quantity</th>
                                <th>Expected Cost</th>
                                <th>Unit Of Measurement</th>
                                <th>Delivery Location Details</th>
                                <th>Is Advanced Payment Considered?</th>
                                <th>Payment Rentention Details</th>
                                <th>Underlying Transaction</th>
                                <th>Originated At</th>
                                <th>Last Updated At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="PurchaseEnquiryUpdateModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryUpdateModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <div style="width:50%">
                            <h4 style="margin-top:10px" class="modal-title ogeo-text">Purchase Enquiry Line Number ID# {{ ViewModalInfo.purchase_enquiry_group_id }}-{{ ViewModalInfo.purchase_enquiry_ingroup_id }}</h4>
                        </div>
                        <div style="width:50%">
                            <img :src="hostName+'/uploads/Logos/'+this.CompanySetup.logo" style="width:50px;height:50px;margin-left:50px;">
                        </div>
                        <div>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Set-up Details: </b></td>
                                        <td>
                                            <span><b>Set-up Name:</b> {{ ViewModalInfo.project.title }}</span><br>
                                            <span><b>Start Date:</b> {{ ViewModalInfo.project.start_date | formatDateNTime }}</span><br>
                                            <span><b>End Date:</b> {{ ViewModalInfo.project.end_date | formatDateNTime }}</span><br>
                                            <span><b>Current Budget:</b> {{ formatPrice(ViewModalInfo.project.value - ViewModalInfo.project.consumed_budget) }} {{ ViewModalInfo.project.currency }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Originated By: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Origination At: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td><b>{{ ViewModalInfo.status }}</b></td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.approval_level }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.underlying_transaction != ''">
                                        <td><b>Underlying Transaction: </b></td>
                                        <td>{{ ViewModalInfo.underlying_transaction }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Sourcing Priority: </b></td>
                                        <td>{{ ViewModalInfo.sourcing_priority }}</td>
                                    </tr>

                                    <tr>
                                        <td><b>Delivery Address Details: </b></td>
                                        <td>
                                            <span><b>Location Name:</b> {{ ViewModalInfo.location_name }}</span><br>
                                            <span><b>Longitude:</b> {{ ViewModalInfo.longitude }}</span><br>
                                            <span><b>Latitude:</b> {{ ViewModalInfo.latitude }}</span><br>  
                                            
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><b>Is Advanced Payment Considered? </b></td>
                                        <td>{{ ViewModalInfo.advanced_payment }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>What Is the Percentage of Retention Payment? </b></td>
                                        <td v-if="ViewModalInfo.retention_percentage != ''">{{ ViewModalInfo.retention_percentage }}%</td>
                                        <td v-else>0%</td>
                                    </tr>
                                    <tr>
                                        <td><b>Retention Timeframe: </b></td>
                                        <td v-if="ViewModalInfo.retention_days != ''">{{ ViewModalInfo.retention_days }} Day(s) From The Date Of Full Delivery</td>
                                        <td v-else>0 Day(s)</td>
                                    </tr>
                                    <tr>
                                        <td><b>Awardee Vendor: </b></td>
                                        <td v-if="ViewModalInfo.purchase_orders.length == 0">Not Yet Awarded</td>
                                        <td v-else><span v-if="ViewModalInfo.project.company.po_prefix != ''">{{ ViewModalInfo.project.company.po_prefix }}</span><span v-else>PO</span>: {{ ViewModalInfo.purchase_orders[0].purchase_order_group_id }} - {{ ViewModalInfo.purchase_orders[0].vendor.name }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr align="center" v-if="p_images.length == 0">
                                        <td>
                                            <img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+ViewModalInfo.item.picture">
                                        </td>
                                    </tr>
                                    <tr align="center" v-else style="display: table-caption;">
                                        <td v-for="(img, index) in p_images" :key="index" >
                                            <img style="width: 7vw;height: 7vw; text-align: center;"  :src="'/uploads/images/'+img">
                                        </td>
                                    </tr>
                                    

                                    <tr v-if="ViewModalInfo.item != null">
                                        <td><b>Item Details:</b></td>
                                        <td>
                                            <span v-if="ViewModalInfo.item_description == null"><b>Item Number:</b> <span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ ViewModalInfo.item.item_group_id }}-{{ ViewModalInfo.item.item_ingroup_id }}</span><br>
                                            <span v-if="ViewModalInfo.item_description != null">{{ViewModalInfo.item_description}}</span><br>

                                            <span v-if="ViewModalInfo.item.item_template != null"><b>Description:</b> 
                                                <template v-for="index in 20">    
                                                    <span v-if="ViewModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                        <b>{{ ViewModalInfo.item.item_template['field_'+index] }}:</b> {{ ViewModalInfo.item['field_'+index] }} | 
                                                    </span>
                                                </template>
                                            </span><br><br>

                                            <span v-if="ViewModalInfo.quantity_changes.length == 0"><b>Quantity:</b> {{ ViewModalInfo.quantity }}</span>
                                            <span v-else><b>Quantity:</b> {{ ViewModalInfo.quantity_changes[0].old_quantity }}</span>
                                            <br><br>

                                            <span><b>Unit of Measurement:</b> {{ ViewModalInfo.item.u_o_m }}</span><br>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td><b>Item Details: </b></td>
                                        <td class="dont-break-out">
                                            <span><b>Description:</b> {{ ViewModalInfo.service_description }}</span><br><br>
                                            <span><b>Quantity:</b> 
                                                <span v-if="ViewModalInfo.quantity_changes.length == 0">{{ ViewModalInfo.quantity }}</span>
                                                <span v-else>{{ ViewModalInfo.quantity_changes[0].old_quantity }}</span>
                                            </span><br> <br>
                                            <span><b>Unit of Measurement:</b> {{ ViewModalInfo.u_o_m }}</span><br>
                                        </td>
                                    </tr>
                                    
                                    <!-- <tr>
                                        <td style="width: 40%"><b>Description:</b></td>
                                        <td v-if="ViewModalInfo.service_description == null">
                                            <template v-for="index in 20">    
                                                <span v-if="ViewModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                    <b>{{ ViewModalInfo.item.item_template['field_'+index] }}:</b> {{ ViewModalInfo.item['field_'+index] }} | 
                                                </span>
                                            </template>
                                        </td>
                                        <td v-else>{{ ViewModalInfo.service_description }}</td>
                                    </tr> 

                                    <tr>
                                        <td><b>Quantity: </b></td>
                                        <td v-if="ViewModalInfo.quantity_changes.length == 0">{{ ViewModalInfo.quantity }}</td>
                                        <td v-else>{{ ViewModalInfo.quantity_changes[0].old_quantity }}</td>
                                    </tr> -->

                                    <tr>
                                        <td><b>Required Documents: </b></td>
                                        <td v-if="ViewModalInfo.required_documents.length > 0">
                                            <ul v-for="(document, index) in ViewModalInfo.required_documents.split(',')">
                                                <li>{{ document }}</li>
                                            </ul>
                                        </td>
                                        <td v-else>
                                            No Documents Required
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width: 40%"><b>Purchase Enquiry Note:</b></td>
                                        <td v-if="ViewModalInfo.notes == null"> Not Available </td>
                                        <td v-else>{{ ViewModalInfo.notes }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Rate Contract </b></td>
                                        <td>
                                            <span><b>Unit Rate:</b> 20  USD</span><br>
                                            <span><b>Vendor Name:</b> Gucci</span><br>
                                            <span><b>Lead Time:</b> 2 Days</span><br>
                                            <span><b>Date:</b> 25 march 2025</span><br>
                                            <span><b>Vendor Score:</b> 30</span><br>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                        
                        <div class="col-lg-12">
                            <hr> 
                        </div>

                        <div class="col-lg-12">
                            <h3 class="text-ogeo">History</h3>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th><b>#</b></th>
                                        <th><b>Action Description</b></th>
                                        <th><b>Action By</b></th>
                                        <th><b>Action Level</b></th>
                                        <th><b>Decision-Note</b></th>
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
                            <div class="d-inline-block">
                                <span><b>Date:</b> {{ new Date() }}</span><br>
                                <span><b>By:</b> {{ currentUser.Name }}</span><button class="btn btn-success ml-3" onclick="document.title = 'Purchase Enquiry Line Information';window.print()">Download PDF</button>   <br><br>
                            </div>
                            <div class="d-inline-block pull-right">
                                <span><img width="250px" :src="hostName+'/assets/images/poweredby.png'" alt=""></span>
                            </div>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="PurchaseEnquiryUpdateModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryUpdateModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title ogeo-text" >Purchase Enquiry Line Number: {{ EditModalInfo.purchase_enquiry_group_id }}-{{ EditModalInfo.purchase_enquiry_ingroup_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Set-up Details: </b></td>
                                        <td>
                                            <span><b>Set-up Name:</b> {{ EditModalInfo.project.title }}</span><br>
                                            <span><b>Start Date:</b> {{ EditModalInfo.project.start_date | formatDateNTime }}</span><br>
                                            <span><b>End Date:</b> {{ EditModalInfo.project.end_date | formatDateNTime }}</span><br>
                                            <span><b>Current Budget:</b> {{ formatPrice(EditModalInfo.project.value - EditModalInfo.project.consumed_budget) }} {{ EditModalInfo.project.currency }}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Originated By: </b></td>
                                        <td>{{ EditModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Origination At: </b></td>
                                        <td>{{ EditModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ EditModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ EditModalInfo.approval_level }}</td>
                                    </tr>
                                    <tr v-if="EditModalInfo.underlying_transaction != ''">
                                        <td><b>Underlying Transaction: </b></td>
                                        <td>{{ EditModalInfo.underlying_transaction }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Delivery Address Details: </b></td>
                                        <td>
                                            <span><b>Location Name:</b> {{ EditModalInfo.location_name }}</span><br>
                                            <span><b>Longitude:</b> {{ EditModalInfo.longitude }}</span><br>
                                            <span><b>Latitude:</b> {{ EditModalInfo.latitude }}</span><br>  
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Is Advanced Payment Considered? </b></td>
                                        <td>{{ EditModalInfo.advanced_payment }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>What Is the Percentage of Retention Payment? </b></td>
                                        <td v-if="EditModalInfo.retention_percentage != ''">{{ EditModalInfo.retention_percentage }}%</td>
                                        <td v-else>0%</td>
                                    </tr>
                                    <tr>
                                        <td><b>Retention Timeframe: </b></td>
                                        <td v-if="EditModalInfo.retention_days != ''">{{ EditModalInfo.retention_days }} Day(s) From The Receipt Note Date.</td>
                                        <td v-else>0 Day(s)</td>
                                    </tr>
                                    <tr>
                                        <td><b>Awardee Vendor: </b></td>
                                        <td v-if="EditModalInfo.purchase_orders.length == 0">Not Yet Awarded</td>
                                        <td v-else><span v-if="EditModalInfo.project.company.po_prefix != ''">{{ EditModalInfo.project.company.po_prefix }}</span><span v-else>PO</span>: {{ EditModalInfo.purchase_orders[0].purchase_order_group_id }} - {{ EditModalInfo.purchase_orders[0].vendor.name }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr align="center" v-if="E_images.length == 0">
                                        <td>
                                            <img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+EditModalInfo.item.picture">
                                        </td>
                                    </tr>
                                    <tr align="center" v-else style="display: table-caption;">
                                        <td v-for="(img, index) in E_images" :key="index" >
                                            <img style="width: 7vw;height: 7vw; text-align: center;" :src="'/uploads/images/'+img">
                                        </td>
                                    </tr>

                                    <tr v-if="EditModalInfo.item.item_template">
                                        <td><b>Item Details: </b></td>
                                        <td>                                            
                                            <span><span v-if="EditModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ EditModalInfo.company.lom_prefix }}</span>-{{ EditModalInfo.item.item_group_id }}-{{ EditModalInfo.item.item_ingroup_id }}</span><br>

                                            <span>
                                                <template v-for="index in 20">    
                                                    <span v-if="EditModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                        <b>{{ EditModalInfo.item.item_template['field_'+index] }}:</b> {{ EditModalInfo.item['field_'+index] }} | 
                                                    </span>
                                                </template>
                                            </span><br><br>

                                            <span v-if="EditModalInfo.quantity_changes.length == 0"><b>Quantity:</b> {{ EditModalInfo.quantity }}</span>
                                            <span v-else><b>Quantity:</b> {{ EditModalInfo.quantity_changes[0].old_quantity }}</span>
                                            <br><br>

                                            <span><b>Unit of Measurement:</b> {{ EditModalInfo.item.u_o_m }}</span><br>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td><b>Item Details: </b></td>
                                      
                                        <td class="dont-break-out">
                                            <span><b>Description:</b> {{ EditModalInfo.item_description }}</span><br><br>

                                            <span v-if="EditModalInfo.quantity_changes.length == 0"> <b>Quantity:</b> {{ EditModalInfo.quantity }}</span>
                                            <span v-else> <b>Quantity:</b> {{ EditModalInfo.quantity_changes[0].old_quantity }}</span>
                                            <br><br>

                                     
                                            <span><b>Unit of Measurement:</b> {{ EditModalInfo.u_o_m }}</span><br>
                                        </td>
                                    </tr>

                                    <!-- <tr>
                                        <td><b>Quantity: </b></td>
                                        <td v-if="EditModalInfo.quantity_changes.length == 0">{{ EditModalInfo.quantity }}</td>
                                        <td v-else>{{ EditModalInfo.quantity_changes[0].old_quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40%"><b>Description:</b></td>
                                        <td v-if="EditModalInfo.service_description == null">{{ EditModalInfo.item.description }}</td>
                                        <td v-else>{{ EditModalInfo.service_description }}</td>
                                    </tr> -->

                                    <tr>
                                        <td><b>Required Documents: </b></td>
                                        <td v-if="EditModalInfo.required_documents.length > 0">
                                            <ol v-for="(document, index) in EditModalInfo.required_documents.split(',')">
                                                <li style="margin: 0;">{{ document }}</li>
                                            </ol>
                                        </td>
                                        <td v-else>
                                            No Documents Required
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width: 40%"><b>Purchase Enquiry Note:</b></td>
                                        <td v-if="EditModalInfo.notes == null"> Not Available </td>
                                        <td v-else>{{ EditModalInfo.notes }}</td>
                                    </tr>
                                    
                                </table>
                            </div>


                            <div class="col-lg-12">
                                <hr>

                                <el-form v-if="EditModalInfo.retention_percentage > 0 && !FullyInvoiced && EditModalInfo.receipt_note" :model="ValidationInfo" class="demo-form-inline" :rules="rules" ref="PurchaseRequestRetentionUpdateForm">
                                <el-row :gutter="20">
                                    <el-col :span="24">

                                        <el-col :span="24">
                                            <hr>
                                            <h5>Adjust The Retention Timeframe</h5>
                                        </el-col>
                                        
                                        <el-col :span="24" >
                                            <div class="grid-content">
                                                <el-form-item label="Adjust The Retention Timeframe" prop="RetentionDays">
                                                        
                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                            
                                                        </span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2">
                                                                The Rentention Timeframe initially opted for at the time of the Purchase Enquiry origination, can be revisited at any time as long as the invoicing by the vendor, hasn't been completed in full.
                                                            </span>
                                                        </span>
                                                    </span>

                                                    <el-select filterable style="width: 100%; padding: 0px;" v-model="ValidationInfo.RetentionDays" placeholder="Select Retention Days From Delivery date">
                                                        
                                                        <el-option v-for="n in ValidationInfo.RetentionDays" :key="n" :label="n+ ' Days'" :value="n"></el-option> 
                                                        
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <div class="col-lg-12 float-right">
                                            <button type="button" @click="PurchaseEnquiryRententionUpdate" class="btn btn-block btn-success waves-effect">Update Retention Timeframe</button>
                                        </div>
                                        
                                    </el-col>
                                </el-row>
                            </el-form>   









                            <!-- Form for update and Resubmitt -->
                            <div class="row" v-if="EditModalInfo.status.indexOf('Rejected') !== -1" >
                                <div class="col-lg-12">
                                    <el-form :model="PurchaseEnquiryLine" class="demo-form-inline" :rules="PeEditRules" ref="PurchaseEnquiryForm">

                                        <el-row :gutter="20">
                                            
                                            <transition v-if="CompanySetup.setup_mode == 'Project Wise'">
                                                <el-col :span="24">
                                                    <div class="grid-content">
                                                        <el-form-item label="Select Set-up" prop="JobNumber">

                                                            <el-select id="SetupSelection" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.JobNumber" placeholder="Select Set-up">
                                                                
                                                                <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                                
                                                            </el-select>
                                                        </el-form-item>
                                                    </div>
                                                </el-col>
                                            </transition>

                        
                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && this.CompanySetup.additional_required_1 == 'Yes'">
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="UnderlyingTransaction">
                                                        <span slot="label"><b>Enter The Underlying Transaction Reference</b></span>

                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    <strong>The Underlying Transaction Reference</strong> is the reference of the transaction  that has led to the creation of this specific Purchase Enquiry. It can be a particular Job Ticket, a Sales Order, a Work Order…etc
                                                                </span>
                                                            </span>
                                                        </span>

                                                        <el-input v-model="PurchaseEnquiryLine.UnderlyingTransaction" placeholder="e.g. PE#1213412-ER Or 35633-1 Or 213/2018/4521"></el-input>

                                                    </el-form-item>
                                                </div>
                                            </el-col>


                                            <el-col :span="24" >
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="SourcingPriority">
                                                        <span slot="label"><b>Sourcing Priority</b></span>

                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    <strong>The sourcing priority is, by default, set to Standard but can be changed to Urgent or Very Urgent.</strong> It is meant to indicate how quickly the sourcing of proposals should be conducted.
                                                                </span>
                                                            </span>
                                                        </span>
                                                        
                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.SourcingPriority" placeholder="">
                                                                
                                                            <el-option label="Standard" value="Standard"></el-option>
                                                            <el-option label="Urgent" value="Urgent"></el-option>
                                                            <el-option label="Very Urgent" value="Very Urgent"></el-option>
                                                                
                                                        </el-select>

                                                    </el-form-item>
                                                </div>
                                            </el-col>


                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && (this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries')">


                                                <!-- <div class="grid-content">
                                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryFromItemMaster">
                                                        <span slot="label"><b>Do You Want To Select An Item From The Library of Materials?</b></span>

                                                        <el-select @change="EnquiryItemDescriptionSelection" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.EnquiryFromItemMaster" placeholder="Do You Want To Select An Item From The Library of Materials?">
                                                                
                                                            <el-option label="Yes" value="Yes"></el-option>
                                                            <el-option label="No" value="No"></el-option>
                                                                
                                                        </el-select>
                                                    </el-form-item>
                                                </div> -->

                                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'Yes'">
                                                    <el-form-item label="temp" prop="ItemNumber">
                                                        <span slot="label"><b>Select The Item From The Library Of Materials</b></span>
                                                        <el-select style="width: 100%"
                                                            v-model="PurchaseEnquiryLine.ItemNumber"
                                                            filterable
                                                            remote
                                                            :remote-method="searchItems"
                                                            :loading="searchItemsLoading"
                                                            placeholder="Search and Select an Item">
                                                            <el-option
                                                                v-for="item in FoundItems"
                                                                :key="item.id"
                                                                :label="'Item ID# ('+item.item_group_id+'-'+item.item_ingroup_id+'), Description: '+item.description"
                                                                :value="item.id">
                                                                <div class="row">
                                                                    <div class="col-lg-2 b-r" style="padding-left: 0px; padding-top: 5px; padding-buttom: 0px; padding-right: 0px;" >
                                                                       <img  class="img-thumbnail vertical-middle" :src="hostName+'/uploads/ItemMasterPictures/'+item.picture">
                                                                        
                                                                    </div>
                                                                    <div class="col-lg-4 b-r" style="padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; line-height: 10px; z-index: 1" >
                                                                        <table class="table itemTable">
                                                                            <tr>
                                                                                <td width="50%"><b>Item Number:</b></td>
                                                                                <td width="50%"> <span v-if="item.company.lom_prefix == ''">LoM</span><span v-else>{{ item.company.lom_prefix }}</span>-{{ item.item_group_id  }}-{{ item.item_ingroup_id  }}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="50%"><b>{{ item.item_template.field_1.substring(0, 20) + '...'  }}:</b></td>
                                                                                <td width="50%"> {{ item.field_1.substring(0, 20) + '...'  }}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="50%"><b>{{ item.item_template.field_2.substring(0, 20) + '...'  }}:</b></td>
                                                                                <td width="50%">{{ item.field_2.substring(0, 20) + '...'  }}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="50%"><b>{{ item.item_template.field_3.substring(0, 20) + '...'  }}:</b></td>
                                                                                <td width="50%">{{ item.field_3.substring(0, 20) + '...'  }}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="50%"><b>Rate Contract:</b></td>
                                                                                <!-- <td width="50%" style="cursor: pointer;" class="text-primary" @mouseover="showRateContract(item.id)"> View Rates</td> -->
                                                                                <td width="50%" style="cursor: pointer;" class="text-primary" @mouseover="showRateContract(item.id)">
                                                                                    <el-tooltip placement="top-start" effect="light">
                                                                                        <div slot="content">
                                                                                            <div v-if="RateContractDataLoaded">
                                                                                                <table style="min-width: 500px" class="table table-bordered">
                                                                                                    <thead>
                                                                                                        <td align="center"><b>Price</b></td>
                                                                                                        <td align="center"><b>Lead Time</b></td>
                                                                                                        <td align="center"><b>Contract End Date</b></td>
                                                                                                    </thead>
                                                                                                    <tbody v-if="ItemRateContractDetails.length > 0">
                                                                                                        <tr v-for="(RateContract, key, index) in ItemRateContractDetails" :key="index">
                                                                                                            <td align="center">{{ formatPrice(RateContract.vendor_responses[0].unit_rate) }} {{ RateContract.vendor_responses[0].currency }}</td>
                                                                                                            <td align="center">{{ RateContract.vendor_responses[0].lead_days }} Day(s)</td>
                                                                                                            <td align="center">{{ RateContract.vendor_responses[0].rate_contract_request.rc_end_period.substring(0, 10) }}</td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                    <tbody v-else>
                                                                                                        <tr>
                                                                                                            <td align="center" colspan="3"> NO CONTRACT AVAILABLE </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                            <div align="center" v-else>
                                                                                                <h2>Gathering Data...</h2>
                                                                                                <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                                                                            </div>
                                                                                            
                                                                                        </div>
                                                                                        <i style="line-height: 0px">View Rates</i>
                                                                                    </el-tooltip>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <div class="col-lg-5" style="padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px;">
                                                                        <div>
                                                                            <h5><b>Item Description:</b></h5>
                                                                            <p>{{ item.description }}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                            </el-option>
                                                        </el-select>

                                                    </el-form-item>
                                                </div>



                                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'No'">
                                                    <el-form-item label="temp" prop="ItemDescription">
                                                        <span slot="label"><b>Enter The Item’s Description</b></span>
                                                        <el-input
                                                            type="textarea"
                                                            :rows="4"
                                                            placeholder="Enter Complete Description Of The Item Required."
                                                            v-model="PurchaseEnquiryLine.ItemDescription">
                                                        </el-input>
                                                    </el-form-item>
                                                </div>

                                            </el-col>



                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && this.CompanySetup.lom_manditory == 'FreeText'" >
                                                <div class="grid-content">

                                                    <el-form-item label="temp" prop="ItemDescription">
                                                        <span slot="label"><b>Enter Material Description</b></span>
                                                        <el-input
                                                            type="textarea"
                                                            :rows="4"
                                                            placeholder="Enter Complete Description Of The Item Required."
                                                            v-model="PurchaseEnquiryLine.ItemDescription">
                                                        </el-input>
                                                    </el-form-item>


                                                    <!-- <span style="margin-top: -20px;" class="float-right">50/{{PurchaseEnquiryLine.ItemDescription.length}}</span> -->
                                                </div>
                                            </el-col>

                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <div class="grid-content">

                                                    <el-form-item label="temp" prop="Quantity">
                                                        <span slot="label"><b>Enter Needed Quantity</b></span>
                                                        <el-input min='0.0001' type="number" placeholder="Enter Item Quantity" v-model="PurchaseEnquiryLine.Quantity">
                                                        </el-input>
                                                    </el-form-item>

                                                </div>
                                            </el-col>
                                            
                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && PurchaseEnquiryLine.EnquiryFromItemMaster == 'No'" >
                                                <div class="grid-content">

                                                    <el-form-item label="temp" prop="UnitOfMeasurement">
                                                        <span slot="label"><b>Enter Unit Of Measurement</b></span>

                                                        <el-input v-model="PurchaseEnquiryLine.UnitOfMeasurement" placeholder="e.g. Dozen, Kilogram, Liters, Boxes of 24 Bottles..."></el-input>

                                                    </el-form-item>

                                                </div>
                                            </el-col>

                                            <el-col :span="24"  v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'">
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="RequiredDocuments">
                                                        <span slot="label"><b>Documents Required From The Vendors</b></span>
                                                            
                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    These are the documents that the vendors need to submit along with their commercial proposals, so that their proposals can be assessed.
                                                                </span>
                                                            </span>
                                                        </span>

                                                        <el-select filterable collapse-tags allow-create multiple style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.RequiredDocuments" placeholder="Select Required Document">
                                                            
                                                            <el-option label="Material Catalogue" value="Material Catalogue"></el-option> 
                                                            <el-option label="MSDS - Material Safety Data Sheet" value="MSDS - Material Safety Data Sheet"></el-option> 
                                                            <el-option label="Warranty Certificate" value="Warranty Certificate"></el-option> 
                                                            <el-option label="Testing Certificate" value="Testing Certificate"></el-option> 
                                                            <el-option label="Customers Testimonials" value="Customers Testimonials"></el-option> 
                                                            <el-option label="Country of Origin Certificate" value="Country of Origin Certificate"></el-option> 
                                                            <el-option label="Liability Insurance Certificate" value="Liability Insurance Certificate"></el-option> 
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>

                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="AdvancedPayment">
                                                        <span slot="label"><b>Will You Consider Offering An Advanced Payment For This?</b></span>

                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.AdvancedPayment" placeholder="Advanced Payment Offered?">
                                                                
                                                            <el-option label="Yes" value="Yes"></el-option>
                                                            <el-option label="No" value="No"></el-option>
                                                                
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>


                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                                <div class="grid-content">                                    

                                                    <el-form-item label="temp" prop="RetentionPercentage">
                                                        <span slot="label"><b>Enter The Retention Percentage (If Applicable)</b></span>

                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    Retention is a percentage of the amount certified as due to the awardee vendor that is deducted from the amount due and retained by us. The purpose of retention is to ensure that the vendor properly completes the activities required of them. This amount will be released back to the vendor at the expiry of the Retention Timeframe.
                                                                </span>
                                                            </span>
                                                        </span>

                                                        <el-input min='0.0001' type="number" placeholder="Enter Item Retention Percentage" v-model.number="PurchaseEnquiryLine.RetentionPercentage">
                                                        </el-input>
                                                    </el-form-item>

                                                </div>
                                            </el-col> 

                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="RetentionDays">
                                                        <span slot="label"><b>Select Retention Timeframe From The Delivery Date</b></span>
                                                        
                                                        <el-select :disabled="PurchaseEnquiryLine.RetentionPercentage == 0 || PurchaseEnquiryLine.RetentionPercentage == ''" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.RetentionDays" placeholder="Select Retention Timeframe From The Delivery Date">
                                                            
                                                            <el-option v-for="n in 900" :key="n" :label="n+ ' Days'" :value="n"></el-option> 
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>


                                            




                                            

                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <el-form-item label="temp">
                                                    <span slot="label"><b>Select the Delivery Location On The Map</b></span>

                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                            
                                                        </span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2">
                                                                You may use Google Map and drop a pin in the location of delivery.                                            
                                                            </span>
                                                        </span>
                                                    </span>

                                                    <button v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" type="button"  data-toggle="modal" id="get_map" data-target="#DeliveryLocation" class="btn btn-primary btn-block waves-effect text-center">Select Delivery Location</button>
                                                </el-form-item>
                                            </el-col>


                                            <!-- Delivery Location Selection -->
                                            <el-col  :span="12" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <el-form-item label="temp" prop="Longitude">
                                                    <span slot="label"><b>Delivery Longitude</b></span>
                                                    <el-input type="number" readonly  placeholder="Enter Location Longitude Or Select From Map" v-model="PurchaseEnquiryLine.Longitude"></el-input>
                                                </el-form-item>
                                            </el-col>
                                            <el-col  :span="12" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <el-form-item label="temp" prop="Latitude">
                                                    <span slot="label"><b>Delivery Latitude</b></span>
                                                    <el-input type="number"  readonly placeholder="Enter Location Longitude Or Select From Map" v-model="PurchaseEnquiryLine.Latitude"></el-input>
                                                </el-form-item>
                                            </el-col>




                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <el-form-item label="temp" prop="LocationName">
                                                    <span slot="label"><b>Location Name</b></span>
                                                    <el-input type="text" placeholder="Enter Location Name" v-model="PurchaseEnquiryLine.LocationName"></el-input>
                                                </el-form-item>
                                            </el-col>



                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" >
                                                <div class="grid-content">

                                                    <el-form-item label="temp" prop="PELineNote">
                                                        <span slot="label"><b>Addtional Notes</b></span>
                                                        <el-input
                                                            type="textarea"
                                                            :rows="4"
                                                            placeholder="Enter Purchase Enqiury Line Note."
                                                            v-model="PurchaseEnquiryLine.PELineNote">
                                                        </el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>










                                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Service'">
                                                <div class="grid-content">
                                                    
                                                    <el-form-item label="temp" prop="ServiceDescription">
                                                        <span slot="label"><b>Enter Service Description</b></span>
                                                        <el-input
                                                            type="textarea"
                                                            :rows="6"
                                                            placeholder="Enter Complete Description Of The Service Required."
                                                            v-model="PurchaseEnquiryLine.ServiceDescription">
                                                        </el-input>
                                                    </el-form-item>
                                                    <!-- <span style="margin-top: -20px;" class="float-right">100/{{PurchaseEnquiryLine.ServiceDescription.length}}</span> -->
                                                    
                                                </div>
                                            </el-col>

                                            
                                            <el-col :span="24" style="background-color: rgb(210, 211, 212); border-radius: 10px ">
                                                <br>
                                                <button v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" type="button" @click="SubmitUpdatePurchaseRequest" class="btn btn-success btn-block waves-effect text-center">Update and Resubmit Purchase Enquiry</button>

                                            
                                                <hr>
                                                <button type="button" @click="CancelPurchaseEnquiry" class="btn btn-danger btn-block waves-effect text-center">Cancel Purchase Enquiry</button>
                                                <br>
                                            </el-col>


                                        </el-row>
                                    </el-form>
                                </div>
                            </div>

                            

                            <!-- Show approval form -->
                            <div class="row" v-if="EditModalInfo.status.indexOf('Created and Assigned to ') !== -1 || EditModalInfo.status.indexOf('PE line Approved by Level') !== -1 || EditModalInfo.status.indexOf('Resubmitted and Assigned') !== -1">
                                <div class="col-lg-12">
                                    
                                    <el-form :model="ValidationInfoApproval" class="demo-form-inline" :rules="ApprovalRules" ref="PurchaseEnquiryApprovalForm">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                
                                                <!-- <div class="col-lg-12">
                                                    <div class="grid-content">
                                                        <el-form-item label="Approve Or Reject Request" prop="Decision">
                                                            <el-select @change="DecisionSelection" style="width: 100%; padding: 0px;" v-model="ValidationInfoApproval.Decision" placeholder="Select Yes/No">
                                                                  <el-option label="Approve" value="Approved"></el-option>
                                                                  <el-option label="Reject" value="Rejected"></el-option>
                                                            </el-select>
                                                        </el-form-item>
                                                    </div> 
                                                </div> -->

                                                <div class="col-lg-12">
                                                    <div class="grid-content">
                                                        <el-form-item label="tmp" prop="DecisionNotes">
                                                            <span slot="label"><b>Enter Decision Notes</b></span>
                                                            <el-input
                                                              type="textarea"
                                                              :rows="5"
                                                              placeholder="Enter Decision Notes"
                                                              v-model="ValidationInfoApproval.DecisionNotes">
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
                                                    <button type="button" @click="PurchaseEnquiryDecision" class="btn btn-primary btn-block waves-effect">Submit Decision</button>
                                                </div> -->
                                                    
                                                
                                            </div>
                                        </div>
                                    </el-form> 

                                </div>
                            </div>


                            <div class="row" v-if="EditModalInfo.status.indexOf('for Further Approval') !== -1">
                                <div class="col-lg-12">
                                    
                                    <el-form :model="ValidationInfoApproval" class="demo-form-inline" :rules="ApprovalRules" ref="PurchaseEnquiryApprovalForm">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                
                                                <!-- <div class="col-lg-12">
                                                    <div class="grid-content">
                                                        <el-form-item label="Approve Or Reject Request" prop="Decision">
                                                            <el-select @change="DecisionSelection" style="width: 100%; padding: 0px;" v-model="ValidationInfoApproval.Decision" placeholder="Select Yes/No">
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
                                                              v-model="ValidationInfoApproval.DecisionNotes">
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
                                                    <button type="button" @click="PurchaseEnquiryDecision" class="btn btn-primary btn-block waves-effect">Submit Decision</button>
                                                </div> -->
                                                    
                                                
                                            </div>
                                        </div>
                                    </el-form> 

                                </div>
                            </div>





                            </div>


                            <div class="col-lg-12">
                                <hr> 
                            </div>

                            <div class="col-lg-12">
                                <h3 class="ogeo-text">History</h3>   
                                <table class="display table table-bordered">
                                    <thead>
                                        <tr>
                                            <th><b>#</b></th>
                                            <th><b>Action Description</b></th>
                                            <th><b>Action By</b></th>
                                            <th><b>Action Level</b></th>
                                            <th><b>Decision-Note</b></th>
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


        <div id="RFIModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFIModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" v-if="RFIDataLoaded">
                        <div  class="modal-header">
                            <h4 class="modal-title text-ogeo">Request For Information <span style="color: black">(<span v-if="CompanySetup.rfq_prefix == ''">RfP-</span><span v-else>{{ CompanySetup.rfq_prefix }}-</span>{{ RFIDetails[0].quotation.quotation_group_id }} / <span v-if="CompanySetup.pe_prefix == ''">PE-</span><span v-else>{{ CompanySetup.pe_prefix }}-</span>{{ RFIDetails[0].purchase_enquiry.purchase_enquiry_group_id }}-{{ RFIDetails[0].purchase_enquiry.purchase_enquiry_ingroup_id }})</span></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="chat-rbox" style="border: 1px dashed gray; border-radius: 10px; max-height: 450px; overflow-y: auto;">
                                        <ul class="chat-list">
                                            
                                            <!--chat Row -->
                                            <template v-for="message in RFIDetails">
                                              
                                                <li v-if="message.user_id != currentUser.userId">
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - By {{ message.user_type }} - <span v-if="message.user_type == 'Vendor'">{{ message.vendor_user.name }}</span> <span v-else>{{ message.user.name }}</span></h5>
                                                        <div class="box bg-light-info" >{{ message.message }}</div>
                                                    </div>
                                                    <div class="chat-time" style="min-width: 10%">{{ message.created_at }}</div>
                                                </li>
                                                <li v-else class="reverse">
                                                    <div class="chat-time">{{ message.created_at }}</div>
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - <i v-if="message.reply_id">(In Reponse to ID#: {{ message.reply_id }}) -</i> By {{ message.user_type }} - <span v-if="message.user_type == 'Vendor'">{{ message.vendor_user.name }}</span> <span v-else>{{ message.user.name }}</span></h5>
                                                        <div class="box bg-light-ogeo" style="min-width: 10%">{{ message.message }}</div>
                                                    </div>
                                                </li>

                                            </template>
                                       
                                        </ul>
                                    </div>
                                    <div v-if="!RFIDetails[0].quotation.status.includes('Canceled') || !RFIDetails[0].quotation.status.includes('Ended') || !RFIDetails[0].quotation.status.includes('Submitted')" class="card-body b-t">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="grid-content">
                                                    <label><b>Select Message To Reply</b></label></span>
                                                    <el-select filterable style="width: 100%; padding: 0px;" v-model="RFIData.RFIMessageID" placeholder="Select Message ID">   
                                                        <el-option v-for="message in RFIDetails" :key="message.id" :label="'ID#: '+message.id" :value="message.id"></el-option>
                                                    </el-select>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <br>
                                                <el-input
                                                    type="textarea"
                                                    rows="6"
                                                    placeholder="Enter Your Request For Information..."
                                                    v-model="RFIData.RFImessage">
                                                </el-input>
                                            </div>
                                            <div class="col-lg-12">
                                                <br>
                                                <button type="button" class="btn btn-block btn-success" @click="SubmitRFI">Submit Answers to RFI</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- <div class="col-lg-12">
                                    <table ref="RFITable" id="RFIMessagesTable" class="display responsive table table-bordered table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Communication #</th>
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
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Locate on Map -->
        <div class="modal fade" id="DeliveryLocation" tabindex="-1" aria-labelledby="DeliveryLocation" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Locate with Marker</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>

                    <div class="modal-body">
                        <div id="map-canvas"></div>
                        <br>
                        <p class="text-muted">Select The Delivery Location by Dragging and Dropping the Pin on The Map</p>
                    </div>
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Done</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
            
</template>

<script>

    import validate, { isEmpty } from 'validate.js';

    export default {
        name: 'purchase-enquiry-list',
        data(){
            var checkRetentionValue = (rule, value, callback) => {
                if(value == 0){
                    callback();
                    this.PurchaseEnquiryLine.RetentionDays = "";
                } else if (!value) { 
                    return callback(new Error('Please Enter Retention Amount')); 
                }
                
                if (!Number.isInteger(value)) {
                    callback(new Error('Please Enter Digits Only'));
                } else {
                    if (value > 100 || value < 0) {
                        callback(new Error('Rentention Amount Should Between 0% and 100%'));
                    } else {
                        callback();
                    }
                }
                
            };
            var checkRetentionDays = (rule, value, callback) => {
                if (!value && this.PurchaseEnquiryLine.RetentionPercentage != '') { 
                    return callback(new Error('Please Select Retention Days')); 
                } else {
                    callback();
                }
            };
            return{
                E_images : [],
                p_images : [],
                hostName: window.location.protocol+'//'+window.location.hostname,
                DataTable: "",
                CompanySetup: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                JobNumbers: false,
                searchItemsLoading: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                FullyInvoiced: false,
                FoundItems: {},
                RFIDataLoaded: false,
                RFIDetails: [],
                RFIData: {
                    RFIMessageID: "",
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    QuotationType: "",
                    ReplyBy: "Purchase Enquiry Originator",
                    PEId: "",
                },
                PurchaseEnquiryLine: {
                    ID: "",
                    JobNumber: "",
                    SetupName: "",
                    UnderlyingTransaction: "",
                    SourcingPriority: "",
                    EnquiryType: "",
                    StoreItemrequest: "No",
                    EnquiryFromItemMaster: "",
                    ItemNumber: "",
                    ItemDescription: "",
                    Quantity: "",
                    UnitOfMeasurement: "",
                    ServiceDescription: "",
                    AdvancedPayment: "",
                    RetentionPercentage: "",
                    RetentionDays: "",
                    RequiredDocuments: "",
                    PELineNote: "",
                    Longitude: '',
                    Latitude: '',
                    LocationName: ''
                },
                ValidationInfo: {
                    PurchaseEnquiryId: "",
                    RetentionDays: "",
                },
                rules: {
                    RetentionDays: [{
                        required: true,
                        message: "Please Select a Retention Days",
                        trigger: "blur"
                    }]
                },
                PeEditRules: {
                    JobNumber: [{
                        required: true, message: "Please Select Job Number", trigger: ["blur"]
                    }],
                    UnderlyingTransaction: [{
                        required: false,
                        message: "Please Underlying Transaction",
                        trigger: "blur"
                    }],
                    SourcingPriority: [{
                        required: false,
                        message: "Please Select Sourcing Priority",
                        trigger: "blur"
                    }],
                    EnquiryType: [{
                        required: true,
                        message: "Please Select Transaction Type",
                        trigger: ["blur"]
                    }],
                    ServiceDescription: [{
                        required: true,
                        message: "Please Enter Service Description",
                        trigger: "blur"
                    }],
                    ItemNumber: [{
                        required: false,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    ItemDescription: [{
                        required: false,
                        message: "Please Select an Item",
                        trigger: "blur"
                    }],
                    Quantity: [{
                        required: true,
                        message: "Please Enter Quantity",
                        trigger: "blur"
                    }],
                    UnitOfMeasurement: [{
                        required: true,
                        message: "Please Select Unit of Measurement",
                        trigger: ["blur"]
                    }],
                    AdvancedPayment: [{
                        required: true,
                        message: "Please Select Advanced Payment Requirements.",
                        trigger: "blur"
                    }],
                    RetentionPercentage: [{validator: checkRetentionValue, trigger: 'blur'}],
                    RetentionDays: [{validator: checkRetentionDays, trigger: 'blur'}],
                    RequiredDocuments: [{
                        required: false,
                        message: "Please Select A Document.",
                        trigger: "blur"
                    }],
                    Longitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    Latitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    LocationName: [{
                        required: true,
                        message: "Please Enter Location Name.",
                        trigger: "blur"
                    }]
                },
                ValidationInfoApproval: {
                    PurchaseEnquiryId: "",
                    Decision: "",
                    DecisionNotes: "",
                },
                ApprovalRules: {
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
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            checkArray(data)
            {
                return Array.isArray(data);
            },
            DecisionApprove(){
                let self = this;
                this.ValidationInfoApproval.Decision = "Approved";
                axios.post('/api/purchase_enquiry/validate_purchase_enquiry_creation', this.ValidationInfoApproval)
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 10000
                        });

                        self.ValidationInfoApproval.PurchaseEnquiryId = "";
                        self.ValidationInfoApproval.Decision = "";
                        self.ValidationInfoApproval.DecisionNotes = "";

                        self.DataTable.ajax.reload( null, false );

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Request Approval)', 'error');
                    });

                    $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');

                this.ApprovalRules.DecisionNotes[0].required = false;
                
                

            },
            DecisionReject(){
                let self = this;
                this.ApprovalRules.DecisionNotes[0].required = true;
                this.ValidationInfoApproval.Decision = "Rejected";
                this.$refs.PurchaseEnquiryApprovalForm.validate((validation) => {
                    if(validation){
                        axios.post('/api/purchase_enquiry/validate_purchase_enquiry_creation', this.ValidationInfoApproval)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.ValidationInfoApproval.PurchaseEnquiryId = "";
                                self.ValidationInfoApproval.Decision = "";
                                self.ValidationInfoApproval.DecisionNotes = "";

                                self.DataTable.ajax.reload( null, false );

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Request Approval)', 'error');
                            });

                            $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');

                        this.ApprovalRules.DecisionNotes[0].required = false;

                        

                    }
                })
            },
            CancelPurchaseEnquiry(){
                let self = this;
                axios.post( '/api/purchase_enquiry/cancel_purchase_enquiry_request', {PurchaseEnquiryId: this.EditModalInfo.id})
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });

                    $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');

            },
            SubmitUpdatePurchaseRequest() {
                let self = this;
                if (event) event.preventDefault();
                
                axios.post('/api/purchase_enquiry/update_purchase_enquiry_request', this.PurchaseEnquiryLine)
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Enquiry Resubmission)', 'error');
                    });


                    $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');
                    

            },
            searchItems(value) {
                this.ItemRateContractDetails = [];
                this.RateContractDataLoaded = false;
                this.PurchaseEnquiryLine.ItemNumber = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_items', {searchQuery: value})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                        //console.log(this.FoundItems);
                    })
            },
            showRateContract(ItemId){

                event.preventDefault();

                axios.post('/api/data/get_item_rate_contract_details', {ItemId: ItemId})
                    .then((response) => {
                        this.ItemRateContractDetails = response.data;
                        this.RateContractDataLoaded = true;
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Getting Item Rate Contract Details)', 'error');
                    });

            },
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        if(response.data.p_images !== null){
                            let image_array_string = response.data.p_images;
                            let image_string = image_array_string.substring(1, image_array_string.length-1);
                            let final = image_string.replace(/"/g,"");
                            var d= final.split(',');
                            this.p_images = d;
                        }
                        this.viewDataLoaded = true;
                        $('#PurchaseEnquiryUpdateModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        if(response.data.p_images !== null){
                            let image_array_string = response.data.p_images;
                            let image_string = image_array_string.substring(1, image_array_string.length-1);
                            let final = image_string.replace(/"/g,"");
                            var d= final.split(',');
                            this.E_images = d;
                        }
                        this.ValidationInfo.PurchaseEnquiryId = this.EditModalInfo.id;
                        this.ValidationInfoApproval.PurchaseEnquiryId = this.EditModalInfo.id;
                        this.ValidationInfo.RetentionDays = this.EditModalInfo.retention_days;

                        /* Check if Fully Invoiced So User Cannot Adjust The Retention Date (Known Bugs if the vendor invoices the client partially on the Retention Money */
                        if(this.EditModalInfo.invoicing_status == 'Invoicing Completed'){
                            this.FullyInvoiced = true;
                        }

                        /* Updating Edit Model Information */
                        if(this.EditModalInfo.status.indexOf('Rejected') !== -1){
                            this.PurchaseEnquiryLine.ID = this.EditModalInfo.id;
                            this.PurchaseEnquiryLine.JobNumber = this.EditModalInfo.project_id;
                            this.PurchaseEnquiryLine.UnderlyingTransaction = this.EditModalInfo.underlying_transaction;
                            this.PurchaseEnquiryLine.SourcingPriority = this.EditModalInfo.sourcing_priority;
                            this.PurchaseEnquiryLine.EnquiryType = this.EditModalInfo.enquiry_type;
                            if(this.EditModalInfo.item.item_group_id == 11){
                                this.PurchaseEnquiryLine.EnquiryFromItemMaster = 'No';
                            } else {
                                this.PurchaseEnquiryLine.EnquiryFromItemMaster = 'Yes';
                            }
                            this.PurchaseEnquiryLine.ItemNumber = this.EditModalInfo.item_id;
                            this.PurchaseEnquiryLine.ItemDescription = this.EditModalInfo.item_description;
                            this.PurchaseEnquiryLine.Quantity = this.EditModalInfo.quantity;
                            this.PurchaseEnquiryLine.UnitOfMeasurement = this.EditModalInfo.u_o_m;
                            this.PurchaseEnquiryLine.ServiceDescription = this.EditModalInfo.service_description;
                            this.PurchaseEnquiryLine.AdvancedPayment = this.EditModalInfo.advanced_payment;
                            this.PurchaseEnquiryLine.RetentionPercentage = this.EditModalInfo.retention_percentage;
                            this.PurchaseEnquiryLine.RetentionDays = this.EditModalInfo.retention_days;
                            this.PurchaseEnquiryLine.RequiredDocuments = this.EditModalInfo.required_documents;
                            this.PurchaseEnquiryLine.PELineNote = this.EditModalInfo.notes;
                            this.PurchaseEnquiryLine.Longitude = this.EditModalInfo.longitude;
                            this.PurchaseEnquiryLine.Latitude = this.EditModalInfo.latitude;
                            this.PurchaseEnquiryLine.LocationName = this.EditModalInfo.location_name;
                            this.ItemRateContractDetails = [];
                            this.RateContractDataLoaded = false;





                            /*
                             * Google Map inside modal
                             */
                            var initializeMap = function(id) {

                                var myLatLng = {lat: this.PurchaseEnquiryLine.Latitude, lng: this.PurchaseEnquiryLine.Longitude};

                                // Map Options
                                var mapOptions = {
                                    zoom: 10,
                                    center: new google.maps.LatLng(this.PurchaseEnquiryLine.Latitude, this.PurchaseEnquiryLine.Longitude),
                                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                                };


                                // Initialize the map with options (inside #map element)
                                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


                                var marker = new google.maps.Marker({
                                    position: myLatLng,
                                    map: map,
                                    draggable: true

                                });


                                google.maps.event.addListener(marker, 'position_changed', function () {
                                    self.PurchaseEnquiryLine.Longitude = marker.getPosition().lat();
                                    self.PurchaseEnquiryLine.Latitude = marker.getPosition().lng();
                                });


                                // When modal window is open, this script resizes the map and resets the map center
                                $("#DeliveryLocation").on("shown.bs.modal", function(e) {
                                  google.maps.event.trigger(map, "resize");
                                  return map.setCenter(myLatLng);
                                });


                                google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));

                            }

                        }

                        this.editDataLoaded = true;
                        $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');

                    })
                this.editDataLoaded = false;
            },
            EnquiryItemDescriptionSelection(){
                if(this.PurchaseEnquiryLine.EnquiryFromItemMaster == 'Yes'){
                    this.rules.ItemNumber[0].required = true;
                    this.rules.ItemDescription[0].required = false;
                } else if (this.PurchaseEnquiryLine.EnquiryFromItemMaster == 'No') {
                    this.rules.ItemNumber[0].required = false;
                    this.rules.ItemDescription[0].required = true;
                } else {
                    this.rules.ItemNumber[0].required = false;
                    this.rules.ItemDescription[0].required = false;
                }
                
            },
            PurchaseEnquiryRententionUpdate(){
                let self = this;

                this.$refs.PurchaseRequestRetentionUpdateForm.validate((validation) => {
                    if(validation){

                        axios.post('/api/purchase_enquiry/update_purchase_enquiry_request_by_peo', this.ValidationInfo)
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
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Update Purchase Request Details)', 'error');
                            });

                            $('#PurchaseEnquiryUpdateModalEdit').modal('toggle');

                    }
                });

            },
            showAllRFIModal(recordId, RecordType, QuotationId) {
                this.RFIData.CompanyId = this.CompanySetup.id
                this.RFIData.QuotationId = QuotationId;
                this.RFIData.PEId = recordId;
                this.RFIData.QuotationType = RecordType;
                this.RFIDetails = [];
                axios.post('/api/data/get_all_pe_rfi_details', {PEId: recordId, QuotationType: RecordType})
                    .then((response) => {
                        this.RFIDetails = response.data;
                        this.RFIDataLoaded = true;
                        // console.log(this.RFIDetails);

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
            SubmitRFI(){
                //check if empty
                if(this.RFIData.RFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                } else {
                    axios.post( '/api/quotations_management/create_rfi_message', this.RFIData)
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });
                            this.RFIData.RFImessage = "";
                            this.RFIData.RFIMessageID = "";
                        })

                    

                    $('#RFIModal').modal('toggle');
                    this.DataTable.ajax.reload( null, false );
                }         
            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace(',', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
        },
        mounted(){
            let self = this;

            var groupColumn = 1;

            axios.get('/api/data/get_company_details')
                .then((response) => {
                    // console.log(response.data);
                    self.CompanySetup = response.data;
                });

            axios.get('/api/data/get_user_projects_list')
                .then((response) => {
                    this.JobNumbers = response.data;
                });


            setTimeout(() => {

                this.DataTable = $('#ProjectPEList').DataTable({
                    fixedHeader: {
                        header: true,
                        headerOffset: 117
                    },
                    
                    stateSave:  false,
                    responsive: true,
                    colReorder: true,
                    processing: true,
                    autoWidth: true,
                    serverSide: true,
                    ajax: 'http://' + window.location.host + '/api/data/get_purchase_request_list_for_peos',
                    columns: [
                        { data: 'show_id', name: 'show_id' },
                        { data: 'purchase_enquiry_group_id', name: 'purchase_enquiry_group_id' },
                        { data: 'project.title', name: 'project.title' },
                        { data: 'creator.name', name: 'creator.name' },
                        { data: 'sourcing_priority', name: 'sourcing_priority' },
                        { data: 'complete_description_with_headers', render: function(data, type, full){
                            if(data == null){
                                return '';
                            }else{
                                return data.length >= 200 ?
                                    data.substr(0,200) +'...' :
                                    data;
                            }
                        }},
                        { data: 'service_description', name: 'service_description' },
                        { data: 'quantity', name: 'quantity' },
                        { data: 'expected_price', name: 'expected_price' },
                        { data: 'item.u_o_m', render: function(data, type, full){
                            if(full.u_o_m == null){
                                return '';
                            }else{
                                return full.u_o_m;
                            }
                        }},
                        { data: 'advanced_payment', name: 'advanced_payment' },
                        { data: 'retention_percentage', name: 'retention_percentage' },
                        { data: 'underlying_transaction', name: 'underlying_transaction' },
                        { data: 'created_at', name: 'created_at' },
                        { data: 'updated_at', name: 'updated_at' },
                        { data: 'updated_at_human', render: function(data, type, full){
                            if(full.updated_at_human == null){
                                return '';
                            }else{
                                return full.updated_at_human.substr(0,200);
                            }
                        }},
                        // { data: 'status', name: 'status' },
                        { data: 'action', name: 'action', orderable: false, searchable: false }
                    ],
                    columnDefs: [
                        {"orderable":false, "targets":9},
                        { visible: false, targets: groupColumn },
                        { width: '30%', targets: 6 },
                        { responsivePriority: 1, targets: -1 },
                        { responsivePriority: 2, targets: 0 },
                        { responsivePriority: 3, targets: 16 },
                    ],
                    dom: '<"html5buttons">Brfgtip',
                    pageLength: 10,
                    lengthMenu: [
                        [ 10, 25, 50, 100, 500, 1000, -1 ],
                        [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                    ],
                    order: [[ groupColumn, 'ASC' ]],
                    "drawCallback": function ( settings ) {
                        var api = this.api();
                        var rows = api.rows( {page:'current'} ).nodes();
                        var last=null;

                        api.column({page:'current'} ).data().each( function ( group, i ) {
                        var res = group.slice(0, -2);
                            if ( last !== group ) {
                                $(rows).eq( i ).before(
                                    '<tr class="group"><td colspan="12">Purchase Enquiry ID# '+res+'</td></tr>'
                                );
             
                                last = group;
                            }
                        } );
                    },
                    buttons: [
                        { extend: 'pageLength', className: 'btn btn-success' },
                        { extend: 'copy', className: 'btn btn-success' },
                        { extend: 'excel', className: 'btn btn-success', title: 'PurchaseEnquiriesList '+new Date() },
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
                        // console.log(data);
                        if (data.status.indexOf('Rejected') !== -1) {
                            $(row).css('background-color', 'rgb(252, 51, 23, 0.3)')
                        }
                    } 
                });

                

                $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                    var $this = $(this);
                    var elquentClass = $(this).data('elquentclass');
                    var RecordID = $(this).data('recordid');
                    self.showViewModal(elquentClass, RecordID);
                });

                $('tbody', this.$refs.table).on('click', '.view-rfi', function(){
                    var $this = $(this);
                    var RecordID = $(this).data('recordid');
                    var RecordType = $(this).data('recordtype');
                    var Quotationid = $(this).data('quotationid');
                    self.showAllRFIModal(RecordID, RecordType, Quotationid);
                });

                $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                    var $this = $(this);
                    var elquentClass = $(this).data('elquentclass');
                    var RecordID = $(this).data('recordid');
                    self.showEditModal(elquentClass, RecordID);
                });

            }, 500);


        },
        beforeRouteLeave (to, from, next) {
            this.DataTable.destroy();
            next();
        }
    }

</script>
<style>
@media print {
  body * {
    visibility: hidden;
  }
  #PurchaseEnquiryUpdateModalView, #PurchaseEnquiryUpdateModalView * {
    visibility: visible;
  }
  #PurchaseEnquiryUpdateModalView {
    position: absolute;
    left: 0;
    top: 0;
  }
}



</style>

<style scoped>

    .font-500{
        font-weight: 500;
    }

    .ogeo-background {
        background-color: rgb(252, 51, 23);
    }

    #PurchaseEnquiryUpdateModalView .modal-dialog {
        min-width:80%;
    }

    #PurchaseEnquiryUpdateModalEdit .modal-dialog {
        min-width:80%;
    }

    #map-canvas {
        width: 100%;
        height: 450px;
        margin: 0 auto;
    }
    
    #DeliveryLocation .modal-dialog {
        width:80%;
    }

    .el-select-dropdown {
        z-index: 20000 !important;
    }

    .el-popper {
        z-index: 20000 !important;
    }

    .el-scrollbar {
        z-index: 20000 !important;
        overflow-y: auto;
        max-width: 1200px !important;
        max-height: 500px !important;
        z-index: 1;
    }
    .el-scrollbar__wrap{
        z-index: 20000 !important;
        max-width: 1200px !important;
        max-height: 500px !important;
        z-index: 1;
    }

    .ogeo-text{
        color: rgb(252, 51, 23, 1);
    }

</style>