<template>
        
    <div class="row">
        <div id='Rate_Contract_Request_Form' class="col-lg-7">
            <div class="card" v-if="CompanyDetailsLoaded">
                <div class="card-header">
                    <h4>Create a Rates Contracts Creation Request</h4>
                </div>
                <div class="card-body" v-if="this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'">
                    <el-form :model="RateContractItemLine" class="demo-form-inline" :rules="rules" ref="RateContractRequestForm">

                        <el-row :gutter="20">  


                            <el-col :span="24">
                                <div class="grid-content">

                                            <el-form-item label="temp" prop="JobNumber">
                                            <span slot="label"><b>Select A Set-up</b></span>


                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="RateContractItemLine.JobNumber" placeholder="Select Set up ">
                                            
                                            <el-option v-for="(JobNumber, JobNumberId) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>                      
        
                            

                            <el-col :span="12">
												<div class="grid-content">
													<el-form-item prop="CompanyCountries">
														<span slot="label"><b>Select Country</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">These will be the names of the country out of which the organization operates.</span>
															</span>
                                    					</span>
													    <!-- <el-select filterable collapse-tags @change="getCities()" style="width: 100%; padding: 0px;" v-model="FirstStepData.CompanyCountry" placeholder="Select Country"> -->
													    <el-select filterable collapse-tags @change="getCities()" style="width: 100%; padding: 0px;" v-model="RateContractItemLine.CompanyCountry" placeholder="Select Country">
															
													    	
															<el-option
													    		v-for="(item,CompanyCountry) in countries"
															    :key="CompanyCountry"
															    :label="CompanyCountry"
															    :value="CompanyCountry">
													    		<span style="float: left">{{ CompanyCountry }}</span>
													    	</el-option>

															
														</el-select>
											      	</el-form-item>
												</div>
											</el-col>

                                            <el-col :span="12">
												<div class="grid-content">
													<el-form-item prop="CompanyCities">
														<span slot="label"><b>Select Cities</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">These will be the names of the cities out of which the organization operates.</span>
															</span>
                                    					</span>
													    <!-- <el-select filterable collapse-tags multiple style="width: 100%; padding: 0px;" v-model="FirstStepData.companyCity" placeholder="Select City"> -->
													    <el-select filterable collapse-tags multiple style="width: 100%; padding: 0px;" v-model="RateContractItemLine.CompanyCitys" placeholder="Select City">
															
													    	<el-option
														      v-for="(item,companyCity) in cities"
														      :key="companyCity"
															  :value="companyCity"
														      :label="item">
															<span style="float: left">{{ item }}</span>
														    </el-option>
															
														</el-select>
											      	</el-form-item>
												</div>
											</el-col>

                            <el-col :span="24" >
                                <div class="grid-content">

                                    <!-- <el-form-item label="What should be the term, in months,of the requested Rates Contract?" prop="RateContractItemPeriod"> -->
                                        
                                           <el-form-item label="temp" prop="RateContractItemPeriod">
                                            <span slot="label"><b>What should be the term, in months,of the requested Rates Contract?</b></span>
                                        
                                         <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success"> <span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                    Rates Contracts signed on the back of this request will be valid for this term,starting from the date of the Rates Contract implementation.
                                                </span>
                                            </span>
                                        </span>
                                        <el-input  type="number" placeholder="Enter Expected term" v-model="RateContractItemLine.RateContractItemPeriod">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>
                            

                            <el-col :span="24">
                                <div class="grid-content" >
                                    <!-- <el-form-item label="Do you want to have a volume-discount clause in the requested Rates Contract?" prop="volume_discount"> -->
                                            

                                       <el-form-item label="temp" prop="volume_discount">
                                            <span slot="label"><b>Do you want to have a volume-discount clause in the requested Rates Contract?</b></span>


                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success"> <span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                   A volume-discount clause forces the contracted vendor to discount every Purchase Order,under this Rates Contract, as soon as a set minimal procured value is reached during the Rates Contract's term. No discount is applicable when the procured value,
                                                   under the Rates Contract,is still below the minimal procured value.
                                                </span>
                                            </span>
                                        </span>
                                        <el-select filterable collapse-tags  @change="hideShowMin()" style="width: 100%; padding: 0px;" v-model="RateContractItemLine.volume_discount" placeholder="Select ">
                                            
                                            <el-option label="Yes" value="Y"></el-option> 
                                            <el-option label="No" value="N"></el-option> 
                                           
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                         <transition v-if="RateContractItemLine.volume_discount == 'Y'">
                             <el-col :span="24" >
                                <div class="grid-content" id="min_val">

                                    <!-- <el-form-item label="what should be the minimal procured value,which will trigger unit rates discounts?" prop="minimal_value"> -->
                                         
                                          <el-form-item label="temp" prop="minimal_value">
                                            <span slot="label"><b>what should be the minimal procured value,which will trigger unit rates discounts?</b></span>
                                         
                                         
                                         <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success"> <span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                  The minimal procured value is the sum of all executed Purchase Orders under this Rates Contract,which will force the vendor to grant a rate discount for any new Purchase Order this same Rates Contract.
                                                </span>
                                            </span>
                                        </span>
                                        <el-input  type="number" placeholder="Enter Expected term" v-model="RateContractItemLine.minimal_value">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>

                            </transition>

                            <el-col :span="24" >
                            <el-form-item label="temp" prop="ItemNumber">
                                        <span slot="label"><b>Select From The Library Of Materials</b></span>
                                        <el-select style="width: 100%"
                                            v-model="RateContractItemLine.ItemNumber"
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


                                    </el-col >
                                  <el-col :span="24" >
                                  
                                <div class="grid-content">

                                    <!-- <el-form-item label="Enter the expected needed quantity during the term?" prop="Quantity"> -->

                                            <el-form-item label="temp" prop="Quantity">
                                            <span slot="label"><b>Enter the expected needed quantity during the term?</b></span>
                                         


                                        <el-input  type="number" placeholder="Enter Expected term" v-model="RateContractItemLine.Quantity">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>



                            <!-- ----------------------------------- -->
                            <button type="button" @click="AddItem" class="btn btn-success btn-block waves-effect text-center">Add The Item To Rate Contract Request List</button>

                        </el-row>
                    </el-form>

                </div>
                <div class="card-body" v-else>
                    <el-row :gutter="20">  
                        <el-col :span="24">
                            <h3 align="center" class="text-danger">Rate Contract Request Are Available Only For Library of Materials Structure</h3>
                        </el-col>
                    </el-row>
                </div>
            </div>
            <div class="card" v-else>
                <div class="card-header">
                    <h4>Create A Rate Contract Creation Request</h4>
                </div>
                <div class="card-body">
                    <el-row :gutter="20">  
                        <el-col :span="24">
                            <h3 align="center" class="text-success">Gathering Company Details...</h3>
                        </el-col>
                    </el-row>
                </div>
            </div>
        </div>

        <!-- List of Items in the list -->
        <div id="Rate_Contract_List" class="col-lg-5">
            <div v-stick-in-parent="stikyKit">
                <el-row v-if="RateContractAllItems.length > 0" :gutter="20">
                    <el-col :span="24">
                        <div class="card">
                            <div class="card-header">
                                <h4>Rates Contract Creation Request Materials</h4>
                            </div>
                            <div id="Rate_Contract_List_Table" class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr.</th>
                                             <th>Material Description</th>
                                        <th>Estiamted Demand</th>
                                        <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(RateContractItem, key, index) in RateContractAllItems" :key="index">
                                            <td>{{ key + 1 }}</td>
                                            <td v-if="RateContractItem.ItemNumber != ''">Item#: IM-{{ RateContractItem.ItemNumber }}</td>
                                            <td v-else>{{ RateContractItem.ItemDescription.substring(0, 20) + '...' }}</td>
                                            <td>{{ RateContractItem.Quantity }}</td>
                                            <td width="25%">
                                                <a style="padding: 6px 9px;" class="btn btn-warning float-left" href="#" @click="showPEDetails(key, $event)"><i class="fa fa-info"></i></a>
                                                <!-- <a class="btn btn-warning float-left" href="#" @click="showItemDetails(key, $event)"><i class="fa fa-edit"></i></a> -->
                                                <a class="btn btn-danger float-left m-l-5" href="#" @click="RemoveItem(key, $event)"><i class="fa fa-remove"></i></a> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <button type="button" @click="SubmitRateContractItemList" class="btn btn-primary btn-block waves-effect text-center">Submit Rates contracts Creation request</button>
                            </div>
                        </div>
                    </el-col>
                </el-row>
                 <el-row v-else :gutter="20">
                    <div class="card">
                        <div class="card-header">
                            <h4>Rates Contract Creation Request Materials</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Sr.</th>
                                        <th>Material Description</th>
                                        <th>Estiamted Demand</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center" colspan="4">Rate Contract Item List is Empty</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-primary btn-block waves-effect text-center disabled">Submit Rates contracts Creation request </button>
                        </div>
                    </div>
                 </el-row>
            </div>
        </div>
        
       

            <!-- Modal Code   -->
            <div class="modal fade" id="PEDetailsModalId" tabindex="-1" aria-labelledby="PEDetailsModalId" role="dialog" aria-hidden="true">
               
                <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="PELineShow">
                    <div class="modal-header">
                        <div style="width:50%">
                            <h4 style="margin-top:10px" class="modal-title text-ogeo">Rates Contracts Creation Request ID# {{ PEModalInfoKey + 1 }}</h4>
                        </div>
                        <div style="width:50%">
                            <img :src="hostName+'/uploads/Logos/'+this.CompanySetup.logo" style="width:40px;height:40px;margin-left:50px;border-radius:25px">
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
                                            <td width="40%"><b>Rate Contract Requested Term(Months): </b></td>
                                            <!-- <td>{{ JobNumbers[PEModalInfo.PEModalInfoKey] }}</td> -->
                                            <td>{{ PEModalInfo.RateContractItemPeriod }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Estimated Demand Throughout the term volum-discount clause: </b></td>
                                            <!-- <td>{{ PEModalInfo.UnderlyingTransaction }}</td> -->
                                            <td>{{ PEModalInfo.minimal_value }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Minimum procured value to trigger unit rates discount: </b></td>
                                            <td>{{ PEModalInfo.Quantity }}</td>
                                        </tr>
                                        

                                       <tr >
                                            <td><b>Material Details: </b></td>
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

                                       

                                       
                                       
                                    </table>
                                </div>
                                <div class="col-lg-6">
                                    <table class="table">
                                        <tr align="center" v-if="PEModalInfo.Images.length > 0">
                                            <td v-for="(img, index) in PEModalInfo.Images" v-bind:key="img.id">
                                                <img class="img-responsive" style="width: 7vw;height: 7vw; text-align: center;" :src="img">
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td><b>Countries: </b></td>
                                            <td>
                                                <span>{{ FirstStepData.CompanyCountry }}</span><br>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td><b> Cities: </b></td>
                                            <td>

                                                <span v-for="(value, index) in FirstStepData.companyCity" v-bind:key="value.id">
                                                 {{ value }} <br>
                                                 </span><br>
                                                
                                            </td>
                                        </tr>

                                       
                                            <td><b>List of Valid Rates Contract</b></td>
                                            <table>
                                                <tr>
                                                    <th>Unit Rate</th>
                                                    <th>Vendor Name</th>
                                                    <th>Expiry Date</th>
                                                    <th>Lead Time</th>
                                                    <th>Vendor Score</th>
                                                </tr>
                                                <tr v-for="(item, index) in RateContractSelection" :key="index">
                                                    <td>{{ item.unit_rate }} USD </td>
                                                    <td>{{ item.vendor_name }}</td>
                                                    <td>{{ item.date }}</td>
                                                    <td>{{ item.lead_time }}</td>
                                                    <td>{{ item.vendor_score }}</td>
                                                </tr>
                                            </table>
                                      
                                        
                                    </table>
                                </div>

                            </div>
                            
                        </div>
                       
                    

                    <div class="col-lg-12">
                        <hr>
                        <div class="d-inline-block">
                            <span><b>Date:</b> {{ new Date() }}</span><br>
                            <!-- <span><b>By:</b> {{ currentUser.Name }}</span><button class="btn btn-success ml-3" onclick="document.title = 'Purchase Enquiry Line Information';window.print()">Download PDF</button>   <br><br> -->
                        </div>
                        <div class="d-inline-block pull-right">
                            <span><img width="250px" :src="hostName+'/assets/images/poweredby.png'" alt=""></span>
                        </div>
                    </div>

                </div>
            </div> 
       
            </div>
            <!-- Modal Code  -->

    </div>


            
</template>

<script>
    

    //import { CustomJs } from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'new-request-rate-contract-creation',
        data(){
            return {
                hostName: window.location.protocol+'//'+window.location.hostname,
                CompanySetup: {},
                stikyKit: {
                    options: {
                        offset_top: 140
                    },
                },
                countries: [],
			    cities: [],
                FirstStepData:{
					CompanyLogo: "",
                    companyName: "",
                    companyTime:"",
                    CompanyEmployeeRange: [],
                    CompanyIndustry: [],
                    CompanyCities: [],
                    companyCity: "",
                    CompanyCountry: "",
                    CompanyCountries: [],
				},
			    EmployeesList: [],
			    ProjectKey: "",
			    JobNumbers: [],
                minVal: '',
                testdata: [],
                PurchaseEnquiryAll: [],
                PEModalInfoKey: "",
                PEModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                CompanyDetailsLoaded: false,
                FoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                RateContractItemLine: {
                    JobNumber: "",
                    ItemNumber: "",
                    RateContractItemPeriod: "",
                    volume_discount: "",
                    minimal_value: "",
                    Quantity: "",
                    JobNumber: "",
                    SetupName: "", 
                    ItemLibraryDescription: "",
                    CompanyCitys: [],
                    CompanyCountry: "",
                    rtYN: 'no',
                },
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
                RateContractAllItems: [],
                RCItemModalInfoKey: "",
                RCItemModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    JobNumber: [{
                        required: true,
                        message: "Please Select Set Up",
                        trigger: ["blur", "change"]
                    }],
                    CompanyCountries: [{
                        required: false,
                        message: "Please Select Country",
                        trigger: "blur"
                    }],
                    ItemNumber: [{
                        required: false,
                        message: "Please Select an Item",
                        trigger: "blur"
                    }],CompanyCities: [{
                        required: false,
                        message: "Please Select City",
                        trigger: "blur"
                    }],
                    RateContractItemPeriod: [{
                        required: false,
                        message: "Please Enter Period",
                        trigger: "blur"
                    }],
                    volume_discount: [{
                        required: true,
                        message: "Please Enter Volume Discount",
                        trigger: "blur"
                    }],
                    UnitOfMeasurement: [{
                        required: true,
                        message: "Please Select Unit of Measurement",
                        trigger: ["blur", "change"]
                    }],
                    AdvancedPayment: [{
                        required: false,
                        message: "Please Select Advanced Payment Requirements.",
                        trigger: "blur"
                    }],
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
                        required: true,
                        message: "Please Enter Location Name.",
                        trigger: "blur"
                    }]
                },
            }
        },
		created() {
            this.getCountries();
            
            console.log('carried');
        },
        methods: {
            searchItems(value) {
                console.log(value);
                this.RateContractItemLine.ItemNumber = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_items', {searchQuery: value})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                        console.log('after search');
                        console.log(this.FoundItems);
                    })
            },getCountries() {
               axios.get('/data/countries.json')
                    .then((res) => {
                        console.log('in the countries sections');
                        this.countries = res.data
                        console.log( this.countries );

                    })
                    .catch((err) => {
                    })
            },
			getCities() {


                console.log(this.RateContractItemLine.CompanyCountry);
				if(this.RateContractItemLine.CompanyCountry != '' || this.RateContractItemLine.CompanyCountry != null ){

                    console.log(this.RateContractItemLine.CompanyCountry);

                  this.cities= this.countries[this.RateContractItemLine.CompanyCountry];
                   // console.log(this.cities);
				}
            },
			hideShowMin() {
				console.log(this.RateContractItemLine.volume_discount);
                if(this.RateContractItemLine.volume_discount=='Y'){
                        $('#min_val').show();
                }else{
                     $('#min_val').hide();
                }

            },
            AddItem: function() {

                
                this.$refs.RateContractRequestForm.validate((validation) => {


                    if(validation){

                        let selectedItem = this.FoundItems.find(obj => obj.id == this.RateContractItemLine.ItemNumber);
                        this.RateContractItemLine.ItemLibraryDescription = selectedItem;

                        this.RateContractAllItems.push(Object.assign({}, this.RateContractItemLine));

                     
                    }
                })



            },
            showItemDetails: function(key, event) {
                if (event) event.preventDefault();

                this.RCItemModalInfoKey = key;
                this.RCItemModalInfo = Object.assign({}, this.RateContractAllItems[key]);
                this.$forceUpdate();

                $('#RCItemDetailsModalId').modal('toggle');

            },
            showPEDetails: function(key, event) {
                if (event) event.preventDefault();
                 console.log(key);
                 this.PEModalInfoKey = key;
                
                 //this.PEModalInfo = Object.assign({}, this.PurchaseEnquiryAll[key]);
                 this.PEModalInfo = Object.assign({}, this.RateContractAllItems[key]);
                 this.$forceUpdate();
                 this.PELineShow = true;

                 $('#PEDetailsModalId').modal('toggle');

            },
            RemoveItem: function(key, event) {
                if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This Will Remove This Item From The Rate Contract Request.",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Remove It!'
                }).then((result) => {
                    if (result.value) {
                        this.RateContractAllItems.splice(key, 1);
                    }
                })

            },
            SubmitRateContractItemList() {
                if (event) event.preventDefault();
                console.log(this.RateContractAllItems);
                axios.post('/api/rate_contracts/post_rate_contract_request', this.RateContractAllItems)
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
                        // check temporary

                        console.log('in the error brackets');
                        //  Swal({ 
                        //     type: 'success', 
                        //     title: 'Rate Contract Request Created.', 
                        //     text: 'Rate Contract Request Created Successfully.',
                        //     showConfirmButton: true,
                        //     timer: 10000
                        // });
                        // check temporary
                         Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Rate Contract Request Submit)', 'error');
                    });

                //Clear All Data
                this.RateContractAllItems = "";
                this.RateContractItemLine.JobNumber = "";
                this.RateContractItemLine.ItemNumber = "";
                this.RateContractItemLine.ItemDescription = "";
                this.RateContractItemLine.RateContractItemPeriod = "";
                this.RateContractItemLine.Quantity = "";
                this.RateContractItemLine.UnitOfMeasurement = "";
                //this.RateContractItemLine.AdvancedPayment = "";
                this.RateContractItemLine.RequiredDocuments = "";
                this.RateContractItemLine.ItemLineNote = "";
                this.RateContractItemLine.Longitude = "";
                this.RateContractItemLine.Latitude = "";
                this.RateContractItemLine.LocationName = "";
                this.RateContractAllItems = [];

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
        },
        mounted(){

            //CustomJs();

            let self = this;

            axios.get('/api/data/get_user_projects_list_rcco')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    console.log('data doen below');
                    console.log(this.JobNumbers);
                    axios.get('/api/data/get_company_details')
                        .then((SecondResponse) => {

                            this.CompanySetup = SecondResponse.data;

                            if(this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'){
                                this.rules.ItemNumber[0].required = true;
                            } else {
                                this.rules.ItemDescription[0].required = true;
                            }
                            if(this.CompanySetup.additional_required_1 == "Yes"){
                               //this.rules.UnderlyingTransaction[0].required = true; 
                            }

                            self.CompanyDetailsLoaded = true;

                        });
                });
               


           
        },
        beforeRouteLeave (to, from, next) {

            if(this.RateContractAllItems.length > 0){
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
        }
    }

       
</script>


<style>

    #Rate_Contract_List_Table{
        max-height: 570px;
        overflow-y: scroll;
    }

    #Rate_Contract_Request_Form{
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
        width:80%;
    }

    #RCItemDetailsModalId .modal-dialog {
        width:80%;
    }

    #PEDetailsModalId, #PEDetailsModalId * {
        visibility: visible;
      }
      #PEDetailsModalId {
        position: absolute;
        left: 0;
        top: 0;
      }

    .itemTable >tr>td{
      height:20px;
      padding:0px;
      border-top: 0px;
    }

    .el-select-dropdown__item{
        height: 100% !important;
    }
    .hide{
    visibility: hidden !important;
    }
    .el-select-dropdown__wrap{
        max-height: 800px !important
    }

    .el-select-dropdown .el-popper {
        max-width: 700px !important
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

</style>
<style scoped>

    #PEDetailsModalId .modal-dialog {
        min-width:80%;
    }
</style>