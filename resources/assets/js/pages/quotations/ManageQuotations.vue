<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>List of Requests of Proposals</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="QuotationsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th v-if="CompanySetup.pe_prefix == ''">PE #</th>
                                <th v-else>{{ CompanySetup.pe_prefix }} #</th>
                                <th>GroupID</th>
                                <th>Set-up</th>
                                <th>Originated By</th>
                                <th>Type</th>
                                <th width="50%" style="min-width: 50%">Requested Materials</th>
                                <th>Bidding Methodology</th>
                                <th>Commercial Evaluation ID</th>
                                <th>Commercial Evaluation Date</th>
                                <th>Service Desc.</th>
                                <th>Quantity</th>
                                <th>UoM</th>
                                <th>Is Advanced Payment Considered?</th>
                                <th>Payment Rentention Details</th>
                                <th>Underlying Transaction</th>
                                <th>Sourcing Priority</th>
                                <th>Originated At</th>
                                <th>On Status Since</th>
                                <th>PE Status</th>
                                <th>RfP Name</th>
                                <th class="text-ogeo">RfP Originated By</th>
                                <th class="text-ogeo">RfP Originated At</th>
                                <th class="text-ogeo">RfP Floating Date</th>
                                <th class="text-ogeo">RfP Closing Date</th>
                                <th class="text-ogeo">RfI Start Date</th>
                                <th class="text-ogeo">RfI End Date</th>
                                <th class="text-ogeo">Consulted Vendors</th>
                                <th>RfP Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>


            <div id="RFPInformationModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFPInformationModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div  class="modal-header">
                            <h4 class="modal-title text-ogeo">Request for Proposals ID# {{ ViewRfPModalInfo.id }}; {{ ViewRfPModalInfo.rfp_name }}</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="viewRfIDataLoaded">
                            <div class="row" v-if="ViewRfPModalInfo.quotation_for =='PE'">

                                <div class="col-lg-12">
                                    <h3 class="text-ogeo">General Information:</h3> 
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <table class="table">
                                                <tr>
                                                    <td><b>RfP Name: </b></td>
                                                    <td>{{ ViewRfPModalInfo.rfp_name }}</td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"><b>Set-up Name: </b></td>
                                                    <td>{{ ViewRfPModalInfo.project.title }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated By: </b></td>
                                                    <td>{{ ViewRfPModalInfo.creator.name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated At: </b></td>
                                                    <td>{{ ViewRfPModalInfo.created_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Number of PE lines:</b></td>
                                                    <td>{{ ViewRfPModalInfo.purchase_enquiries_all_active.length }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Bidding Methodology:</b></td>
                                                    <td>{{ ViewRfPModalInfo.sourcing_type }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Status</b></td>
                                                    <td><b>{{ ViewRfPModalInfo.status }}</b></td>
                                                </tr>
                                                <tr>
                                                    <td><b>On Status</b></td>
                                                    <td>{{ ViewRfPModalInfo.updated_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Request for Proposal Timeframe</b></td>
                                                    <td>
                                                        {{ ViewRfPModalInfo.start_date | formatDateNTime }} <br>
                                                        {{ ViewRfPModalInfo.end_date | formatDateNTime }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>Request For Proposals' Request For Information (RFI) Timeframe</b></td>
                                                    <td>
                                                        {{ ViewRfPModalInfo.rfi_start_date | formatDateNTime }} <br>
                                                        {{ ViewRfPModalInfo.rfi_end_date | formatDateNTime }} <br>
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
                                                            <li v-for="vendor in ViewRfPModalInfo.vendors">{{ vendor.name }}-ID#{{ vendor.id }}</li>
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
                                                <tr>
                                                    <td><b>Commercial Evaluation By</b></td>
                                                    <td v-if="ViewRfPModalInfo.commerical_evaluation">{{ ViewRfPModalInfo.commerical_evaluation.evaluator.name }}</td>
                                                    <td v-else>N/A</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Commercial Evaluation At</b></td>
                                                    <td v-if="ViewRfPModalInfo.commerical_evaluation">{{ ViewRfPModalInfo.commerical_evaluation.created_at }}</td>
                                                    <td v-else>N/A</td>
                                                </tr>
                                                

                                            </table>
                                        </div>
                                    </div>
                                    <hr>
                                </div>

                                <div class="col-lg-12">
                                    <h3 class="text-ogeo">Vendors Responses:</h3>
                                    <span>* Once all of the quantity has been delivered by the awardee vendor, the invoicing for the retained amount can only happen after the specified number of days has elapsed. The invoicing payment terms shall apply..</span>
                                    <div class="table-wrapper">
                                        <table ref="RfPPEsInfo" id="RfPPEsInfo" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th v-if="CompanySetup.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ CompanySetup.pe_prefix }} #</th>
                                                    <th>Set-up Name</th>
                                                    <th style="min-width: 500px;">Requested Materials</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Quantity</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">UoM</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Delivery Location Details</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Is Advanced Payment Considered?</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Underlying Transaction</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Sourcing Priority</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Retention Percentage*</th>
                                                    <th style="min-width: 270px; text-align: center" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        {{ vendor.name }}-ID# {{ vendor.id }}
                                                    </th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(PEline, key, index) in ViewRfPModalInfo.purchase_enquiries_all_active">
                                                    <td>
                                                        <span v-if="CompanySetup.pe_prefix == ''">PE-</span><span v-else>{{ CompanySetup.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                    </td>

                                                    <td>{{ ViewRfPModalInfo.project.title }}</td>

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
                                                    <td style="min-width: 270px;" v-bind:class="[ViewRfPModalInfo.trackers[key].status == 'FABO Submitted' ? 'qoutation-submitted' : (ViewRfPModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        <template v-if="vendor.quotation_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_responses">
                                                                <template v-if="PEline.id == response.purchase_enquiry_id">

                                                                    <!-- Response Details -->
                                                                    <span><b>Level of Completness:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Total Price:</b> <template v-if="response.unit_rate"> {{ formatPrice(response.price)  }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Time:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} Day(s)</template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>
                                                                    <span><b>Offer Validity:</b> {{ response.validity_date | formatDateNTime }} </span><br>
                                                                    <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                    

                                                                    <!-- RFI Review -->
                                                                    <!-- <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                        <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                    </template>
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                                    </template> -->

                                                                    <!-- Uploaded Files Review -->
                                                                    <template v-if="PEline.uploaded_docs.length">
                                                                        <button @click="showRequiredDocsModal(PEline.id, vendor.id)" class="btn btn-success required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
                                                                    </template>

                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-secondary disabled">No Uploaded Files</button>
                                                                    </template>
                                                                
                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewRfPModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Level of Completion: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Unit Rate: </b>N/A</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Offer Validity:</b> N/A </span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            <!-- <button type="button" class="btn btn-warning disabled">No RFI</button> -->

                                                            <button type="button" class="btn btn-secondary disabled">No Uploaded Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td>
                                                        <button @click="showPEViewModal('PurchaseEnquiry', PEline.id)" class="btn btn-xs btn-warning"><i class="fa fa-info"></i> </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                                <div class="col-lg-12">
                                    <hr>
                                    <span><b>Date:</b> {{ new Date() }}</span><br>
                                    <span><b>By:</b> {{ currentUser.Name }}</span><br><br>
                                </div>

                            </div>



                            <div class="row" v-if="ViewRfPModalInfo.quotation_for =='RC'">
                                <div class="col-lg-12">
                                    <div class="table-wrapper">
                                        <table ref="RfPPEsInfo" id="RfPPEsInfo" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th v-if="ViewRfPModalInfo.rate_contract_requests[0].item_id">Item #</th>
                                                    <th>Item Description</th>
                                                    <th v-if="ViewRfPModalInfo.rate_contract_requests[0].item_id">Quantity</th>
                                                    <th v-if="ViewRfPModalInfo.rate_contract_requests[0].item_id">Advanced Payment</th>
                                                    <th style="min-width: 270px" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        Vendor#{{key+1}}: {{ vendor.name }}-ID#{{ vendor.id }}
                                                    </th>
                                                    <th>Recommendations</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(PEline, key, index) in ViewRfPModalInfo.rate_contract_requests">
                                                    <td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                    <td style="min-width: 270px;" v-bind:class="[ViewRfPModalInfo.trackers[key].status == 'FABO Submitted' ? 'qoutation-submitted' : (ViewRfPModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        <template v-if="vendor.quotation_r_c_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_r_c_responses">
                                                                <template v-if="PEline.id == response.rate_contract_request_id">

                                                                    <!-- Response Details -->
                                                                    <span><b>Level of Completion:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Price:</b> <template v-if="response.unit_rate"> {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>
                                                                    <span><b>Offer Validity:</b> {{ response.validity_date | formatDateNTime }} </span><br>
                                                                    <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                    

                                                                    <!-- RFI Review -->
                                                                    <!-- <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                        <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                    </template>
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                                    </template> -->

                                                                    <!-- Uploaded Files Review -->
                                                                    <template v-if="PEline.uploaded_docs.length">
                                                                        <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-warning required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
                                                                    </template>

                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No Files</button>
                                                                    </template>
                                                                
                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewRfPModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Level of Completion: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Unit Rate: </b>N/A</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Offer Validity:</b> N/A </span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            <!-- RFI Review -->
                                                            <!-- Uploaded Files Review -->
                                                            <!-- <template v-if="PEline.rfis.length">
                                                                <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                            </template>
                                                           
                                                            <template v-if="PEline.uploaded_docs.length > 0">
                                                                <button class="btn btn-warning required-docs-placeholder">View Files <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            </template> -->

                                                            <button type="button" class="btn btn-warning disabled">No RFI</button>

                                                            <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td>
                                                        <textarea
                                                           class="form-control"
                                                           :id="'PEline_'+PEline.id+'_Recommendation'"
                                                           type="textarea"
                                                           rows="8"
                                                           placeholder="Recommendations and Notes">
                                                        </textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <!-- <div id="QuotationDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div  class="modal-header">
                            <h4 class="modal-title">Proposal Request # {{ ViewModalInfo.id }}</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="viewDataLoaded">
                            <div class="row" v-if="ViewModalInfo.quotation_for =='PE'">
                                <div class="col-lg-12">
                                    <div class="table-wrapper">
                                        <table ref="CommercialEvaluationTable" id="CommercialEvaluationLine" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Item #</th>
                                                    <th>Item Description</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Quantity</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Advanced Payment</th>
                                                    <th>Retention Percentage</th>
                                                    <th style="min-width: 270px" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        Vendor#{{key+1}}: {{ vendor.name }}
                                                    </th>
                                                    <th>Recommendations</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(PEline, key, index) in ViewModalInfo.purchase_enquiries">
                                                    <td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                    <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>
            
                                                    <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                    <td>{{ PEline.retention_percentage }}%</td>
                                                    <td style="min-width: 270px;" v-bind:class="[ViewModalInfo.trackers[key].status == 'FABO Submitted' ? 'qoutation-submitted' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        <template v-if="vendor.quotation_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_responses">
                                                                <template v-if="PEline.id == response.purchase_enquiry_id">
            
                                                                    Response Details
                                                                    <span><b>Status:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Price:</b> <template v-if="response.unit_rate"> {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>
                                                                    <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                    
            
                                                                    RFI Review
                                                                    <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                        <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                    </template>
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                                    </template>
            
                                                                    Uploaded Files Review
                                                                    <template v-if="PEline.uploaded_docs.length">
                                                                        <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-warning required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
                                                                    </template>
            
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No Files</button>
                                                                    </template>
                                                                
                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Status: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Unit Rate: </b>N/A</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            RFI Review
                                                            Uploaded Files Review
                                                            <template v-if="PEline.rfis.length">
                                                                <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                            </template>
                                                           
                                                            <template v-if="PEline.uploaded_docs.length > 0">
                                                                <button class="btn btn-warning required-docs-placeholder">View Files <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            </template>
            
                                                            <button type="button" class="btn btn-warning disabled">No RFI</button>
            
                                                            <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td>
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_Recommendation'"
                                                           type="textarea"
                                                           rows="8"
                                                           placeholder="Recommendations and Notes">
                                                        </el-input>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
            
            
            
                            <div class="row" v-if="ViewModalInfo.quotation_for =='RC'">
                                <div class="col-lg-12">
                                    <div class="table-wrapper">
                                        <table ref="CommercialEvaluationTable" id="CommercialEvaluationLine" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Item #</th>
                                                    <th>Item Description</th>
                                                    <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Quantity</th>
                                                    <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Advanced Payment</th>
                                                    <th style="min-width: 270px" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        Vendor#{{key+1}}: {{ vendor.name }}
                                                    </th>
                                                    <th>Recommendations</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(PEline, key, index) in ViewModalInfo.rate_contract_requests">
                                                    <td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
            
                                                    <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                    <td style="min-width: 270px;" v-bind:class="[ViewModalInfo.trackers[key].status == 'FABO Submitted' ? 'qoutation-submitted' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        <template v-if="vendor.quotation_r_c_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_r_c_responses">
                                                                <template v-if="PEline.id == response.rate_contract_request_id">
            
                                                                    Response Details
                                                                    <span><b>Status:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Price:</b> <template v-if="response.unit_rate"> {{ response.price }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>
                                                                    <span><b>Required Files:</b> {{ PEline.required_documents }}</span><hr>
                                                                    
            
                                                                    RFI Review
                                                                    <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                        <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                    </template>
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                                    </template>
            
                                                                    Uploaded Files Review
                                                                    <template v-if="PEline.uploaded_docs.length">
                                                                        <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-warning required-docs-placeholder">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
                                                                    </template>
            
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No Files</button>
                                                                    </template>
                                                                
                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Status: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Unit Rate: </b>N/A</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> {{ PEline.required_documents }}</span><hr>
                                                                </template>
                                                            </template>
                                                            
                                                            RFI Review
                                                            Uploaded Files Review
                                                            <template v-if="PEline.rfis.length">
                                                                <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                            </template>
                                                           
                                                            <template v-if="PEline.uploaded_docs.length > 0">
                                                                <button class="btn btn-warning required-docs-placeholder">View Files <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.length }}</span></div></button>
                                                            </template>
                                                            <template v-else>
                                                                <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            </template>
            
                                                            <button type="button" class="btn btn-warning disabled">No RFI</button>
            
                                                            <button type="button" class="btn btn-warning disabled">No Files</button>
                                                            
                                                        </template>
                                                    </td>
                                                    <td>
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_Recommendation'"
                                                           type="textarea"
                                                           rows="8"
                                                           placeholder="Recommendations and Notes">
                                                        </el-input>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
            
            
                            <div class="row" v-if="ViewModalInfo.status != 'Commercial Evaluation Submitted'">
                                <div class="col-lg-12">
                                    <hr><br><h4>Commercial Evaluation Recommendation <span class="text-danger">*</span></h4>
                                    <el-input
                                        type="textarea"
                                        rows="6"
                                        placeholder="Enter Your Additional Notes Here..."
                                        v-model="CEGeneralNotes">
                                    </el-input><br><br>
            
                                    <button type="button" @click="SubmitCommercialEvaluation(ViewModalInfo.id)" class="btn btn-block btn-success">Submit Commercial Evaluation</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->


            <div id="PurchaseEnquiryUpdateModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryUpdateModalView" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div  class="modal-header">
                            <h4 class="modal-title text-ogeo">Purchase Enquiry ID# {{ ViewPEModalInfo.purchase_enquiry_group_id }}-{{ ViewPEModalInfo.purchase_enquiry_ingroup_id }}</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="viewPEDataLoaded">
                            <div class="row">
                                <div class="col-lg-6">
                                    <table class="table">
                                        <tr>
                                            <td width="40%"><b>Set-up Name: </b></td>
                                            <td>{{ ViewPEModalInfo.project.title }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Originated By: </b></td>
                                            <td>{{ ViewPEModalInfo.creator.name }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Origination At: </b></td>
                                            <td>{{ ViewPEModalInfo.created_at }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Status: </b></td>
                                            <td>{{ ViewPEModalInfo.status }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Current Approval Level: </b></td>
                                            <td>{{ ViewPEModalInfo.approval_level }}</td>
                                        </tr>
                                        <tr v-if="ViewPEModalInfo.underlying_transaction != ''">
                                            <td><b>Underlying Transaction: </b></td>
                                            <td>{{ ViewPEModalInfo.underlying_transaction }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Sourcing Priority: </b></td>
                                            <td>{{ ViewPEModalInfo.sourcing_priority }}</td>
                                        </tr>

                                        <tr>
                                            <td><b>Delivery Address Details: </b></td>
                                            <td>
                                                <span><b>Location Name:</b> {{ ViewPEModalInfo.location_name }}</span><br>
                                                <span><b>Longitude:</b> {{ ViewPEModalInfo.longitude }}</span><br>
                                                <span><b>Latitude:</b> {{ ViewPEModalInfo.latitude }}</span><br>  
                                                
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><b>Is Advanced Payment Considered? </b></td>
                                            <td>{{ ViewPEModalInfo.advanced_payment }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>What Is the Percentage of Retention Payment? </b></td>
                                            <td v-if="ViewPEModalInfo.retention_percentage != ''">{{ ViewPEModalInfo.retention_percentage }}%</td>
                                            <td v-else>0%</td>
                                        </tr>
                                        <tr>
                                            <td><b>Retention Timeframe: </b></td>
                                            <td v-if="ViewPEModalInfo.retention_days != ''">{{ ViewPEModalInfo.retention_days }} Day(s) From The Date Of Full Delivery.</td>
                                            <td v-else>0 Day(s)</td>
                                        </tr>
                                        <tr>
                                            <td><b>Awardee Vendor: </b></td>
                                            <td v-if="ViewPEModalInfo.purchase_orders.length == 0">Not Yet Awarded</td>
                                            <td v-else><span v-if="ViewPEModalInfo.project.company.po_prefix != ''">{{ ViewPEModalInfo.project.company.po_prefix }}</span><span v-else>PO</span>: {{ ViewPEModalInfo.purchase_orders[0].purchase_order_group_id }} - {{ ViewPEModalInfo.purchase_orders[0].vendor.name }}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-6">
                                    <table class="table">
                                        <tr align="center" v-if="p_images.length == 0">
                                            <td>
                                                <img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+ViewPEModalInfo.item.picture">
                                            </td>
                                        </tr>
                                        <tr align="center" v-else style="display: table-caption;">
                                            <td v-for="(img, index) in p_images" :key="index" >
                                                <img style="width: 100%; text-align: center;" :src="'/uploads/images/'+img">
                                            </td>
                                        </tr>
                                        

                                        <tr v-if="ViewPEModalInfo.item.item_template">
                                            <td><b>Item Details: </b></td>
                                            <td>
                                                <span><span v-if="ViewPEModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewPEModalInfo.company.lom_prefix }}</span>-{{ ViewPEModalInfo.item.item_group_id }}-{{ ViewPEModalInfo.item.item_ingroup_id }}</span><br>

                                                <span>
                                                    <template v-for="index in 20">    
                                                        <span v-if="ViewPEModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                            <b>{{ ViewPEModalInfo.item.item_template['field_'+index] }}:</b> {{ ViewPEModalInfo.item['field_'+index] }} | 
                                                        </span>
                                                    </template>
                                                </span><br><br>

                                                <span v-if="ViewPEModalInfo.quantity_changes.length == 0"><b>Quantity:</b> {{ ViewPEModalInfo.quantity }}</span>
                                                <span v-else><b>Quantity:</b> {{ ViewPEModalInfo.quantity_changes[0].old_quantity }}</span>
                                                <br>

                                                <span><b>Unit of Measurement:</b> {{ ViewPEModalInfo.item.u_o_m }}</span><br>
                                            </td>
                                        </tr>
                                        <tr v-else>
                                            <td><b>Item Details: </b></td>
                                            <td class="dont-break-out">
                                                <span><b>Description:</b> {{ ViewPEModalInfo.item.description }}</span><br><br>
                                                <span><b>Quantity:</b> 
                                                    <span v-if="ViewPEModalInfo.quantity_changes.length == 0">{{ ViewPEModalInfo.quantity }}</span>
                                                    <span v-else>{{ ViewPEModalInfo.quantity_changes[0].old_quantity }}</span>
                                                </span><br>  
                                                <span><b>Unit of Measurement:</b> {{ ViewPEModalInfo.u_o_m }}</span><br>
                                            </td>
                                        </tr>
                                        
                                        <!-- <tr>
                                            <td style="width: 40%"><b>Description:</b></td>
                                            <td v-if="ViewPEModalInfo.service_description == null">
                                                <template v-for="index in 20">    
                                                    <span v-if="ViewPEModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                        <b>{{ ViewPEModalInfo.item.item_template['field_'+index] }}:</b> {{ ViewPEModalInfo.item['field_'+index] }} | 
                                                    </span>
                                                </template>
                                            </td>
                                            <td v-else>{{ ViewPEModalInfo.service_description }}</td>
                                        </tr> 

                                        <tr>
                                            <td><b>Quantity: </b></td>
                                            <td v-if="ViewPEModalInfo.quantity_changes.length == 0">{{ ViewPEModalInfo.quantity }}</td>
                                            <td v-else>{{ ViewPEModalInfo.quantity_changes[0].old_quantity }}</td>
                                        </tr> -->

                                        <tr>
                                            <td><b>Required Documents: </b></td>
                                            <td v-if="ViewPEModalInfo.required_documents.length > 0">
                                                <ul v-for="(document, index) in ViewPEModalInfo.required_documents.split(',')">
                                                    <li>{{ document }}</li>
                                                </ul>
                                            </td>
                                            <td v-else>
                                                No Documents Required
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 40%"><b>Purchase Enquiry Note:</b></td>
                                            <td v-if="ViewPEModalInfo.notes == null"> Not Available </td>
                                            <td v-else>{{ ViewPEModalInfo.notes }}</td>
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
                                        <tr v-for="(item, key) in ViewPEModalInfo.history" :key="item.id">
                                            <td>{{ key + 1 }}</td>
                                            <td>{{ item.current_action_description }}</td>
                                            <td>{{ item.current_action_by.name }}</td>
                                            <td>{{ item.current_approval_level }}</td>
                                            <td>{{ item.decision }} - {{ item.decision_notes }}</td>
                                            <td>{{ item.created_at }}</td>
                                            <td v-if="key == 0">Not Applicable</td>
                                            <!-- <td v-else>{{ item.created_at }}</td> -->
                                            <td v-else>{{ item.created_at | getDifference(ViewPEModalInfo.history[key-1].created_at) }}</td>
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
                                    <div v-if="!RFIDetails[0].quotation.status.includes('Canceled') || !RFIDetails[0].quotation.status.includes('Ended') || !RFIDetails[0].quotation.status.includes('Submitted')" class="card-body b-t">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="grid-content">
                                                    <label><b>Select Message To Reply</b></label>
                                                    <el-select filterable style="width: 100%; padding: 0px;" v-model="RFIData.RFIMessageID" placeholder="Select Message ID">   
                                                        <el-option v-for="message in RFIDetails" :key="message.id" :label="'ID# '+message.id" :value="message.id"></el-option>
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
                                                        <a v-if="ViewRfPModalInfo.quotation_for == 'PE'" :href="URL+uploadedFile.document_name" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> File {{ index+1 }} Download </a>
                                                        <a v-if="ViewRfPModalInfo.quotation_for == 'RC'" :href="RCURL+uploadedFile.document_name" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> File {{ index+1 }} Download </a>

                                                        <br>
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


            <div id="QuotationEditModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationEditModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div  class="modal-header">
                            <h4 class="modal-title text-ogeo">Request For Proposal ID# {{EditQuotationPrefix}}-{{ EditQuotationId }}; {{ ViewRfPModalInfo.rfp_name }}</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="editDataLoaded">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    <br>
                                    <button type="button" @click="toggleShowRFPModification" class="btn btn-block btn-success">Initiate Request for Proposals Edit</button>
                                </div>

                                <div class="col-lg-12" v-if="ShowRFPModificationDiv">
                                    <br><br>

                                    <div class="col-lg-12">
                                        <span><b>Current Request for Proposal Floating Date:</b> {{ ViewRfPModalInfo.start_date | formatDateNTime }}</span><br>
                                        <span><b>Current Request for Proposal Closing Date:</b> {{ ViewRfPModalInfo.end_date | formatDateNTime }}</span><br>
                                    </div>

                                    <div v-if="ViewRfPModalInfo.status.includes('Queued')" class="col-lg-12">
                                        <br>
                                        <span class="demonstration  text-success"><b>Change The Request for Proposals Timeframe</b> (All Vendors Will be Notified of the Change if Applicable)</span>
                                        <el-date-picker
                                          style="width: 100%"
                                          :picker-options = "pickerOptions1"
                                          v-model="ExtendedDate"
                                          @change="RfPDateChanged"
                                          type="datetimerange"
                                          range-separator="-"
                                          start-placeholder="Floating date"
                                          end-placeholder="Closing Date"
                                          :default-time="['00:00:00', '23:59:59']"
                                          value-format="yyyy-MM-dd HH:mm:ss">
                                        </el-date-picker>
                                    </div>

                                    <div v-else class="col-lg-12">
                                        <br>
                                        <span class="demonstration text-success"><b>Change The Request for Proposals Timeframe Closing Date</b> (All Vendors Will be Notified of the Change if Applicable)</span>
                                        <el-date-picker
                                            v-model="ExtendedDate"
                                            type="datetime"
                                            @change="RfPDateChanged"
                                            style="width: 100%"
                                            placeholder="Pick Closing Date and time"
                                            :default-time="'23:59:59'"
                                            value-format="yyyy-MM-dd HH:mm:ss"
                                            :picker-options="pickerOptions1">
                                        </el-date-picker>
                                    </div>

                                    <div class="col-lg-12">
                                        <br><hr>
                                        <span><b>Current Request for Information Start Date:</b> {{ ViewRfPModalInfo.rfi_start_date | formatDateNTime }}</span><br>
                                        <span><b>Current Request for Information End Date:</b> {{ ViewRfPModalInfo.rfi_end_date | formatDateNTime }}</span><br>
                                    </div>

                                    
                                    <div v-if="RFIStartDate > CurrentDateTime" class="col-lg-12">
                                        <br>
                                        <span class="demonstration text-success"><b>Change The Request for Information Timeframe</b> (All Vendors Will be Notified of the Change if Applicable)</span>
                                        <el-date-picker
                                          style="width: 100%"
                                          :picker-options = "RFIDateRangerPickerOption"
                                          v-model="ExtendedRfIDate"
                                          type="datetimerange"
                                          range-separator="-"
                                          start-placeholder="Start date"
                                          end-placeholder="End Date"
                                          :default-time="['00:00:00', '23:59:59']"
                                          value-format="yyyy-MM-dd HH:mm:ss">
                                        </el-date-picker>
                                    </div>
                                    <div v-else class="col-lg-12">
                                        <br>
                                        <span class="demonstration text-success"><b>Change The Request for Information Closing Date</b> (All Vendors Will be Notified of the Change if Applicable)</span>
                                        <br>
                                        <el-date-picker
                                            v-model="ExtendedRfIDate"
                                            type="datetime"
                                            style="width: 100%"
                                            placeholder="Pick End Date and time"
                                            :default-time="'23:59:59'"
                                            value-format="yyyy-MM-dd HH:mm:ss"
                                            :picker-options="RFIDateRangerPickerOption">
                                        </el-date-picker>
                                    </div>


                                    <div class="col-lg-12">
                                        <br><hr>
                                        <span><b>Consulted Vendors:</b>
                                            <span v-for="(vendor,index) in ViewRfPModalInfo.vendors">{{index + 1}}. {{ vendor.name }}-ID#{{vendor.id}}, </span>
                                        </span>
                                        <br><br>
                                    </div>

                                    <div class="col-lg-12">
                                        <span class="demonstration text-success"><b>Select Additional Vendors</b> (Added Vendors Will be Notified of the Change if Applicable)</span>
                                        <br>
                                        <div class="grid-content">
                                            <el-select filterable multiple style="width: 100%; padding: 0px;" v-model="AddedVendors" placeholder="Select Vendors">
                                                
                                                  <el-option
                                                    v-for="vendor in AdditionalVendorsList"
                                                    :key="vendor.id"
                                                    :label="vendor.name"
                                                    :value="vendor.id">
                                                  </el-option>
                                                
                                            </el-select>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <br>
                                        <button type="button" @click="ModifyQuotation" class="btn btn-block btn-success">Edit Request for Proposals</button>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <hr>
                                </div>


                                <div class="col-lg-12">
                                    <br>
                                    <button type="button" @click="toggleShowRFPCancellation" class="btn btn-block btn-danger">Initiate Request for Proposals Cancellation</button>
                                </div>

                                <div class="col-lg-12" v-if="ShowRFPCancellationDiv">
                                    <br><br>
                                    <hr><br><h4>Enter Reason For Cancellation <span class="text-danger">*</span></h4>
                                    <el-input
                                        type="textarea"
                                        rows="6"
                                        placeholder="Reason For Cancellation"
                                        v-model="RfPCancellationNotes">
                                    </el-input><br><br>

                                    <button type="button" @click="CancelQuotation" class="btn btn-block btn-danger">Cancel Request for Proposals</button>

                                </div>



                                <div class="col-lg-12">
                                    <hr>
                                </div>



                                <div class="col-lg-12">
                                    <br>
                                    <button type="button" @click="toggleShowCommercialEvaluation" class="btn btn-block btn-primary">Initiate the Commercial Evaluation</button>
                                </div>

               
                                <!-- <div class="col-lg-12" v-if="ShowCommercialEvaluationDiv">
                                    <br><br>
                                    <h3 class="text-ogeo">General Information:</h3> 
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <table class="table">
                                                <tr>
                                                    <td width="40%"><b>Set-up Name: </b></td>
                                                    <td>{{ ViewRfPModalInfo.project.title }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated By: </b></td>
                                                    <td>{{ ViewRfPModalInfo.creator.name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated At: </b></td>
                                                    <td>{{ ViewRfPModalInfo.created_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Number of PE lines:</b></td>
                                                    <td>{{ ViewRfPModalInfo.purchase_enquiries_all_active.length }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Bidding Methodology:</b></td>
                                                    <td>{{ ViewRfPModalInfo.sourcing_type }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Status</b></td>
                                                    <td>{{ ViewRfPModalInfo.status }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>On Status</b></td>
                                                    <td>{{ ViewRfPModalInfo.updated_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Request for Proposal Timeframe</b></td>
                                                    <td>
                                                        {{ ViewRfPModalInfo.start_date | formatDateNTime }} <br>
                                                        {{ ViewRfPModalInfo.end_date | formatDateNTime }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>Request For Proposls Request For Information (RFI) Timeframe</b></td>
                                                    <td>
                                                        {{ ViewRfPModalInfo.rfi_start_date | formatDateNTime }} <br>
                                                        {{ ViewRfPModalInfo.rfi_end_date | formatDateNTime }} <br>
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
                                                            <li v-for="vendor in ViewRfPModalInfo.vendors">{{ vendor.name }}</li>
                                                        </ol>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>Confirmed Participants </b></td>
                                                    <td>{{ ConfirmedParticipants }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Submitted Bids</b></td>
                                                    <td>{{ VendorsWithBids }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>RFIs Raised</b></td>
                                                    <td>{{ RFIsRaised }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Commercial Evaluation By</b></td>
                                                    <td>{{ ViewRfPModalInfo.created_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Commercial Evaluation At</b></td>
                                                    <td>{{ ViewRfPModalInfo.created_at }}</td>
                                                </tr>
                                                
                                
                                            </table>
                                        </div>
                                    </div>
                                    <hr>
                                </div> -->

                                <div class="col-lg-12" v-if="ShowCommercialEvaluationDiv">
                                    <br><br>
                                    <h3 class="text-ogeo">Vendors Responses:</h3>
                                    <span>* Once all of the quantity has been delivered by the awardee vendor, the invoicing for the retained amount can only happen after the specified number of days has elapsed. The invoicing payment terms shall apply..</span>
                                    <div class="table-wrapper">
                                        <table ref="RfPPEsInfoCommercialEvaluation" id="RfPPEsInfoCommercialEvaluation" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th v-if="CompanySetup.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ CompanySetup.pe_prefix }} #</th>
                                                    <th>Set-up Name</th>
                                                    <th>Requested Materials</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Quantity</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">UoM</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Delivery Location Details</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Is Advanced Payment Considered?</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Underlying Transaction</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Sourcing Priority</th>
                                                    <th v-if="ViewRfPModalInfo.purchase_enquiries_all_active[0].item_id">Retention Percentage*</th>
                                                    <th style="min-width: 270px; text-align: center" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        {{ vendor.name }}-ID#{{ vendor.id }}
                                                    </th>
                                                    <th>Recommendations</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(PEline, key, index) in ViewRfPModalInfo.purchase_enquiries_all_active">
                                                    <td>
                                                        <span v-if="CompanySetup.pe_prefix == ''">PE-</span><span v-else>{{ CompanySetup.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                    </td>
                                
                                                    <td>{{ ViewRfPModalInfo.project.title }}</td>
                                
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
                                                    <td style="min-width: 270px;" v-bind:class="[ViewRfPModalInfo.trackers[key].status == 'FABO Submitted' ? 'qoutation-submitted' : (ViewRfPModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewRfPModalInfo.vendors">
                                                        <template v-if="vendor.quotation_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_responses">
                                                                <template v-if="PEline.id == response.purchase_enquiry_id">
                                
                                                                    <!-- Response Details -->
                                                                    <span><b>Level of Completness:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Total Price:</b> <template v-if="response.unit_rate"> {{ formatPrice(response.price)  }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Time:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} Day(s)</template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>                                                                    
                                                                </template>
                                                            </template>
                                                        </template>
                                                        <template v-else>
                                                            <template v-for="tracker in ViewRfPModalInfo.trackers">
                                                                <template v-if="tracker.vendor_id == vendor.id">
                                                                    <span><b>Level of Completion: </b>{{ tracker.status }}</span><br>
                                                                    <span><b>Unit Rate: </b>N/A</span><br>
                                                                    <span><b>Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                </template>
                                                            </template>
                                                        </template>
                                                    </td>
                                                    <td style="min-width: 300px">
                                                        <textarea
                                                           :id="'PEline_'+PEline.id+'_Recommendation'"
                                                           class="form-control"
                                                           type="textarea"
                                                           rows="8"
                                                           placeholder="Recommendations and Notes">
                                                        </textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="col-lg-12"  v-if="ShowCommercialEvaluationDiv && ViewRfPModalInfo.status != 'Commercial Evaluation Submitted'">
                                    <hr><br><h4>Commercial Evaluation Recommendation <span class="text-danger">*</span></h4>
                                    <el-input
                                        type="textarea"
                                        rows="6"
                                        placeholder="Enter Your Additional Notes Here..."
                                        v-model="CEGeneralNotes">
                                    </el-input><br><br>
                                    
                                    
                                    <el-checkbox v-model="AbidedToProcedure"><b>I Confirm That I Have Abided by The Organization’s Internal Procedure for Sourcing Proposals from Vendors.</b></el-checkbox>

                                    <el-checkbox v-if="RFPEndDate > CurrentDateTime" v-model="RFPEndDateChange"><b>The Closing Date of This RfP Will Be Brought Forward to The Commercial Evaluation's Submittal Time. Vendors Will Be Notified of The Change in The Timeframe.</b></el-checkbox>
                                    
                                    
                                    <button v-if="RFPEndDate > CurrentDateTime" type="button" @click="SubmitCommercialEvaluation(ViewRfPModalInfo.id)" :class="[{ 'disabled': (!AbidedToProcedure || !RFPEndDateChange) },'btn btn-success btn-block waves-effect text-center']">Submit Commercial Evaluation</button>

                                    <button v-else type="button" @click="SubmitCommercialEvaluation(ViewRfPModalInfo.id)" :class="[{ 'disabled': !AbidedToProcedure },'btn btn-success btn-block waves-effect text-center']">Submit Commercial Evaluation</button>
                                </div>
                                
                                    
                                

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

</template>

<script>
    
    import {CustomJs} from '../../helpers/custom.js';
    import validate from 'validate.js';
    import _ from 'lodash';

    export default {
        name: 'request-for-quotation',
        data(){
            var self = this;
            let minDate = '';
            let maxDate = '';
            return{
                p_images : [],
                RFPEndDateChange: true,
                AbidedToProcedure: false,
                RFPEndDate: "",
                RFPStartDate: "",
                CurrentDateTime: "",
                EditQuotationId: "",
                EditQuotationPrefix: "",
                EditQuotationCompanyId: "",
                ExtendedDate: "",
                ExtendedRfIDate: "",
                CompanySetup: "",
                AddedVendors: [],
                AdditionalVendorsList: [],
                pickerOptions1: {
                  disabledDate(time) {
                    return time.getTime() <= new Date(new Date().setDate(new Date().getDate()-1));
                  }
                },
                RFIDateRangerPickerOption: {
                  disabledDate(time) {
                    if(self.ExtendedDate.length == 2){
                        var mindate = moment(self.ExtendedDate[0]);
                        var maxDate = moment(self.ExtendedDate[1]); 
                    } else if (self.ExtendedDate == "")  {
                        if(self.ViewRfPModalInfo.status.includes("Queued")){
                            var mindate = moment(self.ViewRfPModalInfo.start_date);
                            var maxDate = moment(self.ViewRfPModalInfo.end_date);  
                        } else {
                            var mindate = moment().subtract(1, "days");
                            var maxDate = moment(self.ViewRfPModalInfo.end_date); 
                        }
                    } else {
                        var mindate = moment().subtract(1, "days");
                        var maxDate = moment(self.ExtendedDate);
                    }
                    var isBeforeMinDate = time.getTime() <= mindate;
                    var isAfterMaxDate = time.getTime() > maxDate;

                    return isBeforeMinDate || isAfterMaxDate;
                  },
                },
                URL: '/uploads/PEVendorUploadsRequiredDocs/',
                RCURL: '/uploads/RCVendorUploadsRequiredDocs/',
                DataTable: "",
                viewDataLoaded: false,
                viewRfIDataLoaded: false,
                viewPEDataLoaded: false,
                editDataLoaded: false,
                RFIDataLoaded: false,
                RequiredDocsDataLoaded: false,
                QuotationSubmitStatus: "",
                ViewRfPModalInfo: {},
                ViewPEModalInfo: {},
                ViewModalInfo: {},
                RFIStartDate: "",
                RFIEndDate: "",
                RFIDetails: [],
                RequiredRFIId: "",
                RequiredFilesId: "",
                RequiredDocsDetails: [],
                RFIData: {
                    RFIMessageID: "",
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    QuotationType: "",
                    ReplyBy: "RfP Administrator",
                    PEId: "",
                },
                CEDetails: [],
                CEGeneralNotes: "",
                ConfirmedParticipants: 0,
                VendorsWithBids: 0,
                RFIsRaised: 0,
                RfPCancellationNotes: "",
                ShowRFPModificationDiv: false,
                ShowRFPCancellationDiv: false,
                ShowCommercialEvaluationDiv: false,
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            RfPDateChanged() {
                this.ExtendedRfIDate = "";
            },
            toggleShowRFPModification(){
                this.ShowRFPModificationDiv = !this.ShowRFPModificationDiv;
            },
            toggleShowRFPCancellation(){
                this.ShowRFPCancellationDiv = !this.ShowRFPCancellationDiv;
            },
            toggleShowCommercialEvaluation(){
                this.ShowCommercialEvaluationDiv = !this.ShowCommercialEvaluationDiv;
            },
            CancelQuotation(){

                let self = this;

                if(this.RfPCancellationNotes == ""){
                    Swal('Missing Information', 'Cancellation Reason is Mandatory Field.', 'warning');
                } else {

                    axios.post('/api/quotations_management/cancel_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, CancellationNotes: this.RfPCancellationNotes})
                            .then((response) => {
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 15000
                                });

                                self.DataTable.ajax.reload( null, false );  
                            });

                    $('#QuotationEditModal').modal('toggle');

                }
                
            },
            ModifyQuotation(){

                let self = this;

                if(this.ExtendedDate != "" || this.AddedVendors.length > 0 || this.ExtendedRfIDate != ""){

                    if(this.ExtendedDate != ""){ // User Did change the RfP Date

                        if(this.ExtendedDate.length == 2){ // check if the status is (Status Queued)
                            if(this.ExtendedRfIDate == ""){
                                if(this.RFIStartDate >= moment(this.ExtendedDate[0], 'YYYY.MM.DD HH:mm:ss') && this.RFIEndDate <= moment(this.ExtendedDate[1], 'YYYY.MM.DD HH:mm:ss')){

                                    axios.post('/api/quotations_management/modify_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, ExtendedDate: this.ExtendedDate, AddedVendors: this.AddedVendors, ExtendedRfIDate: this.ExtendedRfIDate})
                                        .then((response) => {
                                            Swal({ 
                                                type: response.data.messageType, 
                                                title: response.data.messageTitle, 
                                                text: response.data.message,
                                                showConfirmButton: true,
                                                timer: 15000
                                            });

                                            self.DataTable.ajax.reload( null, false );  
                                        });

                                    this.EditQuotationId = "";
                                    this.EditQuotationCompanyId = "";
                                    this.ExtendedRfIDate = "";
                                    this.ExtendedDate = "";
                                    this.AddedVendors = [];

                                    this.$nextTick(() => {
                                        $('#QuotationEditModal').modal('toggle');
                                    })

                                } else {
                                    Swal('Timeframe Miss Match', 'RfI Timeframes has to be adjusted to the new RfP Timeframes...', 'warning');
                                }
                            } else {
                                axios.post('/api/quotations_management/modify_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, ExtendedDate: this.ExtendedDate, AddedVendors: this.AddedVendors, ExtendedRfIDate: this.ExtendedRfIDate})
                                    .then((response) => {
                                        Swal({ 
                                            type: response.data.messageType, 
                                            title: response.data.messageTitle, 
                                            text: response.data.message,
                                            showConfirmButton: true,
                                            timer: 15000
                                        });

                                        self.DataTable.ajax.reload( null, false );  
                                    });

                                this.EditQuotationId = "";
                                this.EditQuotationCompanyId = "";
                                this.ExtendedRfIDate = "";
                                this.ExtendedDate = "";
                                this.AddedVendors = [];

                                this.$nextTick(() => {
                                    $('#QuotationEditModal').modal('toggle');
                                })
                            }
                            

                        } else { // the user changed the Closing Date only meaning the Status Floated

                            if(this.ExtendedRfIDate == ""){ // user didn't change the RfI dates

                                if(this.RFIEndDate <= moment(this.ExtendedDate, 'YYYY.MM.DD HH:mm:ss')){

                                    axios.post('/api/quotations_management/modify_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, ExtendedDate: this.ExtendedDate, AddedVendors: this.AddedVendors, ExtendedRfIDate: this.ExtendedRfIDate})
                                        .then((response) => {
                                            Swal({ 
                                                type: response.data.messageType, 
                                                title: response.data.messageTitle, 
                                                text: response.data.message,
                                                showConfirmButton: true,
                                                timer: 15000
                                            });

                                            self.DataTable.ajax.reload( null, false );  
                                        });

                                    this.EditQuotationId = "";
                                    this.EditQuotationCompanyId = "";
                                    this.ExtendedRfIDate = "";
                                    this.ExtendedDate = "";
                                    this.AddedVendors = [];

                                    this.$nextTick(() => {
                                        $('#QuotationEditModal').modal('toggle');
                                    })

                                } else {
                                    Swal('Timeframe Miss Match', 'RfI Timeframes has to be adjusted to the new RfP Timeframes...', 'warning');
                                }
                            } else {
                                axios.post('/api/quotations_management/modify_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, ExtendedDate: this.ExtendedDate, AddedVendors: this.AddedVendors, ExtendedRfIDate: this.ExtendedRfIDate})
                                    .then((response) => {
                                        Swal({ 
                                            type: response.data.messageType, 
                                            title: response.data.messageTitle, 
                                            text: response.data.message,
                                            showConfirmButton: true,
                                            timer: 15000
                                        });

                                        self.DataTable.ajax.reload( null, false );  
                                    });

                                this.EditQuotationId = "";
                                this.EditQuotationCompanyId = "";
                                this.ExtendedRfIDate = "";
                                this.ExtendedDate = "";
                                this.AddedVendors = [];

                                this.$nextTick(() => {
                                    $('#QuotationEditModal').modal('toggle');
                                })
                            }
                                
                        }

                    } else { // only the RFI has been changed

                        axios.post('/api/quotations_management/modify_quotation_request', {CompanyId: this.EditQuotationCompanyId, QuotationID: this.EditQuotationId, ExtendedDate: this.ExtendedDate, AddedVendors: this.AddedVendors, ExtendedRfIDate: this.ExtendedRfIDate})
                            .then((response) => {
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 15000
                                });

                                self.DataTable.ajax.reload( null, false );  
                            });

                        this.EditQuotationId = "";
                        this.EditQuotationCompanyId = "";
                        this.ExtendedRfIDate = "";
                        this.ExtendedDate = "";
                        this.AddedVendors = [];

                        this.$nextTick(() => {
                            $('#QuotationEditModal').modal('toggle');
                        })
                    }

                    

                } else {
                    Swal('Missing Data', 'Please Modity Timeframes and/or Add a Vendor(s)...', 'warning');
                }        
            },
            showEditModal(QuotationID, CompanyId){
                let self = this;

                //Reset Previous Data
                this.EditQuotationId = "";
                this.EditQuotationCompanyId = "";
                this.ExtendedDate = "";
                this.AddedVendors = [];

                this.EditQuotationId = QuotationID;
                if(this.CompanySetup.rfq_prefix != '') {
                    this.EditQuotationPrefix = this.CompanySetup.rfq_prefix;
                } else {
                    this.EditQuotationPrefix = "RfP";
                }
                
                this.EditQuotationCompanyId = CompanyId;
                this.AdditionalVendorsList = [];

                axios.post('/api/data/get_vendors_list_without_existing', {CompanyId: CompanyId, QuotationID: QuotationID})
                    .then((response) => {
                        this.AdditionalVendorsList = response.data;
                    })


                this.ViewRfPModalInfo = {};
                axios.post('/api/data/get_quotation_details', {QuotationId: QuotationID, QuotationType: "PE"})
                    .then((response) => {
                        this.ViewRfPModalInfo = response.data;
                        this.viewRfIDataLoaded = true
                        // console.log(this.ViewRfPModalInfo);
                        self.RFPEndDate = moment(this.ViewRfPModalInfo.end_date, 'YYYY.MM.DD HH:mm:ss');
                        self.RFPStartDate = moment(this.ViewRfPModalInfo.start_date, 'YYYY.MM.DD HH:mm:ss');
                        self.RFIStartDate = moment(this.ViewRfPModalInfo.rfi_start_date, 'YYYY.MM.DD HH:mm:ss');
                        self.RFIEndDate = moment(this.ViewRfPModalInfo.rfi_end_date, 'YYYY.MM.DD HH:mm:ss');
                        self.CurrentDateTime = moment();


                        self.editDataLoaded = true;

                        $('#QuotationEditModal').modal('toggle');

                        self.VendorsWithBids = 0;
                        $.each(this.ViewRfPModalInfo.vendors, function(index, vendor) {
                            $.each(vendor.quotation_responses, function(key, response) {
                                if(response.price != null){
                                    self.VendorsWithBids = self.VendorsWithBids + 1;
                                    return false;
                                }
                            });
                        });

                        self.ConfirmedParticipants = 0;
                        $.each(this.ViewRfPModalInfo.trackers, function(index, track) {
                            if(track.status == "Offer will be submitted"){
                                self.ConfirmedParticipants = self.ConfirmedParticipants + 1;
                                return false;
                            }
                        });
                        self.ConfirmedParticipants = this.ViewRfPModalInfo.vendors.length - self.ConfirmedParticipants;



                        self.RFIsRaised = 0;
                        $.each(this.ViewRfPModalInfo.rfis, function(index, rfi) {
                            if(rfi.user_type == "Vendor"){
                                self.RFIsRaised = self.RFIsRaised + 1;
                            }
                        });
                        
                        
                        this.$nextTick(() => {
                            $('#RfPPEsInfo').DataTable({
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 10,
                                bDestroy: true,
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

                        });

                    })

                self.editDataLoaded = false;

            },
            SubmitCommercialEvaluation: _.debounce(function(QuotationNumber) {
                
                    if(this.RFPEndDateChange && this.AbidedToProcedure){
                        let self = this;
                        var PECompanyId = "";
                        var QuotationID = "";
                        let QuotationSubmitted = false;

                        if(this.CEGeneralNotes == ""){
                            Swal('Missing information', 'Commercial Evaluation recommendation is a required field.', 'warning');
                            return false;
                        }

                        if(this.ViewRfPModalInfo.quotation_for == "PE"){
                            $.each(this.ViewRfPModalInfo.purchase_enquiries_all_active, function(index, val) {

                                PECompanyId = parseInt(val.company_id);
                                QuotationID = parseInt(val.pivot.quotation_id);

                                self.CEDetails.push({
                                    PELineID: parseInt(val.id),
                                    PELineNote: $('#PEline_'+val.id+'_Recommendation').val(),
                                });
                               
                            });

                            /* Check to have at least one quotation is submitted quotation */
                            $.each(this.ViewRfPModalInfo.vendors, function(index, vendor) {
                                if(vendor.quotation_responses.length > 0){
                                    QuotationSubmitted = true;
                                    return false;
                                }
                            });

                            
                            if(QuotationSubmitted){

                                axios.post('/api/quotations_management/submit_commerical_evaluation', {PECompanyId: PECompanyId, QuotationID: QuotationID, CEDetails: self.CEDetails, CEGeneralNotes: self.CEGeneralNotes, QuotationType: this.ViewRfPModalInfo.quotation_for})
                                .then((response) => {

                                    self.DataTable.ajax.reload( null, false );  
                                    $('#QuotationEditModal').modal('toggle');

                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 15000
                                    });
                                })

                                this.CEGeneralNotes = "";
                                self.CEDetails = [];

                            } else {
                                Swal('No quotations submitted', 'No quotations available. Submiting empty Commercial Evaluation is not possible.', 'warning')
                            }
                            

                        }

                        if(this.ViewRfPModalInfo.quotation_for == "RC"){
                            $.each(this.ViewRfPModalInfo.rate_contract_requests, function(index, val) {

                                PECompanyId = parseInt(val.company_id);
                                QuotationID = parseInt(val.pivot.quotation_id);

                                self.CEDetails.push({
                                    PELineID: parseInt(val.id),
                                    PELineNote: $('#PEline_'+val.id+'_Recommendation').val(),
                                });
                               
                            });

                            /* Check to have at least one quotation is submitted quotation */
                            $.each(this.ViewRfPModalInfo.vendors, function(index, vendor) {
                                if(vendor.quotation_r_c_responses.length > 0){
                                    QuotationSubmitted = true;
                                    return false;
                                }
                            });

                            if(QuotationSubmitted){

                                axios.post('/api/quotations_management/submit_commerical_evaluation', {PECompanyId: PECompanyId, QuotationID: QuotationID, CEDetails: self.CEDetails, CEGeneralNotes: self.CEGeneralNotes, QuotationType: this.ViewRfPModalInfo.quotation_for})
                                    .then((response) => {

                                        self.DataTable.ajax.reload( null, false );  
                                        $('#QuotationEditModal').modal('toggle');

                                        Swal({ 
                                            type: response.data.messageType, 
                                            title: response.data.messageTitle, 
                                            text: response.data.message,
                                            showConfirmButton: true,
                                            timer: 15000
                                        });
                                    })

                                    this.CEGeneralNotes = "";
                                    self.CEDetails = [];

                            } else {
                                Swal('No quotations submitted', 'No quotations available. Submitting empty Commercial Evaluation is not possible.', 'warning')
                            }


                        }

                    }

                }, 100)
                
                
            ,
            showRequiredDocsModal(recordId, VendorId) {

                // console.log(recordId, VendorId);

                if(this.ViewRfPModalInfo.quotation_for == "PE"){
                    function isRequiredPE(PE){
                        return PE.id == recordId;
                    }

                    // console.log(recordId);

                    //reset previous values and uploaded files
                    this.RequiredFilesId = "";
                    this.RequiredDocsDetails = [];

                    //store the selected PE Id
                    this.RequiredFilesId = recordId;
                    
                    //get the list of document required for the selected PE
                    let PE = this.ViewRfPModalInfo.purchase_enquiries_all_active.find(isRequiredPE);
                    console.log(PE);
                    this.RequiredDocsDetails = PE.required_documents.split(",");
                    this.PEVendorUploadedFiles = PE.uploaded_docs.filter( document => document.vendor_id == VendorId );

                    //Show the modal
                    this.RequiredDocsDataLoaded = true;
                    $('#RequiredDocsModal').modal('toggle');

                    this.RequiredDocsDataLoaded = true;
                }


                if(this.ViewRfPModalInfo.quotation_for == "RC"){

                    function isRequiredPE(PE){
                        return PE.id == recordId;
                    }

                    console.log(recordId);

                    //reset previous values and uploaded files
                    this.RequiredFilesId = "";
                    this.RequiredDocsDetails = [];

                    //store the selected PE Id
                    this.RequiredFilesId = recordId;
                    
                    //get the list of document required for the selected PE
                    let PE = this.ViewRfPModalInfo.rate_contract_requests.find(isRequiredPE);
                    console.log(PE);
                    this.RequiredDocsDetails = PE.required_documents.split(",");
                    this.PEVendorUploadedFiles = PE.uploaded_docs.filter( document => document.vendor_id == VendorId );

                    //Show the modal
                    this.RequiredDocsDataLoaded = true;
                    $('#RequiredDocsModal').modal('toggle');

                    this.RequiredDocsDataLoaded = true;

                }
            },
            showPfPViewModal(recordId, recordType){
                let self = this;
                this.ViewRfPModalInfo = {};
                axios.post('/api/data/get_quotation_details', {QuotationId: recordId, QuotationType: recordType})
                    .then((response) => {
                        this.ViewRfPModalInfo = response.data;
                        this.viewRfIDataLoaded = true
                        console.log(this.ViewRfPModalInfo);
                        $('#RFPInformationModal').modal('toggle');

                        self.VendorsWithBids = 0;
                        $.each(this.ViewRfPModalInfo.vendors, function(index, vendor) {
                            $.each(vendor.quotation_responses, function(key, response) {
                                if(response.price != null){
                                    self.VendorsWithBids = self.VendorsWithBids + 1;
                                    return false;
                                }
                            });
                        });

                        self.ConfirmedParticipants = 0;
                        $.each(this.ViewRfPModalInfo.trackers, function(index, track) {
                            if(track.status == "Offer will be submitted"){
                                self.ConfirmedParticipants = self.ConfirmedParticipants + 1;
                                return false;
                            }
                        });
                        //self.ConfirmedParticipants = this.ViewRfPModalInfo.vendors.length - self.ConfirmedParticipants;



                        self.RFIsRaised = 0;
                        $.each(this.ViewRfPModalInfo.rfis, function(index, rfi) {
                            if(rfi.user_type == "Vendor"){
                                self.RFIsRaised = self.RFIsRaised + 1;
                            }
                        });
                        
                        
                        

                        this.$nextTick(() => {
                            $('#RfPPEsInfoCommercialEvaluation').DataTable({
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 10,
                                bDestroy: true,
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

                        });

                    })

                this.viewRfIDataLoaded = false; 

                
            },
            showPEViewModal(elquentClass, recordId){
                this.ViewPEModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewPEModalInfo = response.data;
                        console.log(this.ViewPEModalInfo);
                        if(response.data.p_images !== null){
                            let image_array_string = response.data.p_images;
                            let image_string = image_array_string.substring(1, image_array_string.length-1);
                            let final = image_string.replace(/"/g,"");
                            var d= final.split(',');
                            this.p_images = d;
                        }
                        this.viewPEDataLoaded = true;
                        $('#PurchaseEnquiryUpdateModalView').modal('toggle');
                    });
                this.viewPEDataLoaded = false;
            },
            // showViewModal(recordId, recordType){
            //     this.ViewModalInfo = {};
            //     axios.post('/api/data/get_quotation_details', {QuotationId: recordId, QuotationType: recordType})
            //         .then((response) => {
            //             this.ViewModalInfo = response.data;
            //             this.viewDataLoaded = true
            //             console.log(this.ViewModalInfo);
            //             $('#QuotationDetailsModal').modal('toggle');

            //             this.$nextTick(() => {
            //                 $('#CommercialEvaluationLine').DataTable({
            //                     colReorder: true,
            //                     dom: '<"html5buttons">Brfgtip',
            //                     pageLength: 10,
            //                     columnDefs: [
            //                         { width: "300px" }
            //                     ],
            //                     lengthMenu: [
            //                         [ 10, 25, 50, 100, 500, 1000, -1 ],
            //                         [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
            //                     ],
            //                     order: [[ 0, "ASC" ]],
            //                     buttons: [
            //                         { extend: 'pageLength', className: 'btn btn-success' },
            //                         { extend: 'copy', className: 'btn btn-success' },
            //                         { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
            //                         { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
            //                     ],   
            //                 });

            //             });

            //         })

            //     this.viewDataLoaded = false;            
            // },
            showRFIModal(recordId, VendorId) {
                this.RFIDetails = [];
                this.RFIData.PEId = recordId;
                this.RFIData.VendorId = VendorId;
                this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                this.RFIData.QuotationType = this.ViewModalInfo.quotation_for;
                this.RFIData.QuotationId = this.ViewModalInfo.id;
                axios.post('/api/data/get_all_pe_rfi_details', {PEId: recordId, VendorId: VendorId, QuotationType: this.RFIData.QuotationType})
                    .then((response) => {
                        this.RFIDetails = response.data;
                        this.RFIDataLoaded = true;
                        console.log(this.RFIDetails);

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
                        console.log(this.RFIDetails);

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

            const self = this

            axios.get('/api/data/get_company_details')
                .then((response) => {
                    console.log(response.data);
                    self.CompanySetup = response.data;

                    var groupColumn = 1;
                    const table = $('#QuotationsList').DataTable({
                        fixedHeader: {
                            header: true,
                            headerOffset: 117
                        },
                        bDestroy: true,
                        autoWidth: false,
                        bAutoWidth: false,
                        stateSave:  true,
                        responsive: true,
                        colReorder: true,
                        processing: true,
                        serverSide: true,
                        ajax: 'http://' + window.location.host + '/api/data/get_quotations_list',
                        columns: [
                            { data: 'show_id', name: 'show_id' },
                            { data: 'quotation_grouping', name: 'quotation_grouping' },
                            { data: 'project.title', name: 'project.title' },
                            { data: 'creator.name', name: 'creator.name' },
                            { data: 'enquiry_type', name: 'enquiry_type' },
                            { data: 'complete_description_with_headers', name: 'complete_description_with_headers' },
                            { data: 'sourcing_type', name: 'sourcing_type' },
                            { data: 'commerical_evaluation_group_id', name: 'commerical_evaluation_group_id' },
                            { data: 'commerical_evaluation_group_id_created_at', name: 'commerical_evaluation_group_id_created_at' },
                            { data: 'service_description', name: 'service_description' },
                            { data: 'quantity', name: 'quantity' },
                            { data: 'item.u_o_m', name: 'item.u_o_m' },
                            { data: 'advanced_payment', name: 'advanced_payment' },
                            { data: 'retention_percentage', name: 'retention_percentage' },
                            { data: 'underlying_transaction', name: 'underlying_transaction' },
                            { data: 'sourcing_priority', name: 'sourcing_priority' },
                            { data: 'created_at', name: 'created_at' },
                            { data: 'updated_at_human', name: 'updated_at_human' },
                            { data: 'status', name: 'status' },
                            { data: 'rfp_name', name: 'rfp_name' },
                            { data: 'creator_name', name: 'creator_name' },
                            { data: 'quotations_created_at', name: 'quotations_created_at' },
                            { data: 'quotations_start_date', name: 'quotations_start_date' },
                            { data: 'quotations_end_date', name: 'quotations_end_date' },
                            { data: 'quotations_rfi_start_date', name: 'quotations_rfi_start_date' },
                            { data: 'quotations_rfi_end_date', name: 'quotations_rfi_end_date' },
                            { data: 'consulted_vendors', name: 'consulted_vendors' },
                            { data: 'quotations_status', name: 'quotations_status' },
                            { data: 'action', name: 'action', orderable: false, searchable: false }
                        ],
                        columnDefs: [
                            { visible: false, targets: groupColumn },
                            { responsivePriority: 1, targets: -1 },
                            { width: '50%', targets: 5 },
                            { responsivePriority: 2, targets: 0 },
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
                            var columns = api.columns( {page:'current'} ).nodes();
                            var last = null;

                            var columnSpan = 2;
                 
                            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                                if ( last !== group ) {
                                    // alert(group, i)
                                    //console.log($(rows).eq(i)[0].cells)
                                    let cellLength = $(rows).eq(i)[0].cells.length;
                                    let ViewDataSet = $(rows).eq(i)[0].cells[cellLength-1].children[0].dataset; //gets the view
                                    let EditDataSet = $(rows).eq(i)[0].cells[cellLength-1].children[1].dataset; //gets the edit
                                    let RFPStatus = $(rows).eq(i)[0].cells[cellLength-1].children[0].dataset.quotationstatus; //gets the edit
                                    let RFPName = $(rows).eq(i)[0].cells[cellLength-1].children[1].dataset; //gets the edit
                                    let RFIDates = $(rows).eq(i)[0].cells[cellLength-1].children[1].dataset; //gets the edit
                                    let RFPDates = $(rows).eq(i)[0].cells[cellLength-1].children[1].dataset; //gets the edit
                                    let prefix = "RfP";
                                    //console.log(api.columns(':visible').count());
                                    if(self.CompanySetup.rfq_prefix != ""){  prefix = self.CompanySetup.rfq_prefix; }

                                    /* Check if we have at least one submitted commerical evaluation and change the spaning from 1 to 2 */
                                    
                                    

                                    if($(rows).eq(i)[0].cells[cellLength-2].innerText == 'Commercial Evaluation Submitted' || $(rows).eq(i)[0].cells[cellLength-2].innerText == 'Request for Proposals cancelled'){

                                        columnSpan = 1;

                                        $(rows).eq(i).before(
                                            '<tr class="group">'+
                                                '<td colspan="'+(api.columns(':visible').count() - columnSpan)+'">'+
                                                    '<span>Request For Proposal ID# '+prefix+'-'+group+'</span>'+
                                                '</td>'+
                                                '<td>'+
                                                    '<button title="View Info" class="btn btn-xs btn-warning view-rfp-placeholder" data-elquentClass="QuotationRequest" data-recordid="'+ViewDataSet.recordid+'" data-recordtype="'+ViewDataSet.recordtype+'"><i class="fa fa-info"></i> </button>'+
                                                '</td>'+
                                            '</tr>'
                                        );
                                    } else {

                                        columnSpan = 1;

                                        $(rows).eq(i).before(
                                            '<tr class="group">'+
                                                '<td colspan="'+(api.columns(':visible').count() - columnSpan)+'">'+
                                                    '<span>Request For Proposal ID# '+prefix+'-'+group+'</span>'+
                                                '</td>'+
                                                '<td colspan="1">'+
                                                    '<button title="View Info" class="btn btn-xs btn-warning view-rfp-placeholder" data-elquentClass="QuotationRequest" data-recordid="'+ViewDataSet.recordid+'" data-recordtype="'+ViewDataSet.recordtype+'"><i class="fa fa-info"></i> </button> <button title="Edit" class="btn btn-xs btn-primary edit-placeholder" data-elquentClass="QuotationRequest" data-companyid="'+EditDataSet.companyid+'" data-recordid="'+EditDataSet.recordid+'" data-recordtype="'+EditDataSet.recordtype+'"><i class="fa fa-edit"></i> </button>'+
                                                '</td>'+
                                            '</tr>'
                                        );
                                    }
                                    
                 
                                    last = group;
                                }
                            } );
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

                    $('tbody', this.$refs.table).on('click', '.view-rfp-placeholder', function(){
                        var $this = $(this);
                        var RecordID = $(this).data('recordid');
                        var RecordType = $(this).data('recordtype');
                        self.showPfPViewModal(RecordID, RecordType);
                    });

                    $('tbody', this.$refs.table).on('click', '.view-rfi', function(){
                        var $this = $(this);
                        var RecordID = $(this).data('recordid');
                        var RecordType = $(this).data('recordtype');
                        var Quotationid = $(this).data('quotationid');
                        self.showAllRFIModal(RecordID, RecordType, Quotationid);
                    });


                    $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                        var $this = $(this);
                        var RecordID = $(this).data('recordid');
                        var RecordType = $(this).data('recordtype');
                        self.showViewModal(RecordID, RecordType);
                    });

                    $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                        var $this = $(this);
                        var CompanyId = $(this).data('companyid');
                        var RecordID = $(this).data('recordid');
                        var RecordType = $(this).data('recordtype');
                        self.showEditModal(RecordID, CompanyId);
                    });

                    self.DataTable = table;


                });

            
            
        },
        beforeRouteLeave (to, from, next) {
            this.DataTable.destroy();
            next();
        }

    }


</script>


<style scoped>

    .dt-button-collection {
        width: 300px !important;
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

    .modal { overflow: auto !important; }

    #QuotationDetailsModal .modal-dialog {
        min-width:80%;
    }

    #RFPInformationModal .modal-dialog {
        min-width:80%;
    }

    #PurchaseEnquiryUpdateModalView .modal-dialog {
        min-width:80%;
    }

    #QuotationEditModal .modal-dialog {
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

    .qoutation-submitted {
        background-color: rgb(69, 249, 132, 0.1);
    }

    .qoutation-not-submitted {
        background-color: rgb(249, 69, 72, 0.08);
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>