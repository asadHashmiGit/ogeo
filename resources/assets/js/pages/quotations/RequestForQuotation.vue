<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Request For Proposal</h4>
                </div>
                <div class="card-body">
					<el-form :model="RFQDetails" class="demo-form-inline" :rules="rules" ref="ItemCreationForm">
                        
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="" prop="RequestType">
                                        <span slot="label"><b>Request For Proposal Category</b></span>
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                            <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2"><strong>Requests For Proposals</strong> can be raised to secure proposals from vendors for either Purchase Enquiries or for Rate Contracts (Volume Discount Goods Supply Master Agreement)</span>
                                            </span>
                                        </span>
                                        <el-select style="width: 100%; padding: 0px;" @change="GetRCsListFromRequestType" v-model="RFQDetails.RequestType" placeholder="">
                                            <el-option label="Purchase Enquiry Requests" value="PE" selected></el-option>  
                                            <el-option label="Rate Contract Requests" value="RC"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                            
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="" prop="ProjectId">
                                        <span slot="label"><b>Select Set-up Name</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" @change="GetPEsRCsListFromProject" v-model="RFQDetails.ProjectId" placeholder="Select Set-up Name">
                                            
                                            <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            
                            
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="" prop="RFQType">
                                        <span slot="label"><b>Select Request for Proposals Type</b></span>
                                        
                                        <el-select style="width: 100%; padding: 0px;" @change='GetPEsRCsList' v-model="RFQDetails.RFQType" placeholder="Select Request for Proposals Type">
                                            <el-option label="Materials" value="Materials"></el-option>  
                                            <el-option label="Service" value="Service"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                        </div>


                        <div class="row" >
                            <div class="col-lg-12">
                                <div class="col-lg-12 p-l-0 p-r-0 p-t-10 b-all" id="PEMatSelCol" v-if="RFQDetails.RFQType == 'Materials' && RFQDetails.RequestType == 'PE'" style="display: none; min-height: 275px; max-height: 600px; overflow-y: auto; overflow-x: hidden;">

                                    <!-- Show Loader -->
                                    <div align="center" v-if="RfPRecordsLoading">
                                        <h2>Gathering Data...</h2>
                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                    </div>
                                    <div class="row">
                                        <div style="display: flex; align-items: stretch; width: 95%" v-for="(PurchaseEnquiry, key) in RequestForProposalsList" class="col-lg-6 ">
                                          
                                            <div style="cursor: pointer; margin-bottom: 7px" @click="selectedItem(PurchaseEnquiry.id)" :id="'RfPEnquiry_Id_'+PurchaseEnquiry.id" class="card card-body">
                                                <div class="row">
                                                    <div class="col-lg-2 text-center">
                                                        <img v-if="PurchaseEnquiry.item.field_1 != '' && PurchaseEnquiry.item.field_1 != null || PurchaseEnquiry.enquiry_from_item_master == 'Yes'" :src="'/uploads/ItemMasterPictures/'+PurchaseEnquiry.item.picture" class="img-rounded img-responsive">
                                                        <img v-else :src="'/uploads/images/'+PurchaseEnquiry.p_images[0]" class="img-rounded img-responsive">


                                                    </div>
                                                    <div class="col-lg-4 p-l-0">
                                                        <h6 class="box-title m-b-0"><b>
                                                            <span v-if="PurchaseEnquiry.company.pe_prefix == ''">PE</span><span v-else>{{ PurchaseEnquiry.company.pe_prefix }}</span>-{{ PurchaseEnquiry.purchase_enquiry_group_id }}-{{ PurchaseEnquiry.purchase_enquiry_ingroup_id }}</b>
                                                        </h6><br>
                                                        <h6 class="box-title m-b-0">
                                                            
                                                                <span v-if="PurchaseEnquiry.company.lom_prefix == ''"><b>LoM</b></span><span v-else><b>{{ PurchaseEnquiry.company.lom_prefix }}</b></span><span v-if="PurchaseEnquiry.item.item_group_id == 'N/A'">: Not Applicable</span>
                                                                    <span v-else>
                                                                        <b>-{{ PurchaseEnquiry.item.item_group_id }}-{{ PurchaseEnquiry.item.item_ingroup_id }}</b>
                                                                    </span>
                                                                </span>
                                                            
                                                        </h6>
                                                        <h6 class="box-title m-b-0"><b>Priority:</b> {{ PurchaseEnquiry.sourcing_priority }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Qty:</b> {{ PurchaseEnquiry.quantity }}</h6>
                                                        <h6 class="box-title m-b-0"><b>UOM:</b> {{ PurchaseEnquiry.u_o_m }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Adv. Pymt:</b> {{ PurchaseEnquiry.advanced_payment }}</h6>
                                                        <h6 v-if="PurchaseEnquiry.status == 'Send for a New Request for Proposals'" class="box-title m-b-0 text-danger"><b>Re-Run</b></h6>
                                                        <hr>
                                                        <div class="btn btn-sm btn-block btn-primary" @click="showPEDetails(PurchaseEnquiry.id)">Full Info</div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <h6 class="box-title m-b-0"><b>Item Description:</b></h6>
                                                        
                                                        <span v-if="PurchaseEnquiry.item.field_1 != '' && PurchaseEnquiry.item.field_1 != null">
                                                            <template v-for="index in 20">    
                                                                <span v-if="PurchaseEnquiry.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                                    <b>{{ PurchaseEnquiry.item.item_template['field_'+index] }}:</b> {{ PurchaseEnquiry.item['field_'+index] }} | 
                                                                </span>
                                                            </template>
                                                        </span>
                                                        <span v-else>
                                                            {{ PurchaseEnquiry.item_description }}
                                                        </span>

                                                        <hr>
                                                        
                                                        <span v-if="PurchaseEnquiry.location_name != '' && PurchaseEnquiry.location_name != null">
                                                            <h6 class="box-title m-b-0"><b>Deliver To:</b></h6>
                                                            {{ PurchaseEnquiry.location_name }} - <span style="font-size: 12px; cursor: pointer;" class="text-primary" @click="showMap(PurchaseEnquiry.latitude, PurchaseEnquiry.longitude, PurchaseEnquiry.id)"> Map</span>
                                                        </span>
                                                        
                                                        
                                                        
                                                    
                                                        <div class="checkbox checkbox-success check_box_css">
                                                            <input :id="'checkbox_'+PurchaseEnquiry.id" type="checkbox" :value="'checked_'+PurchaseEnquiry.id">
                                                            <label :for="'checkbox'+PurchaseEnquiry.id"></label>
                                                         </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="col-lg-12 p-l-0 p-r-0 p-t-10 b-all" id="PESerSelCol" v-if="RFQDetails.RFQType == 'Service' && RFQDetails.RequestType == 'PE'" style="display: none; min-height: 275px; max-height: 1000px; overflow-y: auto">
                                    

                                    <!-- Show Loader -->
                                    <div align="center" v-if="RfPRecordsLoading">
                                        <h2>Gathering Data...</h2>
                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                    </div>
                                    
                                    <div align="center" v-if="RequestForProposalsList.length == 0">
                                        <h2>No Purchase Enquiries Available</h2>
                                    </div>

                                    <div v-else v-for="(PurchaseEnquiry, key) in RequestForProposalsList">
                                        <div style="cursor: pointer;" @click="selectedItem(PurchaseEnquiry.id)" :id="'RfPEnquiry_Id_'+PurchaseEnquiry.id" class="card card-body">
                                            
                                            
                                            <h4>Service Description:</h4>
                                            <p style="width: 95%">{{ PurchaseEnquiry.service_description }}</p>
                                                
                                            
                                            <div style="top: 10px; right: 10px" class="checkbox checkbox-success check_box_css">
                                                <input :id="'checkbox_'+PurchaseEnquiry.id" type="checkbox" :value="'checked_'+PurchaseEnquiry.id">
                                                <label :for="'checkbox'+PurchaseEnquiry.id"></label>
                                            </div>
                                                
                                            
                                        </div>
                                    </div>
                                </div>



                                <div class="col-lg-12 p-l-0 p-r-0 p-t-10 b-all" id="RCMatSelCol" v-if="RFQDetails.RFQType == 'Materials' && RFQDetails.RequestType == 'RC'" style="display: none; min-height: 275px; max-height: 600px; overflow-y: auto; overflow-x: hidden;">

                                    <!-- Show Loader -->
                                    <div align="center" v-if="RfPRecordsLoading">
                                        <h2>Gathering Data...</h2>
                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                    </div>
                                    <div class="row">
                                        <div style="display: flex; align-items: stretch; width: 95%" v-for="(RateContractRequest, key) in RequestForProposalsList" class="col-lg-6 ">
                                          
                                            <div style="cursor: pointer; margin-bottom: 7px" @click="selectedItem(RateContractRequest.id)" :id="'RfPEnquiry_Id_'+RateContractRequest.id" class="card card-body">
                                                <div class="row">
                                                    <div class="col-lg-2 text-center">
                                                        <img v-if="RateContractRequest.item.field_1 != '' && RateContractRequest.item.field_1 != null" :src="hostName+'/uploads/ItemMasterPictures/'+RateContractRequest.item.picture" class="img-rounded img-responsive">
                                                        <img v-else :src="hostName+'/assets/images/'+RateContractRequest.item.picture" class="img-rounded img-responsive">


                                                    </div>
                                                    <div class="col-lg-3 p-l-0">
                                                        <h6 class="box-title m-b-0"><b>RC #:</b> {{ RateContractRequest.rate_contract_request_group_id }}-{{ RateContractRequest.rate_contract_request_ingroup_id }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Item #:</b> {{ RateContractRequest.item.id }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Qty:</b> {{ RateContractRequest.quantity }}</h6>
                                                        <h6 class="box-title m-b-0"><b>UOM:</b> {{ RateContractRequest.u_o_m }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Delivery:</b><span style="font-size: 12px; cursor: pointer;" class="text-primary" @click="showMap(RateContractRequest.latitude, RateContractRequest.longitude, RateContractRequest.id)"> Map</span></h6>
                                                    </div>
                                                    <div class="col-lg-7">
                                                        <span v-if="RateContractRequest.item.field_1 != '' && RateContractRequest.item.field_1 != null">
                                                        {{ RateContractRequest.item.item_template.field_1 }}: {{ RateContractRequest.item.field_1 }}
                                                        </span>
                                                        <span v-else>
                                                            <h6 class="box-title m-b-0"><b>Item Description:</b></h6>
                                                            {{ RateContractRequest.item_description }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_2 != '' && RateContractRequest.item.field_2 != null">
                                                            | {{ RateContractRequest.item.item_template.field_2 }}: {{ RateContractRequest.item.field_2 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_3 != '' && RateContractRequest.item.field_3 != null">
                                                            | {{ RateContractRequest.item.item_template.field_3 }}: {{ RateContractRequest.item.field_3 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_4 != '' && RateContractRequest.item.field_4 != null">
                                                            | {{ RateContractRequest.item.item_template.field_4 }}: {{ RateContractRequest.item.field_4 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_5 != '' && RateContractRequest.item.field_5 != null">
                                                            | {{ RateContractRequest.item.item_template.field_5 }}: {{ RateContractRequest.item.field_5 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_6 != '' && RateContractRequest.item.field_6 != null">
                                                            | {{ RateContractRequest.item.item_template.field_6 }}: {{ RateContractRequest.item.field_6 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_7 != '' && RateContractRequest.item.field_7 != null">
                                                            | {{ RateContractRequest.item.item_template.field_7 }}: {{ RateContractRequest.item.field_7 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_8 != '' && RateContractRequest.item.field_8 != null">
                                                            | {{ RateContractRequest.item.item_template.field_8 }}: {{ RateContractRequest.item.field_8 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_9 != '' && RateContractRequest.item.field_9 != null">
                                                            | {{ RateContractRequest.item.item_template.field_9 }}: {{ RateContractRequest.item.field_9 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_10 != '' && RateContractRequest.item.field_10 != null">
                                                            | {{ RateContractRequest.item.item_template.field_10 }}: {{ RateContractRequest.item.field_10 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_11 != '' && RateContractRequest.item.field_11 != null">
                                                            | {{ RateContractRequest.item.item_template.field_11 }}: {{ RateContractRequest.item.field_11 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_12 != '' && RateContractRequest.item.field_12 != null">
                                                            | {{ RateContractRequest.item.item_template.field_12 }}: {{ RateContractRequest.item.field_12 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_13 != '' && RateContractRequest.item.field_13 != null">
                                                            | {{ RateContractRequest.item.item_template.field_13 }}: {{ RateContractRequest.item.field_13 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_14 != '' && RateContractRequest.item.field_14 != null">
                                                            | {{ RateContractRequest.item.item_template.field_14 }}: {{ RateContractRequest.item.field_14 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_15 != '' && RateContractRequest.item.field_15 != null">
                                                            | {{ RateContractRequest.item.item_template.field_15 }}: {{ RateContractRequest.item.field_15 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_16 != '' && RateContractRequest.item.field_16 != null">
                                                            | {{ RateContractRequest.item.item_template.field_16 }}: {{ RateContractRequest.item.field_16 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_17 != '' && RateContractRequest.item.field_17 != null">
                                                            | {{ RateContractRequest.item.item_template.field_17 }}: {{ RateContractRequest.item.field_17 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_18 != '' && RateContractRequest.item.field_18 != null">
                                                            | {{ RateContractRequest.item.item_template.field_18 }}: {{ RateContractRequest.item.field_18 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_19 != '' && RateContractRequest.item.field_19 != null">
                                                            | {{ RateContractRequest.item.item_template.field_19 }}: {{ RateContractRequest.item.field_19 }}
                                                        </span>

                                                        <span v-if="RateContractRequest.item.field_20 != '' && RateContractRequest.item.field_20 != null">
                                                            | {{ RateContractRequest.item.item_template.field_20 }}: {{ RateContractRequest.item.field_20 }}
                                                        </span>

                                                        <hr>
                                                        
                                                        <span v-if="RateContractRequest.location_name != '' && RateContractRequest.location_name != null">
                                                            <h6 class="box-title m-b-0"><b>Deliver To:</b></h6>
                                                            {{ RateContractRequest.location_name }}
                                                        </span>
                                                        
                                                        
                                                        
                                                    
                                                        <div class="checkbox checkbox-success check_box_css">
                                                            <input :id="'checkbox_'+RateContractRequest.id" type="checkbox" :value="'checked_'+RateContractRequest.id">
                                                            <label :for="'checkbox'+RateContractRequest.id"></label>
                                                         </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            
                            
                            <div class="col-lg-12"><hr>
                                <div class="col-lg-6 pull-left">
                                    <div class="grid-content">
                                        <el-form-item label="" prop="SourcingType">
                                            <span slot="label"><b>Select The Vendors Proposals’ Sourcing Methodology</b></span>
                                            
                                            <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                                <span class="tooltip-content4 clearfix">
                                                    <span class="tooltip-text2"><strong>Requests For Proposals</strong> can be raised to secure proposals from vendors for either Purchase Enquiries or for Rate Contracts (Volume Discount Goods Supply Master Agreement)</span>
                                                </span>
                                            </span>

                                            <el-select style="width: 100%; padding: 0px;" value-key="value" v-model="RFQDetails.SourcingType" placeholder="Select The Vendors Proposals’ Sourcing Methodology">
                                                <el-option label="Sealed Bid" value="Sealed Bid"></el-option>  
                                                <el-option label="Live Auctions" value="Live Auctions"></el-option> 
                                                <!-- <el-option label="Japanees Auction" value="Japanees Auction"></el-option>  -->
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                </div>


                                <div class="col-lg-6 pull-left">
                                    <div class="grid-content">
                                        <el-form-item label="temp" prop="RFPName">
                                            <span slot="label"><b>Request For Proposal Name</b></span>

                                            <el-input v-model="RFQDetails.RFPName" placeholder="e.g. Request For Proposal For Painting Materials"></el-input>

                                        </el-form-item>
                                    </div>
                                </div>


                                <div class="col-lg-6 pull-left">
                                    <div class="grid-content">
                                        <el-form-item label="" prop="QuotationDate">
                                            <span slot="label"><b>Select The Request For Proposals Timeframe</b></span>
                                            
                                            <el-date-picker
                                            style="width: 100%"
                                            :picker-options = "pickerOptions"
                                            v-model="RFQDetails.QuotationDate"
                                            type="datetimerange"
                                            range-separator="-"
                                            @change="QuotationDateSelected($event)"
                                            start-placeholder="Start date"
                                            end-placeholder="End date"
                                            :default-time="['00:00:00', '23:59:59']"
                                            value-format="yyyy-MM-dd HH:mm:ss">
                                            </el-date-picker>
                                            
                                        </el-form-item>
                                    </div>
                                </div>


                                <div class="col-lg-6 pull-left">
                                    <div class="grid-content">
                                        <el-form-item label="" prop="RFIDate">
                                            <span slot="label"><b>Select The Request For Proposals' Request For Information (RFI) Timeframe</b></span>
                                            
                                            <el-date-picker
                                            ref="RFIPicker"
                                            style="width: 100%"
                                            :picker-options = "RfIPickerOptions"
                                            v-model="RFQDetails.RFIDate"
                                            type="datetimerange"
                                            :disabled=RFIDatePickerisDisabled
                                            range-separator="-"
                                            start-placeholder="Start date"
                                            end-placeholder="End date"
                                            :default-time="['00:00:00', '23:59:59']"
                                            value-format="yyyy-MM-dd HH:mm:ss">
                                            </el-date-picker>
                                            
                                        </el-form-item>
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12" v-if="RFQDetails.RFQType != ''">
                                <div class="grid-content VendorSelection">
                                    <el-form-item label="" prop="SelectedVendors">
                                        <span slot="label"><b>Select Vendors</b></span>
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                            <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2"><strong>Euclid</strong>, also known as Euclid of Alexandria, was a Greek mathematician, often referred to as the "Father of Geometry". He was active in Alexandria during the reign of Ptolemy I. <a href="http://en.wikipedia.org/wiki/Euclid">Wikipedia</a></span>
                                            </span>
                                        </span>
									    <el-select filterable multiple style="width: 100%; padding: 0px;" v-model="RFQDetails.SelectedVendors" placeholder="Select Vendors">
											
										      <el-option
										        v-for="vendor in VendorsList"
                                                :key="vendor.id"
										        :label="(vendor.users.length > 0) ? vendor.name : vendor.name +' (No Active Users)'"
										        :value="vendor.id">
										      </el-option>
										    
										</el-select>
							      	</el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12 VendorSelection" v-if="RFQDetails.RFQType != ''">
                                <button type="button" @click="CreateQuotation" class="btn btn-success btn-block waves-effect text-center VendorSelection">Create the Request for Proposals</button>
                            </div>



                        </div>
                    </el-form>
                </div>
            </div>
        </div>

        <!-- Locate on Map -->
        <div class="modal fade" id="DeliveryLocation" tabindex="-1" aria-labelledby="DeliveryLocation" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delivery Location</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>

                    <div class="modal-body">
                        <div id="map-canvas"></div>
                    </div>
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Done</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- PE Details Modal -->

        <div id="PurchaseEnquiryUpdateModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryUpdateModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title text-ogeo">Purchase Enquiry ID# {{ ViewModalInfo.purchase_enquiry_group_id }}-{{ ViewModalInfo.purchase_enquiry_ingroup_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
                                        <td><b>Delivery address details: </b></td>
                                        <td>
                                            <span><b>Location name:</b> {{ ViewModalInfo.location_name }}</span><br>
                                            <span><b>Longitude:</b> {{ ViewModalInfo.longitude }}</span><br>
                                            <span><b>Latitude:</b> {{ ViewModalInfo.latitude }}</span><br>  
                                            
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><b>Is advanced payment considered? </b></td>
                                        <td>{{ ViewModalInfo.advanced_payment }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>What is the percentage of retention payment? </b></td>
                                        <td v-if="ViewModalInfo.retention_percentage != ''">{{ ViewModalInfo.retention_percentage }}%</td>
                                        <td v-else>0%</td>
                                    </tr>
                                    <tr>
                                        <td><b>Retention Timeframe: </b></td>
                                        <td v-if="ViewModalInfo.retention_days != ''">{{ ViewModalInfo.retention_days }} Day(s) from the date of full delivery.</td>
                                        <td v-else>0 Day(s)</td>
                                    </tr>
                                    <tr>
                                        <td><b>Awardee vendor: </b></td>
                                        <td v-if="ViewModalInfo.purchase_orders.length == 0">Not yet awarded</td>
                                        <td v-else><span v-if="ViewModalInfo.project.company.po_prefix != ''">{{ ViewModalInfo.project.company.po_prefix }}</span><span v-else>PO</span>: {{ ViewModalInfo.purchase_orders[0].purchase_order_group_id }} - {{ ViewModalInfo.purchase_orders[0].vendor.name }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <!-- <tr align="center">
                                        <td>
                                            <img style="width: 100%; text-align: center;" :src="'/uploads/ItemMasterPictures/'+ViewModalInfo.item.picture">
                                        </td>
                                    </tr> -->
                                    <tr align="center" v-if="ViewModalInfo.enquiry_from_item_master == 'Yes'">
                                        <td>
                                            <img style="width: 7vw;height: 7vw; text-align: center;" :src="'/uploads/ItemMasterPictures/'+ViewModalInfo.item.picture">
                                        </td>
                                    </tr>
                                    <tr align="center" v-else style="display: table-caption;">
                                        <td v-for="(img, index) in p_images" :key="index" >
                                            <img style="width: 7vw;height: 7vw; text-align: center;" :src="'/uploads/images/'+img">
                                        </td>
                                    </tr>

                                    <tr v-if="ViewModalInfo.item.item_template">
                                        <td><b>Item Details: </b></td>
                                        <td>
                                            <span> <span v-if="ViewModalInfo.company.lom_prefix == ''">LoM</span><span v-else>{{ ViewModalInfo.company.lom_prefix }}</span>-{{ ViewModalInfo.item.item_group_id }}-{{ ViewModalInfo.item.item_ingroup_id }}</span><br>

                                            <span>
                                                <template v-for="index in 20">    
                                                    <span v-if="ViewModalInfo.item.item_template['field_'+index] !== 'Ogeo-None'">
                                                        <b>{{ ViewModalInfo.item.item_template['field_'+index] }}:</b> {{ ViewModalInfo.item['field_'+index] }} | 
                                                    </span>
                                                </template>
                                            </span><br><br>

                                            <span v-if="ViewModalInfo.quantity_changes.length == 0"><b>Quantity:</b> {{ ViewModalInfo.quantity }}</span>
                                            <span v-else><b>Quantity:</b> {{ ViewModalInfo.quantity_changes[0].old_quantity }}</span>
                                            <br>

                                            <span><b>Unit of Measurement:</b> {{ ViewModalInfo.item.u_o_m }}</span><br>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td><b>Item Details: </b></td>
                                        <td class="dont-break-out">
                                            <span><b>Description:</b> {{ ViewModalInfo.item.description }}</span><br><br>
                                            <span><b>Quantity:</b> 
                                                <span v-if="ViewModalInfo.quantity_changes.length == 0">{{ ViewModalInfo.quantity }}</span>
                                                <span v-else>{{ ViewModalInfo.quantity_changes[0].old_quantity }}</span>
                                            </span><br>  
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
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <span><b>By:</b> {{ currentUser.Name }}</span><br><br>
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

    export default {
        name: 'request-for-quotation',
        data(){
            var self = this;
            let minDate = '';
            let maxDate = '';
            return{
                pickerOptions: {
                  disabledDate(time) {
                    return time.getTime() <= new Date(new Date().setDate(new Date().getDate()-1));
                  },
                },
                RfIPickerOptions: {
                  disabledDate(time) {
                    var mindate = moment(self.RFQDetails.QuotationDate[0]);
                    var maxDate = moment(self.RFQDetails.QuotationDate[1]);         
                    var isBeforeMinDate = time.getTime() < mindate;
                    var isAfterMaxDate = time.getTime() > maxDate;

                    return isBeforeMinDate || isAfterMaxDate;

                  },
                },
                RFIDatePickerisDisabled: true,
                hostName: window.location.protocol+'//'+window.location.hostname,
                RfPRecordsLoading: false,
                CompanySetup: {},
                JobNumbers: [],
                VendorsList: [],
                ViewModalInfo: {},
                viewDataLoaded: false,
            	RequestForProposalsList: "",
                SourcingOption: null,
                RFQDetails: {
                    ProjectId: "",
                	RFQType: "",
                    RequestType: "PE",
                	QuotationDate: "",
                    RFPName: "",
                    RFIDate: "",
                	SourcingType: "",
                	RfPEnquiries: [],
                	SelectedVendors: {},
                },
                rules: {
                	ProjectId: [{
                        required: true,
                        message: "Please Select Project",
                        trigger: ["blur"]
                    }],
                    RFQType: [{
                        required: true,
                        message: "Please Select RFQ Type",
                        trigger: ["blur"]
                    }],
                    RequestType: [{
                        required: true,
                        message: "Please Select Request Type",
                        trigger: ["blur"]
                    }],
                    QuotationDate: [{
                        required: true,
                        message: "Please select closure date",
                        trigger: ["blur"]
                    }],
                    RFPName: [{
                        required: false,
                        message: "Please Ener RFP name",
                        trigger: ["blur"]
                    }],
                    RFIDate: [{
                        required: true,
                        message: "Please select RFI date",
                        trigger: ["blur"]
                    }],
                    RfPEnquiries: [{
                        required: true,
                        message: "Please select at least one purchase enquiry",
                        trigger: ["blur"]
                    }],
                    SourcingType: [{
                        required: true,
                        message: "Please Select The Vendors Proposals’ Sourcing Methodology",
                        trigger: ["blur"]
                    }],
                    SelectedVendors: [{
                        required: true,
                        message: "Please select at least one vendor",
                        trigger: ["blur"]
                    }],
                },
                pickerOptions1: {
                    shortcuts: [{
                        text: 'Tomorrow',
                        onClick(picker) {
                            const date = new Date();
                            date.setTime(date.getTime() + 3600 * 1000 * 24);
                            picker.$emit('pick', date);
                        }
                    },
                    {
                        text: '1 Week From Now',
                        onClick(picker) {
                            const date = new Date();
                            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', date);
                        }
                    },
                    {
                        text: '2 Week From Now',
                        onClick(picker) {
                            const date = new Date();
                            date.setTime(date.getTime() + 3600 * 1000 * 24 * 14);
                            picker.$emit('pick', date);
                        }
                    },
                    {
                        text: '3 Week From Now',
                        onClick(picker) {
                            const date = new Date();
                            date.setTime(date.getTime() + 3600 * 1000 * 24 * 21);
                            picker.$emit('pick', date);
                        }
                    },
                    {
                        text: '30 Days From Now',
                        onClick(picker) {
                            const date = new Date();
                            date.setTime(date.getTime() + 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', date);
                        }
                    }]
                },
            }
        },
        methods: {
            QuotationDateSelected(QuotationDate) {
                var self = this;
                console.log(QuotationDate);
                this.RFIDatePickerisDisabled = false;
            },
            showPEDetails(recordId){

                this.selectedItem(recordId);

                let elquentClass = "PurchaseEnquiry";

                this.ViewModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        console.log(this.ViewModalInfo);
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
            showMap(latitude, longitude, PEID){

                var myLatLng = {lat: parseFloat(longitude), lng: parseFloat(latitude)};

                // Map Options
                var mapOptions = {
                    zoom: 10,
                    center: new google.maps.LatLng(parseFloat(longitude), parseFloat(latitude)),
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                };

                // Initialize the map with options (inside #map element)
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                });


                // When modal window is open, this script resizes the map and resets the map center
                $("#DeliveryLocation").on("shown.bs.modal", function(e) {
                  google.maps.event.trigger(map, "resize");
                  return map.setCenter(myLatLng);
                });

                this.selectedItem(PEID);

                $('#DeliveryLocation').modal('toggle');


            },
            selectedItem(PEID) {

                if($('#RfPEnquiry_Id_'+PEID).hasClass('selectedItem')){

                    $('#RfPEnquiry_Id_'+PEID).removeClass('selectedItem');
                    $('#RfPEnquiry_Id_'+PEID).css('background-color', '');
                    $('#checkbox_'+PEID).attr('checked', false);
                    this.RFQDetails.RfPEnquiries.splice(this.RFQDetails.RfPEnquiries.indexOf(PEID), 1);

                } else {
                    $('#RfPEnquiry_Id_'+PEID).addClass('selectedItem');
                    $('#RfPEnquiry_Id_'+PEID).css('background-color', 'rgb(69, 249, 132, 0.1)');
                    $('#checkbox_'+PEID).attr('checked', 'checked');
                    this.RFQDetails.RfPEnquiries.push(PEID);
                }
                
                //console.log(this.RFQDetails.RequestForProposalsList);
            },
            GetRCsListFromRequestType(RequestType){
                this.RfPRecordsLoading = true;
                if(this.RFQDetails.RequestType == 'RC'){
                    this.RFQDetails.RFQType = "Materials";
                }
                if(this.RFQDetails.RFQType != "" && this.RFQDetails.ProjectId != ""){
                    this.RequestForProposalsList = "";
                    console.log(this.RFQDetails.RFQType);
                    axios.post('/api/data/get_pe_list_per_type', { PEType: this.RFQDetails.RFQType, ProjectId: this.RFQDetails.ProjectId, RequestType: RequestType })
                        .then((response) => {
                            this.RequestForProposalsList = response.data;
                            console.log(this.RequestForProposalsList);
                            console.log(this.RFQDetails.RFQType);
                            this.$nextTick(() => {

                                this.RfPRecordsLoading = false;

                                if(this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'PE'){
                                    //handle switching between materials and services
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('#PEMatSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else if (this.RFQDetails.RFQType == 'Service' && this.RFQDetails.RequestType == 'PE') {
                                    //handle switching between materials and services
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else if (this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'RC') {
                                    //handle switching between materials and services
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else {
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('.VendorSelection').css('display', 'none');
                                }
                                
                            })        
                        });

                    axios.get('/api/data/get_vendors_list')
                        .then((response) => {
                            self.VendorsList = response.data;                  
                        });
                }

                
            },
            GetPEsRCsListFromProject(ProjectId){
                self = this;
                this.RfPRecordsLoading = true;
                if(this.RFQDetails.RFQType != ""){
                    this.RequestForProposalsList = "";
                    console.log(this.RFQDetails.RFQType);
                    axios.post('/api/data/get_pe_list_per_type', { PEType: this.RFQDetails.RFQType, ProjectId: ProjectId, RequestType: this.RFQDetails.RequestType })
                        .then((response) => {
                            this.RequestForProposalsList = response.data;
                            console.log(this.RequestForProposalsList);
                            console.log(this.RFQDetails.RFQType);

                            //JobNumbers.auction_types

                            this.$nextTick(() => {

                                this.RfPRecordsLoading = false;

                                if(this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'PE'){
                                    //handle switching between materials and services
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('#PEMatSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else if (this.RFQDetails.RFQType == 'Service' && this.RFQDetails.RequestType == 'PE') {
                                    //handle switching between materials and services
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else if (this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'RC') {
                                    //handle switching between materials and services
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', '');
                                    $('.VendorSelection').css('display', '');
                                } else {
                                    $('#PEMatSelCol').css('display', 'none');
                                    $('#PESerSelCol').css('display', 'none');
                                    $('#RCMatSelCol').css('display', 'none');
                                    $('.VendorSelection').css('display', 'none');
                                }
                                
                            })        
                        });

                    axios.get('/api/data/get_vendors_list')
                        .then((response) => {
                            self.VendorsList = response.data;                  
                        });
                }

                
            },
        	GetPEsRCsList(PEType){
                self = this;
                this.RfPRecordsLoading = true;
                if(this.RFQDetails.ProjectId == ''){
                    Swal('Select Project', 'Please Select Project Before To Display with PEs Menu', 'success');
                }

                this.RequestForProposalsList = "";
                console.log(PEType);
        		axios.post('/api/data/get_pe_list_per_type', { PEType: PEType, ProjectId: this.RFQDetails.ProjectId, RequestType: this.RFQDetails.RequestType })
	                .then((response) => {
	                    this.RequestForProposalsList = response.data;
                        console.log(this.RequestForProposalsList);
                        console.log(this.RFQDetails.RFQType);
                        $.each(this.RequestForProposalsList, function(index, val) {
                            console.log(val)
                            console.log(index)
                            if(val.p_images !== null){
                                let image_array_string = val.p_images;
                                console.log(image_array_string);
                                let image_string = image_array_string.substring(1, image_array_string.length-1);
                                let final = image_string.replace(/"/g,"");
                                var d= final.split(',');
                                this.p_images = d;
                            }
                        });
                        this.$nextTick(() => {
                            
                            this.RfPRecordsLoading = false;
                            if(this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'PE'){
                                //handle switching between materials and services
                                $('#PESerSelCol').css('display', 'none');
                                $('#RCMatSelCol').css('display', 'none');
                                $('#PEMatSelCol').css('display', '');
                                $('.VendorSelection').css('display', '');
                            } else if (this.RFQDetails.RFQType == 'Service' && this.RFQDetails.RequestType == 'PE') {
                                //handle switching between materials and services
                                $('#PEMatSelCol').css('display', 'none');
                                $('#RCMatSelCol').css('display', 'none');
                                $('#PESerSelCol').css('display', '');
                                $('.VendorSelection').css('display', '');
                            } else if (this.RFQDetails.RFQType == 'Materials' && this.RFQDetails.RequestType == 'RC') {
                                //handle switching between materials and services
                                $('#PEMatSelCol').css('display', 'none');
                                $('#PESerSelCol').css('display', 'none');
                                $('#RCMatSelCol').css('display', '');
                                $('.VendorSelection').css('display', '');
                            } else {
                                $('#PEMatSelCol').css('display', 'none');
                                $('#PESerSelCol').css('display', 'none');
                                $('#RCMatSelCol').css('display', 'none');
                                $('.VendorSelection').css('display', 'none');
                            }
                            
                        })        
	                });

                axios.get('/api/data/get_vendors_list')
                    .then((response) => {
                        this.VendorsList = response.data;                  
                    });

        	},
            CreateQuotation(){
                //check that there is at least one purchase enquiry selected...
                if(this.RFQDetails.RfPEnquiries.length == 0){
                    Swal('No Items were selectecd for The Request For Proposals', 'You must select at least one item before a Request For Proposals can be floated', 'warning');
                } else {
                    this.$refs.ItemCreationForm.validate((validation) => {

                        if(validation){

                            axios.post('/api/quotations_management/create_new_quotation_request', this.RFQDetails)
                                .then((response) => {
                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 5000
                                    });


                                    //Remove Form Details
                                    this.RFQDetails.ProjectId = "";
                                    this.RFQDetails.RFQType = "";
                                    this.RFQDetails.RequestType = "PE";
                                    this.RFQDetails.QuotationDate = "";
                                    this.RFQDetails.RFPName = "";
                                    this.RFQDetails.RFIDate = "";
                                    this.RFQDetails.SourcingType = "";
                                    this.RFQDetails.RfPEnquiries = [];
                                    this.RFQDetails.SelectedVendors = {};
                                    



                                })
                                .catch(function(){
                                    Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (CreatingQuotation)', 'error');
                                });

                            
                        }
                        
                    })
                }


                

                
            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace(',', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted(){

            //CustomJs();
            
            let self = this;

            axios.get('/api/data/get_company_projects_list')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {

                        this.CompanySetup = SecondResponse.data;
                        if(this.CompanySetup.setup_mode == 'Company Wide'){
                            this.RFQDetails.ProjectId = Object.keys(this.JobNumbers)[0];
                        }

                    });
                });


	
        }

    }


</script>

<style scoped>
    
    #map-canvas {
        width: 100%;
        height: 450px;
        margin: 0 auto;
    }


    #PurchaseEnquiryUpdateModalView .modal-dialog {
        min-width:80%;
    }
    
    #DeliveryLocation .modal-dialog {
        width:80%;
    }

    .el-date-picker.has-sidebar.has-time {
        width: 700px;
    }

    .check_box_css {
        font-size:2rem;
        font-weight: normal;
        color:#fff;
        position:absolute;
        right:0px;
        top:-15px;
        z-index:999;
        opacity:1;
    }

</style>