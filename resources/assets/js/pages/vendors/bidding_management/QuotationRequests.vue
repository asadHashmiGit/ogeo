<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Seal Bids List</h4>
                </div>
                <div class="card-body">
                	<table ref="table" id="QuotationRequests" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>RfP ID#</th>
                                <th>RfP Name</th>
                                <th>Organization Name</th>
                                <th>Request Category</th>
                                <th>Created By</th>
                                <th>No. Of Lines</th>
                                <th>Floated At</th>
                                <th>Closing At</th>
                                <th>RFI Start At</th>
                                <th>RFI End At</th>
                                <th>Due</th>
                                <th>Level of Completion</th>
                                <th>RfP Status</th>
                                <th>On Status Since</th>
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
                            <h4 class="modal-title text-ogeo">Request for Proposals ID# {{ ViewModalInfo.id }}</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body" v-if="viewRfIDataLoaded">
                            <div class="row" v-if="ViewModalInfo.quotation_for =='PE'">

                                <div class="col-lg-12">
                                    <h3 class="text-ogeo">General Information:</h3> 
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <table class="table">
                                                <tr>
                                                    <td><b>Organization Name: </b></td>
                                                    <td>{{ ViewModalInfo.company.name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>RfP Name: </b></td>
                                                    <td>{{ ViewModalInfo.rfp_name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated By: </b></td>
                                                    <td>{{ ViewModalInfo.creator.name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Originated At: </b></td>
                                                    <td>{{ ViewModalInfo.created_at }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Number of PE lines:</b></td>
                                                    <td>{{ ViewModalInfo.purchase_enquiries_all_active.length }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Bidding Methodology:</b></td>
                                                    <td>{{ ViewModalInfo.sourcing_type }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Status</b></td>
                                                    <td>{{ ViewModalInfo.status }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>On Status</b></td>
                                                    <td>{{ ViewModalInfo.updated_at }}</td>
                                                </tr>
                                                
                                                
                                                
                                            </table>
                                        </div>

                                        <div class="col-lg-6">
                                            <table class="table">
                                                <tr>
                                                    <td><b>Request for Proposals Timeframe</b></td>
                                                    <td>
                                                        {{ ViewModalInfo.start_date | formatDateNTime }} <br>
                                                        {{ ViewModalInfo.end_date | formatDateNTime }}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>RFI Timeframe</b></td>
                                                    <td>
                                                        {{ ViewModalInfo.rfi_start_date | formatDateNTime }} <br>
                                                        {{ ViewModalInfo.rfi_end_date | formatDateNTime }} <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><b>RFIs Raised</b></td>
                                                    <td>{{ RFIsRaised }}</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Commercial Evaluation By</b></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Commercial Evaluation At</b></td>
                                                    <td></td>
                                                </tr>
                                                

                                            </table>
                                        </div>
                                    </div>
                                    <hr>
                                </div>

                                <div class="col-lg-12">
                                    <h3 class="text-ogeo">Terms and Conditions:</h3>
                                    <p>{{ ViewModalInfo.project.terms_n_conditions }}</p>
                                    <br>
                                </div>

                                <div class="col-lg-12">
                                    <h3 class="text-ogeo">Details:</h3>
                                    <div class="table-wrapper">
                                        <table ref="RfPPEsInfo" id="RfPPEsInfo" class="responsive table table-bordered" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th v-if="ViewModalInfo.company.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ ViewModalInfo.company.pe_prefix }} #</th>
                                                    <th>Requested Materials</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Advanced Required?</th>
                                                    <th>Retention Details</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Required Documents</th>
                                                    <th>Quantity</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">UoM</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Delivery Location Details</th>
                                                    <th class="text-ogeo" style="min-width: 100px">Unit Rate</th>
                                                    <th>Currency</th>
                                                    <th>Total Price</th>
                                                    <th class="text-ogeo" style="min-width: 100px">Lead Time (Days)</th>
                                                    <th class="text-ogeo" style="min-width: 100px">Advanced Payment %</th>
                                                    <th>Upload Files</th>
                                                    <th>Raise/View RFI</th>
                                                    <th style="min-width: 150px">Notes</th>
                                                </tr>
                                            </thead>

                                            <!-- <thead>
                                                <tr>
                                                    <th v-if="ViewModalInfo.company.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ ViewModalInfo.company.pe_prefix }} #</th>
                                                    <th>Set-up Name</th>
                                                    <th>Requested Materials</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Quantity</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">UoM</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Delivery Location Details</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Is Advanced Payment Considered?</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Retention Percentage**</th>
                                                    <th style="min-width: 270px; text-align: center" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        {{ vendor.name }}
                                                    </th>
                                                </tr>
                                            </thead> -->


                                            <tbody>
                                                <template v-if="ViewModalInfo.purchase_enquiries_all_active[0].responses.length > 0">
                                                    <tr v-for="PEline in ViewModalInfo.purchase_enquiries_all_active">
                                                        <td>
                                                            <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                        </td>

                                                        <td style="min-width: 600px" v-if="PEline.item.item_template">
                                                            
                                                           <div class="row">
                                                                <div class="col-lg-2">
                                                                    <a :href="'/uploads/ItemMasterPictures/'+PEline.item.picture" download><img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+PEline.item.picture"></a>
                                                                </div>
                                                                <div class="col-lg-10">
                                                                    <span>
                                                                        <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                                        <template v-for="index in 20">    
                                                                            <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                                <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                            </span>
                                                                        </template>
                                                                    </span><br>
                                                                </div>
                                                           </div>
                                                        </td>
                                                        <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                        <!-- <td v-else style="min-width: 500px">{{ PEline.service_description }}</td> -->

                                                        <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                        <td>{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>
                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">
                                                                <span v-for="(document, index) in PEline.required_documents.split(',')">
                                                                    {{index+1}}. {{ document }}<br>
                                                                </span>
                                                            </td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                        <td v-else>1</td>

                                                        <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                        <td v-else>{{ PEline.u_o_m }}</td>
                                                        <td v-if="PEline.item_id">
                                                            <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                            <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                            <b>Longitude:</b><br>{{ PEline.longitude }}
                                                        </td>

                                                        <td v-if="PEline.responses[0].unit_rate != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].unit_rate">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].currency != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].currency">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].price != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].price">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].lead_days != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].lead_days">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Provided">        
                                                            </input>
                                                        </td>


                                                        <td v-if="PEline.responses[0].advanced_percentage != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].advanced_percentage">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Required">        
                                                            </input>
                                                        </td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''" >
                                                            <button class="btn btn-block btn-info disabled required-docs-placeholder" :id="'fileUploadt-'+PEline.id" :data-peid="PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                            </div>
                                                        </td>
                                                        <td v-else>
                                                            <span>No Files Required</span>
                                                        </td>
                                                        
                                                        
                                                        <td align="center">
                                                            <button class="btn btn-block btn-success rfi-placeholder" :data-recordid="PEline.id" data-recordtype="PE"  :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>

                                                        <td width="15%">
                                                            <input
                                                                class="form-control"
                                                                type="textarea"
                                                                rows="2"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].notes">
                                                            </input>
                                                        </td>
                                                    </tr>
                                                </template>
                                                <template v-else>
                                                    <tr v-for="(PEline, index) in ViewModalInfo.purchase_enquiries_all_active">
                                                        <td>
                                                            <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                        </td>

                                                        <td v-if="PEline.item.item_template">
                                                            <span>
                                                                <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                                <template v-for="index in 20">    
                                                                    <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                        <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                    </span>
                                                                </template>
                                                            </span><br>
                                                        </td>
                                                        <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                        <!-- <td v-else style="min-width: 500px">{{ PEline.service_description }}</td> -->

                                                        <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                        <td>{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>

                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                        <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                        <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                        <td v-else>{{ PEline.u_o_m }}</td>
                                                        <td v-if="PEline.item_id">
                                                            <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                            <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                            <b>Longitude:</b><br>{{ PEline.longitude }}
                                                        </td>

                                                        <td class="PELinePriceField">Not Submitted</td>
                                                        <td class="PELinePriceField">Not Submitted</td>
                                                        <td class="PELinePriceField">Not Submitted</td>
                                                        <td class="PELinePriceField">Not Submitted</td>
                                                        <td class="PELinePriceField">Not Submitted</td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''">
                                                            <button class="btn btn-block btn-info required-docs-placeholder" :data-peid="PEline.id" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                            </div>
                                                            <div v-else>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                            </div>
                                                        </td>
                                                        <td align="center" v-else>
                                                            <span>No Uploads Required</span>
                                                            <input
                                                                class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                        </td>
                                                        


                                                        <td align="center">
                                                            <button class="btn btn-block btn-success rfi-placeholder" :data-recordid="PEline.id" data-recordtype="PE"  :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>

                                                        <td class="PELinePriceField">Not Submitted</td>

                                                    </tr>
                                                </template>
                                                
                                            </tbody>

                                            

                                        </table>
                                    </div>
                                </div>
                            </div>



                            <div class="row" v-if="ViewModalInfo.quotation_for =='RC'">
                                <div class="col-lg-12">
                                    <div class="table-wrapper">
                                        <table ref="RfPPEsInfo" id="RfPPEsInfo" class="responsive table table-bordered" style="width:100%">
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
                                                    <td style="min-width: 270px;" v-bind:class="[ViewModalInfo.trackers[key].status == 'Quotation Submitted' ? 'qoutation-submitted' : (ViewModalInfo.trackers[key].status == 'Commercial Evaluation Submitted' ? 'qoutation-submitted' : 'qoutation-not-submitted')]" v-for="(vendor, key, index) in ViewModalInfo.vendors">
                                                        <template v-if="vendor.quotation_r_c_responses.length > 0">
                                                            <template v-for="(response, key, index) in vendor.quotation_r_c_responses">
                                                                <template v-if="PEline.id == response.rate_contract_request_id">

                                                                    <!-- Response Details -->
                                                                    <span><b>Status:</b> <template v-if="response.unit_rate">  {{ response.status }} </template> <template v-else>No Submitted</template></span><br>
                                                                    <span><b>Unit Rate:</b> <template v-if="response.unit_rate"> {{ response.unit_rate }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Total Price:</b> <template v-if="response.unit_rate"> {{ formatPrice(response.price)  }} {{ response.currency }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Lead Days:</b> <template v-if="response.unit_rate"> {{ response.lead_days }} </template> <template v-else>No Submitted</template> </span><br>
                                                                    <span><b>Advanced Percentage:</b> <template v-if="response.unit_rate"> {{ response.advanced_percentage }}% </template> <template v-else>No Submitted</template> </span><br>
                                                                    <template v-if="response.notes != null">
                                                                        <span><b>Notes:</b> {{ response.notes }}</span><br>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span><b>Notes:</b> None</span><br>
                                                                    </template>
                                                                    <span><b>Required Files:</b> 
                                                                        <span v-for="document in PEline.required_documents.split(',')">
                                                                            {{ document }}<br>
                                                                        </span>
                                                                    </span><hr>
                                                                    

                                                                    <!-- RFI Review -->
                                                                    <!-- <template v-if="PEline.rfis.length && vendor.id == PEline.rfis[0].vendor_id">
                                                                        <button type="button" @click="showRFIModal(PEline.id, PEline.rfis[0].vendor_id)" class="btn btn-warning">View RFIs <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div></button>
                                                                    </template>
                                                                    <template v-else>
                                                                        <button type="button" class="btn btn-warning disabled">No RFI</button>
                                                                    </template> -->

                                                                    <!-- Uploaded Files Review -->
                                                                    <template v-if="PEline.uploaded_docs.length">
                                                                        <button @click="showRequiredDocsModal( PEline.id, vendor.id)" class="btn btn-warning required-docs-placeholder" data-peid="PEline.id" :data-vendorid="vendor.id">View Files <div class="numberCircle pull-right"><span>{{ PEline.uploaded_docs.filter( document => document.vendor_id == vendor.id ).length }}</span></div></button>
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
                                                                    <span><b>Total Price: </b>N/A</span><br>
                                                                    <span><b>Lead Days:</b> N/A</span><br>
                                                                    <span><b>Notes: </b>N/A</span><br>
                                                                    <span><b>Required Files: </b> 
                                                                        <span v-for="document in PEline.required_documents.split(',')">
                                                                            {{ document }}<br>
                                                                        </span></span><hr>
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

                            <div class="col-lg-12">
                                <hr>
                                <span><b>Date:</b> {{ new Date() }}</span><br>
                                <span><b>By:</b> {{ currentVendor.Name }}</span><br><br>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div id="QuotationDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModal" aria-hidden="true" style="display: none;">
	            <div class="modal-dialog modal-lg" >
	                <div class="modal-content"  v-if="viewDataLoaded">
	                    <div class="modal-header">
	                        <h4 class="modal-title text-ogeo">Request For Proposals ID# <span style="color: black" v-if="ViewModalInfo.company.rfq_prefix == ''">RfP-</span><span style="color: black" v-else>{{ ViewModalInfo.company.rfq_prefix }}-</span><span style="color: black">{{ ViewModalInfo.quotation_group_id }}</span><span style="color: black" v-if="ViewModalInfo.rfp_name">; {{ ViewModalInfo.rfp_name }}</span></h4>
	                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                    </div>
	                    <div class="modal-body">
	                        <div class="row" v-if="ViewModalInfo.quotation_for == 'PE'">
	                            <div class="col-lg-12">
                                    <span>* Unit Rates are to be inclusive of all taxes. NOT entering a Unit Rate means that no offer is tabled for the respective Item. Entering 0.00 as a Unit Rate means that the respective item is offered free of cost.</span><br>
                                    <span>** Once all of the quantity has been delivered by the awardee vendor, the invoicing for the retained amount can only happen after the specified number of days has elapsed. The invoicing payment terms shall apply.</span><br>
                                    <span>*** From date of award.</span>
                                    <div class="table-wrapper">
    	                                <table ref="PETable" id="QuotationRequestsLines" class="display responsive table table-bordered table-hover" style="width:100%">
    				                        <thead>
    				                            <tr>
                                                    <th v-if="ViewModalInfo.company.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ ViewModalInfo.company.pe_prefix }} #</th>
    				                                <th>Requested Materials</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Advanced Required?</th>
                                                    <th>Retention Details**</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Required Documents</th>
    				                                <th>Quantity</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">UoM</th>
                                                    <th v-if="ViewModalInfo.purchase_enquiries_all_active[0].item_id">Delivery Location Details</th>
                                                    <th class="text-ogeo" style="min-width: 100px">Unit Rate*</th>
                                                    <th>Currency</th>
                                                    <th>Total Price</th>
                                                    <th class="text-ogeo" style="min-width: 100px">Lead Time (Days)***</th>
    				                                <th class="text-ogeo" style="min-width: 100px">Advanced Payment %</th>
                                                    <th>Upload Files</th>
                                                    <th>Raise/View RFI</th>
                                                    <th style="min-width: 150px">Notes</th>
    				                            </tr>
    				                        </thead>
    				                        <tbody>
                                                <template v-if="ViewModalInfo.purchase_enquiries_all_active[0].responses.length > 0">
                                                    <tr v-for="PEline in ViewModalInfo.purchase_enquiries_all_active">
                                                        <td>
                                                            <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                        </td>

                                                        <td style="min-width: 600px" v-if="PEline.item.item_template">
                                                            
                                                           <div class="row">
                                                                <div class="col-lg-2">
                                                                    <a :href="'/uploads/ItemMasterPictures/'+PEline.item.picture" download><img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+PEline.item.picture"></a>
                                                                </div>
                                                                <div class="col-lg-10">
                                                                    <span>
                                                                        <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                                        <template v-for="index in 20">    
                                                                            <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                                <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                            </span>
                                                                        </template>
                                                                    </span><br>
                                                                </div>
                                                           </div>
                                                        </td>
                                                        <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                        <!-- <td v-else style="min-width: 500px">{{ PEline.service_description }}</td> -->

                                                        <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                        <td>{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>
                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">
                                                                <span v-for="(document, index) in PEline.required_documents.split(',')">
                                                                    {{index+1}}. {{ document }}<br>
                                                                </span>
                                                            </td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                        <td v-else>1</td>

                                                        <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                        <td v-else>{{ PEline.u_o_m }}</td>
                                                        <td v-if="PEline.item_id">
                                                            <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                            <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                            <b>Longitude:</b><br>{{ PEline.longitude }}
                                                        </td>

                                                        <td v-if="PEline.responses[0].unit_rate != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].unit_rate">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].currency != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].currency">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].price != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].price">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].lead_days != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].lead_days">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Provided">        
                                                            </input>
                                                        </td>


                                                        <td v-if="PEline.responses[0].advanced_percentage != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].advanced_percentage">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Required">        
                                                            </input>
                                                        </td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''" >
                                                            <button class="btn btn-block btn-info disabled required-docs-placeholder" :id="'fileUploadt-'+PEline.id" :data-peid="PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                            </div>
                                                        </td>
                                                        <td v-else>
                                                            <span>No Files Required</span>
                                                        </td>
                                                        
                                                        
    
                                                        <td align="center">
                                                            <button class="btn btn-block btn-success disabled rfi-placeholder" :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>

                                                        <td width="15%">
                                                            <input
                                                                class="form-control"
                                                                type="textarea"
                                                                rows="2"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].notes">
                                                            </input>
                                                        </td>
                                                    </tr>
                                                </template>
                                                <template v-else>
                                                    <tr v-for="(PEline, index) in ViewModalInfo.purchase_enquiries_all_active">
                                                        <td>
                                                            <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                        </td>

                                                        <td v-if="PEline.item.item_template">
                                                            <span>
                                                                <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                                <template v-for="index in 20">    
                                                                    <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                        <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                    </span>
                                                                </template>
                                                            </span><br>
                                                        </td>
                                                        <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                        <!-- <td v-else style="min-width: 500px">{{ PEline.service_description }}</td> -->

                                                        <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                        <td>{{ PEline.retention_percentage }}% - {{ PEline.retention_days }} Day(s)</td>

                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                        <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                        <td v-if="PEline.item.item_template">{{ PEline.item.u_o_m }}</td>
                                                        <td v-else>{{ PEline.u_o_m }}</td>
                                                        <td v-if="PEline.item_id">
                                                            <b>Location Name:</b><br>{{ PEline.location_name }}<br>
                                                            <b>Latitude:</b><br>{{ PEline.latitude }}<br>
                                                            <b>Longitude:</b><br>{{ PEline.longitude }}
                                                        </td>

                                                        <td style="min-width: 100px">
                                                            <input
                                                               class="form-control text-ogeo"
                                                               :id="'PEline_'+PEline.id+'_unit_price'"
                                                               type="number"
                                                               style="min-width: 100%; font-size: 20px; font-weight: bolder;"
                                                               v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                               placeholder="Enter Unit Price">
                                                            </input>
                                                        </td>
                                                        <td>
                                                            <select 
                                                                :id="'PEline_'+PEline.id+'_currency'"
                                                                placeholder="Select Currency"
                                                                class="form-control"
                                                                hidden
                                                                style="max-height: 7px">
                                                                
                                                                <option :value="PEline.project.currency.slice(0, PEline.project.currency.length-1)">{{  PEline.project.currency.slice(0, PEline.project.currency.length-1) }}</option>
                                                            </select>
                                                            <span>{{  PEline.project.currency.slice(0, PEline.project.currency.length-1) }}</span>
                                                        </td>
                                                        <td class="PELinePriceField">0.00</td>
                                                        <td>
                                                            <input
                                                                class="form-control text-ogeo"
                                                                :id="'PEline_'+PEline.id+'_lead_days'"
                                                                v-on:input="checkLeadDays(PEline.id)"
                                                                type="number"
                                                                step="1"
                                                                style=" font-size: 20px; font-weight: bolder;"
                                                                placeholder="Enter Days">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.advanced_payment == 'Yes'">
                                                            <input
                                                                class="form-control text-ogeo"
                                                                :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                                 type="number"
                                                                 step="1"
                                                                 max="100"
                                                                 value="0.00"
                                                                 @blur="CheckAdvPercentage(PEline.id)"
                                                                 style=" font-size: 20px; font-weight: bolder;"
                                                                 placeholder="Enter %">        
                                                            </input>
                                                        </td>
                                                        <td v-else>N/A <input
                                                            class="form-control" type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''">
                                                            <button class="btn btn-block btn-info required-docs-placeholder" :data-peid="PEline.id" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                            </div>
                                                            <div v-else>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                            </div>
                                                        </td>
                                                        <td align="center" v-else>
                                                            <span>No Uploads Required</span>
                                                            <input
                                                                class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                        </td>
                                                        


                                                        <td align="center">
                                                            <button class="btn btn-block btn-success rfi-placeholder" :data-recordid="PEline.id" data-recordtype="PE"  :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>
                                                        <td width="15%">
                                                            <input
                                                                class="form-control"
                                                               :id="'PEline_'+PEline.id+'_note'"
                                                               type="textarea"
                                                               rows="2"
                                                               placeholder="Additional Notes">
                                                            </input>
                                                        </td>
                                                    </tr>
                                                </template>
    				                        	
    				                        </tbody>
    				                    </table>
                                    </div>

                                    <div v-if="ViewModalInfo.purchase_enquiries_all_active[0].responses.length > 0" class="row">
                                        <div class="col-lg-12">
                                            <br>
                                            <label><b> Offer Validity End Date:</b></label>
                                            <span>{{ ViewModalInfo.purchase_enquiries_all_active[0].responses[0].validity_date | formatDateNoTime }} </span>
                                        </div>
                                    </div>
	                            </div>
	                        </div>


                            <div class="row" v-if="ViewModalInfo.quotation_for == 'RC'">
                                <div class="col-lg-12">
                                    <p>* Unit Rates are to be inclusive of all taxes. NOT entering a Unit Rate means that no offer is tabled for the respective Item. Entering 0.00 as a Unit Rate means that the respective item is offered free of cost.</p>
                                    <div class="table-wrapper">
                                        <table ref="PETable" id="QuotationRequestsLines" class="display responsive table table-bordered table-hover" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th v-if="ViewModalInfo.company.pe_prefix == ''">PE #</th>
                                                    <th v-else>{{ ViewModalInfo.company.pe_prefix }} #</th>
                                                    <th>Requested Materials</th>
                                                    <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Advanced Required?</th>
                                                    <th v-if="ViewModalInfo.rate_contract_requests[0].item_id">Required Documents</th>
                                                    <th>Quantity</th>
                                                    <th style="min-width: 100px">Unit Rate*</th>
                                                    <th>Currency</th>
                                                    <th>Total Price</th>
                                                    <th style="min-width: 100px">Lead Days</th>
                                                    <th style="min-width: 100px">Advanced Payment %</th>
                                                    <th>Upload Files</th>
                                                    <th>Raise/View RFI</th>
                                                    <th style="min-width: 150px">Notes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <template v-if="ViewModalInfo.rate_contract_requests[0].responses.length > 0">
                                                    <tr v-for="PEline in ViewModalInfo.rate_contract_requests">
                                                        <td>
                                                            <span v-if="ViewModalInfo.company.pe_prefix == ''">PE-</span><span v-else>{{ ViewModalInfo.company.pe_prefix }}-</span>{{ PEline.purchase_enquiry_group_id }}-{{ PEline.purchase_enquiry_ingroup_id }}
                                                        </td>

                                                        <td v-if="PEline.item.item_template">
                                                            <span>
                                                                <b><span><span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ PEline.item.item_group_id }}-{{ PEline.item.item_ingroup_id }}</span></b><br>
                                                                <template v-for="index in 20">    
                                                                    <span v-if="PEline.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                        <b>{{ PEline.item.item_template['field_'+index] }}:</b> {{ PEline.item['field_'+index] }} | 
                                                                    </span>
                                                                </template>
                                                            </span><br>
                                                        </td>
                                                        <td v-else style="min-width: 200px">{{ PEline.item_description }}</td>

                                                        <!-- <td v-else style="min-width: 500px">{{ PEline.service_description }}</td> -->

                                                        <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>
                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id">{{ PEline.quantity }}</td>
                                                        <td v-else>1</td>

                                                        <td v-if="PEline.responses[0].unit_rate != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].unit_rate">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].currency != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].currency">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].price != null">
                                                            <input
                                                                class="form-control" 
                                                                type="number"
                                                                step="4"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].price">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Price Not Provided">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.responses[0].lead_days != null">
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].lead_days">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Provided">        
                                                            </input>
                                                        </td>


                                                        <td v-if="PEline.responses[0].advanced_percentage != null">
                                                            Rate Contract
                                                            <input
                                                                class="form-control" 
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].advanced_percentage">        
                                                            </input>
                                                        </td>
                                                        <td v-else>
                                                            Rate Contract
                                                            <input
                                                                class="form-control"
                                                                type="text"
                                                                readonly
                                                                disabled
                                                                value="Not Required">        
                                                            </input>
                                                        </td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''" >
                                                            <button class="btn btn-block btn-info disabled required-docs-placeholder" :data-peid="PEline.id" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                            </div>
                                                        </td>
                                                        <td v-else>
                                                            <span>No Files Required</span>
                                                        </td>
                                                        
                                                        

                                                        <td align="center">
                                                            <button class="btn btn-block btn-success disabled rfi-placeholder" :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>

                                                        <td width="15%">
                                                            <input
                                                                class="form-control"
                                                                type="textarea"
                                                                rows="2"
                                                                readonly
                                                                disabled
                                                                :value="PEline.responses[0].notes">
                                                            </input>
                                                        </td>
                                                    </tr>
                                                </template>
                                                <template v-else>
                                                    <tr v-for="(PEline, index) in ViewModalInfo.rate_contract_requests">
                                                        <td>{{ PEline.id }}</td>
                                                        <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                        
                                                        <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                        <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>

                                                        <td v-if="PEline.item_id">Rate Contract</td>

                                                        <template v-if="PEline.item_id">
                                                            <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                        </template>

                                                        <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                        <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                        <td style="min-width: 100px">
                                                            <input
                                                                class="form-control"
                                                               :id="'PEline_'+PEline.id+'_unit_price'"
                                                               type="number"
                                                               style="min-width: 100%;"
                                                               v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                               placeholder="Enter Unit Price">
                                                            </input>
                                                        </td>
                                                        <td>
                                                            <select 
                                                                :id="'PEline_'+PEline.id+'_currency'"
                                                                placeholder="Select Currency"
                                                                class="form-control"
                                                                style="max-height: 7px">
                                                                        
                                                                <option :value="PEline.project.currency.slice(0, PEline.project.currency.length-1)">{{  PEline.project.currency.slice(0, PEline.project.currency.length-1) }}</option>
                                                            </select>
                                                        </td>
                                                        <td class="PELinePriceField">0.00</td>
                                                        <td>
                                                            <input
                                                                class="form-control"
                                                                :id="'PEline_'+PEline.id+'_lead_days'"
                                                                 type="number"
                                                                 v-on:input="checkLeadDays(PEline.id)"
                                                                 step="1"
                                                                 placeholder="Enter Days">        
                                                            </input>
                                                        </td>

                                                        <td v-if="PEline.advanced_payment == 'Yes'">
                                                            Rate Contract
                                                            <input
                                                                class="form-control"
                                                                :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                                 type="number"
                                                                 step="1"
                                                                 max="100"
                                                                 value="0.00"
                                                                 @blur="CheckAdvPercentage(PEline.id)"
                                                                 placeholder="Enter %">        
                                                            </input>
                                                        </td>
                                                        <td v-else> Rate Contract <input
                                                            class="form-control" type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                        
                                                        
                                                        <td align="center" v-if="PEline.required_documents != ''">
                                                            <button class="btn btn-block btn-info required-docs-placeholder" :data-peid="PEline.id" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                            <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                                <span>{{ PEline.uploaded_docs.length }}</span>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                            </div>
                                                            <div v-else>
                                                                <input
                                                                    class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                            </div>
                                                        </td>
                                                        <td align="center" v-else>
                                                            <span>No Uploads Required</span>
                                                            <input
                                                                class="form-control" type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                        </td>
                                                        

                                                        <td align="center">
                                                            <button class="btn btn-block btn-success rfi-placeholder" :data-recordid="PEline.id" data-recordtype="PE" :id="'infoRequest-'+PEline.id">RFI </button>
                                                            <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                        </td>
                                                        <td width="15%">
                                                            <input
                                                                class="form-control"
                                                               :id="'PEline_'+PEline.id+'_note'"
                                                               type="textarea"
                                                               rows="2"
                                                               placeholder="Additional Notes">
                                                            </input>
                                                        </td>
                                                    </tr>
                                                </template>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

	                        <div class="col-lg-12">
                                
                                <template v-if="QuotationSubmitStatus != 'Quotation Submitted' && QuotationSubmitStatus != 'Commercial Evaluation Submitted'">

                                    <br><hr>
                                    <div class="row" v-if="ViewModalInfo.quotation_for == 'RC'">
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-8">
                                            <h5>Discount Volume Details (Optional):</h5>
                                            <table class="display responsive table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>From Value</th>
                                                        <th>To Value</th>
                                                        <th>Discount Percentage</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(VolDis, index) in VolDisDetails">
                                                        <td>{{ VolDis.FromTotalValue }}</td>
                                                        <td>{{ VolDis.ToTotalValue }}</td>
                                                        <td>{{ VolDis.Percentage }}</td>
                                                        <td>
                                                            <button @click="RemoveVolumnDiscountLine(index)" class="btn btn-block btn-success"><i class="fa fa-remove m-r-10"></i> Remove Line </button>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td><input
                                                            class="form-control" placeholder="Enter From Value e.g. 15423" type="number" v-model="AddVolDis.FromTotalValue"></input></td>
                                                        <td><input
                                                            class="form-control" placeholder="Enter To Value e.g. 15423" type="number" v-model="AddVolDis.ToTotalValue"></input></td>
                                                        <td><input
                                                            class="form-control" placeholder="Discount % Value e.g. 5.2%" type="number" v-model="AddVolDis.Percentage"></input></td>
                                                        <td>
                                                            <button @click="AddVolumnDiscountLine" class="btn btn-block btn-success"><i class="fa fa-plus m-r-10"></i> Add New Line </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-lg-2"></div>
                                    </div>

                                    
                                    
                                    <h5>Select The Offer's Validity:</h5>
                                    <el-date-picker
                                        v-model="QuotationValidityDate"
                                        type="datetime"
                                        style="width: 100%"
                                        placeholder="Pick a day"
                                        :default-time="'23:59:59'"
                                        value-format="yyyy-MM-dd HH:mm:ss"
                                        :picker-options="pickerOptions1">
                                    </el-date-picker>
                                    <!-- <span class="text-danger" style="font-size: 12px" v-if="QuotationResponseErrors != undefined">{{ QuotationResponseErrors.QuotationValidityDate[0] }}</span> -->

                                    <br><br>

                                    <el-checkbox v-model="AbidedToCompanyRules"><b>I Confirm That I Have Read and Agreed With The Request of Proposal's Terms & Conditions.</b></el-checkbox>
    
                                    <button type="button" @click="SubmitPrices" :class="[{ 'disabled': !AbidedToCompanyRules  },'btn btn-success btn-block waves-effect text-center']">Submit Response to Request for Proposals</button>
                                </template>

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
                                            <td v-if="QuotationSubmitStatus != 'Quotation Submitted' && PEVendorUploadedFiles">
                                                <el-upload
                                                    class="upload-demo"
                                                    action="#"
                                                    multiple
                                                    :id="'RequiredFiles_'+Document"
                                                    :ref="'RequiredFiles_'+Document"
                                                    :auto-upload="false">
                                                    <el-button slot="trigger" size="small" type="primary">Select file(s)</el-button>
                                                    <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload(Document)">Upload</el-button>
                                                    <div class="el-upload__tip" slot="tip">Any File Type Allow Max Size 3MB</div>
                                                </el-upload>
                                            </td>

                                            <td valign="middle" align="center" v-if="PEVendorUploadedFiles">
                                                <div v-for="uploadedFile in PEVendorUploadedFiles">
                                                    <a v-if="uploadedFile.required_doc_name == Document" :href="URL+uploadedFile.document_name" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> File {{ index+1 }} Download </a><br>
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


            <div id="RFIModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFIModal" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" v-if="RFIDataLoaded">
                        <div  class="modal-header">
                            <h4 class="modal-title text-ogeo">Request For Information <span style="color: black">(<span v-if="ViewModalInfo.company.rfq_prefix == ''">RfP-</span><span v-else>{{ ViewModalInfo.company.rfq_prefix }}-</span>{{ ViewModalInfo.quotation_group_id }} / <span v-if="RFIDetails[0].company.pe_prefix == ''">PE-</span><span v-else>{{ RFIDetails[0].company.pe_prefix }}-</span>{{ RFIDetails[0].purchase_enquiry_group_id }}-{{ RFIDetails[0].purchase_enquiry_ingroup_id }})</span></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="chat-rbox" style="border: 1px dashed gray; border-radius: 10px; max-height: 450px; overflow-y: auto;">
                                        <ul class="chat-list">
                                            
                                            <!--chat Row -->
                                            <template v-if="RFIDetails[1].length > 0" v-for="message in RFIDetails[1]">
                                                <li v-if="message.vendor_id != currentVendorDetails[0].id">
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - <i v-if="message.reply_id">(In Reponse to ID#: {{ message.reply_id }}) -</i> By {{ message.user_type }}</h5>
                                                        <div class="box bg-light-info" >{{ message.message }}</div>
                                                    </div>
                                                    <div class="chat-time" style="min-width: 10%">{{ message.created_at }}</div>
                                                </li>
                                                <li v-else class="reverse">
                                                    <div class="chat-time">{{ message.created_at }}</div>
                                                    <div class="chat-content">
                                                        <h5>ID# {{ message.id }} - <i v-if="message.reply_id">(In Reponse to ID#: {{ message.reply_id }}) -</i> By {{ message.user_type }}</h5>
                                                        <div class="box bg-light-ogeo" style="min-width: 10%">{{ message.message }}</div>
                                                    </div>
                                                </li>

                                            </template>
                                        
                                        </ul>
                                    </div>
                                    <div v-if="(RFPEndDate > CurrentDateTime && !ViewModalInfo.status.includes('cancelled') && !ViewModalInfo.trackers[0].status.includes('Submitted'))" class="card-body b-t">
                                        <div class="row">
                                            <div v-if="RFIDetails[1].length > 0" class="col-12">
                                                <div v-if="moment(ViewModalInfo.rfi_start_date) < moment() || moment() > moment(ViewModalInfo.rfi_end_date)" class="grid-content">
                                                    <label><b>Select Message To Reply</b></label></span>
                                                    <el-select filterable style="width: 100%; padding: 0px;" v-model="RFIData.RFIMessageID" placeholder="Select Message ID">   
                                                        <el-option v-for="message in RFIDetails[1]" :key="message.id" :label="'ID#: '+message.id" :value="message.id"></el-option>
                                                    </el-select>
                                                </div>
                                            </div>
                                            <div v-else class="col-12">
                                                <h2 align="center">No RFIs Available</h2>
                                            </div>
                                            <div v-if="moment(ViewModalInfo.rfi_start_date) < moment() || moment() > moment(ViewModalInfo.rfi_end_date)" class="col-12">
                                                <br>
                                                <el-input
                                                    type="textarea"
                                                    rows="6"
                                                    placeholder="Enter Your Request For Information..."
                                                    v-model="RFIData.RFImessage">
                                                </el-input>
                                            </div>
                                            <div v-if="moment(ViewModalInfo.rfi_start_date) < moment() || moment() > moment(ViewModalInfo.rfi_end_date)" class="col-lg-12">
                                                <br>
                                                <button type="button" class="btn btn-block btn-success" @click="SubmitRFI">Raise RFI</button>
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

            <!-- <div id="RFIModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFIModal" aria-hidden="true" style="display: none;">
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
                            <template v-if="QuotationSubmitStatus != 'Quotation Submitted'">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <hr>
                                        <h4>Submit New RFI</h4>
                                        <input
                                            class="form-control"
                                            type="textarea"
                                            rows="6"
                                            placeholder="Enter Your Request For Information..."
                                            v-model="RFIData.RFImessage">
                                        </input>
                                    </div>
                                    <div class="col-lg-12">
                                        <br>
                                    </div>
                                    <div class="col-lg-12">
                                        <button type="button" class="btn btn-block btn-success" @click="SubmitRFI">Submit RFI</button>
                                    </div>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </div> -->

        </div>
    </div>

</template>

<script>

	import validateJs from 'validate.js';

	export default {
		name: "quotation-requests",
		data() {
			return {
                pickerOptions1: {
                  disabledDate(time) {
                    return time.getTime() < Date.now();
                  },
                  shortcuts: [{
                    text: 'Tomorrow',
                    onClick(picker) {
                      picker.$emit('pick', new Date());
                    }
                  }, {
                    text: '7 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '30 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 30);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '45 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 45);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '60 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 60);
                      picker.$emit('pick', date);
                    }
                  }]
                },
                URL: '/uploads/PEVendorUploadsRequiredDocs/',
				DataTable: "",
                VolDisDetails: [],
                AddVolDis: {
                    FromTotalValue: 1,
                    ToTotalValue: "",
                    Percentage: "",
                },
				PEDataTable: "",
                AbidedToCompanyRules: false,
                QuotationDetailsModalClosed: true,
                ViewRfPModalInfo: {},
                viewRfIDataLoaded: false,
                RFIEndDate: "",
                CurrentDate: "",
                RFIsRaised: 0,
                QuotationLinesTable: "",
                viewDataLoaded: false,
                RequiredDocsDataLoaded: false,
                RFIDataLoaded: false,
                ViewModalInfo: {},
                QuotationResponse: [],
                RFIDetails: [],
                QuotationSubmitStatus: "",
                RequiredDocsDetails: [],
                RequiredFilesId: "",
                currentVendorDetails: {},
                RequiredRFIId: "",
                PEVendorUploadedId: "",
                RFIData: {
                    RFIMessageID: "",
                    RFImessage: "",
                    VendorId: "",
                    CompanyId: "",
                    QuotationId: "",
                    QuotationType: "",
                    PEId: "",
                },
                QuotationResponseRules: {
                    PECompany: { 
                        presence: true,
                    },
                    QuotationID: { 
                        presence: true,
                    },
                    PELineID: { 
                        presence: true,
                    },
                    PELineUnitPrice: { 
                        presence: true,
                        // presence: {  
                        //     allowEmpty: false 
                        // },
                    },
                    PELineCurrency: { 
                        presence: true,
                        length: {
                            minimum: 3,
                            message: "Select Currency From the List Only!"
                        }
                    },
                    PELineLeadDays: { 
                        presence: true,
                    },
                    PELineNote: { 
                        presence: true, 
                    },
                    QuotationValidityDate: {
                        presence: {  
                            allowEmpty: false 
                        },
                    }
                },
                QuotationResponseErrors: null,
                PEVendorUploadedFiles: null,
                QuotationValidityDate: "",
			}
		},
		methods: {
            CheckAdvPercentage(PEline){
                let PercentageAmount = $('#PEline_'+PEline+'_advanced_percentage').val();
                if(PercentageAmount > 100 || PercentageAmount < 0 ){
                    $('#PEline_'+PEline+'_advanced_percentage').val('');
                    Swal('Percentage Entry Error', 'Percentage Can not exceed 100 or be negative value', 'warning');
                }
            },
            UpdatePELinePrice(PEId, rowIndex, ItemId){

                if($('#PEline_'+PEId+'_unit_price').val() < 0){
                    Swal('Negative Values Not Allowed', '', 'warning');
                    $('#PEline_'+PEId+'_unit_price').val('');
                }

                //check if the update amount is a service or materials
                if(ItemId == null){
                    var table = this.QuotationLinesTable;
                    var unitRate = $('#PEline_'+PEId+'_unit_price').val();
                    var quantity = table.cell({row: rowIndex, column: 5}).data();
                    var NewPrice = quantity * unitRate;
                    table.cell({row: rowIndex, column: 10}).data(this.formatPrice(NewPrice));
                } else {
                    var table = this.QuotationLinesTable;
                    var unitRate = $('#PEline_'+PEId+'_unit_price').val();
                    var quantity = table.cell({row: rowIndex, column: 5}).data();
                    var NewPrice = quantity * unitRate;
                    table.cell({row: rowIndex, column: 10}).data(this.formatPrice(NewPrice));
                }
                
            },
            checkLeadDays(PEId){
                if($('#PEline_'+PEId+'_lead_days').val() < 0){
                    Swal('Negative Values Not Allowed', '', 'warning');
                    $('#PEline_'+PEId+'_lead_days').val('');
                }
            },
            showAllRFIModal(recordId, RecordType) {
                this.RFIData.PEId = recordId;
                this.RFIData.QuotationType = RecordType;
                this.RFIDetails = [];        

                axios.post('/api/vendors/data/get_all_pe_rfi_details', {PEId: recordId, QuotationType: RecordType})
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
            SubmitPrices(){

                if(this.AbidedToCompanyRules){

                    if(this.ViewModalInfo.quotation_for == "PE"){

                        let Check1 = true;
                        let Check2 = true;
                        let Check3 = true;
                        let Check4 = true;
                        let Check5 = true;
                        let OKToContinue = false;
                        let EmptyEntries = false;
                        let LeadDayMissing = false;
                        let LeadDayMissingID = "";
                        let AdvancedPaymentMissing = false;
                        let AdvancedPaymentMissingID = "";
                        let AllPricesNotAvailable = false;

                        //Reset Previous Responses
                        this.QuotationResponse = [];

                        const self = this;

                        $.each(this.ViewModalInfo.purchase_enquiries_all_active, function(index, val) {

                            self.QuotationResponse.push({
                                PECompany: parseInt(val.company_id),
                                QuotationID: parseInt(val.pivot.quotation_id),
                                PELineID: parseInt(val.id),
                                PEFullID: val.purchase_enquiry_group_id+'-'+val.purchase_enquiry_ingroup_id,
                                PELineUnitPrice: $('#PEline_'+val.id+'_unit_price').val(),
                                PELinePrice: (parseFloat($('#PEline_'+val.id+'_quantity').text()) * parseFloat($('#PEline_'+val.id+'_unit_price').val())),
                                PELineCurrency: $('#PEline_'+val.id+'_currency').val(),
                                PELineLeadDays: parseInt($('#PEline_'+val.id+'_lead_days').val()),
                                AdvancedPayment: $('#PEline_'+val.id+'_advanced_percentage').val(),
                                PELineNote: $('#PEline_'+val.id+'_note').val(),
                                PEUploadedFiles: $('#PEline_'+val.id+'_filesUpload').val(),
                                QuotationValidityDate: self.QuotationValidityDate,
                                QuotationType: self.ViewModalInfo.quotation_for,
                                PELineItemID: val.item_id,
                            });
                           
                        });

                        console.log(self.QuotationResponse);

                        //Check Completeness of the Prices and PE notes
                        $.each(self.QuotationResponse, function(index, val) {
                            if(val.PELineUnitPrice == "" && val.PELineNote == ""){
                                EmptyEntries = true;
                            }

                            //check leaddays for price entered
                            if((val.PELineUnitPrice != "" && val.PELineLeadDays == "") || (val.PELineUnitPrice != "" && isNaN(val.PELineLeadDays))){
                                LeadDayMissing = true;
                                LeadDayMissingID = val.PEFullID;
                            }

                            //check AdvancedPayment for price entered
                            if(val.PELineUnitPrice != "" && val.AdvancedPayment == ""){
                                AdvancedPaymentMissing = true;
                                AdvancedPaymentMissingID = val.PEFullID;
                            }


                        });

                        function hasAtleastOnePrice(x) {
                            return x.PELineUnitPrice == '';
                        }
            
                        //check if atleast one line submitted
                        if(self.QuotationResponse.every(hasAtleastOnePrice)){
                            AllPricesNotAvailable = true;
                        }


                        //check the completness of the data
                        const constraints = self.QuotationResponseRules;
                        self.QuotationResponseErrors = null;
                        $.each(self.QuotationResponse, function(index, QuotationResponseSingle) {
                            //this.QuotationResponseErrors = validateJs(QuotationResponseSingle, constraints);
                            console.log(EmptyEntries);
                            console.log(LeadDayMissing);
                            console.log(AdvancedPaymentMissing);
                            console.log(AllPricesNotAvailable);


                            //check if atleast one line submitted
                            if(AllPricesNotAvailable){
                                Swal({ 
                                    text: 'To Submit a quotation a unit rate for at least one line must be provided.',
                                    title: 'Price Required',
                                    type: 'warning'
                                });
                                Check5 = false;
                                return false;
                            }

                            if(LeadDayMissing){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Lead Time for Submitted PE#: '+ LeadDayMissingID +'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check1 = false;
                                return false;
                            }


                            if(AdvancedPaymentMissing){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Advance Payment For Submitted PE#: '+ AdvancedPaymentMissingID +'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check4 = false;
                                return false;
                            }

                            if (QuotationResponseSingle.PELineUnitPrice != '' && QuotationResponseSingle.PEUploadedFiles == "DocsUploadRequired"){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>1. File Upload for Purchase Enquiry ID # '+QuotationResponseSingle.PEFullID+'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check2 = false;
                                return false;
                            }

                            
                            
                            
                        });

                        //Check if user enter validaty date
                        if (self.QuotationValidityDate == ""){
                            Swal({ 
                                html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Select A Quotation Validity Date</b></div>',
                                title: 'Required Data Missing',
                                type: 'warning'
                            });
                            Check3 = false;
                            return false;
                        }


                        if(Check1 && Check2 && Check3 && Check4 && Check5){
                            OKToContinue = true;
                        }


                        if(OKToContinue){
                            if(EmptyEntries) {

                                Swal({
                                  title: 'Some Prices Are Not Submitted',
                                  text: "You have some prices left empty, would you like to proceed? these line items will not be submitted. If those lines are to be submitted as free item you should enter Zeros for those lines. This submission is final and cannot be changed or edited in the future.",
                                  type: 'warning',
                                  showCancelButton: true,
                                  confirmButtonColor: '#3085d6',
                                  cancelButtonColor: '#d33',
                                  confirmButtonText: 'Yes, Submit',
                                  cancelButtonText: 'No'
                                }).then((result) => {
                                    
                                    if (result.value) {
                                        // We are here after agreeing to submit some empty prices
                                        axios.post('/api/vendors/bidding_management/quotation_reponse_submission', self.QuotationResponse)
                                            .then((response) => {

                                                this.QuotationSubmitStatus = "Quoation Submitted";
                                                self.DataTable.ajax.reload( null, false );
                                                $('#QuotationDetailsModal').modal('toggle');

                                                Swal({ 
                                                    type: response.data.messageType, 
                                                    title: response.data.messageTitle, 
                                                    text: response.data.message,
                                                    showConfirmButton: true,
                                                    timer: 15000
                                                });


                                            })

                                    }
                                    
                                    
                                    
                                    
                                    
                                });
                            } else {

                                Swal({
                                    title: 'Confirm Submission!' ,
                                    text: "This submission is considered as your Final and Best Offer (FABO). This submission is final and cannot be changed or edited in the future.",
                                    type: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'Yes, Submit',
                                    cancelButtonText: 'No'
                                    }).then((result) => {
                                        
                                        if (result.value) {
                                            // We are after filling all the prices from the first time.
                                            axios.post('/api/vendors/bidding_management/quotation_reponse_submission', self.QuotationResponse)
                                                .then((response) => {

                                                    this.QuotationSubmitStatus = "Quoation Submitted";
                                                    self.DataTable.ajax.reload( null, false );
                                                    $('#QuotationDetailsModal').modal('toggle');
                                                    
                                                    Swal({ 
                                                        type: response.data.messageType, 
                                                        title: response.data.messageTitle, 
                                                        text: response.data.message,
                                                        showConfirmButton: true,
                                                        timer: 15000
                                                    });
                                                });
                                        }

                                        

                                });

                            }
                        }
                    }

                    if(this.ViewModalInfo.quotation_for == "RC"){

                        let Check1 = true;
                        let Check2 = true;
                        let Check3 = true;
                        let Check4 = true;
                        let Check5 = true;
                        let OKToContinue = false;
                        let EmptyEntries = false;
                        let LeadDayMissing = false;
                        let LeadDayMissingID = "";
                        let AdvancedPaymentMissing = false;
                        let AdvancedPaymentMissingID = "";
                        let AllPricesNotAvailable = false;

                        //Reset Previous Responses
                        this.QuotationResponse = [];

                        const self = this;

                        $.each(this.ViewModalInfo.rate_contract_requests, function(index, val) {

                            self.QuotationResponse.push({
                                PECompany: parseInt(val.company_id),
                                QuotationID: parseInt(val.pivot.quotation_id),
                                PELineID: parseInt(val.id),
                                PEFullID: val.purchase_enquiry_group_id+'-'+val.purchase_enquiry_ingroup_id,
                                PELineUnitPrice: $('#PEline_'+val.id+'_unit_price').val(),
                                PELinePrice: (parseFloat($('#PEline_'+val.id+'_quantity').text()) * parseFloat($('#PEline_'+val.id+'_unit_price').val())),
                                PELineCurrency: $('#PEline_'+val.id+'_currency').val(),
                                PELineLeadDays: parseInt($('#PEline_'+val.id+'_lead_days').val()),
                                AdvancedPayment: $('#PEline_'+val.id+'_advanced_percentage').val(),
                                PELineNote: $('#PEline_'+val.id+'_note').val(),
                                PEUploadedFiles: $('#PEline_'+val.id+'_filesUpload').val(),
                                QuotationValidityDate: self.QuotationValidityDate,
                                QuotationType: self.ViewModalInfo.quotation_for,
                                VolDisDetails: self.VolDisDetails,
                                PELineItemID: val.item_id,

                            });
                           
                        });

                        console.log(self.QuotationResponse);

                        //Check Completeness of the Prices and PE notes
                        $.each(self.QuotationResponse, function(index, val) {
                            if(val.PELineUnitPrice == "" && val.PELineNote == ""){
                                EmptyEntries = true;
                            }

                            //check leaddays for price entered
                            if((val.PELineUnitPrice != "" && val.PELineLeadDays == "") || (val.PELineUnitPrice != "" && isNaN(val.PELineLeadDays))){
                                LeadDayMissing = true;
                                LeadDayMissingID = val.PEFullID;
                            }

                            //check AdvancedPayment for price entered
                            if(val.PELineUnitPrice != "" && val.AdvancedPayment == ""){
                                AdvancedPaymentMissing = true;
                                AdvancedPaymentMissingID = val.PEFullID;
                            }


                        });

                        function hasAtleastOnePrice(x) {
                            return x.PELineUnitPrice == '';
                        }
            
                        //check if atleast one line submitted
                        if(self.QuotationResponse.every(hasAtleastOnePrice)){
                            AllPricesNotAvailable = true;
                        }


                        //check the completness of the data
                        const constraints = self.QuotationResponseRules;
                        self.QuotationResponseErrors = null;
                        $.each(self.QuotationResponse, function(index, QuotationResponseSingle) {
                            //this.QuotationResponseErrors = validateJs(QuotationResponseSingle, constraints);
                            console.log(EmptyEntries);
                            console.log(LeadDayMissing);
                            console.log(AdvancedPaymentMissing);
                            console.log(AllPricesNotAvailable);


                            //check if atleast one line submitted
                            if(AllPricesNotAvailable){
                                Swal({ 
                                    text: 'To Submit a quotation a price for at least one line must be provided.',
                                    title: 'Price Required',
                                    type: 'warning'
                                });
                                Check5 = false;
                                return false;
                            }

                            if(LeadDayMissing){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Lead Days For Submitted RC#: '+ LeadDayMissingID +'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check1 = false;
                                return false;
                            }


                            if(AdvancedPaymentMissing){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Advance Payment For Submitted RC#: '+ AdvancedPaymentMissingID +'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check4 = false;
                                return false;
                            }

                            if (QuotationResponseSingle.PELineUnitPrice != '' && QuotationResponseSingle.PEUploadedFiles == "DocsUploadRequired"){
                                Swal({ 
                                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>1. File Upload for Rate Contract ID # '+QuotationResponseSingle.PELineID+'</b></div>',
                                    title: 'Required Data Missing',
                                    type: 'warning'
                                });
                                Check2 = false;
                                return false;
                            }

                            
                            
                            
                        });

                        //Check if user enter validaty date
                        if (self.QuotationValidityDate == ""){
                            Swal({ 
                                html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Select A Quotation Validity Date</b></div>',
                                title: 'Required Data Missing',
                                type: 'warning'
                            });
                            Check3 = false;
                            return false;
                        }


                        if(Check1 && Check2 && Check3 && Check4 && Check5){
                            OKToContinue = true;
                        }


                        if(OKToContinue){
                            if(EmptyEntries) {

                                Swal({
                                  title: "Some Prices Are Not Submitted",
                                  text: "You have some prices left empty, would you like to proceed? these line items will not be submitted. If those lines are to be submitted as free item you should enter Zeros for those lines. This submission is final and cannot be changed or edited in the future.",
                                  type: 'warning',
                                  showCancelButton: true,
                                  confirmButtonColor: '#3085d6',
                                  cancelButtonColor: '#d33',
                                  confirmButtonText: 'Yes, Submit',
                                  cancelButtonText: 'No'
                                }).then((result) => {
                                    
                                    if (result.value) {
                                        // We are here after agreeing to submit some empty prices
                                        axios.post('/api/vendors/bidding_management/quotation_reponse_submission', self.QuotationResponse)
                                            .then((response) => {

                                                this.QuotationSubmitStatus = "Quoation Submitted";
                                                self.DataTable.ajax.reload( null, false );
                                                $('#QuotationDetailsModal').modal('toggle');

                                                Swal({ 
                                                    type: response.data.messageType, 
                                                    title: response.data.messageTitle, 
                                                    text: response.data.message,
                                                    showConfirmButton: true,
                                                    timer: 15000
                                                });

                                            })

                                    }
                                    
                                    
                                    
                                });
                            } else {

                                Swal({
                                    title: 'Confirm Submission!' ,
                                    text: "This submission is considered as your Final and Best Offer (FABO). This submission is final and cannot be changed or edited in the future.",
                                    type: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'Yes, Submit',
                                    cancelButtonText: 'No'
                                    }).then((result) => {
                                        
                                        if (result.value) {
                                            // We are after filling all the prices from the first time.
                                            axios.post('/api/vendors/bidding_management/quotation_reponse_submission', self.QuotationResponse)
                                                .then((response) => {

                                                    this.QuotationSubmitStatus = "Quoation Submitted";
                                                    self.DataTable.ajax.reload( null, false );
                                                    $('#QuotationDetailsModal').modal('toggle');
                                                    
                                                    Swal({ 
                                                        type: response.data.messageType, 
                                                        title: response.data.messageTitle, 
                                                        text: response.data.message,
                                                        showConfirmButton: true,
                                                        timer: 15000
                                                    });
                                                });
                                        }
                                        

                                });

                            }
                        }

                    }

                }
                

            },

            ShowSubmissionErrors() {

                Swal({ 
                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that all the required data are completed:  <br><b>1. Prices </b><br><b>2. Currencies </b><br><b>3. Required Documents</b></div>',
                    title: 'Required Data Missing',
                    type: 'warning'
                });

            },
            submitUpload(RequiredFile) {

                if(this.ViewModalInfo.quotation_for == "PE"){
                    let self = this;
                    console.log(self.PEVendorUploadedId);
                    function isRequiredPE(PE){
                        return PE.id == self.PEVendorUploadedId;
                    }
                    let PE = this.ViewModalInfo.purchase_enquiries_all_active.find(isRequiredPE);

                    let formData = new FormData();

                    if(!this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[0]){
                        Swal('Document Required', 'You must select at least one document to upload', 'warning')
                        return false;
                    }

                    for(var i = 0; i < this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles.length; i++ ){
                        let file = this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[i].raw;
                        formData.append('RequiredFiles['+i+']', file);
                        PE.uploaded_docs.push('FileName');
                    }

                    formData.append('PEId', JSON.stringify(this.RequiredFilesId));
                    formData.append('CompanyId', JSON.stringify(this.ViewModalInfo.company_id));
                    formData.append('QuotationId', JSON.stringify(this.ViewModalInfo.id));
                    formData.append('QuotationType', JSON.stringify(this.ViewModalInfo.quotation_for));
                    formData.append('RequiredDocsDetails', JSON.stringify(this.RequiredDocsDetails));
                    
                    axios.post( '/api/vendors/bidding_management/upload_required_files', formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        })
                        .then((response) => {

                            //mark docuement uploadfield as "NoUploadsRequired"
                            $('#PEline_'+this.PEVendorUploadedId+'_filesUpload').val('NoUploadsRequired');
                            //add the 
                            
                            

                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });



                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (RequiredFilesUpload)', 'error');
                        });



                    $('#RequiredDocsModal').modal('toggle');
                }

                if(this.ViewModalInfo.quotation_for == "RC"){

                    let self = this;
                    console.log(self.PEVendorUploadedId);
                    function isRequiredPE(PE){
                        return PE.id == self.PEVendorUploadedId;
                    }
                    let PE = this.ViewModalInfo.rate_contract_requests.find(isRequiredPE);

                    let formData = new FormData();

                    if(!this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[0]){
                        Swal('Document Required', 'You must select at least one document to upload', 'warning')
                        return false;
                    }

                    for(var i = 0; i < this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles.length; i++ ){
                        let file = this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[i].raw;
                        formData.append('RequiredFiles['+i+']', file);
                        PE.uploaded_docs.push('FileName');
                    }

                    formData.append('PEId', JSON.stringify(this.RequiredFilesId));
                    formData.append('CompanyId', JSON.stringify(this.ViewModalInfo.company_id));
                    formData.append('QuotationId', JSON.stringify(this.ViewModalInfo.id));
                    formData.append('QuotationType', JSON.stringify(this.ViewModalInfo.quotation_for));
                    formData.append('RequiredDocsDetails', JSON.stringify(this.RequiredDocsDetails));
                    
                    axios.post( '/api/vendors/bidding_management/upload_required_files', formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        })
                        .then((response) => {

                            //mark docuement uploadfield as "NoUploadsRequired"
                            $('#PEline_'+this.PEVendorUploadedId+'_filesUpload').val('NoUploadsRequired');
                            //add the 
                            
                            

                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });



                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (RequiredFilesUpload)', 'error');
                        });



                    $('#RequiredDocsModal').modal('toggle');

                }



                
            },
            showRequiredDocsModal(recordId, DocName) {
                
                //get the list of document required for the selected PE
                if(this.ViewModalInfo.quotation_for == "PE"){

                    function isRequiredPE(PE){
                        return PE.id == recordId;
                    }

                    //reset previous values and uploaded files
                    this.RequiredFilesId = "";
                    this.RequiredDocsDetails = [];

                    //store the selected PE Id
                    this.RequiredFilesId = recordId;

                    let PE = this.ViewModalInfo.purchase_enquiries_all_active.find(isRequiredPE);
                    console.log(PE);
                    this.RequiredDocsDetails = PE.required_documents.split(",");
                    this.PEVendorUploadedFiles = PE.uploaded_docs;
                    this.PEVendorUploadedId = PE.id;
                    //Show the modal
                    this.RequiredDocsDataLoaded = true;
                    $('#RequiredDocsModal').modal('toggle');

                    this.RequiredDocsDataLoaded = true;
                }
                if(this.ViewModalInfo.quotation_for == "RC"){

                    function isRequiredPE(PE){
                        return PE.id == recordId;
                    }

                    //reset previous values and uploaded files
                    this.RequiredFilesId = "";
                    this.RequiredDocsDetails = [];

                    //store the selected PE Id
                    this.RequiredFilesId = recordId;
                    

                    let PE = this.ViewModalInfo.rate_contract_requests.find(isRequiredPE);
                    this.RequiredDocsDetails = PE.required_documents.split(",");
                    this.PEVendorUploadedFiles = PE.uploaded_docs;
                    this.PEVendorUploadedId = PE.id;
                     //Show the modal
                    this.RequiredDocsDataLoaded = true;
                    $('#RequiredDocsModal').modal('toggle');

                    this.RequiredDocsDataLoaded = true;
                }
                

               

            },
            SubmitRFI(){
                //check if empty
                if(this.RFIData.RFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                } else {
                    axios.post( '/api/vendors/bidding_management/create_rfi_message', this.RFIData)
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
            showRFIModal(recordId) {

                console.log(this.ViewModalInfo.quotation_for);
                this.RFIDetails = [];
                this.RFIData.PEId = recordId;
                // this.RFIData.QuotationType = this.ViewModalInfo.quotation_for;
                // this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                // this.RFIData.QuotationId = this.ViewModalInfo.id;
                axios.post('/api/vendors/data/get_pe_rfi_details', {PEId: recordId, CompanyId: this.RFIData.CompanyId, QuotationType: this.RFIData.QuotationType})
                    .then((response) => {
                        this.RFIDetails = response.data;
                        this.RFIDataLoaded = true;

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
            showViewModal(recordId, recordType){
                let self = this;
                this.ViewModalInfo = {};
                axios.post('/api/vendors/data/get_quotation_details_record_details', {QuotationId: recordId, QuotationType: recordType})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        
                        console.log(this.ViewModalInfo);

                        this.RFIData.QuotationType = this.ViewModalInfo.quotation_for;
                        this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                        this.RFIData.QuotationId = this.ViewModalInfo.id;

                        this.RFPEndDate = moment(this.ViewModalInfo.rfi_end_date, 'YYYY.MM.DD HH:mm:ss');
                        this.CurrentDateTime = moment();

                        this.viewRfIDataLoaded = true

                        $('#RFPInformationModal').modal('toggle');

                        // self.VendorsWithBids = 0;
                        // $.each(this.ViewRfPModalInfo.vendors, function(index, vendor) {
                        //     $.each(vendor.quotation_responses, function(key, response) {
                        //         if(response.price != null){
                        //             self.VendorsWithBids = self.VendorsWithBids + 1;
                        //             return false;
                        //         }
                        //     });
                        // });

                        // self.ConfirmedParticipants = 0;
                        // $.each(this.ViewRfPModalInfo.trackers, function(index, track) {
                        //     if(track.status == "Bid Non-Participation Confirmed" || track.status == "Request for Proposals Not Viewed"){
                        //         self.ConfirmedParticipants = self.ConfirmedParticipants + 1;
                        //         return false;
                        //     }
                        // });
                        // self.ConfirmedParticipants = this.ViewRfPModalInfo.vendors.length - self.ConfirmedParticipants;



                        // self.RFIsRaised = 0;
                        // $.each(this.ViewRfPModalInfo.rfis, function(index, rfi) {
                        //     if(rfi.user_type == "Vendor"){
                        //         self.RFIsRaised = self.RFIsRaised + 1;
                        //     }
                        // });
                        

                        this.$nextTick(() => {
                            var table = $('#RfPPEsInfo').DataTable({
                                colReorder: true,
                                bDestroy: true,
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

                            const self = this;


                            $('tbody', this.$refs.PETable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $(this).data('peid');
                                var VendorID = $(this).data('vendorid');
                                console.log(RecordID, VendorID);
                                self.showRequiredDocsModal(RecordID, VendorID);
                            });

                            $('tbody', this.$refs.PETable).on('click', '.rfi-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $(this).data('recordid');
                                var RecordType = $(this).data('recordtype');
                                self.showAllRFIModal(RecordID, RecordType);
                            });

                        });

                    })

                this.viewRfIDataLoaded = false; 

            },
			showEditModal(recordId){

                this.VolDisDetails = [];
                this.AddVolDis.FromTotalValue = 1;
                this.ViewModalInfo = {};
                this.QuotationSubmitStatus = "";
                axios.post('/api/vendors/data/get_quotation_details_record_details', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        
                        console.log(this.ViewModalInfo);
                        this.RFIData.QuotationType = this.ViewModalInfo.quotation_for;
                        this.RFIData.CompanyId = this.ViewModalInfo.company_id;
                        this.RFIData.QuotationId = this.ViewModalInfo.id;

                        this.RFPEndDate = moment(this.ViewModalInfo.rfi_end_date, 'YYYY.MM.DD HH:mm:ss');
                        this.CurrentDateTime = moment();

                        this.QuotationSubmitStatus = this.ViewModalInfo.trackers[0].status;

                        this.viewDataLoaded = true;

                        $('#QuotationDetailsModal').modal('toggle');

                        this.$nextTick(() => {
	                        var table = $('#QuotationRequestsLines').DataTable({
				                responsive: false,
                                bDestroy: true,
				                dom: '<"html5buttons">Brfgtip',
				                pageLength: 10,
                                columnDefs: [
                                    { "width": "100px", "targets": "_all" }
                                ],
				                lengthMenu: [
				                    [ 10, 25, 50, 100, 500, 1000, -1 ],
				                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
				                ],
				                order: [[ 1, "ASC" ]],
				                buttons: [
				                    { extend: 'pageLength', className: 'btn btn-success' },
				                    { extend: 'copy', className: 'btn btn-success' },
				                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
				                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
				                ],
				            }); 

                            const self = this;


                            $('tbody', this.$refs.PETable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $(this).data('peid');
                                var VendorID = $(this).data('vendorid');
                                console.log(RecordID, VendorID);
                                self.showRequiredDocsModal(RecordID, VendorID);
                            });

                            $('tbody', this.$refs.PETable).on('click', '.rfi-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $(this).data('recordid');
                                var RecordType = $(this).data('recordtype');
                                self.showAllRFIModal(RecordID, RecordType);
                            });

                            
                            // $('tbody', this.$refs.PETable).on('click', '.required-docs-placeholder', function(){
                            //     var $this = $(this);
                            //     var RecordID1 = $(this).data('peid');
                            //     console.log($(this));
                            //     var RecordID = $this.parent().parent().find(">:first-child").text();
                            //     //Check if Id has prefix and resolve
                            //     if (RecordID.includes("-")){
                            //         RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                            //     }
                            //     self.showRequiredDocsModal(RecordID);
                            // });


                            // $('tbody', this.$refs.PETable).on('click', '.rfi-placeholder', function(){
                            //     var $this = $(this);
                            //     var RecordID = $this.parent().parent().find(">:first-child").text();
                            //     //Check if Id has prefix and resolve
                            //     if (RecordID.includes("-")){
                            //         RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                            //     }
                            //     self.showRFIModal(RecordID);
                            // });

                            self.QuotationLinesTable = table;

	                    });

                    })


                this.viewDataLoaded = false;
                
            },
            AddVolumnDiscountLine(){

                if( parseFloat(this.AddVolDis.FromTotalValue) == "" || parseFloat(this.AddVolDis.ToTotalValue) == "" || parseFloat(this.AddVolDis.Percentage) == ""){
                    Swal('Missing Values', 'All values are required to add volume discount', 'warning');
                    return false;
                }

                /* Get the value of the last records and compare it's value */
                if(parseFloat(this.AddVolDis.ToTotalValue) <= parseFloat(this.AddVolDis.FromTotalValue)){
                    Swal('Values Entry Error', 'From Value Can Not Equal or Exceed To Value', 'warning');
                    return false;
                }

                if(parseFloat(this.AddVolDis.Percentage) > 100 || parseFloat(this.AddVolDis.Percentage) < 0 ){
                    Swal('Percentage Entry Error', 'Percentage Can not exceed 100% or be negative value', 'warning');
                    return false;
                }

                /* Get the value of the last records and compare it's value */
                if(this.VolDisDetails.length > 0){              
                    if(parseFloat(this.AddVolDis.FromTotalValue) <= parseFloat(this.VolDisDetails[this.VolDisDetails.length-1].ToTotalValue)){
                        Swal('From Values Entry Error', 'From value should be greater than '+ this.VolDisDetails[this.VolDisDetails.length-1].ToTotalValue, 'warning');
                        return false;
                    }
                }

                if(this.VolDisDetails.length > 0){ 
                    if(parseFloat(this.VolDisDetails[this.VolDisDetails.length-1].Percentage) == 100){
                        Swal('Percentage Values Entry Maxed', 'Lastest Entry Has the maximum percentage possible, no records can be added.', 'warning');
                            return false;
                    }
                }

                if(this.VolDisDetails.length > 0){              
                    if(parseFloat(this.AddVolDis.Percentage) <= parseFloat(this.VolDisDetails[this.VolDisDetails.length-1].Percentage)){
                        Swal('Percentage Values Entry Error', 'Percentage value should be greater than '+ this.VolDisDetails[this.VolDisDetails.length-1].Percentage, 'warning');
                        return false;
                    }
                }

                let self = this;
                this.VolDisDetails.push(Object.assign({}, self.AddVolDis));

                this.AddVolDis.FromTotalValue = parseInt(this.AddVolDis.ToTotalValue) + 1;
                this.AddVolDis.ToTotalValue = "";
                this.AddVolDis.Percentage = "";

            },
            RemoveVolumnDiscountLine(index){
                console.log(index);
                this.$delete(this.VolDisDetails, index);
                this.AddVolDis.FromTotalValue = this.VolDisDetails[this.VolDisDetails.length-1].ToTotalValue;
            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace(',', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }

		},
        computed: {
            currentVendor(){
                return this.$store.getters.currentVendor;
            }
        },
		mounted(){

            axios.get('/api/vendors/data/get_vendor_details')
                .then((response) => {
                    console.log(response.data);
                    self.currentVendorDetails = response.data;
                })


			const table = $('#QuotationRequests').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                bDestroy: true,
                ajax: 'http://' + window.location.host + '/api/vendors/data/get_vendor_quotations_list',
                columns: [
                    { data: 'rfp_full_id', name: 'rfp_full_id' },
                    { data: 'rfp_name', name: 'rfp_name' },
                    { data: 'company.name', name: 'company.name' },
                    { data: 'quotation_type', name: 'quotation_type' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'linesCount', name: 'linesCount' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'rfi_start_date', name: 'rfi_start_date' },
                    { data: 'rfi_end_date', name: 'rfi_end_date' },
                    { data: 'days_left', name: 'days_left' },
                    { data: 'vendor_status', name: 'vendor_status' },
                    { data: 'status', name: 'status' },
                    { data: 'updated_at', name: 'updated_at' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: -1 },
                    { responsivePriority: 2, targets: 1 },
                    { responsivePriority: 3, targets: -3 },
                    { responsivePriority: 4, targets: -4 },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsList' },
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

            const self = this;

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showEditModal(RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                var recordType = $(this).data('recordtype');
                self.showViewModal(RecordID, recordType);
            });

            self.DataTable = table;



            //on RequiredDocsModal close clear the files for each required docuement
            $('#RequiredDocsModal').on('hidden.bs.modal', function () {
                $.each(self.RequiredDocsDetails, function(index, Document) {
                    self.$refs['RequiredFiles_'+Document][0].clearFiles();
                });   
                self.PEVendorUploadedFiles = null;
            });


            //update view status of the qoutation
            $('#QuotationDetailsModal').on('shown.bs.modal', function() {
                if(self.QuotationSubmitStatus == "Request for Proposals Not Yet Viewed"){
                    axios.post('/api/vendors/bidding_management/mark_qoutation_as_viewed', {QuotationId: self.ViewModalInfo.id , CompanyId: self.ViewModalInfo.company_id })
                        .then((response) => {
                            //update the status and reload table
                            self.DataTable.ajax.reload( null, false );
                        })
                }
            });


            $('#QuotationDetailsModal').on('hidden.bs.modal', function () {
                this.QuotationDetailsModalClosed = true;
                //check if the user is seeing this for the first time and not submitting the prices
                if(self.QuotationSubmitStatus == "Request for Proposals Not Yet Viewed" || self.QuotationSubmitStatus == "Request for Proposals Viewed"){
                    Swal({
                      title: 'Will You Submit Prices For This Quotation?',
                      text: "This will notifiy the Quotation Manager if you are interested in submitting prices for this quotation.",
                      type: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Yes',
                      cancelButtonText: 'No'
                    }).then((result) => {

                        if (result.value) {
                            // We are here after agreeing to submit some empty prices
                            axios.post('/api/vendors/bidding_management/confirm_quotation_submission', {QuotationId: self.ViewModalInfo.id , CompanyId: self.ViewModalInfo.company_id, WillSubmit: true })
                                .then((response) => {
                                    self.DataTable.ajax.reload( null, false );
                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 15000
                                    });
                                    
                                })
                        }

                        if(result.dismiss == "cancel"){
                            axios.post('/api/vendors/bidding_management/confirm_quotation_submission', {QuotationId: self.ViewModalInfo.id , CompanyId: self.ViewModalInfo.company_id, WillSubmit: false })
                                .then((response) => {
                                    self.DataTable.ajax.reload( null, false );
                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 15000
                                    });
                                })
                        }

                        if(result.dismiss == "overlay"){
                            //do something when user clicks outside of the Swal
                        }
                        
                    });
                } else {

                    

                }
                
                
            });

			
		}
	}
</script>

<style>

    .numberCircle {
        position: relative;
        top: -45px;
        left: 10px;

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

    #RFPInformationModal .modal-dialog {
        min-width:90%;
    }

    #QuotationDetailsModal .modal-dialog {
        min-width:95%;
    }

    #RequiredDocsModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }
    
    #RFIModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    input[type='number'] {
        -moz-appearance:textfield;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }

</style>