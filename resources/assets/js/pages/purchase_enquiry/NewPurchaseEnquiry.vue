<template>
        
    <div class="row">
        <div id='Purchase_Enqiury_Form' class="col-lg-7">
            <div class="card" v-if="ProjectDetailsLoaded">
                <div class="card-header">
                    <h4 v-if="this.PurchaseEnquiryLine.EnquiryType == 'Materials'">Create A Material Purchase Enquiry Line</h4>
                    <h4 v-if="this.PurchaseEnquiryLine.EnquiryType == 'Service'">Create A Service Purchase Enquiry</h4>
                </div>
                <div class="card-body">
                    <el-form :model="PurchaseEnquiryLine" class="demo-form-inline" :rules="rules" ref="PurchaseEnquiryForm">

                        <el-row :gutter="20">
                            

                            <transition v-if="CompanySetup.setup_mode == 'Project Wise'">
                                <el-col :span="24">
                                    <div class="grid-content">
                                        <el-form-item label="temp" prop="JobNumber">
                                            <span slot="label"><b>Select A Set-up</b></span>

                                            <el-select id="SetupSelection" @change="getProjectCurrency()" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.JobNumber" placeholder="Select A Set-up">
                                                
                                                <el-option  v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                </el-col>
                            </transition>

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryType">
                                        <span slot="label"><b>Select Enquiry Type</b></span>

                                        <el-select @change="EnquiryTypeSelection" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.EnquiryType" placeholder="Select Enquiry Type (Material Or Service)">
                                                
                                            <el-option label="Materials" value="Materials"></el-option>
                                            <el-option label="Services" value="Service"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>
        
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

                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && this.CompanySetup.lom_manditory == 'LibrariesNFreeText'">

                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryFromItemMaster">
                                        <span slot="label"><b>Do You Want To Select An Item From The Library of Materials?</b></span>

                                        <el-select @change="EnquiryItemDescriptionSelection" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.EnquiryFromItemMaster" placeholder="Do You Want To Select An Item From The Library of Materials?">
                                                
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>

                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'Yes'">
                                    <el-form-item label="temp" prop="ItemNumber">
                                        <span slot="label"><b>Select From The Library Of Materials</b></span>
                                        <el-select style="width: 100%"
                                            v-model="PurchaseEnquiryLine.ItemNumber"
                                            @change="checkRateContract()"
                                            filterable
                                            remote
                                            :remote-method="searchItems"
                                            :loading="searchItemsLoading"
                                            placeholder="Search and Select an Item">
                                            <el-option style="max-width: 674.656px; max-height: 150px"
                                                v-for="item in FoundItems"
                                                :key="item.id"
                                                :label="'Item ID: ('+item.item_group_id+'-'+item.item_ingroup_id+'), Description: '+item.description"
                                                :value="item.id">
                                                <div class="row">
                                                    <div class="col-sm-2 b-r" style="padding-left: 0px; padding-top: 5px; padding-buttom: 0px; padding-right: 0px;" >
                                                       <img  class="img-thumbnail vertical-middle" :src="hostName+'/uploads/ItemMasterPictures/'+item.picture">
                                                        
                                                    </div>
                                                    <div class="col-sm-5 b-r" style="padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; line-height: 10px; z-index: 1" >
                                                        <table class="table itemTable">
                                                            <tr>
                                                                <td width="50%"><b>Item Number:</b></td>
                                                                <td width="50%"> <span v-if="item.company.lom_prefix == null">LoM</span><span v-else>{{ item.company.lom_prefix }}</span>-{{ item.item_group_id  }}-{{ item.item_ingroup_id  }}</td>
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
                                                    <div class="col-sm-3 text-wrap" style="padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; word-wrap: break-word;">
                                                        <div>
                                                            <h5><b>Item Description:</b></h5>
                                                            <p style="word-wrap: break-word;">{{ item.description }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </el-option>
                                        </el-select>

                                    </el-form-item>
                                </div>

                             

                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'No'">
                                    <el-form-item label="temp" prop="ItemDescription">
                                        <span slot="label"><b>Enter The Material Description</b></span>
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Complete Description Of The Item Required."
                                            v-model="PurchaseEnquiryLine.ItemDescription">
                                        </el-input>
                                    </el-form-item>
                                </div>
                                   <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'No'">
                                  <el-row :gutter="20">
											<el-col :span="12">
												<div class="grid-content">
													
												    <el-upload
                                                        style="width:654px;hight:270px"
					                                    action="#"
					                                    list-type="picture-card"
					                                    :limit="4"
					                                    id='Images'
					                                    :auto-upload="false"
					                                    ref="Images"
					                                    accept=".jpg, .jpeg, .png"
                                                        :on-change="handleChange"
					                                    :on-exceed="handleExceed"
					                                    :on-remove="handleRemove">
					                                    <i class="el-icon-plus"></i>
					                                </el-upload>
					                                <span>You can upload 4 Images maximum size of 1 MB.</span>
											      	
												</div>
											</el-col>
                                          
										</el-row>

                                </div>


                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryFromItemMaster == 'No'">

                                    <el-form-item label="temp" prop="UnitOfMeasurement">
                                        <span slot="label"><b>Enter Unit Of Measurement</b></span>

                                        <el-input v-model="PurchaseEnquiryLine.UnitOfMeasurement" placeholder="e.g. Dozen, Kilogram, Liters, Boxes of 24 Bottles..."></el-input>

                                    </el-form-item>

                                </div>

                            </el-col>

                            <el-col :span="24" v-else-if="this.CompanySetup.lom_manditory == 'Libraries'">
                                <div class="grid-content">
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
                                                :label="'Item ID: ('+item.item_group_id+'-'+item.item_ingroup_id+'), Description: '+item.description"
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
                                                                <td width="50%" style="cursor: pointer;" class="text-primary" @mouseover="showRateContract(item.id)"> View Rates</td>
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

                                <div class="grid-content">

                                    <el-form-item label="temp" prop="UnitOfMeasurement">
                                        <span slot="label"><b>Enter Unit Of Measurement</b></span>

                                        <el-input v-model="PurchaseEnquiryLine.UnitOfMeasurement" placeholder="e.g. Dozen, Kilogram, Liters, Boxes of 24 Bottles..."></el-input>

                                        <!-- <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.UnitOfMeasurement" placeholder="Enter Unit Of Measurement">
                                                
                                            <el-option label="Metre" value="Metre"></el-option>
                                            <el-option label="Millimeter" value="Millimeter"></el-option>
                                            <el-option label="Centimeter" value="Centimeter"></el-option>
                                            <el-option label="Decimeter" value="Decimeter"></el-option>
                                            <el-option label="Kilometer" value="Kilometer"></el-option>
                                            <el-option label="Cup" value="Cup"></el-option>
                                            <el-option label="Gill" value="Gill"></el-option>
                                            <el-option label="Pint" value="Pint"></el-option>
                                            <el-option label="Grams" value="Grams"></el-option>
                                            <el-option label="Kilogram" value="Kilogram"></el-option>
                                            <el-option label="Grain" value="Grain"></el-option>
                                            <el-option label="Dram" value="Dram"></el-option>
                                            <el-option label="Ounce" value="Ounce"></el-option>
                                            <el-option label="Pound" value="Pound"></el-option>
                                            <el-option label="Dozen" value="Dozen"></el-option>
                                                
                                        </el-select> -->
                                    </el-form-item>

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

                                        <el-select filterable allow-create multiple style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.RequiredDocuments" placeholder="Select Required Document">
                                            
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


                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' | PurchaseEnquiryLine.EnquiryType == 'Service'" >
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

                            <el-col :span="24" v-if="PurchaseEnquiryLine.RetentionPercentage != 0 || PurchaseEnquiryLine.RetentionPercentage != ''" >
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="RetentionDays">
                                        <span slot="label"><b>Select Retention Timeframe From The Delivery Date</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.RetentionDays" placeholder="Select Retention Timeframe From The Delivery Date">
                                            
                                            <el-option v-for="n in 900" :key="n" :label="n+ ' Days'" :value="n"></el-option> 
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>


                            
                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <div class="grid-content" v-if="this.showQuestionRateMaterial == true">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryFromItemMaster">
                                        <span slot="label"><b>This item from the Library of Materials has (the number of existing, valid, Rates Contracts) Rates Contract(s) attached to it. Do you want to select one of them (if there are many) it (if there is only one) to reduce the sourcing turnaround time?</b></span>
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                    A Rate Contract is a framework agreement signed with a Vendor, for a list of materials, which freezes both Unit Rates & Lead Times over a given period of time. The use of Rates Contract helps reduce turnaround times since a validated Purchase Enquiry line, linked to a Rate Contract, can reasdily be turned into a Purcase Order, without the need to source proposals.                                            
                                                </span>
                                            </span>
                                        </span>
                                        <el-select @change="ShowPopUpIgnoreRateContract" filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.ShowPopUpIgnoreRateContract" placeholder="Do You Want To Select An Item From The Library of Materials?">
                                                
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>

                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' && PurchaseEnquiryLine.EnquiryFromItemMaster == 'Yes'">
                                    <el-form-item label="temp" prop="ItemNumber">
                                        <span slot="label"><b>Select From Existing Rates Contracts</b></span>
                                        <el-select style="width: 100%"
                                            v-model="PurchaseEnquiryLine.RateContractSelected"
                                            @change="checkLowestRateContract()"
                                            placeholder="Select Rate Contract">
                                            <el-option 
                                                v-for="item in RateContractSelection"
                                                :key="item.value"
                                                :label="'Vendor Name: '+item.vendor_name+' | Vendor Score: '+item.vendor_score+' | Unit Rate: '+item.unit_rate+ 'USD | Lead Time: ' +item.lead_time+' | Rates Contract Reference: '+item.rate_contract_reference+' | Rate Contract Expiry Date: '+item.date"
                                                :value="item">
                                            </el-option>
                                        </el-select>

                                    </el-form-item>
                                </div>

                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryType == 'Service'">
                                    <el-form-item label="temp" prop="ServiceTimePeriod">
                                        <span slot="label"><b>Will these Services Be One/Off Or Will They Be Delivered Over A Period Of Time?</b></span>
                                        <el-select style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.ServiceOneOff" placeholder="Will these Services Be One/Off Or Will They Be Delivered Over A Period Of Time?">
                                                
                                            <el-option label="One/Off" value="One/Off"></el-option>
                                            <el-option label="Over A Period Of Time" value="Over A Period Of Time"></el-option>
                                                
                                        </el-select>

                                    </el-form-item>
                                </div>
                                <div class="grid-content" v-if="PurchaseEnquiryLine.EnquiryType == 'Service' && PurchaseEnquiryLine.ServiceOneOff == 'Over A Period Of Time'">
                                    <el-form-item label="temp">
                                        <span slot="label"><b>What Is The Term, In Days, Of The Services?</b></span>
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.RetentionDays" placeholder="What Is The Term, In Days, Of The Services?">
                                            
                                            <el-option v-for="n in 900" :key="n" :label="n+ ' Days'" :value="n"></el-option> 
                                            
                                        </el-select>

                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="TypeOfServicesContract">
                                        <span slot="label"><b>Type of Service Contract</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.TypeOfServicesContract" placeholder="Please Select One OF Below">
                                                
                                            <el-option value="Fixed-price contract">Fixed-Pried Contract
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                    <span class="tooltip-item2">
                                                        <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                        
                                                    </span>
                                                    <span class="tooltip-content4 clearfix" style="position:fixed; width:500px">
                                                        <span class="tooltip-text2">
                                                            A fixed-price contract, also known as lump sum contract,<br> 
                                                            is used in situations where the payment doesn’t depend on the<br> 
                                                            resources used or time expended. With fixed-price contracts, <br>
                                                            vendors will estimate the total allowable costs of labor, <br>
                                                            materials and equipment and perform the action specified by<br>
                                                            the contract regardless of the actual cost.<br>
                                                        </span>
                                                    </span>
                                                </span>
                                            </el-option>
                                            <el-option value="Cost-reimbursement contract">Cost-Reimbursement Contract
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                    <span class="tooltip-item2">
                                                        <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                        
                                                    </span>
                                                    <span class="tooltip-content4 clearfix" style="position:fixed; width:500px">
                                                        <span class="tooltip-text2">
                                                            With a cost-reimbursement contract, the final<br> 
                                                            total cost is determined when the project is completed<br>
                                                            or at another predetermined date within the contract’s timeframe.<br>
                                                            Before the project is started, the vendor will create<br>
                                                            an estimated cost to give the organization an idea of the budget.<br>
                                                            The purpose of setting this expectation with cost-reimbursement<br> 
                                                            contracts is to establish a ceiling price that the contractor<br>
                                                            shouldn’t exceed without the approval of the organization. At<br>
                                                            the same time, if that ceiling is reached, the vendor can stop work.<br>
                                                        </span>
                                                    </span>
                                                </span>
                                            </el-option>
                                            <el-option value="Cost-plus fixed fee contract">Cost-plus-Fixed-Fee Contract
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                    <span class="tooltip-item2">
                                                        <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                        
                                                    </span>
                                                    <span class="tooltip-content4 clearfix" style="position:fixed; width:500px">
                                                        <span class="tooltip-text2">
                                                            A cost-plus contract is type of cost reimbursement contract<br>
                                                            for situations where the organization agrees to pay the <br>
                                                            actual cost of the entire project, including labor, materials,<br>
                                                            and any unexpected expenses. The word “plus” refers to the<br>
                                                            fee that covers the contractor’s profits and overhead. <br>
                                                            In these agreements, the organization agrees to pay that extra<br> 
                                                            amount and expects the vendor to deliver on their promise.<br>

                                                        </span>
                                                    </span>
                                                </span>
                                            </el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24" v-if="PurchaseEnquiryLine.TypeOfServicesContract == 'Fixed-price contract'" >
                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="VendorCommercialFormat">
                                        <span slot="label"><b>Vendors’ Commercial Offer Required Format</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.VendorCommercialOffer" placeholder="Please Select One OF Below">
                                                
                                            <el-option label="Total Fixed Price" value="Fixed Price Only"></el-option>
                                            <el-option label="Breakdown of Manpower, Subcontractors, Tools/Equipment & Materials Prices" value="Breakdown of Manpower, Subcontractors, Tools/Equipment & Materials price"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24" v-if="PurchaseEnquiryLine.TypeOfServicesContract == 'Cost-reimbursement contract'" >
                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryFromItemMaster">
                                        <span slot="label"><b>Vendors’ Commercial Offer Required Format</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.VendorCommercialOffer" placeholder="Please Select One OF Below">
                                                
                                            <el-option label="Total Reimbursement Price" value="Total Reimbursement Price"></el-option>
                                            <el-option label="Subcontractors, Tools/Equipment & Materials Prices " value="Subcontractors, Tools/Equipment & Materials Prices"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24" v-if="PurchaseEnquiryLine.TypeOfServicesContract == 'Cost-plus fixed fee contract'" >
                                <div class="grid-content">
                                    <el-form-item style="font-weight: bolder" label="temp" prop="EnquiryFromItemMaster">
                                        <span slot="label"><b>Vendors’ Commercial Offer Required Format</b></span>
                                        
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.VendorCommercialOffer" placeholder="Please Select One OF Below">
                                                
                                            <el-option label="Total Contract Price + Fee (in %)" value="Total Contract Price + Fee (in %)"></el-option>
                                            <el-option label="Subcontractors, Tools/Equipment & Materials Prices + Fee (in %)" value="Subcontractors, Tools/Equipment & Materials Prices + Fee (in %)"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <div class="grid-content">
                                    <table class="table-table table table-striped thead-inverse dataex-res-configuration bg-white">
                                        <thead class="text-white bg-dark">
                                            <tr style="width:25%">
                                                <th><span style="color:white">*</span>Header Name:
                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                            
                                                        </span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2">
                                                                These headers help better 
                                                                describe the required Services, as well as the conditions of award. They can include 
                                                                Scope of Works, Duration/Term, Activities, Inclusions, Exclusions, SLAs (Service Level 
                                                                Agreements), KPIs (Key Performance Indicators), Penalty Matrixes, Manpower Skills, 
                                                                Vendors Offers’ Contents, Quantity, Invoicing Instructions.....
                                                            </span>
                                                        </span>
                                                    </span>
                                                </th>
                                                <th style="width:70%">Content</th>
                                                <th class="text-center" width="70"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(header, index) in PurchaseEnquiryLine.ContractHeaders"
                                                :key="index">
                                                <td>
                                                    <input v-model="header.name" class="form-control">
                                                </td>
                                                <td>
                                                    <input v-model="header.contant" class="form-control">
                                                </td>
                                                <td class="text-center">
                                                    <button style="margin-top: 5px" type="button" @click="deleteContractHeader(index)" class="btn-pointer btn-danger btn-floating">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-control" v-model="contractheader.name">
                                                </td>
                                                <td>
                                                    <input class="form-control" v-model="contractheader.contant">
                                                </td>
                                                <td class="text-center">
                                                    <button v-if="contractheader.contant" style="margin-top: 5px" @click.prevent="addContractHeader()" class="btn-pointer btn-success btn-floating"><i class="fa fa-plus"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </el-col>

                            <!-- <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <div class="grid-content">

                                    <el-form-item label="temp" prop="PELineNote">
                                        <span slot="label"><b>Title</b></span>
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Title"
                                            v-model="PurchaseEnquiryLine.Title">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </el-col> -->
                            
                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="AdvancedPayment">
                                        <span slot="label"><b>Will You Consider Offering An Advanced Payment For This Service?</b></span>

                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="PurchaseEnquiryLine.AdvancedPayment" placeholder="Advanced Payment Offered?">
                                                
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <el-form-item label="temp">
                                    <span slot="label"><b>Select the Delivery Location Address On The Map</b></span>

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

                                    <button v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" type="button"  data-toggle="modal" id="get_map" data-target="#DeliveryLocation" class="btn btn-primary btn-block waves-effect text-center">Select Delivery Location</button>
                                </el-form-item>
                            </el-col>


                            <!-- Delivery Location Selection -->
                            <el-col  :span="12" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <el-form-item label="temp" prop="Longitude">
                                    <span slot="label"><b>Delivery Longitude</b></span>
                                    <el-input type="number" readonly  placeholder="Enter Location Longitude Or Select From Map" v-model="PurchaseEnquiryLine.Longitude"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col  :span="12" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <el-form-item label="temp" prop="Latitude">
                                    <span slot="label"><b>Delivery Latitude</b></span>
                                    <el-input type="number"  readonly placeholder="Enter Location Longitude Or Select From Map" v-model="PurchaseEnquiryLine.Latitude"></el-input>
                                </el-form-item>
                            </el-col>


                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
                                <el-form-item label="temp" prop="LocationName">
                                    <span slot="label"><b>Location Name</b></span>
                                    <el-input type="text" placeholder="Enter Location Name" v-model="PurchaseEnquiryLine.LocationName"></el-input>
                                </el-form-item>
                            </el-col>


                            <el-col :span="24" v-if="PurchaseEnquiryLine.EnquiryType == 'Materials' || PurchaseEnquiryLine.EnquiryType == 'Service'" >
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

                           <button v-if="PurchaseEnquiryLine.EnquiryType == 'Materials'" type="button" @click="AddItem" class="btn btn-success btn-block waves-effect text-center">Add The Line To The Purchase Enquiry</button>

                           <button v-if="PurchaseEnquiryLine.EnquiryType == 'Service'" type="button" @click="SubmitService" class="btn btn-success btn-block waves-effect text-center">Submit Purchase Enquiry For Service</button>


                        </el-row>
                    </el-form>

                </div>
            </div>

            <div class="card" v-else>
                <div class="card-header">
                    <h4>Create A Purchase Enquiry Line</h4>
                </div>
                <div class="card-body">
                    <el-row :gutter="20">  
                        <el-col :span="24">
                            <h3 align="center" class="text-success">Gathering Required Details...</h3>
                        </el-col>
                    </el-row>
                </div>
            </div>
        </div>

        <!-- List of PEs in the list -->
        <div id="Purchase_Enqiury_List" class="col-lg-5">
            <div v-stick-in-parent="stikyKit">
                <el-row v-if="PurchaseEnquiryAll.length > 0" :gutter="20">
                    <el-col :span="24">
                        <div class="card">
                            <div class="card-header">
                                <h4>Purchase Enquiry Lines</h4>
                            </div>
                            <div id="Purchase_Enqiury_List_Table" class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr.</th>
                                            <th>Material</th>
                                            <th>Qty</th>
                                            <th>Ex.Price {{this.projectcurrency.substring(0, 3)}}</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(PurchaseEnquiry, key, index) in PurchaseEnquiryAll" :key="index">
                                            <td>{{ key + 1 }}</td>
                                            <td v-if="PurchaseEnquiry.ItemNumber != ''">
                                                <span v-if="PurchaseEnquiry.ItemLibraryDescription.company.lom_prefix == null">LoM</span>
                                                <span v-else>{{ PurchaseEnquiry.ItemLibraryDescription.company.lom_prefix }}</span>-{{ PurchaseEnquiry.ItemLibraryDescription.item_group_id }}-{{ PurchaseEnquiry.ItemLibraryDescription.item_ingroup_id }}</td>
                                            <td v-else>{{ PurchaseEnquiry.ItemDescription.substring(0, 20) + '...' }}</td>
                                            <td>{{ PurchaseEnquiry.Quantity }}</td>
                                            <td v-if="PurchaseEnquiry.EnquiryFromItemMaster == 'Yes'">{{ formatPrice(PurchaseEnquiry.RateContractSelected.unit_rate * PurchaseEnquiry.Quantity)}}</td>
                                            <td v-else> - </td>
                                            <td width="25%">
                                                <a class="btn btn-warning float-left" href="#" @click="showPEDetails(key, $event)"><i class="fa fa-info"></i></a>
                                                <a class="btn btn-danger float-left m-l-5" href="#" @click="RemovePE(key, $event)"><i class="fa fa-remove"></i></a> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p v-if="this.TotalExpectedPrice">Total Expected Cost For the Lines With Rates Contracts, Past Purchase Orders or Past Vendors’ Offers:<b class="font-weight-bold"> {{formatPrice(this.TotalExpectedPrice)}} {{this.projectcurrency}}</b></p>
                            </div>
                            <div class="card-footer">
                                <button type="button" @click="SubmitPEList" class="btn btn-primary btn-block waves-effect text-center">Submit The Purchase Enquiry For Approval</button>
                            </div>
                        </div>
                    </el-col>
                </el-row>
                <el-row v-else :gutter="20">
                    <div class="card">
                        <div class="card-header">
                            <h4>Purchase Enquiry Details</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><b>Line.</b></th>
                                        <th><b>Item Info</b></th>
                                        <th><b>Quantity</b></th>
                                        <th><b>Actions</b></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center" colspan="4">Purchase Enquiry List is Empty</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-primary btn-block waves-effect text-center disabled">Submit The Purchase Enquiry For Approval </button>
                        </div>
                    </div>
                 </el-row>
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

        <div class="modal fade" id="PEDetailsModalId" tabindex="-1" aria-labelledby="PEDetailsModalId" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="PELineShow">
                    <div class="modal-header">
                        <div style="width:50%">
                            <h4 style="margin-top:10px" class="modal-title text-ogeo">Material Purchase Enquiry Line Information ID# {{ PEModalInfoKey + 1 }}</h4>
                        </div>
                        <div style="width:50%">
                            <img :src="hostName+'/uploads/Logos/'+this.CompanySetup.logo" style="width:50px;height:50px;margin-left:50px;">
                        </div>
                        <div>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Set-up Name: </b></td>
                                        <td>{{ JobNumbers[PEModalInfo.JobNumber] }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Underlying Transaction: </b></td>
                                        <td>{{ PEModalInfo.UnderlyingTransaction }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Sourcing Priority: </b></td>
                                        <td>{{ PEModalInfo.SourcingPriority }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Enquiry Type: </b></td>
                                        <td>{{ PEModalInfo.EnquiryType }}</td>
                                    </tr>
                                    <tr v-if="PEModalInfo.EnquiryFromItemMaster == 'Yes'">
                                        <td><b>Material Details: </b></td>
                                        <td>
                                            <span><span v-if="PEModalInfo.ItemLibraryDescription.company.lom_prefix == null">LoM</span><span v-else>{{ PEModalInfo.ItemLibraryDescription.company.lom_prefix }}</span>-{{ PEModalInfo.ItemLibraryDescription.item_group_id }}-{{ PEModalInfo.ItemLibraryDescription.item_ingroup_id }}</span><br>

                                            <span>
                                                <template v-for="index in 20">      
                                                    <span v-if="PEModalInfo.ItemLibraryDescription.item_template['field_'+index] !== 'Ogeo-None'">
                                                        <b>{{ PEModalInfo.ItemLibraryDescription.item_template['field_'+index] }}:</b> {{ PEModalInfo.ItemLibraryDescription['field_'+index] }} | 
                                                    </span>
                                                </template>
                                            </span><br><br>
                                            <span><b>Quantity:</b> {{ PEModalInfo.Quantity }}</span><br> <br>
                                            <span><b>Unit of Measurement:</b> {{ PEModalInfo.ItemLibraryDescription.u_o_m }}</span><br>
                                            <span><img :src="'/uploads/ItemMasterPictures/'+PEModalInfo.ItemLibraryDescription.picture" class="img-rounded img-responsive"></span><br>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td><b>Material Details: </b></td>
                                        <td class="dont-break-out">
                                            <span> {{ PEModalInfo.ItemDescription }}</span><br><br>
                                            <span><b>Quantity:</b> {{ PEModalInfo.Quantity }}</span><br><br>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span><b>Unit of Measurement:</b> {{ PEModalInfo.UnitOfMeasurement }}</span><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Is Advanced Payment Considered? </b></td>
                                        <td>{{ PEModalInfo.AdvancedPayment }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>What Is The Percentage Of Retention Payment? </b></td>
                                        <td v-if="PEModalInfo.RetentionPercentage != ''">{{ PEModalInfo.RetentionPercentage }}%</td>
                                        <td v-else>0%</td>
                                    </tr>
                                    <tr>
                                        <td><b>Retention Timeframe: </b></td>
                                        <td v-if="PEModalInfo.RetentionDays != ''">{{ PEModalInfo.RetentionDays }} Day(s) From The Date Of Full Delivery.</td>
                                        <td v-else>0 Day(s)</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr align="center" v-if="PEModalInfo.Images.length > 0">
                                        <td v-for="(img, index) in PEModalInfo.Images">
                                            <img class="img-responsive" style="width: 7vw;height: 7vw; text-align: center;" :src="img">
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td width="40%"><b>Required Documents: </b></td>
                                        <td v-if="PEModalInfo.RequiredDocuments.length > 0">
                                            <ul v-for="(document, index) in PEModalInfo.RequiredDocuments">
                                                <li>{{ document }}</li>
                                            </ul>
                                        </td>
                                        <td v-else>
                                            No Documents Required
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Additional Note: </b></td>
                                        <td>{{ PEModalInfo.PELineNote }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Delivery Adress Details: </b></td>
                                        <td>
                                            <span><b>Location Name:</b> {{ PEModalInfo.LocationName }}</span><br>
                                            <span><b>Longitude:</b> {{ PEModalInfo.Longitude }}</span><br>
                                            <span><b>Latitude:</b> {{ PEModalInfo.Latitude }}</span><br>  
                                            
                                        </td>
                                    </tr>
                                    <tr v-if="PEModalInfo.EnquiryFromItemMaster == 'Yes'">
                                        <td><b>Expected Cost: </b></td>
                                        <td>{{ formatPrice(PEModalInfo.RateContractSelected.unit_rate * PEModalInfo.Quantity) }} {{this.projectcurrency}} <small>From Rate Contracts</small> </td>
                                    </tr>
                                    <tr v-else>
                                        <td><b>Expected Cost: </b></td>
                                        <td>There are no valid Rate Contract(s) for this material.</td>
                                    </tr>
                                    <tr v-if="PEModalInfo.EnquiryFromItemMaster == 'Yes'">
                                        <td><b>List of Valid Rates Contract</b></td>
                                        <table>
                                            <tr v-for="(item, index) in RateContractSelection.filter(i=>i.value != PEModalInfo.RateContractSelected.value)" :key="index">
                                                <td>Unit Rate: {{ item.unit_rate }} </td>
                                                <td>Vendor Name: {{ item.vendor_name }}</td>
                                            </tr>
                                        </table>
                                    </tr>
                                    <tr v-if="PEModalInfo.EnquiryFromItemMaster == 'Yes'">
                                        <td><b>Selected Rate Contract </b></td>
                                        <td>
                                            <span><b>Unit Rate:</b> {{ formatPrice(PEModalInfo.RateContractSelected.unit_rate) }}  {{this.projectcurrency}}</span><br>
                                            <span><b>Vendor Name:</b> {{ PEModalInfo.RateContractSelected.vendor_name }}</span><br>
                                            <span><b>Lead Time:</b> {{ PEModalInfo.RateContractSelected.lead_time }}</span><br>
                                            <span><b>Date:</b> {{ PEModalInfo.RateContractSelected.date }}</span><br>
                                            <span><b>Vendor Score:</b> {{ PEModalInfo.RateContractSelected.vendor_score }}</span><br>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                        
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
            </div>v 
        </div>

    </div>


            
</template>

<script>
    
    //import { CustomJs } from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'new-purchase-enquiry',
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
            return {

                hostName: window.location.protocol+'//'+window.location.hostname,
                CompanySetup: {},
                stikyKit: {
                    options: {
                        offset_top: 140
                    },
                },
                JobNumbers: [],
                FoundItems: {},
                ProjectDetailsLoaded: false,
                ItemRateContractDetails: [],
                RateContractDataLoaded: false,
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                PELineShow: false,
                RateContractSelection: [
					{
			          value: 1,
			          vendor_name: 'Gucci',
			          vendor_score: '25',
			          unit_rate: '25',
			          lead_time: '1 Day',
			          rate_contract_reference: 'Gucci',
			          date: '17 june 2022',
			        },
                    {
			          value: 2,
			          vendor_name: 'Versace',
			          vendor_score: '30',
			          unit_rate: '30',
			          lead_time: '2 Days',
			          rate_contract_reference: 'Versace',
			          date: '25 march 2022',
			        },
                    {
			          value: 3,
			          vendor_name: 'Nike',
			          vendor_score: '10',
			          unit_rate: '10',
			          lead_time: '5 Days',
			          rate_contract_reference: 'Nike',
			          date: '09 july 2023',
			        }

				],
                PurchaseEnquiryLine: {
                    JobNumber: "",
                    SetupName: "",
                    UnderlyingTransaction: "",
                    ServiceOneOff: "",
                    SourcingPriority: "Standard",
                    EnquiryType: "",
                    StoreItemrequest: "No",
                    EnquiryFromItemMaster: "",
                    ItemNumber: "",
                    ItemLibraryDescription: "",
                    ItemDescription: "",
                    Quantity: "",
                    Images:[],
                    UnitOfMeasurement: "",
                    ServiceDescription: "",
                    AdvancedPayment: "",
                    RetentionPercentage: "",
                    RetentionDays: "",
                    RequiredDocuments: "",
                    PELineNote: "",
                    Longitude: '',
                    Latitude: '',
                    LocationName: '',
                    ShowPopUpIgnoreRateContract: '',
                    RateContractSelected: '',
                    TypeOfServicesContract: '',
                    ContractHeaders:[],
                    Title: '',
                    VendorCommercialOffer:'',

                },
                minVal: '',
                testdata: [],
                PurchaseEnquiryAll: [],
                PEModalInfoKey: "",
                PEModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    JobNumber: [{
                        required: true, message: "Please Select A Set-up", trigger: ["blur"]
                    }],
                    ServiceTimePeriod: [{
                        required: true,
                        message: "Please Select",
                        trigger: "blur"
                    }],
                    VendorCommercialFormat: [{
                        required: true,
                        message: "Please Vendor Commercial Format",
                        trigger: "blur"
                    }],
                    TypeOfServicesContract: [{
                        required: true,
                        message: "Please Type Of Services Contract",
                        trigger: "blur"
                    }],
                    UnderlyingTransaction: [{
                        required: false,
                        message: "Please Underlying Transaction",
                        trigger: "blur"
                    }],
                    ContractHeaders: [{
                        required: true,
                        message: "Please Header",
                        trigger: "blur"
                    }],
                    Images: [{
                        required: true,
                        message: "Please Select Image",
                        trigger: "blur"
                    }],
                    SourcingPriority: [{
                        required: true,
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
                        required: false,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    Latitude: [{
                        required: false,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    LocationName: [{
                        required: false,
                        message: "Please Enter Location Name.",
                        trigger: "blur"
                    }]
                },
                showQuestionRateMaterial: false,
                RateContractPurcase: [],
                TotalExpectedPrice: '',
                contractheader: {
                    name: '',
                    contant: '',
                },
                projectcurrency: '',
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            },
        },
        methods: {
            getProjectCurrency()
            {
                axios.get('/api/data/get-project-currency/' + this.PurchaseEnquiryLine.JobNumber)
                .then((response) => {
                    this.projectcurrency = response.data[0]
                })
            },
            addContractHeader() {
                if (this.existContractHeader() == true) {
                    this.PurchaseEnquiryLine.ContractHeaders.push({
                        name: this.contractheader.name,
                        contant: this.contractheader.contant,
                    })
                    this.contractheader.name = ''
                    this.contractheader.contant = ''
                } else {
                    Swal('Error', 'This Contract Header already exist.' , 'error'); 
                }
            },
            deleteContractHeader(index) {
                this.$delete(this.PurchaseEnquiryLine.ContractHeaders, index);
            },
            existContractHeader() {
                if (this.PurchaseEnquiryLine.ContractHeaders.find(item => item.name === this
                        .contractheader.name)) {
                    return false;
                } else {
                    return true;
                }
            },
            ShowPopUpIgnoreRateContract()
            {
                if(this.PurchaseEnquiryLine.ShowPopUpIgnoreRateContract == "No")
                {
                    Swal('Warning', 'Please Note That You Have Ignored Rates Contracts With A Lower Unit Rate.' , 'error'); 
                }
            },
            checkRateContract()
            {
                event.preventDefault();

                axios.post('/api/data/check_item_rate_contract_details', this.PurchaseEnquiryLine.ItemNumber)
                    .then((response) => {
                        if(response.data)
                        {
                            this.showQuestionRateMaterial = false
                        }
                        else
                        {
                            this.showQuestionRateMaterial = true
                        }
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Getting Item Rate Contract Details)', 'error');
                    });

            },
            checkLowestRateContract()
            {

                var numbers = [25, 30, 10];
							
                var sorted = numbers.slice().sort(function(a, b) {
                return a - b;
                });

                var smallest = sorted[0],                      
                    secondSmallest = sorted[1],                
                    secondLargest = sorted[sorted.length - 2], 
                    largest  = sorted[sorted.length - 1];
                if(this.PurchaseEnquiryLine.RateContractSelected.unit_rate > smallest)
                {
                    Swal('Warning', 'Please Note That You Have Ignored Rates Contracts With A Lower Unit Rate.' , 'error'); 
                }

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
            EnquiryTypeSelection: function(){
                
                if(this.PurchaseEnquiryLine.EnquiryType == "Service"){
                    $('#Purchase_Enqiury_List').addClass('animated fadeOutRight');
                    setTimeout(function() {
                        $('#Purchase_Enqiury_Form').removeClass('col-lg-7').addClass('col-lg-12');
                    }, 100);

                } else {
                    if($('#Purchase_Enqiury_List').hasClass('animated')){
                        $('#Purchase_Enqiury_List').removeClass('animated fadeOutRight');
                        $('#Purchase_Enqiury_List').addClass('animated fadeInRight');
                        $('#Purchase_Enqiury_Form').removeClass('col-lg-12').addClass('col-lg-7').delay(500);
                    }
                }
            },
            handleChange(file,fileList){

                const isJPG = file.raw.type === 'image/jpeg';
                const isPNG = file.raw.type === 'image/png';
                const isLt2M = file.raw.size / 1024 / 1024 < 2;

                if ((isJPG || isPNG) && isLt2M) {

                var image_array=[];
                for(var i=0;i<fileList.length;i++){

                    const reader=new FileReader();
                    reader.readAsDataURL(fileList[i].raw);
                    reader.onload = function(e) {
                            var rawLog = reader.result;
                            image_array.push(rawLog);
                        };
                    
                    }
                    //  console.log(image_array);
                    this.PurchaseEnquiryLine.Images=image_array;
                }
                else {
                    
                    fileList.shift();
                    fileList.shift();
                    this.imageUrl = "";
                    
                    this.$message.error('Avatar picture must be JPG or PNG format with size not exceeding 1MB!!');
                    return false;
                }
                  
            },
            	handleExceed: function(files, fileList){
                Swal('The Limit is ' + fileList.length , 'You can’t upload more than 4 pictures of the material.'  , 'warning'); 
            },
            handleRemove(file, fileList) {
                var image_array=[];
                for(var i=0;i<fileList.length;i++){

                const reader=new FileReader();
                reader.readAsDataURL(fileList[i].raw);
                reader.onload = function(e) {
                        var rawLog = reader.result;
                          image_array.push(rawLog);
                    };
                
             
                  
                }
                  this.PurchaseEnquiryLine.Images=image_array;
               
              
            },
            AddItem: function() {

                // if(this.CompanySetup.lom_manditory == 'LibrariesNFreeText'){
                //     if(this.PurchaseEnquiryLine.ItemNumber == "" && this.PurchaseEnquiryLine.ItemDescription == ""){
                //         Swal('Missing Item Information', 'Please Select an item from the list or enter item description', 'error');
                //         return false;
                //     }
                // }
                if(this.PurchaseEnquiryLine.EnquiryFromItemMaster == 'Yes')
                {
                    axios.post('/api/purchase_enquiry/check_purchase_in_past', this.PurchaseEnquiryLine)
                    .then(function(response){
                        if(response.data)
                        {
                            this.RateContractPurcase = response.data
                        }
                    })
                    if(this.PurchaseEnquiryLine.RateContractSelected)
                    {
                        Swal('Selected Rates Contract', 'Unit Rate: '+ '<b>'+this.PurchaseEnquiryLine.RateContractSelected.unit_rate+' '+ this.projectcurrency+'</b>' + '<br>Expected Cost: ' + '<b>'+this.PurchaseEnquiryLine.Quantity * this.PurchaseEnquiryLine.RateContractSelected.unit_rate+' '+this.projectcurrency+'</b>', 'warning');

                    }
                }

                



                // if(this.PurchaseEnquiryLine.Latitude == ""){
                //     Swal('Missing Map Location', 'Please Select a Location on Map to create PE Line', 'warning');
                //     return false;
                // }

                this.$refs.PurchaseEnquiryForm.validate((validation) => {




                    if(validation){

                        // Getting Item Description of the selected item
                        if(this.PurchaseEnquiryLine.EnquiryFromItemMaster == "Yes"){
                            let selectedItem = this.FoundItems.find(obj => obj.id == this.PurchaseEnquiryLine.ItemNumber);
                            this.PurchaseEnquiryLine.ItemLibraryDescription = selectedItem;
                          
                        }


                        /* Add Setupname */
                        //this.PurchaseEnquiryLine.SetupName = $('#SetupSelection option:selected').text();

                        this.PurchaseEnquiryAll.push(Object.assign({}, this.PurchaseEnquiryLine));
                        // console.log(this.PurchaseEnquiryAll);
                        /*this.PurchaseEnquiryLine.UnderlyingTransaction = "";
                        /*this.PurchaseEnquiryLine.SourcingPriority = "Standard";
                        this.PurchaseEnquiryLine.ItemNumber = "";
                        this.PurchaseEnquiryLine.ItemLibraryDescription= "",
                        this.PurchaseEnquiryLine.EnquiryFromItemMaster = "";
                        this.PurchaseEnquiryLine.ItemDescription = "";
                        this.PurchaseEnquiryLine.Quantity = "";
                        this.PurchaseEnquiryLine.UnitOfMeasurement = "";
                        this.PurchaseEnquiryLine.ServiceDescription = "";
                        this.PurchaseEnquiryLine.AdvancedPayment = "";
                        this.PurchaseEnquiryLine.RetentionPercentage = "";
                        this.PurchaseEnquiryLine.RequiredDocuments = "";
                        this.PurchaseEnquiryLine.PELineNote = "";
                        this.PurchaseEnquiryLine.Longitude = "";
                        this.PurchaseEnquiryLine.Latitude = "";
                        this.PurchaseEnquiryLine.LocationName = "";*/

                        // this.scrollTo(0, 1000);
                        // totalExpectedPrice(){
                            // alert('enter');
                            var sum=0;
                            // var event = this.PurchaseEnquiryAll;
                            this.PurchaseEnquiryAll.forEach(function (element) {
                                sum = parseInt(sum) + (element.RateContractSelected.unit_rate * element.Quantity)
                                console.log(sum)
                            })
                            this.TotalExpectedPrice = sum;
                        // }
                    }
                })
            },
            SubmitService() {
                if(this.PurchaseEnquiryLine.ContractHeaders[0])
                {
                    if (event) event.preventDefault();

                    this.PurchaseEnquiryAll.push(Object.assign({}, this.PurchaseEnquiryLine));

                    axios.post('/api/purchase_enquiry/post_purchase_enquiry_request', this.PurchaseEnquiryAll)
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
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Service Purchase Enquiry Submit)', 'error');
                        });   
                }
                else
                {
                    Swal('Error Occured', 'Please Fill All Mandatory Field!', 'error');
                }
                

                // this.PurchaseEnquiryAll = "";
                // this.PurchaseEnquiryLine.JobNumber = "";
                // this.PurchaseEnquiryLine.UnderlyingTransaction = "";
                // this.PurchaseEnquiryLine.SourcingPriority = "Standard";
                // this.PurchaseEnquiryLine.EnquiryType = "";
                // this.PurchaseEnquiryLine.EnquiryFromItemMaster = "";
                // this.PurchaseEnquiryLine.ItemNumber = "";
                // this.PurchaseEnquiryLine.ItemLibraryDescription = "",
                // this.PurchaseEnquiryLine.ItemDescription = "";
                // this.PurchaseEnquiryLine.Quantity = "";
                // this.PurchaseEnquiryLine.UnitOfMeasurement = "";
                // this.PurchaseEnquiryLine.ServiceDescription = "";
                // this.PurchaseEnquiryLine.AdvancedPayment = "";
                // this.PurchaseEnquiryLine.RetentionPercentage = "";
                // this.PurchaseEnquiryLine.RetentionDays = "";
                // this.PurchaseEnquiryLine.RequiredDocuments = "";
                // this.PurchaseEnquiryLine.PELineNote = "";
                // this.PurchaseEnquiryLine.Longitude = "";
                // this.PurchaseEnquiryLine.Latitude = "";
                //   this.PurchaseEnquiryLine.Images = [];
                // this.PurchaseEnquiryLine.LocationName = "";
                // this.ItemRateContractDetails = [];
                // this.RateContractDataLoaded = false;

                if(this.CompanySetup.setup_mode == 'Company Wide'){
                    this.PurchaseEnquiryLine.JobNumber = Object.keys(this.JobNumbers)[0];
                }

            },
            formatPrice(value) {
                let val = (value/1).toFixed(2).replace(',', '.')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            },
            showPEDetails: function(key, event) {
                if (event) event.preventDefault();

                this.PEModalInfoKey = key;
                this.PEModalInfo = Object.assign({}, this.PurchaseEnquiryAll[key]);
                this.$forceUpdate();

                this.PELineShow = true;

                $('#PEDetailsModalId').modal('toggle');

            },
            RemovePE: function(key, event) {
                if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This Will Remove This Line From The Purchase Enquiry.",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Remove It!'
                }).then((result) => {
                    if (result.value) {
                        this.PurchaseEnquiryAll.splice(key, 1);
                    }
                })

            },
            SubmitPEList() {
                if (event) event.preventDefault();
                // console.log(this.PurchaseEnquiryAll);
                axios.post('/api/purchase_enquiry/post_purchase_enquiry_request', this.PurchaseEnquiryAll)
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Purchase Enquiry Submit)', 'error');
                    });

                //Clear All Data
                this.PurchaseEnquiryAll = "";
                this.PurchaseEnquiryLine.JobNumber = "";
                this.PurchaseEnquiryLine.UnderlyingTransaction = "";
                this.PurchaseEnquiryLine.SourcingPriority = "Standard";
                this.PurchaseEnquiryLine.EnquiryType = "";
                this.PurchaseEnquiryLine.EnquiryFromItemMaster = "";
                this.PurchaseEnquiryLine.ItemNumber = "";
                this.PurchaseEnquiryLine.ItemLibraryDescription = "",
                this.PurchaseEnquiryLine.ItemLibraryUnitOfMeasurement = "",
                this.PurchaseEnquiryLine.ItemDescription = "";
                this.PurchaseEnquiryLine.Quantity = "";
                this.PurchaseEnquiryLine.UnitOfMeasurement = "";
                this.PurchaseEnquiryLine.ServiceDescription = "";
                this.PurchaseEnquiryLine.AdvancedPayment = "";
                this.PurchaseEnquiryLine.RetentionPercentage = "";
                this.PurchaseEnquiryLine.RequiredDocuments = "";
                this.PurchaseEnquiryLine.PELineNote = "";
                this.PurchaseEnquiryLine.Longitude = "";
                this.PurchaseEnquiryLine.Latitude = "";
                this.PurchaseEnquiryLine.LocationName = "";
                this.ItemRateContractDetails = [];
                this.RateContractDataLoaded = false;
                this.PurchaseEnquiryAll = [];

                if(this.CompanySetup.setup_mode == 'Company Wide'){
                    this.PurchaseEnquiryLine.JobNumber = Object.keys(this.JobNumbers)[0];
                }

            },
            scrollTo: function(to, duration) {

                const
                element = document.scrollingElement || document.documentElement,
                start = element.scrollTop,
                change = to - start,
                startDate = +new Date(),
                // t = current time
                // b = start value
                // c = change in value
                // d = duration
                easeInOutQuad = function(t, b, c, d) {
                    t /= d/2;
                    if (t < 1) return c/2*t*t + b;
                    t--;
                    return -c/2 * (t*(t-2) - 1) + b;
                },
                animateScroll = function() {
                    const currentDate = +new Date();
                    const currentTime = currentDate - startDate;
                    element.scrollTop = parseInt(easeInOutQuad(currentTime, start, change, duration));
                    if(currentTime < duration) {
                        requestAnimationFrame(animateScroll);
                    }
                    else {
                        element.scrollTop = to;
                    }
                };
                animateScroll();
            },
            EnquiryItemDescriptionSelection(){

                this.PurchaseEnquiryLine.ItemNumber = "";
                this.PurchaseEnquiryLine.ItemDescription = "";
                
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

            }
        },
        mounted(){

            //CustomJs();

            let self = this;

            axios.get('/api/data/get_user_projects_list')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    // console.log(this.JobNumbers);
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {

                        this.CompanySetup = SecondResponse.data;

                        if(this.CompanySetup.lom_manditory == 'Libraries'){
                            this.rules.ItemNumber[0].required = true;
                        } else if (this.CompanySetup.lom_manditory == 'FreeText') {
                            this.rules.ItemDescription[0].required = true;
                        } else {
                            this.rules.ItemNumber[0].required = false;
                            this.rules.ItemDescription[0].required = false;
                        }

                        if(this.CompanySetup.additional_required_1 == "Yes"){
                           this.rules.UnderlyingTransaction[0].required = false; 
                        }

                        self.ProjectDetailsLoaded = true;

                    });
                });


            /*
             * Google Map inside modal
             */
            var initializeMap = function(id) {

                var myLatLng = {lat: 25.2707688, lng: 55.3227913};

                // Map Options
                var mapOptions = {
                    zoom: 10,
                    center: new google.maps.LatLng(25.2707688, 55.3227913),
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

            };

            google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));
            
        },
        beforeRouteLeave (to, from, next) {

            if(this.PurchaseEnquiryAll.length > 0 || this.PurchaseEnquiryLine.EnquiryType != ""){
                Swal({
                    title: 'Navigate Away?',
                    text: "Are you sure you want to navigate away, all unsubmitted data will be lost?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Remove It!'
                }).then((result) => {
                    if (result.value) {
                        next()
                    } else {
                        next(false)
                    }
                })
            } else {
                next();
            }
        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));
            
            if(currentUser.hasOwnProperty('PRO')){
                next();
            } else if (currentUser.hasOwnProperty('PRV')) {
                next('/app/purchase_enquiry/list');
            } else {
                next('/app/dashboard');
            }
            
        }
    }

</script>
<style>
    @media print {
      body * {
          visibility: hidden;
      }
      #PEDetailsModalId, #PEDetailsModalId * {
        visibility: visible;
      }
      #PEDetailsModalId {
        position: absolute;
        left: 0;
        top: 0;
      }
    }
</style>
<style scoped>

    #Purchase_Enqiury_List_Table{
        max-height: 570px;
        overflow-y: scroll;
    }

    #Purchase_Enqiury_Form{
        -webkit-transition: max-width 0.8s;
        -moz-transition: max-width 0.8s;
        transition: max-width 0.8s;
        overflow:hidden;
    }

    #map-canvas {
        width: 100%;
        height: 450px;
        margin: 0 auto;
    }
    
    #DeliveryLocation .modal-dialog {
        min-width:80%;
    }

    #PEDetailsModalId .modal-dialog {
        min-width:80%;
    }

    .itemTable >tr>td{
      height:20px;
      padding:0px;
      border-top: 0px;
    }
    
    .el-select-dropdown{
        z-index: 1 !important;
       
    }
  

    .el-popper {
        z-index: 1 !important;
        
    }

    .el-scrollbar {
        overflow-y: auto;
        max-width: 1200px !important;
        max-height: 500px !important;
        z-index: 1;
    }
    .el-scrollbar__wrap{
        max-width: 1200px !important;
        max-height: 500px !important;
        z-index: 1;
    }

    .el-select-dropdown__item{
        height: 100% !important;
        z-index: 1;
    }

    .el-select-dropdown__wrap{
        max-height: 800px !important;
        z-index: 1;
    }

    .el-select-dropdown .el-popper {
        max-width: 700px !important;
        z-index: 1;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }



    .dont-break-out {

      /* These are technically the same, but use both */
      overflow-wrap: break-word;
      word-wrap: break-word;

      -ms-word-break: break-all;
      /* This is the dangerous one in WebKit, as it breaks things wherever */
      word-break: break-all;
      /* Instead use this non-standard one: */
      word-break: break-word;

      /* Adds a hyphen where the word breaks, if supported (No Blink) */
      -ms-hyphens: auto;
      -moz-hyphens: auto;
      -webkit-hyphens: auto;
      hyphens: auto;

    }

</style>