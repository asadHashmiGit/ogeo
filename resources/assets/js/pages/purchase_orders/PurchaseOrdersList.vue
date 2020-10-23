<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Orders List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="ProjectPOList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>PO #</th>
                                <th>PO Generator</th>
                                <th>Set-up Name</th>
                                <th>Approval Criteria</th>
                                <th>Total PO Value</th>
                                <th>PE Line IDs</th>
                                <th>Awardee Vendor</th>
                                <th>Created At</th>
                                <th>Last Updated At</th>
                                <th>Status</th>
                                <th>Action</th> 
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="PurchaseOrderUpdateModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderUpdateModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"  v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title text-ogeo">Purchase Order ID# <span v-if="ViewModalInfo.company.po_prefix==''">PO-{{ ViewModalInfo.purchase_order_group_id }}</span><span else>{{ ViewModalInfo.company.po_prefix }}-{{ ViewModalInfo.purchase_order_group_id }}</span></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 50%"><b>Purchase Order ID#</b></td>
                                        <td><span v-if="ViewModalInfo.company.po_prefix==''">PO-{{ ViewModalInfo.purchase_order_group_id }}</span><span else>{{ ViewModalInfo.company.po_prefix }}-{{ ViewModalInfo.purchase_order_group_id }}</span></td>
                                    </tr>
                                    <tr>
                                        <td><b>Commercial Evalutation ID#</b></td>
                                        <td><span v-if="ViewModalInfo.company.ce_prefix==''">CE-{{ ViewModalInfo.commercial_evaluation.commerical_evaluation_group_id }}</span><span else>{{ ViewModalInfo.company.ce_prefix }}-{{ ViewModalInfo.commercial_evaluation.commerical_evaluation_group_id }}</span></td>
                                    </tr>
                                    <tr>
                                        <td><b>RfP ID#</b></td>
                                        <td><span v-if="ViewModalInfo.company.rfq_prefix==''">RfP-{{ ViewModalInfo.quotation.quotation_group_id }}</span><span else>{{ ViewModalInfo.company.rfq_prefix }}-{{ ViewModalInfo.quotation.quotation_group_id }}</span></td>
                                    </tr>
                                    <tr>
                                        <td><b>RfP Name</b></td>
                                        <td>{{ ViewModalInfo.quotation.rfp_name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Originated By</b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Originated At</b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Awardee Vendor:</b></td>
                                        <td>{{ ViewModalInfo.vendor.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Consulted Vendors </b></td>
                                        <td>
                                            <ol>
                                                <li v-for="vendor in ViewModalInfo.quotation.vendors" :key="vendor.id">{{ vendor.name }}-ID#{{ vendor.id }}</li>
                                            </ol>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40%"><b>Total PO Value:</b></td>
                                        <td class="text-ogeo"><b>{{ formatPrice(ViewModalInfo.vendor_responses.reduce((acc, responses) => acc + responses.price, 0)) }} {{ ViewModalInfo.vendor_responses[0].currency }}</b></td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>


                        <hr>
                        <h3 class="text-ogeo">Purchase Enquiry lines</h3>

                        <div class="col-lg-12">
                            <div class="table-wrapper">
                                <table ref="ViewPOPELines" id="ViewPOPELines" class="responsive table table-bordered cell-border" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>PE ID# (Status)</th>
                                            <th style="min-width: 600px">Requested Materials</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Quantity</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Delivery Location Details</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Underlying Transaction</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Retention Percentage</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Vendor Response</th>
                                            <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Communication</th>
                                            <th>Approval Notes</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr :key="PEResponse.id" v-for="PEResponse in ViewModalInfo.vendor_responses">

                                            <td>
                                                <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEResponse.purchase_enquiry.purchase_enquiry_group_id }}-{{ PEResponse.purchase_enquiry.purchase_enquiry_ingroup_id }} <br><br>
                                                (<b>{{ PEResponse.purchase_enquiry.purchase_orders[0].pivot.status }}</b>)
                                            </td>

                                            <td v-if="PEResponse.purchase_enquiry.item.item_template">
                                                <span>
                                                    <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEResponse.purchase_enquiry.item.item_group_id }}-{{ PEResponse.purchase_enquiry.item.item_ingroup_id }}</span></b><br>
                                                    <template v-for="index in 20">    
                                                        <span :key="index" v-if="PEResponse.purchase_enquiry.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                            <b>{{ PEResponse.purchase_enquiry.item.item_template['field_'+index] }}:</b> {{ PEResponse.purchase_enquiry.item['field_'+index] }} | 
                                                        </span>
                                                    </template>
                                                </span><br>
                                            </td>
                                            <td v-else style="min-width: 200px">{{ PEResponse.purchase_enquiry.item_description }}</td>

                                            <td v-if="PEResponse.purchase_enquiry.item_id">
                                            <b>{{ PEResponse.purchase_enquiry.quantity }}</b> - <span v-if="PEResponse.purchase_enquiry.item.item_template">{{ PEResponse.purchase_enquiry.item.u_o_m }}</span><span v-else>{{ PEResponse.purchase_enquiry.u_o_m }}</span>
                                                
                                            </td>     
                                            <td v-if="PEResponse.purchase_enquiry.item_id">
                                                <b>Location Name:</b><br>{{ PEResponse.purchase_enquiry.location_name }}<br>
                                                <b>Latitude:</b><br>{{ PEResponse.purchase_enquiry.latitude }}<br>
                                                <b>Longitude:</b><br>{{ PEResponse.purchase_enquiry.longitude }}
                                            </td>
                                            <!-- <td v-if="PEResponse.purchase_enquiry.item_id">{{ PEResponse.purchase_enquiry.advanced_payment }}</td> -->
                                            <td v-if="PEResponse.purchase_enquiry.item_id">{{ PEResponse.purchase_enquiry.underlying_transaction }}</td>
                                            <td v-if="PEResponse.purchase_enquiry.item_id">{{ PEResponse.purchase_enquiry.retention_percentage }}% - {{ PEResponse.purchase_enquiry.retention_days }} Day(s)</td>
                                            
                        
                                            <td class="text-ogeo" style="min-width: 150px">
                                                <span><b>Unit Rate:</b> {{ PEResponse.unit_rate }} {{ PEResponse.currency }}</span><br>
                                                <span><b>Total Price:</b> {{ formatPrice( PEResponse.unit_rate * PEResponse.purchase_enquiry.quantity) }} {{ PEResponse.currency }}</span><br>
                                                <span><b>Lead Days:</b> {{ PEResponse.lead_days }} Days</span><br>
                                                <span><b>Advanced Payment:</b> {{ PEResponse.advanced_percentage }}%</span><br>
                                                <span v-if="PEResponse.notes">Vednor Notes: 
                                                    <span>{{ PEResponse.notes }}</span>
                                                </span>
                                            </td>


                                            <td style="min-width: 240px;">
                                                <!-- RFI Review -->
                                                <template v-if="PEResponse.purchase_enquiry.rfis.length">
                                                    <button type="button" @click="showRFIModal(PEResponse.purchase_enquiry.id, PEResponse.purchase_enquiry.rfis[0].vendor_id)" class="btn btn-info">View RFIs <div v-if="PEResponse.purchase_enquiry.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.purchase_enquiry.rfis.length }}</span></div></button>
                                                </template>
                                                <template v-else>
                                                    <button type="button" class="btn btn-info disabled">No RFI</button>
                                                </template>

                                                <!-- Uploaded Files Review -->
                                                <template v-if="PEResponse.purchase_enquiry.uploaded_docs.length">
                                                    <button class="btn btn-info required-docs-placeholder">View Files <div v-if="PEResponse.purchase_enquiry.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.purchase_enquiry.uploaded_docs.length }}</span></div></button>
                                                </template>
                                                <template v-else>
                                                    <button type="button" class="btn btn-info disabled">No Files</button>
                                                </template>
                                            </td>


                                            <td class="alignVertically" align="center">
                                                <p v-if="PEResponse.purchase_enquiry.purchase_orders[0].pivot.approval_notes">{{ PEResponse.purchase_enquiry.purchase_orders[0].pivot.approval_notes }}</p>
                                                <p v-else>No Notes</p>
                                            </td>
                                            
                                        </tr>
                                        
                                    
                                    </tbody>
                                        
                                </table>
                            </div>
                        </div>
                        
  

                        <!-- <div v-for="(CancellationRequest, index) in ViewModalInfo.cancellation_requests"  class="col-lg-12">
                            <hr> 
                            <h3>History of Cancellation Request# {{ index + 1 }}</h3>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
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
                                    <template>
                                    <tr v-for="(item, key) in CancellationRequest.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
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
                        </div> -->


                        <div class="col-lg-12">
                            <hr>
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <span><b>By:</b> {{ currentUser.name }}</span><br><br>
                        </div>
                 
                    </div>
                </div>
            </div>
        </div>

        <!-- This is a cancellation modal -->
        <div id="PurchaseOrderCancellationModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderCancellationModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"  v-if="cancelDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: <span v-if="EditModalInfo.company.po_prefix==''">CE-{{ EditModalInfo.purchase_order_group_id }}</span><span else>{{ EditModalInfo.company.po_prefix }}-{{ EditModalInfo.purchase_order_group_id }}</span></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <!-- <td>PO-{{ EditModalInfo.receipt_note_group_id }}-{{ EditModalInfo.receipt_note_ingroup_id }}</td> -->
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>PO Line Number (ID):</b></td>
                                        <!-- <td>PO-{{ EditModalInfo.receipt_note_group_id }}-{{ EditModalInfo.receipt_note_ingroup_id }}</td> -->
                                    </tr>
                                    <tr>
                                        <td><b>Requested Quantity </b></td>
                                        <!-- <td>{{ EditModalInfo.purchase_enquiry.quantity }}</td> -->
                                    </tr>
                                    <tr>
                                        <td><b>Received Quantity </b></td>
                                        <!-- <td>{{ EditModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td> -->
                                    </tr>
                                    <tr>
                                        <td><b>Pending Quantity </b></td>
                                        <!-- <td>{{ EditModalInfo.purchase_enquiry.quantity - EditModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0) }}</td> -->
                                    </tr>
                                    <tr>
                                        <td><b>Additional details </b></td>
                                        <td>Tell me what additional details you want to see here</td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                        <el-form :model="CancellationInfo" class="demo-form-inline" :rules="rules" ref="ReceiptNoteCancellationForm">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-12">
                                        <hr>
                                        <h4 class="text-danger" align="center">Purchase Order Line Cancellation</h4>
                                    </div>
                                    
                                    <el-col :span="24" >
                                        <div class="grid-content">
                                            <el-form-item label="Select Reason For Cancellation" prop="CancellationReason">
                                                    
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                    <span class="tooltip-item2">
                                                        <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                        
                                                    </span>
                                                    <span class="tooltip-content4 clearfix">
                                                        <span class="tooltip-text2">
                                                            Any Note Can Go Here.
                                                        </span>
                                                    </span>
                                                </span>

                                                <el-select filterable style="width: 100%; padding: 0px;" v-model="CancellationInfo.CancellationReason" placeholder="Select Reason For Cancellation">
                                                    
                                                    <el-option label="The vendor sent a notifucation that he decided not to deliver because the agreed advanced payment wasn't made." value="The vendor sent a notifucation that he decided not to deliver because the agreed advanced payment wasn't made."></el-option> 
                                                    <el-option label="The vendor sent a notifucation that he decided not to deliver without providing a reason" value="The vendor sent a notifucation that he decided not to deliver without providing a reason"></el-option> 
                                                    <el-option label="The vendor didn't succeed in fully delivering the entirety of the items as per the agreed lead time. (This is only for PO line for materials. Shouldn't be in the dropdown for services)" value="The vendor didn't succeed in fully delivering the entirety of the items as per the agreed lead time. (This is only for PO line for materials. Shouldn't be in the dropdown for services)"></el-option> 
                                                    <el-option label="The vendor didn't mobilise his project team per the agreed lead time. (This is only for PO line for Services. Shouldn't be in the dropdown for Materials)" value="The vendor didn't mobilise his project team per the agreed lead time. (This is only for PO line for Services. Shouldn't be in the dropdown for Materials)"></el-option> 
                                                    <el-option label=" the vendor didn't deliver his service per the agreed quality. (This is only for PO line for Services. Shouldn't be in the dropdown for Materials)" value=" the vendor didn't deliver his service per the agreed quality. (This is only for PO line for Services. Shouldn't be in the dropdown for Materials)"></el-option> 
                                                    <el-option label=" the vendor didn't items of the quality specified in the PO. (This is only for PO line for materials. Shouldn't be in the dropdown for services)" value=" the vendor didn't items of the quality specified in the PO. (This is only for PO line for materials. Shouldn't be in the dropdown for services)"></el-option> 
                                                    
                                                </el-select>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="24" >
                                        <div class="grid-content">
                                            <el-form-item label="Enter Cancellation Notes" prop="CancellationNotes">
                                                <el-input
                                                  type="textarea"
                                                  :rows="5"
                                                  placeholder="Enter Cancellation Notes"
                                                  v-model="CancellationInfo.CancellationNotes">
                                                </el-input>
                                            </el-form-item>
                                        </div> 
                                    </el-col>

                                    <div class="col-lg-12 float-right">
                                        <button type="button" @click="CancelPurchaseOrderLine" class="btn btn-block btn-success waves-effect">Cancel Purchase Order Line</button>
                                    </div>
                                    
                                </div>
                            </div>
                        </el-form>


                    </div>
                </div>
            </div>
        </div>




        <!-- This is a validation/approval modal -->
        <div id="PurchaseOrderValidationModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseOrderValidationModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"  v-if="editDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Order Number: {{ EditModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="PODetailsTable" id="PODetailsTable" class="table table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>PE Id</th>
                                                <th style="min-width: 600px;">Item Details</th>
                                                <th>Quantity</th>
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
                                            <tr :key="PEResponse.id" v-for="PEResponse in EditModalInfo.vendor_responses">
                                                <td>{{ PEResponse.purchase_enquiry.id }}</td>
                                                
                                                <td v-if="PEResponse.purchase_enquiry.item.item_template">
                                                    <span>
                                                        <b><span><span v-if="EditModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ EditModalInfo.company.lom_prefix }}</span>-{{ PEResponse.purchase_enquiry.item.item_group_id }}-{{ PEResponse.purchase_enquiry.item.item_ingroup_id }}</span></b><br>
                                                        <template v-for="index in 20">    
                                                            <span :key="index" v-if="PEResponse.purchase_enquiry.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                <b>{{ PEResponse.purchase_enquiry.item.item_template['field_'+index] }}:</b> {{ PEResponse.purchase_enquiry.item['field_'+index] }} | 
                                                            </span>
                                                        </template>
                                                    </span><br>
                                                </td>
                                                <td v-else style="min-width: 200px">{{ PEResponse.purchase_enquiry.item_description }}</td>

                                                <td v-if="PEResponse.purchase_enquiry.item_id">
                                                    <input
                                                       class="form-control"
                                                       :id="'PEline_'+PEResponse.purchase_enquiry.id+'_Quantity'"
                                                       style="min-width: 100%;"
                                                       type="number"
                                                       v-on:input="UpdateLinePrice(EditModalInfo.id, PEResponse.purchase_enquiry.id, index)"
                                                       :value="PEResponse.purchase_enquiry.quantity"
                                                       placeholder="Quantity">
                                                    </input>
                                                </td>
                                                <td v-else>
                                                    <input
                                                        class="form-control"
                                                        :id="'PEline_'+PEResponse.purchase_enquiry.id+'_Quantity'"
                                                        style="min-width: 100%;"
                                                        type="number"
                                                        disabled
                                                        value="1">
                                                    </input>
                                                </td>

                                                <td>{{ PEResponse.unit_rate }}</td>
                                                
                                                <td v-if="PEResponse.purchase_enquiry.item_id">{{ parseFloat(PEResponse.unit_rate) * parseFloat(PEResponse.purchase_enquiry.quantity) }} </td>
                                                <td v-else>{{ parseFloat(PEResponse.unit_rate) * 1 }} </td>

                                                <td>{{ PEResponse.currency }} </td>
                                                <td style="min-width: 150px">
                                                    <span><b>Lead Days:</b> {{ PEResponse.lead_days }} Days</span><br>
                                                    <span><b>Advanced Payment:</b> {{ PEResponse.advanced_percentage }}%</span><br>
                                                    <span v-if="PEResponse.notes">Vednor Notes: 
                                                        <span>{{ PEResponse.notes }}</span>
                                                    </span>
                                                </td>
                                                <td style="min-width: 240px;">
                                                    <!-- RFI Review -->
                                                    <template v-if="PEResponse.purchase_enquiry.rfis.length">
                                                        <button type="button" @click="showRFIModal(PEResponse.purchase_enquiry.id, PEResponse.purchase_enquiry.rfis[0].vendor_id)" class="btn btn-info">View RFIs <div v-if="PEResponse.purchase_enquiry.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.purchase_enquiry.rfis.length }}</span></div></button>
                                                    </template>
                                                    <template v-else>
                                                        <button type="button" class="btn btn-info disabled">No RFI</button>
                                                    </template>

                                                    <!-- Uploaded Files Review -->
                                                    <template v-if="PEResponse.purchase_enquiry.uploaded_docs.length">
                                                        <button class="btn btn-info required-docs-placeholder">View Files <div v-if="PEResponse.purchase_enquiry.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEResponse.purchase_enquiry.uploaded_docs.length }}</span></div></button>
                                                    </template>
                                                    <template v-else>
                                                        <button type="button" class="btn btn-info disabled">No Files</button>
                                                    </template>
                                                </td>
                                                <td>{{ PEResponse.purchase_enquiry.purchase_orders[0].pivot.status }}</td>
                                                <td>{{ EditModalInfo.created_at }}</td>
                                                <td style="min-width: 150px">
                                                    <el-input
                                                       :id="'PEline_'+PEResponse.purchase_enquiry.id+'_Decision_Notes'"
                                                       style="min-width: 100%; font-size:12px"
                                                       type="textarea"
                                                       rows="3"
                                                       placeholder="Decision Notes">
                                                    </el-input><br>
                                                    <div class="m-t-10">
                                                        <button @click="RejectPOLine(EditModalInfo.id, PEResponse.purchase_enquiry.id, index)" style="width: 45%" type="button" class="btn btn-sm btn-danger pull-left">Reject</button> 
                                                        <button @click="ApprovePOLine(EditModalInfo.id, PEResponse.purchase_enquiry.id, index)" style="width: 45%" type="button" class="btn btn-sm btn-success pull-right">Approve</button>
                                                        <button @click="RequestPOLineInfo(EditModalInfo.id, PEResponse.purchase_enquiry.id, index)" style="width: 100%; margin-top: 2px;" type="button" class="btn btn-sm btn-primary pull-right">Request Clarification</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <hr><button type="button" @click="SubmitPODecision(EditModalInfo.id)" class="btn btn-block btn-success"> Submit Decisions</button>
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


        <div id="POLineRFIDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="POLineRFIDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">PO Line Additional Information Request</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="POLineRFIDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <table ref="POLineRFITable" id="POLineRFITable" class="display responsive table table-bordered table-hover" style="width:100%">
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
                                        <tr v-for="message in POLineRFIDetails">
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
                                    v-model="POLineRFImessage">
                                </el-input>
                            </div>
                            <div class="col-lg-12">
                                <br>
                            </div>
                            <div class="col-lg-12">
                                <button type="button" class="btn btn-block btn-success" @click="SubmitPOLineRFI()">Send Message</button>
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
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                cancelDataLoaded: false,
                RFIDataLoaded: false,
                POLineRFIDataLoaded: false,
                RequiredDocsDataLoaded: false,
                ViewModalInfo: {
                    purchase_order: '',
                },
                EditModalInfo: {
                    purchase_order: '',
                },
                CancellationInfo: {
                    ReceiptNoteId: "",
                    CancelledQty: "",
                    CancellationReason: "",
                    CancellationNotes: "",
                },
                rules: {
                    CancellationReason: [{
                        required: true,
                        message: "Please Select a Cancellation Reason",
                        trigger: "blur"
                    }],
                    CancellationNotes: [{
                        required: false,
                        message: "Please Enter Cancellation Note",
                        trigger: "blur"
                    }]
                },
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            SubmitPODecision(POId){

                var self = this;

                if(this.EditModalInfo.vendor_responses.length > (this.ApprovedLines.length + this.RejectedLines)){
                    Swal('Decision Incomplete', 'Please complete descision for all lines', 'warning');
                } else {
                    //Adding Generic value which is added when the approver changes the quantity
                    $.each(self.EditModalInfo.vendor_responses, function(RowIndex, vendor_response) {
                        //update object which will be submitted
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('POId')){
                            self.EditModalInfo.vendor_responses[RowIndex].POId = self.EditModalInfo.id;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('PEId')){
                            self.EditModalInfo.vendor_responses[RowIndex].PEId = self.EditModalInfo.vendor_responses[RowIndex].purchase_enquiry_id;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('OldPrice')){
                            self.EditModalInfo.vendor_responses[RowIndex].OldPrice = self.EditModalInfo.vendor_responses[RowIndex].price;
                        }
                        if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('NewPrice')){
                            self.EditModalInfo.vendor_responses[RowIndex].NewPrice = parseFloat(self.EditModalInfo.vendor_responses[RowIndex]['purchase_enquiry'].quantity) * self.EditModalInfo.vendor_responses[RowIndex].unit_rate;
                        }
                        //this is only if we are dealing with materials 
                        if(self.EditModalInfo.vendor_responses[RowIndex].purchase_enquiry.item_id != null){
                           if(!self.EditModalInfo.vendor_responses[RowIndex].hasOwnProperty('OldQuantity')){
                                self.EditModalInfo.vendor_responses[RowIndex].OldQuantity = self.EditModalInfo.vendor_responses[RowIndex]['purchase_enquiry'].quantity;
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

                    axios.post('/api/quotations_management/purchase_order_approval', {POId: POId, POResponseDetails: self.EditModalInfo.vendor_responses, ApprovedLines: self.ApprovedLines, RejectedLines: self.RejectedLines, ProjectId: self.EditModalInfo.project_id, CompanyId: self.EditModalInfo.company_id, POApprovalLevel: self.EditModalInfo.approval_level, Currency: self.EditModalInfo.vendor_responses[0].currency})
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
                    $('#PurchaseOrderValidationModalEdit').modal('toggle');
                    self.DataTable.ajax.reload( null, false );
                    
                }
                
            },
            UpdateLinePrice(POId, PEId, RowIndex){
                var table = this.POLinesTable;
                var quantity = parseFloat($('#PEline_'+PEId+'_Quantity').val());
                // console.log(quantity);
                if(!quantity || quantity == 0){
                    Swal('Quantity Can Be Blank or Zero', 'Value will reset to its original quantity', 'info')
                    parseFloat($('#PEline_'+PEId+'_Quantity').val(this.EditModalInfo.purchase_enquiries[RowIndex].quantity));
                    return false;
                }
                var unitRate = parseFloat(table.cell({row: RowIndex, column: 3}).data());
                var NewPrice = quantity * unitRate;

                //update table
                table.cell({row: RowIndex, column: 4}).data(NewPrice);

                //update object which will be submitted
                this.EditModalInfo.vendor_responses[RowIndex].POId = POId;
                this.EditModalInfo.vendor_responses[RowIndex].PEId = PEId;
                this.EditModalInfo.vendor_responses[RowIndex].OldPrice = this.EditModalInfo.vendor_responses[RowIndex].price;
                this.EditModalInfo.vendor_responses[RowIndex].NewPrice = NewPrice;
                this.EditModalInfo.vendor_responses[RowIndex].OldQuantity = this.EditModalInfo.purchase_enquiries[RowIndex].quantity;
                this.EditModalInfo.vendor_responses[RowIndex].NewQuantity = quantity;

            },
            RejectPOLine(POId, PEId, RowIndex){

                if($('#PEline_'+PEId+'_Quantity').val() == 0 || $('#PEline_'+PEId+'_Quantity').val() == ''){
                    Swal('Quantity Required', 'Quantity Required Before Making a Decision', 'warning');
                    return false;
                }
                
                //check if decision notes are entered...
                if($('#PEline_'+PEId+'_Decision_Notes').val() == ""){
                    Swal('Notes Required', 'All Rejections Require Notes', 'warning');
                } else {

                    var table = this.POLinesTable;
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
            ApprovePOLine(POId, PEId, RowIndex){

                if($('#PEline_'+PEId+'_Quantity').val() == 0 || $('#PEline_'+PEId+'_Quantity').val() == ''){
                    Swal('Quantity Required', 'Quantity Required Before Making a Decision', 'warning');
                    return false;
                }

                var table = this.POLinesTable;
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
            RequestPOLineInfo(POId, PEId, RowIndex){

                this.PEId = PEId;
                this.POId = POId;

                this.POLineRFIDetails = [];
                axios.post('/api/data/get_po_line_rfi_details', {POId: POId, PEId: PEId})
                    .then((response) => {
                        this.POLineRFIDetails = response.data;
                        this.POLineRFIDataLoaded = true;
                        // console.log(this.POLineRFIDetails);

                        $('#POLineRFIDetailsModal').modal('toggle');

                        this.$nextTick(() => {
                            $('#POLineRFITable').DataTable({
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

                this.POLineRFIDataLoaded = false;

               
            },
            SubmitPOLineRFI(){

                //check if message is empty
                if(this.POLineRFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                    
                } else {
                    axios.post('/api/quotations_management/create_po_line_rfi', {POLineRFImessage: this.POLineRFImessage, PEId: this.PEId, POId: this.POId, By: "Requester"})
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });
                        })

                    this.POLineRFImessage = "";
                    $('#POLineRFIDetailsModal').modal('toggle');

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
                let PR = this.EditModalInfo.purchase_enquiries.find(isRequiredPE);
                // console.log(PR);
                this.RequiredDocsDetails = PR.required_documents.split(",");
                this.PRVendorUploadedFiles = PR.uploaded_docs;

                //Show the modal
                this.RequiredDocsDataLoaded = true;
                $('#RequiredDocsModal').modal('toggle');

                this.RequiredDocsDataLoaded = true;
            },
            showRFIModal(recordId, VendorId) {
                this.RFIDetails = [];
                axios.post('/api/data/get_pe_rfi_details', {PEId: recordId, VendorId: VendorId})
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

            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {
                    purchase_order: '',
                };
                axios.post('/api/data/get_po_details', {POId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        // console.log(this.ViewModalInfo);
                        this.viewDataLoaded = true;
                        $('#PurchaseOrderUpdateModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            cancelEditModal(elquentClass, recordId){
                this.CancellationInfo.ReceiptNoteId = "";
                this.CancellationInfo.CancelledQty = "";
                this.CancellationInfo.CancellationReason = "";
                this.CancellationInfo.CancellationNotes = "";

                this.EditModalInfo = {
                    purchase_order: '',
                };
                axios.post('/api/data/get_po_details', {POId: recordId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.CancellationInfo.ReceiptNoteId = this.EditModalInfo.id;
                        this.CancellationInfo.CancelledQty = this.EditModalInfo.purchase_enquiry.quantity - this.EditModalInfo.receiving_records.reduce((acc, item) => acc + item.received_quantity, 0);

                        this.cancelDataLoaded = true;
                        $('#PurchaseOrderCancellationModal').modal('toggle');
                    })
                this.cancelDataLoaded = false;
            },
            showEditModal(recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_po_details', {POId: recordId})
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        // console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#PurchaseOrderValidationModalEdit').modal('toggle');

                        this.$nextTick(() => {
                            var table = $('#PODetailsTable').DataTable({
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

                            $('tbody', this.$refs.PODetailsTable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                // console.log(RecordID);
                                self.showRequiredDocsModal(RecordID);
                            });

                            self.POLinesTable = table;

                        });

                        

                    })

                this.editDataLoaded = false;
            },
            CancelPurchaseOrderLine(){
                let self = this;

                this.$refs.ReceiptNoteCancellationForm.validate((validation) => {
                    if(validation){

                        axios.post('/api/receipt_notes_management/cancel_po_rn_line', this.CancellationInfo)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.DataTable.draw(null, false );

                                this.CancellationInfo.ReceiptNoteId = "";
                                this.CancellationInfo.CancelledQty = "";
                                this.CancellationInfo.CancellationReason = "";
                                this.CancellationInfo.CancellationNotes = "";

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Update Purchase Request Details)', 'error');
                            });

                            $('#PurchaseOrderCancellationModal').modal('toggle');

                    }
                });

            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace(',', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
        },
        mounted(){

            const table = $('#ProjectPOList').DataTable({
                fixedHeader: {
                    header: true,
                    headerOffset: 117
                },
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_po_list',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'project.title', name: 'project.title' },
                    { data: 'project.po_doa_criterion', name: 'project.po_doa_criterion' },
                    { data: 'total_po_value', name: 'total_po_value' },
                    { data: 'pe_lines', name: 'pe_lines' },
                    { data: 'vendor.name', name: 'vendor.name' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'updated_at', name: 'updated_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: -1 },
                    { responsivePriority: 2, targets: 1 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 1, 'ASC' ]],
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;  
                },
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
                    // console.log(data.status);
                    if(data.status.indexOf('Created and Assigned to') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('sent for sourcing') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected by ') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.08)')
                    } else {
                        $(row).css('background-color', 'rgb(249, 69, 237, 0.1)')
                    }
                } 
            });

            const self = this;

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showViewModal(elquentClass, RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.cancel-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.cancelEditModal(elquentClass, RecordID);
            });
            
            
            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });


            $('#PurchaseOrderValidationModalEdit').on('hide.bs.modal', function (e) {

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
                                $("#PurchaseOrderValidationModalEdit").modal('hide');
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

    .font-500{
        font-weight: 500;
    }

    #PurchaseOrderUpdateModalView .modal-dialog {
        min-width:80%;
    }

    #PurchaseOrderCancellationModal .modal-dialog {
        min-width:80%;
    }

    #PurchaseOrderValidationModalEdit .modal-dialog {
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

    #POLineRFIDetailsModal .modal-dialog {
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