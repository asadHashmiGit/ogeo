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
                                <th>Commerical Evaluation ID#</th>
                                <th>Set-up</th>
                                <th>RfP ID# (Name)</th>
                                <th>RfP Administrator</th>
                                <th>RfP Floating Date</th>
                                <th>RfP Closing Date</th>
                                <th width="30%">PE Line IDs</th>
                                <!-- <th>PO Line IDs</th> -->
                                <th>Offers Received From</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="QuotationDetailsModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"  v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h3 class="modal-title text-ogeo">Commercial Evaluation ID# <span v-if="ViewModalInfo.company.ce_prefix==''">CE-{{ ViewModalInfo.commerical_evaluation.commerical_evaluation_group_id }}</span><span else>{{ ViewModalInfo.company.ce_prefix }}-{{ ViewModalInfo.commerical_evaluation.commerical_evaluation_group_id }}</span></h3>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <h4 class="text-ogeo">General Information:</h4> 
                                <div class="row">
                                    <div class="col-lg-6">
                                        <table class="table">
                                            <tr>
                                                <td><b>RfP ID: </b></td>
                                                <td><span v-if="ViewModalInfo.company.rfq_prefix == ''">RFP-</span><span v-else>{{ ViewModalInfo.company.rfq_prefix }}-</span>{{ ViewModalInfo.id }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>RfP Name: </b></td>
                                                <td>{{ ViewModalInfo.rfp_name }}</td>
                                            </tr>
                                            <tr>
                                                <td width="40%"><b>Set-up Name: </b></td>
                                                <td>{{ ViewModalInfo.project.title }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Originated By: </b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.evaluator.name }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Originated At: </b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.created_at }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Number of PE lines:</b></td>
                                                <td>{{ ViewModalInfo.purchase_enquiries.length }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Bidding Methodology:</b></td>
                                                <td>{{ ViewModalInfo.sourcing_type }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Status</b></td>
                                                <td><b>{{ ViewModalInfo.commerical_evaluation.status }}</b></td>
                                            </tr>
                                            <tr>
                                                <td><b>On Status</b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.updated_at }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Request for Proposal Timeframe</b></td>
                                                <td>
                                                    {{ ViewModalInfo.start_date | formatDateNTime }} <br>
                                                    {{ ViewModalInfo.end_date | formatDateNTime }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Request For Proposals' Request For Information (RFI) Timeframe</b></td>
                                                <td>
                                                    {{ ViewModalInfo.rfi_start_date | formatDateNTime }} <br>
                                                    {{ ViewModalInfo.rfi_end_date | formatDateNTime }} <br>
                                                </td>
                                            </tr>
                                            
                                            
                                        </table>
                                    </div>

                                    <div class="col-lg-6">
                                        <table class="table">
                                            <tr>
                                                <td><b>Consulted Vendors:</b></td>
                                                <td>
                                                    <ol>
                                                        <li v-for="vendor in ViewModalInfo.vendors">{{ vendor.name }}-ID#{{ vendor.id }}</li>
                                                    </ol>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Confirmed Participants </b></td>
                                                <td>{{ ConfirmedParticipants }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Vendor With Offers</b></td>
                                                <td>{{ VendorsWithBids }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>RFIs Raised</b></td>
                                                <td>{{ RFIsRaised }}</td>
                                            </tr>
                                            

                                        </table>
                                    </div>
                                </div>
                                <hr>
                            </div>
                            
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="Edit" id="CommercialEvaluationLine" class="responsive table table-bordered cell-border" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>PE ID# (Status)</th>
                                                <th style="min-width: 600px">Requested Materials</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Quantity</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">UoM</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Delivery Location Details</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Is Advanced Payment Considered?</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Underlying Transaction</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Sourcing Priority</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Retention Percentage*</th>
                                                <th style="min-width: 270px" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                    Vendor#{{key+1}}: {{ vendor.name }}
                                                </th>
                                                <th>Initial Recommendations</th>
                                                <th>Rerun/Cancel Notes</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <template v-for="(PEline, key, index) in ViewModalInfo.purchase_enquiries">
                                                <tr :class="[
                                                    PEline.purchase_orders.some(PO => (PO['status'].includes('Created'))) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Approvals Fully Completed - PO Sent To Vendor')) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Fully Rejected')) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'].includes('Approved By Level:'))) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Accepted By Vendor')) ? 'po-generated' :
                                                    PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Send for a New Request for Proposals')) ? 'selected_for_new_cancellation_or_new_rfp_existing' :
                                                    PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Purchase Enquiry line cancelled')) ? 'selected_for_new_cancellation_or_new_rfp_existing' : 'po-not-generated']"  >
                                                    <td>
                                                        <span v-if="CompanySetup.pe_prefix == ''">PE-</span><span v-else>{{ CompanySetup.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }} <br><br>
                                                        (<b>{{ PEline.commerical_evaluations[0].pivot.status }}</b>)
                                                    </td>

                                                    <td v-if="PEline.item.item_template">
                                                        <span>
                                                            <b><span><span v-if="CompanySetup.lom_prefix == ''">LoM</span><span v-else>{{ CompanySetup.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                            <template v-for="index in 20">    
                                                                <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                    <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                </span>
                                                            </template>
                                                        </span><br>
                                                    </td>
                                                    <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                    <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                    <td v-else>{{ PEline.u_o_m }}</td>
                                                    <td v-if="PEline.item_id">
                                                        <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                        <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                        <b>Longitude:</b><br>{{ PEline.longitude }}
                                                    </td>
                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.underlying_transaction }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.sourcing_priority }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>
                                                    <td style="min-width: 270px;" v-for="(vendor, key, index) in ViewModalInfo.vendors" >
                                                        <!-- v-bind:class="[ViewModalInfo.trackers[key].status == 'Quotation Submitted' ? 'po-generated' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'po-generated' : 'po-not-generated')]" -->
                                                        <template v-if="vendor.quotation_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_responses">
                                                                <template v-if="PEline.id == response.purchase_enquiry_id">
                                                                    <div v-bind:class="[ response.unit_rate ? 'po-not-generated' : 'po-generated']">
                                                                        <!-- Response Details -->
                                                                        <span><b>Level of Completion:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Price:</b> <template v-if="response.unit_rate">   {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}</template> <template v-else>No Submitted</template></span><br>
                                                                        <template v-if="response.notes != null">
                                                                            <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                        </template>
                                                                        <template v-else>
                                                                            <span><b>Notes:</b> None</span><br>
                                                                        </template>
                                                                        <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                        

                                                                        <!-- RFI Review -->
                                                                        <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                            <button type="button" @click="showAllRFIModal(PEline.id, 'PE')" class="btn btn-info">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                        </template>
                                                                        <template v-else>
                                                                            <button type="button" class="btn btn-info disabled">No RFI</button>
                                                                        </template>

                                                                        <!-- Uploaded Files Review -->
                                                                        <template v-if="PEline.uploaded_docs.length">
                                                                            <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-info required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
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
                                                                    <span><b>Level of Completion: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Total Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            <!-- RFI Review -->
                                                            <!-- <template v-if="PEline.rfis.length">
                                                                <button type="button" @click="showAllRFIModal(PEline.id, 'PE')" class="btn btn-info">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No RFI</button>
                                                            </template>
                                                            
                                                            
                                                            Uploaded Files Review
                                                            <template v-if="PEline.uploaded_docs.length > 0">
                                                                <button class="btn btn-info required-docs-placeholder">View Files <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No Files</button>
                                                            </template> -->

                                                            <button type="button" class="btn btn-info disabled">No RFI</button>

                                                            <button type="button" class="btn btn-info disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td class="alignVertically" align="center">
                                                        <p v-if="PEline.commerical_evaluations[0].pivot.pe_note">{{ PEline.commerical_evaluations[0].pivot.pe_note }}</p>
                                                        <p v-else>No Notes</p>
                                                    </td>
                                                    <td class="alignVertically" align="center">
                                                        <p v-if="PEline.commerical_evaluations[0].pivot.ce_pe_notes">{{ PEline.commerical_evaluations[0].pivot.ce_pe_notes }}</p>
                                                        <p v-else>No Notes</p>
                                                    </td>
                                                </tr>
                                            </template>
                                            
                                        

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <hr>
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <span><b>By:</b> {{ currentUser.name }}</span><br><br>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
        
        <div id="QuotationDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content"  v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h3 class="modal-title">Commercial Evaluation ID# <span v-if="ViewModalInfo.company.ce_prefix==''">CE-{{ ViewModalInfo.commerical_evaluation.commerical_evaluation_group_id }}</span><span else>{{ ViewModalInfo.company.ce_prefix }}-{{ ViewModalInfo.commerical_evaluation.commerical_evaluation_group_id }}</span><span></span></h3>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">

                            <div class="col-lg-12">
                                <h4 class="text-ogeo">General Information:</h4> 
                                <div class="row">
                                    <div class="col-lg-6">
                                        <table class="table">
                                            <tr>
                                                <td><b>RfP ID: </b></td>
                                                <td><span v-if="ViewModalInfo.company.rfq_prefix == ''">RFP-</span><span v-else>{{ ViewModalInfo.company.rfq_prefix }}-</span>{{ ViewModalInfo.id }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>RfP Name: </b></td>
                                                <td>{{ ViewModalInfo.rfp_name }}</td>
                                            </tr>
                                            <tr>
                                                <td width="40%"><b>Set-up Name: </b></td>
                                                <td>{{ ViewModalInfo.project.title }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Originated By: </b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.evaluator.name }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Originated At: </b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.created_at }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Number of PE lines:</b></td>
                                                <td>{{ ViewModalInfo.purchase_enquiries.length }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Bidding Methodology:</b></td>
                                                <td>{{ ViewModalInfo.sourcing_type }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Status</b></td>
                                                <td><b>{{ ViewModalInfo.commerical_evaluation.status }}</b></td>
                                            </tr>
                                            <tr>
                                                <td><b>On Status</b></td>
                                                <td>{{ ViewModalInfo.commerical_evaluation.updated_at }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Request for Proposal Timeframe</b></td>
                                                <td>
                                                    {{ ViewModalInfo.start_date | formatDateNTime }} <br>
                                                    {{ ViewModalInfo.end_date | formatDateNTime }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Request For Proposals' Request For Information (RFI) Timeframe</b></td>
                                                <td>
                                                    {{ ViewModalInfo.rfi_start_date | formatDateNTime }} <br>
                                                    {{ ViewModalInfo.rfi_end_date | formatDateNTime }} <br>
                                                </td>
                                            </tr>
                                            
                                            
                                        </table>
                                    </div>

                                    <div class="col-lg-6">
                                        <table class="table">
                                            <tr>
                                                <td><b>Consulted Vendors:</b></td>
                                                <td>
                                                    <ol>
                                                        <li v-for="vendor in ViewModalInfo.vendors">{{ vendor.name }}-ID#{{ vendor.id }}</li>
                                                    </ol>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Confirmed Participants </b></td>
                                                <td>{{ ConfirmedParticipants }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Vendor With Offers</b></td>
                                                <td>{{ VendorsWithBids }}</td>
                                            </tr>
                                            <tr>
                                                <td><b>RFIs Raised</b></td>
                                                <td>{{ RFIsRaised }}</td>
                                            </tr>
                                            

                                        </table>
                                    </div>
                                </div>
                                <hr>
                            </div>

                            <div class="col-lg-12">
                                <h2 class="text-ogeo">Actions:</h2>
                                <p>You will be able to treat each of the PE lines that are attached to this Commercial Evaluation.</p>
                                <span>Practically, you will be in position to:</span>
                                <ol>
                                    <li>attach specific PE lines to Purchase Orders;</li>
                                    <li>ask that specific PE lines are attached to a new Request for Proposals (In case you are dissatisfied with the offers which are attached to this Commercial Evaluation), and</li>
                                    <li>ask that specific PE lines are irrevocably "killed off" (In case there is no intent to go ahead and attach them to Purchase Orders).</li>
                                </ol>
                            </div>
                            <div class="col-lg-12">
                                <div class="table-wrapper">
                                    <table ref="CommercialEvaluationTableEdit" id="CommercialEvaluationLineEdit" class="responsive table table-bordered cell-border" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>PE ID# (Status)</th>
                                                <th style="min-width: 600px">Requested Materials</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Quantity</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">UoM</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Delivery Location Details</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Is Advanced Payment Considered?</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Underlying Transaction</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Sourcing Priority</th>
                                                <th v-if="ViewModalInfo.purchase_enquiries[0].item_id">Retention Percentage*</th>
                                                <th style="min-width: 270px" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                    Vendor#{{key+1}}: {{ vendor.name }}
                                                </th>
                                                <th>Initial Recommendations</th>
                                                <th>Rerun/Cancel</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <template v-for="(PEline, key, index) in ViewModalInfo.purchase_enquiries">
                                                <tr :class="[
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Created and Assigned to Level 1')) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Approvals Fully Completed - PO Sent To Vendor')) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Fully Rejected')) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'].includes('Approved By Level:'))) ? 'po-generated' : 
                                                    PEline.purchase_orders.some(PO => (PO['status'] === 'Accepted By Vendor')) ? 'po-generated' :
                                                    PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Send for a New Request for Proposals')) ? 'selected_for_new_cancellation_or_new_rfp_existing' :
                                                    PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Purchase Enquiry line cancelled')) ? 'selected_for_new_cancellation_or_new_rfp_existing' : 'po-not-generated']" >
                                                    <td :data-perealid="PEline.id">
                                                        <span v-if="CompanySetup.pe_prefix == ''">PE-</span>
                                                        <span :data-perealid="PEline.id" v-else>{{ CompanySetup.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }} <br><br>
                                                        (<b>{{ PEline.commerical_evaluations[0].pivot.status }}</b>)
                                                    </td>

                                                    <td v-if="PEline.item.item_template">
                                                        <span>
                                                            <b><span><span v-if="CompanySetup.lom_prefix == ''">LoM</span><span v-else>{{ CompanySetup.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                            <template v-for="index in 20">    
                                                                <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                    <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                </span>
                                                            </template>
                                                        </span><br>
                                                    </td>
                                                    <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                    <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                    <td v-else>{{ PEline.u_o_m }}</td>
                                                    <td v-if="PEline.item_id">
                                                        <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                        <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                        <b>Longitude:</b><br>{{ PEline.longitude }}
                                                    </td>
                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.underlying_transaction }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.sourcing_priority }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>
                                                    <td style="min-width: 270px;" v-for="(vendor, key, index) in ViewModalInfo.vendors" >
                                                        <!-- v-bind:class="[ViewModalInfo.trackers[key].status == 'Quotation Submitted' ? 'po-generated' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'po-generated' : 'po-not-generated')]" -->
                                                        <template v-if="vendor.quotation_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_responses">
                                                                <template v-if="PEline.id == response.purchase_enquiry_id">
                                                                    <div v-bind:class="[ response.unit_rate ? 'po-not-generated' : 'po-generated']">
                                                                        <!-- Response Details -->
                                                                        <span><b>Level of Completion:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Total Price:</b> <template v-if="response.unit_rate">   {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template></span><br>
                                                                        <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}</template> <template v-else>No Submitted</template></span><br>
                                                                        <template v-if="response.notes != null">
                                                                            <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                        </template>
                                                                        <template v-else>
                                                                            <span><b>Notes:</b> None</span><br>
                                                                        </template>
                                                                        <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                        

                                                                        <!-- RFI Review -->
                                                                        <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                            <button type="button" @click="showAllRFIModal(PEline.id, 'PE')" class="btn btn-info">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                        </template>
                                                                        <template v-else>
                                                                            <button type="button" class="btn btn-info disabled">No RFI</button>
                                                                        </template>

                                                                        <!-- Uploaded Files Review -->
                                                                        <template v-if="PEline.uploaded_docs.length">
                                                                            <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-info required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
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
                                                                    <span><b>Level of Completion: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Total Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            <!-- RFI Review -->
                                                            <!-- <template v-if="PEline.rfis.length">
                                                                <button type="button" @click="showAllRFIModal(PEline.id, 'PE')" class="btn btn-info">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No RFI</button>
                                                            </template>
                                                            
                                                            
                                                            Uploaded Files Review
                                                            <template v-if="PEline.uploaded_docs.length > 0">
                                                                <button class="btn btn-info required-docs-placeholder">View Files <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-info disabled">No Files</button>
                                                            </template> -->

                                                            <button type="button" class="btn btn-info disabled">No RFI</button>

                                                            <button type="button" class="btn btn-info disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td class="alignVertically" align="center">
                                                        <p v-if="PEline.commerical_evaluations[0].pivot.pe_note">{{ PEline.commerical_evaluations[0].pivot.pe_note }}</p>
                                                        <p v-else>No Notes</p>
                                                    </td>

                                                    <td v-if="PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Send for a New Request for Proposals')) ? false : PEline.commerical_evaluations.some(CE => (CE['pivot']['status'] === 'Purchase Enquiry line cancelled')) ? false : true" class="alignVertically action_selection" align="center">
                                                        <textarea
                                                            :id="'PE_'+PEline.id+'_Cancellation_Notes'"
                                                            class="form-control"
                                                            type="textarea"
                                                            rows="5"
                                                            placeholder="Purchase Enquiry line cancellaion/new Request for Proposals notes">
                                                        </textarea><hr>
                                                        <button :id="'PE_'+PEline.id+'_Cancellation_Select_Button'" type="button" class="btn btn-block btn-info" @click="SelectPELineforCancellation(PEline.id)">Select for Rerun/Cancellation</button>
                                                    </td>
                                                    <td v-else align="center" class="alignVertically">
                                                        <p>{{ PEline.commerical_evaluations[0].pivot.ce_pe_notes }}</p>
                                                    </td>
                                                </tr>
                                            </template>
                                            <tr class="action_selection">
                                                <td><span style="display: none">N.A</span></td>
                                                <td v-if="ViewModalInfo.purchase_enquiries[0].item_id"></td>
                                                <td v-if="ViewModalInfo.purchase_enquiries[0].item_id"></td>
                                                <td v-if="ViewModalInfo.purchase_enquiries[0].item_id"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td v-for="(vendor, key) in ViewModalInfo.vendors">
                                                    <template v-if="vendor.quotation_responses.length > 0">
                                                        <textarea
                                                            :id="'Vendor_'+vendor.id+'_PO_Notes'"
                                                            class="form-control"
                                                            type="textarea"
                                                            rows="4"
                                                            placeholder="Purchase Order Notes (Optional)">
                                                        </textarea><hr>

                                                        <button type="button" class="btn btn-block btn-danger" @click="GeneratePO(vendor.id, key, ViewModalInfo.id, ViewModalInfo.purchase_enquiries[0].project_id)">Generate PO To This Vendor</button>
                                                    </template>
                                                    <template v-else>
                                                        No Vendor Response
                                                    </template>
                                                </td>
                                                <td></td>
                                                <td class="action_selection">
                                                    <button type="button" style="float: right; bottom: 0;" class="btn btn-block btn-warning" @click="NewRFPForSelectedPELines"><b>Send selected lines <br> for new Request for Proposals</b></button>

                                                    <button type="button" style="float: right; bottom: 0;" class="btn btn-block btn-danger" @click="CancelSelectedPELines"><b>Cancel selected lines <br><br></b></button>
                                                </td>
                                            </tr>
                                        

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <hr>
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <span><b>By:</b> {{ currentUser.name }}</span><br><br>
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
                                              
                                                <li v-if="message.user_id == null">
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - By {{ message.user_type }} - <span v-if="message.user_type == 'Vendor'">{{ message.vendor_user.name }}</span> <span v-else>{{ message.user.name }}</span></h5>
                                                        <div class="box bg-light-info" >{{ message.message }}</div>
                                                    </div>
                                                    <div class="chat-time" style="min-width: 10%">{{ message.created_at }}</div>
                                                </li>
                                                <li v-else class="reverse">
                                                    <div class="chat-time">{{ message.created_at }}</div>
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - <i v-if="message.reply_id">(In Reponse to ID# {{ message.reply_id }}) -</i> By {{ message.user_type }} - <span v-if="message.user_type == 'Vendor'">{{ message.vendor_user.name }}</span> <span v-else>{{ message.user.name }}</span></h5>
                                                        <div class="box bg-light-ogeo" style="min-width: 10%">{{ message.message }}</div>
                                                    </div>
                                                </li>

                                            </template>
                                            
                                            <!--chat Row -->
                                            <!-- <li>
                                                <div class="chat-content">
                                                    <h5>Bianca Doe</h5>
                                                    <div class="box bg-light-success">It’s Great opportunity to work.</div>
                                                </div>
                                                <div class="chat-time">10:57 am</div>
                                            </li>
                                            
                                            chat Row
                                            <li class="reverse">
                                                <div class="chat-time">10:57 am</div>
                                                <div class="chat-content">
                                                    <h5>Steave Doe</h5>
                                                    <div class="box bg-light-inverse">It’s Great opportunity to work.</div>
                                                </div>
                                            </li>
                                            
                                            chat Row
                                            <li class="reverse">
                                                <div class="chat-time">10:57 am</div>
                                                <div class="chat-content">
                                                    <h5>Steave Doe</h5>
                                                    <div class="box bg-light-inverse">It’s Great opportunity to work.</div>
                                                </div>
                                            </li>
                                            
                                            chat Row
                                            <li>
                                                <div class="chat-content">
                                                    <h5>Angelina Rhodes</h5>
                                                    <div class="box bg-light-primary">Well we have good budget for the project</div>
                                                </div>
                                                <div class="chat-time">11:00 am</div>
                                            </li> -->
                                            <!--chat Row -->

                                        </ul>
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
    
    import validate from 'validate.js';

    export default {
        name: 'purchase-enquiry-list',
        data(){
            return{
                URL: '/uploads/PEVendorUploadsRequiredDocs/',
                DataTable: "",
                CompanySetup: "",
                CEDataTable: "",
                CancelledPELines: [],
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
                StartColumnIndex: 9,
                StartColumnIndexServices: 9,
                TotalRows: "",
                ConfirmedParticipants: 0,
                VendorsWithBids: 0,
                RFIsRaised: 0,
                RFIData: {
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    PEId: "",
                },
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            CancelSelectedPELines () {
                let self = this;
                self.CancelledPELines = {};
                // Get the selected lines for cancellation
                $('.selected_for_new_cancellation_or_new_rfp').each( function(){
                    let PEId = $($(this).children()[0]).data('perealid');
                    let Notes = $('#PE_'+PEId+'_Cancellation_Notes').val()
                    self.CancelledPELines[PEId] = Notes;
                });

                
                // Check if the we have a selected lines
                if(Object.keys(self.CancelledPELines).length === 0 && self.CancelledPELines.constructor === Object){
                    Swal('No seleted lines', 'Please select PE lines for rejection before going for a new Request for Proposals.', 'warning');
                } else {
                    axios.post('/api/quotations_management/cancel_ce_pe_lines', {CancelledPELines: this.CancelledPELines, CEID: this.ViewModalInfo.commerical_evaluation.id})
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
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (PE Lines Cancellation)', 'error');
                        });

                    $('#QuotationDetailsModal').modal('toggle');
                }
            },
            NewRFPForSelectedPELines (){
                let self = this;
                self.CancelledPELines = {};
                // Get the selected lines for cancellation
                $('.selected_for_new_cancellation_or_new_rfp').each( function(){
                    let PEId = $($(this).children()[0]).data('perealid');
                    let Notes = $('#PE_'+PEId+'_Cancellation_Notes').val()
                    self.CancelledPELines[PEId] = Notes;
                });
                
                // Check if the we have a selected lines
                if(Object.keys(self.CancelledPELines).length === 0 && self.CancelledPELines.constructor === Object){
                    Swal('No seleted lines', 'Please select PE lines for rejection before going for a new Request for Proposals.', 'warning');
                } else {
                    axios.post('/api/quotations_management/reject_ce_pe_lines_for_new_rfp', {CancelledPELines: this.CancelledPELines, CEID: this.ViewModalInfo.commerical_evaluation.id})
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
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (PE Lines Cancellation)', 'error');
                        });

                    $('#QuotationDetailsModal').modal('toggle');
                }
                
            },
            SelectPELineforCancellation(PEId){
                
                if($('#PE_'+PEId+'_Cancellation_Notes').val() == ''){
                    Swal('Missing rejection notes', 'Please enter rejection notes before selecting this Purchase Enquiry line for new Request for Proposals.', 'warning');
                    return false;
                } else {

                    

                    //check if parent is having selected_for_new_cancellation_or_new_rfp class to toggle
                    let SelectRow = $('td[data-perealid='+PEId+']').parent();
                    if(SelectRow.hasClass('selected_for_new_cancellation_or_new_rfp')) {
                        SelectRow.removeClass('selected_for_new_cancellation_or_new_rfp');
                        $('#PE_'+PEId+'_Cancellation_Notes').prop('disabled', false);
                        $('#PE_'+PEId+'_Cancellation_Select_Button').text('Select for Rerun/Cancellation');
                        $('#PE_'+PEId+'_Cancellation_Select_Button').removeClass('btn-danger');
                        $('#PE_'+PEId+'_Cancellation_Select_Button').addClass('btn-info');

                    } else {
                        SelectRow.addClass('selected_for_new_cancellation_or_new_rfp');
                        $('#PE_'+PEId+'_Cancellation_Notes').prop('disabled', true);
                        $('#PE_'+PEId+'_Cancellation_Select_Button').text('Deselect for Rerun/Cancellation');
                        $('#PE_'+PEId+'_Cancellation_Select_Button').removeClass('btn-info');
                        $('#PE_'+PEId+'_Cancellation_Select_Button').addClass('btn-danger');
                        // check if any of the td having "selected" and remove it
                        SelectRow.find('td').each (function() {
                            if(this.hasClass="selected"){
                                $(this).removeClass('selected');
                            }
                        });    
                        
                    }
                }
                

            },
            GeneratePO(VednorId, ColumnIndex, QuotationId, ProjectId){

                let self = this; 

                if(this.ViewModalInfo.quotation_type == "Service"){
                    var SelectedVendorColumn = ColumnIndex + this.StartColumnIndexServices;
                } else {
                    var SelectedVendorColumn = ColumnIndex + this.StartColumnIndex;
                }
                
                var TotalRows = this.TotalRows - 1;
                var table = this.CEDataTable;
                var SelectedPEIds = [];
                var PONotes = $('#Vendor_'+VednorId+'_PO_Notes').val();

                for (var i = 0; i <= TotalRows; i++){
                    var selectedCell = table.cell({row: i, column: SelectedVendorColumn}).node();
                    if($(selectedCell).hasClass('selected')){
                        var IdCell = table.cell({row: i, column: 0}).node();
                        var IdCell = $(IdCell).data('perealid');


                        $(table.row(i).node()).addClass('po-generated');
                        SelectedPEIds.push(IdCell);
                    }
                }

                if(SelectedPEIds.length == 0){
                    Swal('Selection Error', 'No lines has been selected against this vendor!', 'warning');
                    return false;
                } else {
                    axios.post('/api/quotations_management/create_purchase_order', {VendorId: VednorId, QuotationId: QuotationId, ProjectId: ProjectId, SelectedPEs: SelectedPEIds, PONotes: PONotes})
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
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (PO Generation)', 'error');
                            });

                            
                }

                $('#QuotationDetailsModal').modal('toggle');

            },
            showViewModal(recordId){
                let self = this;
                this.ViewModalInfo = {};
                axios.post('/api/data/get_commercial_evaluation_details', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        // console.log(this.ViewModalInfo);
                        $('#QuotationDetailsModalView').modal('toggle');


                        self.VendorsWithBids = 0;
                        $.each(this.ViewModalInfo.vendors, function(index, vendor) {
                            $.each(vendor.quotation_responses, function(key, response) {
                                if(response.price != null){
                                    self.VendorsWithBids = self.VendorsWithBids + 1;
                                    return false;
                                }
                            });
                        });

                        self.ConfirmedParticipants = 0;
                        $.each(this.ViewModalInfo.trackers, function(index, track) {
                            if(track.status == "Offer will be submitted"){
                                self.ConfirmedParticipants = self.ConfirmedParticipants + 1;
                                return false;
                            }
                        });
                        self.ConfirmedParticipants = this.ViewModalInfo.vendors.length - self.ConfirmedParticipants;



                        self.RFIsRaised = 0;
                        $.each(this.ViewModalInfo.rfis, function(index, rfi) {
                            if(rfi.user_type == "Vendor"){
                                self.RFIsRaised = self.RFIsRaised + 1;
                            }
                        });

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

                                //if the cell has status po-generate (this is checking if the vendor did not submit price for the item and thus can be selected)
                                if(NotSubmittedCell){
                                    Swal('Price Not Available', 'This item is not selectable under this vendor since no price has been submitted.', 'warning');
                                    return false;
                                }
                                
                                var TableColumnsIndexLength = table.columns()[0].length - 1;
                                var TableNumberOfRows = table.rows().count() - 1;
                                // console.log(TableColumnsIndexLength, TableNumberOfRows);
                                var rowIdx = table.cell(this).index().row;
                                var columnIdx = table.cell(this).index().column;
                                var ValidColumnsIndexLength = TableColumnsIndexLength - 1; //Exclude Last Column

                                // console.log(columnIdx);
                                // console.log(StartColumnIndex1);
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
            showEditModal(recordId){
                let self = this;
                this.ViewModalInfo = {};
                axios.post('/api/data/get_commercial_evaluation_details', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        // console.log(this.ViewModalInfo);
                        $('#QuotationDetailsModal').modal('toggle');

                        self.VendorsWithBids = 0;
                        $.each(this.ViewModalInfo.vendors, function(index, vendor) {
                            $.each(vendor.quotation_responses, function(key, response) {
                                if(response.price != null){
                                    self.VendorsWithBids = self.VendorsWithBids + 1;
                                    return false;
                                }
                            });
                        });

                        self.ConfirmedParticipants = 0;
                        $.each(this.ViewModalInfo.trackers, function(index, track) {
                            if(track.status == "Offer will be submitted"){
                                self.ConfirmedParticipants = self.ConfirmedParticipants + 1;
                                return false;
                            }
                        });
                        self.ConfirmedParticipants = this.ViewModalInfo.vendors.length - self.ConfirmedParticipants;



                        self.RFIsRaised = 0;
                        $.each(this.ViewModalInfo.rfis, function(index, rfi) {
                            if(rfi.user_type == "Vendor"){
                                self.RFIsRaised = self.RFIsRaised + 1;
                            }
                        });

                        this.$nextTick(() => {
                            const table = $('#CommercialEvaluationLineEdit').DataTable({
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: -1,
                                order: [[ 0, "desc" ]],
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


                            $('#CommercialEvaluationLineEdit tbody').on('click', 'td', function () {

                                if(self.ViewModalInfo.quotation_type == "Service"){
                                    var StartColumnIndex1 = self.$data.StartColumnIndexServices;
                                } else {
                                    var StartColumnIndex1 = self.$data.StartColumnIndex;
                                }
                                var $this = $(this);
                                var SelectedForCancellation = $this.parent().hasClass('selected_for_new_cancellation_or_new_rfp');
                                var SelectedForCancellationExisting = $this.parent().hasClass('selected_for_new_cancellation_or_new_rfp_existing');
                                var CanBeSelectedPONotGenerated = $this.parent().hasClass('po-not-generated');
                                var NotSubmittedCell = $this.children().first().hasClass('po-generated');

                                //if the cell has status po-generate (this is checking if the vendor did not submit price for the item and thus can be selected)
                                if(NotSubmittedCell){
                                    Swal('Price Not Available', 'This item is not selectable under this vendor since no price has been submitted.', 'warning');
                                    return false;
                                }
                                
                                var TableColumnsIndexLength = table.columns()[0].length - 2;
                                var TableNumberOfRows = table.rows().count() - 1;
                                // console.log(table.cell(this), TableColumnsIndexLength, TableNumberOfRows);
                                var rowIdx = table.cell(this).index().row;
                                var columnIdx = table.cell(this).index().column;
                                var ValidColumnsIndexLength = TableColumnsIndexLength - 1; //Exclude Last Column

                                // console.log(StartColumnIndex1, columnIdx);
                                if(columnIdx < StartColumnIndex1){
                                    // Swal('Selection Error', 'This Cell Can Not Be Selected!', 'warning');
                                } else if (TableColumnsIndexLength <= columnIdx) {
                                    // Swal('Selection Error', 'This Cell Can Not Be Selected!!', 'warning');
                                }else {

                                    if(CanBeSelectedPONotGenerated && !SelectedForCancellation && !SelectedForCancellationExisting){
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

                //reset previous values and uploaded files
                this.RequiredFilesId = "";
                this.RequiredDocsDetails = [];

                //store the selected PE Id
                this.RequiredFilesId = recordId;
                
                //get the list of document required for the selected PE
                let PE = this.ViewModalInfo.purchase_enquiries.find(isRequiredPE);
                this.RequiredDocsDetails = PE.required_documents.split(",");
                this.PEVendorUploadedFiles = PE.uploaded_docs.filter( document => document.vendor_id == VendorId );

                //Show the modal
                this.RequiredDocsDataLoaded = true;
                $('#RequiredDocsModal').modal('toggle');

                this.RequiredDocsDataLoaded = true;
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
                                bDestroy: true,
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
            showRFIModal(recordId, VendorId) {
                this.RFIDetails = [];
                this.RFIData.RFImessage = "";
                this.RFIData.PEId = recordId;
                this.RFIData.VendorId = VendorId;
                this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                this.RFIData.QuotationId = this.ViewModalInfo.id;
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
            
        },
        mounted(){

            axios.get('/api/data/get_company_details')
                .then((response) => {
                    // console.log(response.data);
                    self.CompanySetup = response.data;
                })
            

            const table = $('#CommercialEvaluationList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_commercial_evaluations_list',
                columns: [
                    { data: 'commerical_evaluation_group_id', name: 'commerical_evaluation_group_id' },
                    { data: 'quotation.project.title', name: 'quotation.project.title' },
                    { data: 'rfi_full_id', name: 'rfi_full_id' },
                    { data: 'evaluator', name: 'evaluator' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'pe_lines', name: 'pe_lines' },
                    // { data: 'po_line', name: 'po_line' },
                    { data: 'vendors_count', name: 'vendors_count' },
                    { data: 'created_at', name: 'created_at' },
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

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });

            self.DataTable = table;

        },
    }

</script>


<style scoped>

    .action_selection{
        background-color: rgba(213, 225, 225, 0.5);
    }

    .selected_for_new_cancellation_or_new_rfp{
        background-size: auto auto;
        background-color: rgba(255, 255, 255, 1);
        background-image: repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(255, 87, 87, 0.05) 10px, rgba(255, 87, 87, 0.05) 24px );
        color: red;
    }

    .selected_for_new_cancellation_or_new_rfp_existing{
        background-size: auto auto;
        background-color: rgba(255, 255, 255, 1);
        background-image: repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(255, 87, 87, 0.05) 10px, rgba(255, 87, 87, 0.05) 24px );
        color: red;
    }


    td.alignVertically {
      vertical-align: middle;
    }

    .numberCircle {
        position: relative;
        top: -15px;
        left: 15px;

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

    #QuotationDetailsModalView .modal-dialog {
        min-width:80%;
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

    .po-generated {
        background-size: auto auto;
        background-color: rgba(255, 255, 255, 1);
        background-image: repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(46, 212, 17, 0.05) 10px, rgba(46, 212, 17, 0.05) 24px );
        color: black;
    }

    .po-46, 212, 17{
        /*background-color: rgb(69, 249, 132, 0.2);*/
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>