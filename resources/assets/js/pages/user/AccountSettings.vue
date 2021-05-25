<template>

	<!-- Validation wizard -->
	<div class="page-wrapper">
        <div class="container-fluid">
            <!-- <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Account Configuration</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Account Configuration</li>
                    </ol>
                </div>
            </div> -->

            <!-- <div class="row page-titles">
            	<div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
		            <img :src="logoPreview" />
		        </div>
	        </div> -->
            
		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
	
							<form-wizard title="Account Configuration" subtitle="A registration is required before Ogéo can be properly utilized." ref="onboarding_wizard" @on-complete="onComplete" shape="circle" color="#FF2F2F" error-color="#ff4949">

							    <tab-content title="Organization Details" icon="fa fa-university" :before-change="validateFirstStep"  > <!-- :before-change="validateFirstStep" -->
							    	<hr>
							    	
								    <el-form :model="FirstStepData" class="demo-form-inline" :rules="rules1" ref="AccountSettingForm1">

								    	<el-row :gutter="20">
								    		
								    		<el-col :span="6">
												<div class="grid-content">
													
													<el-form-item prop="companyName">
														<span slot="label"><b>Organization Name</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">This is the name of my organization as it will appear in all transaction documents, reports, etc...</span>
															</span>
                                    					</span>
											        	<el-input v-model="FirstStepData.companyName" placeholder="Organization Name"></el-input>
											        </el-form-item>
												</div>
											</el-col>
											<el-col :span="6">
												<div class="grid-content">
													<el-form-item  prop="TimeZone">
														<span slot="label"><b>TimeZone</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">These are the lists of TimeZones.</span>
															</span>
                                    					</span>
													    <el-select filterable collapse-tags style="width: 100%; padding: 0px;" v-model="FirstStepData.companyTime" placeholder="Select TimeZone">

													    	<el-option v-for="industry in AllTimeZone"
													    		:key="industry"
															    :label="industry"
															    :value="industry">
													    	</el-option>

													    </el-select>
											      	</el-form-item>
												</div>
											</el-col>


											<el-col :span="6">
												<div class="grid-content">
													<el-form-item prop="CompanyEmployeeRange">
														<span slot="label"><b>Organization Size</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<!-- <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span> -->
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">This is the number of employees that work for my organization.</span>
															</span>
                                    					</span>
													    <el-select filterable style="width: 100%" v-model="FirstStepData.CompanyEmployeeRange" placeholder="Select Number Of Employees">
		
													    	<el-option
													    		v-for="item in EmployeeRange"
															    :key="item.value"
															    :label="item.label"
															    :value="item.value">
													    		<span style="float: left">{{ item.label }}</span>
      															<span style="float: right; color: #8492a6; font-size: 13px">Emplyees</span>
													    	</el-option>
				                                            
													    </el-select>
											      	</el-form-item>
												</div>
											</el-col>


											<el-col :span="6">
												<div class="grid-content">
													<el-form-item prop="CompanyIndustry">
														<span slot="label"><b>Organization Industry</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">These are the lists of industries in which my organization operates.</span>
															</span>
                                    					</span>
													    <el-select filterable collapse-tags multiple style="width: 100%; padding: 0px;" v-model="FirstStepData.CompanyIndustry" placeholder="Select Industry">

													    	<el-option v-for="industry in Industries"
													    		:key="industry.index"
															    :label="industry"
															    :value="industry">
													    	</el-option>

													    </el-select>
											      	</el-form-item>
												</div>
											</el-col>

											

											<el-col :span="6">
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
													    <el-select filterable collapse-tags multiple @change="getCities()" style="width: 100%; padding: 0px;" v-model="FirstStepData.CompanyCountries" placeholder="Select City">
															
													    	
															<el-option
													    		v-for="item in countries"
															    :key="item.id"
															    :label="item.country_name"
															    :value="item.id">
													    		<span style="float: left">{{ item.country_name }}</span>
													    	</el-option>

															
														</el-select>
											      	</el-form-item>
												</div>
											</el-col>
											<el-col :span="6">
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
													    <el-select filterable collapse-tags multiple style="width: 100%; padding: 0px;" v-model="FirstStepData.CompanyCities" placeholder="Select City">
															
													    	<el-option
														      v-for="city in cities"
														      :key="city.id"
															  :value="city.city_name"
														      :label="city.city_name">
															<span style="float: left">{{ city.city_name }}</span>
														    </el-option>
															
														</el-select>
											      	</el-form-item>
												</div>
											</el-col>
											</el-row>
	                                      <el-row :gutter="20">
											<el-col :span="12">
												<div class="grid-content">
													<div v-if="this.logopreview">
														<img :src="'/uploads/LogosPreview/'+this.logopreview" style="width:150px;height:150px;border-radius:10px" v-if="this.logopreview">
														<i @click="deleteLogoPreview()" class="el-icon-delete" style="margin-left:-98px;font-size:35;color:red;cursor:pointer"></i>
													</div>	
													<el-form-item v-show="this.logopreview == ''">
														<el-upload
															action="#"
															:file-list="fileList"
															list-type="picture-card"
															:limit="1"
															id='CompanyLogo'
															:auto-upload="false"
															ref="CompanyLogo"
															v-model="FirstStepData.CompanyLogo"
															accept=".jpg, .jpeg, .png"
															:on-exceed="handleExceed"
															:on-change="handleEditChange"
															:on-remove="handleRemove">
															<i class="el-icon-plus"></i>
														</el-upload>
													</el-form-item>		
					                                <span>You can upload 1 logo with a maximum size of 1 MB.</span>
											      	
												</div>
											</el-col>

										</el-row>
									        
								    </el-form>
							    </tab-content>

							    <tab-content title="Transaction Details" icon="fa fa-pencil-square-o" :before-change="validateSecondStep"> <!-- :before-change="validateSecondStep" -->
							    	<el-form :model="SecondStepData" class="demo-form-inline" :rules="rules2" ref="AccountSettingForm2">

								    	<el-row :gutter="20">
								    		<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companyPEPrefix">
														<span slot="label"><b><i>Purchase Enquiry</i></b><b> Prefix</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<!-- <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span> -->
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span style="bottom: -50px;" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Purchase Enquiries” created by my organization. All the sequential identifiers assigned by Ogéo to the “Purchase Enquiries” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: PE, PR, …) followed with serial numbers.</span>
															</span>
                                    					</span>
														
											        	<el-input v-model="SecondStepData.companyPEPrefix" placeholder="Enter Purchase Enquiry Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>

											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companyRFQPrefix">
														<span slot="label"><b><i>Request For Proposals</i></b> <b>Prefix</b></span>
														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span style="bottom: -50px;" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Request For Proposals” created by my organization. All the sequential identifiers assigned by Ogéo to the “Request For Proposals” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: RfP, RFP, RfQ, RFQ …) followed with serial numbers.</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companyRFQPrefix" placeholder="Enter Request For Proposals Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>


											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companyComEvalPrefix">
														<span slot="label"><b><i>Commercial Evaluation</i></b> <b>Prefix</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span style="bottom: -50px;" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Commercial Evaluations” created by my organization, following the submital of proposals by the vendors. All the sequential identifiers assigned by Ogéo to the “Commercial Evaluations” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: CE …) followed with serial numbers.</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companyComEvalPrefix" placeholder="Enter Commercial Evaluation Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>


											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companyPOPrefix">
														<span slot="label"><b><i>Purchase Order</i></b> <b>Prefix</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span style="bottom: -50px;" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Purchase Orders” created by my organization. All the sequential identifiers assigned by Ogéo to the “Purchase Orders” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: PO …) followed with serial numbers.</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companyPOPrefix" placeholder="Enter Purchase Order Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>


											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companySTRIPrefix">
														<span slot="label"><b><i>Storeroom Item Issue Note</i></b> <b>Prefix</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Storeroom Items Issue Notes” created by my organization. All the sequential identifiers assigned by Ogéo to the “Storeroom Items Issue Notes” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: SIIN, SKUIN …) followed with serial numbers.</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companySTRIPrefix" placeholder="Enter Storeroom Item Issue Note Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>


											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companySTRRPrefix">
														<span slot="label"><b><i>Storeroom Item Return Note</i></b> <b>Prefix</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Storeroom Items Return Notes” created by my organization. All the sequential identifiers assigned by Ogéo to the “Storeroom Items Return Notes” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: SIRN, SKURN…) followed with serial numbers.</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companySTRRPrefix" placeholder="Enter Storeroom Item Return Note Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>

											<el-col :span="8">
												<div class="grid-content">
													<el-form-item label="temp" prop="companyRNPrefix">
														<span slot="label"><b><i>Receipt Note</i></b> <b>Prefix</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to personalize the way Ogéo assigns identifiers to the “Receipt Notes” created by my organization. All the sequential identifiers assigned by Ogéo to the “Receipt Notes” will start with any 03 (or less) alphanumerical prefix of my choosing (Examples: RN, GRN, SRN …) followed with serial numbers</span>
															</span>
                                    					</span>

											        	<el-input v-model="SecondStepData.companyRNPrefix" placeholder="Enter Reciept Note Prefix"></el-input>
											        </el-form-item>
												</div>
											</el-col>

											<el-col :span="12">
												<div class="grid-content">
													<el-form-item prop="companyAdditionalField">
														<span slot="label"><b>Mandatorily link Purchase Enquiries to underlying transactions?</b></span>

														<!-- <span style="display: inline-block; font-size: 14px; text-align: left; line-height: 100%; color: #606266; font-weight: 400" ><span style="color: red">*</span> Mandatorily link Purchase Enquiries to underlying transactions? -->

															<span style="z-index: 10000;" class="mytooltip tooltip-effect-1">
																<span class="tooltip-item2">
																	<span class="fa-stack fa-1x">
																	  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																	  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																</span>
																<span style="bottom: -90px; left: -180px" class="tooltip-content4 clearfix">
																	<span class="tooltip-text2">I’m offered the possibility to impose that an underlying transaction is compulsory referred to whenever a Purchase Enquiry is created by my organization. Selecting “Yes” will make it easy to link the transactions undertaken by my organization on Ogéo (Purchase Enquiries, Requests for Proposals, Purchase Orders…) to any underlying transaction reference captured at the time of the Purchase Enquiry creation. Examples of such underlying transactions can include: Job Tickets, Work Orders, Sales Orders …</span>
																</span>
	                                    					</span>
	                                    				<!-- </span> -->
														
														


					                                    <el-select style="width: 100%; padding: 0px;" v-model="SecondStepData.companyAdditionalField" placeholder="Select Yes/No">
																	
														    <el-option label="Yes" value="Yes"></el-option>
														    <el-option label="No" value="No"></el-option>
															    
														</el-select>

											        </el-form-item>
												</div>
											</el-col>


											<el-col :span="12">
												<div class="grid-content">
													<el-form-item prop="companyStoreAdditionalField">
														<span slot="label"><b>Mandatorily link Storerooms Items Issue Notes to underlying transactions?</b></span>

														<!-- <span style="display: inline-block; font-size: 14px; text-align: left; line-height: 100%; color: #606266; font-weight: 400" ><span style="color: red">*</span> Mandatorily link Purchase Enquiries to underlying transactions? -->

															<span style="z-index: 10000;" class="mytooltip tooltip-effect-1">
																<span class="tooltip-item2">
																	<span class="fa-stack fa-1x">
																	  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																	  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																</span>
																<span style="bottom: -100px; left: -180px" class="tooltip-content4 clearfix">
																	<span class="tooltip-text2">I’m offered the possibility to impose that an underlying transaction is compulsory referred to whenever a Storeroom Item Issue Note is created by my organization. Examples of such underlying transactions can include: Job Tickets, Work Orders, Sales Orders …</span>
																</span>
	                                    					</span>
	                                    				<!-- </span> -->
														

					                                    <el-select style="width: 100%; padding: 0px;" v-model="SecondStepData.companyStoreAdditionalField" placeholder="Select Yes/No">
																	
														    <el-option label="Yes" value="Yes"></el-option>
														    <el-option label="No" value="No"></el-option>
															    
														</el-select>

											        </el-form-item>
												</div>
											</el-col>

											
										</el-row>
									</el-form>
								</tab-content>
								








								<tab-content title="Library of Materials" icon="fa fa-list-alt" :before-change="LoMvalidateStep" > <!-- :before-change="LoMvalidateStep" -->
							    	<el-form :model="ThirdStepData" class="demo-form-inline" :rules="LoMrules" ref="AccountSettingFormLoM">
										<el-row :gutter="20">
											<el-col :span="24">
												<div class="grid-content">
													<el-form-item prop="companyLoMManditory">
														<span slot="label"><b>What will be used to create Purchase Enquiries for materials?</b></span>

														<span style="z-index: 1" class="mytooltip tooltip-effect-1">
															<span class="tooltip-item2">
																<span class="fa-stack fa-1x">
																  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															</span>
															<span style="bottom: -230px; left: 220px" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">I’m offered the possibility to impose or not the use of Libraries of Materials when creating a Purchase Enquiry for materials. Though it’s perfectly possible to use Ogéo without actually using the Libraries of Materials, it’s highly recommended that I actually use this functionality as it will help my organization’s users better qualify and specify the materials they intend to buy. It will also help me generate more insightful reports and analytics. It's important to note that this selection can be changed at will by my organization at all times. The changes take effect as soon as they are captured.</span>
															</span>
                                    					</span>
											        	<el-select style="width: 100%; padding: 0px;" v-model="ThirdStepData.companyLoMManditory" placeholder="Select An Option">
						                                      <el-option label="Libraries of Materials" value="Libraries"></el-option>
						                                      <el-option label="Free text descriptions" value="FreeText"></el-option>
														      <el-option label="Libraries of Materials + Free text descriptions" value="LibrariesNFreeText"></el-option>
														</el-select>
											        </el-form-item>
												</div>
											</el-col>
											
											<transition name="slide-fade" v-if="ThirdStepData.companyLoMManditory == 'LibrariesNFreeText' || ThirdStepData.companyLoMManditory == 'Libraries'">
												<div>
												<el-col :span="24" >







			<div class="card">
                <div class="card-header">
                    <h4>Libraries of Materials Templates Configuration</h4>
                </div>
                <div class="card-body">
                    <h3 class="text-danger">Templates’ Creation</h3>
                    <p class="text-danger">You are allowed to create as many templates as you wish. Each template can have up to 20 customizable headers. You must decide whether or not capturing a header’s information, during the addition of a material to the Library, is mandatory. Example: <u>Template Name:</u> Light bulbs, <u>Header 1:</u> Type (LED, Fluorescent, HID...) | <u>Header 2:</u> Bulb Base | <u>Header 3:</u> Wattage (W) | <u>Header 4:</u> Voltage (V) ……</p>

                    <hr>
                   
                    <div class="card">
                        <div class="card-header">
                            <h4>List of Existing Templates For The Organization</h4>
                        </div>
                        <div class="card-body">
                            <table ref="ItemsTemplatesList" id="ItemsTemplatesList" class="display responsive table table-bordered table-hover" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Template Name</th>
                                        <th>Mandatory Header</th>
                                        <th style="min-width: 500px">Assigned Headers</th>
                                        <th >Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<tr v-for="(Tempate, index) in TemplatesDetails">
                                        <td>{{ index + 1 }}</td>
                                        <td>{{ Tempate.Template_Name }}</td>
                                        <td>Unit of Measurement</td>
                                        <td style="min-widtd: 500px">{{ Tempate.ConsolidatedTitles }}</td>
                                        <td @click="deleteTemplate(Tempate.ID)" v-html="Tempate.Action"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <hr>

                    <h3>Create New Template:</h3>
                    
                    
                    <el-form :model="ItemStructureSetup" class="demo-form-inline" :rules="FormRules" ref="ItemStructureSetupForm">
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Template Name" prop="Template_Name">
                                        <el-input ref="Template_Name" v-model="ItemStructureSetup.Template_Name" placeholder="Enter Template Name"></el-input>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 1" prop="Field_1_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(1, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Required" placeholder="Header 1">
                                            <el-option label="Yes" :value="true"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_1_Header">

                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>

                                        <el-input ref="Header_1" :disabled="ItemStructureSetup.Field_1_Required ? null : true" v-model="ItemStructureSetup.Field_1_Header" placeholder="e.g. Category"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_1_Mandatory">
                                        <el-select ref="Mandatory_1" @change="checkHeader1()" :disabled="ItemStructureSetup.Field_1_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 2" prop="Field_2_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(2, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Required" placeholder="Header 2">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_2_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_2" :disabled="ItemStructureSetup.Field_2_Required ? null : true" v-model="ItemStructureSetup.Field_2_Header" placeholder="e.g. Subcategory"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_2_Mandatory">
                                        <el-select ref="Mandatory_2" @change="checkHeader2()" :disabled="ItemStructureSetup.Field_2_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 3" prop="Field_3_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(3, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Required" placeholder="Header 3">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_3_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_3" :disabled="ItemStructureSetup.Field_3_Required ? null : true" v-model="ItemStructureSetup.Field_3_Header" placeholder="e.g. Sub Subcategory"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_3_Mandatory">
                                        <el-select ref="Mandatory_3" @change="checkHeader3()" :disabled="ItemStructureSetup.Field_3_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 4" prop="Field_4_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(4, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Required" placeholder="Header 4">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_4_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_4" :disabled="ItemStructureSetup.Field_4_Required ? null : true" v-model="ItemStructureSetup.Field_4_Header" placeholder="e.g. Make/Brand"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_4_Mandatory">
                                        <el-select ref="Mandatory_4"@change="checkHeader4()" :disabled="ItemStructureSetup.Field_4_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 5" prop="Field_5_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(5, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Required" placeholder="Header 5">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_5_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_5" :disabled="ItemStructureSetup.Field_5_Required ? null : true" v-model="ItemStructureSetup.Field_5_Header" placeholder="e.g. Model"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_5_Mandatory">
                                        <el-select ref="Mandatory_5" @change="checkHeader5()" :disabled="ItemStructureSetup.Field_5_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 6" prop="Field_6_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(6, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Required" placeholder="Header 6">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_6_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_6" :disabled="ItemStructureSetup.Field_6_Required ? null : true" v-model="ItemStructureSetup.Field_6_Header" placeholder="e.g. Serial Number"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_6_Mandatory">
                                        <el-select ref="Mandatory_6" @change="checkHeader6()" :disabled="ItemStructureSetup.Field_6_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 7" prop="Field_7_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(7, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Required" placeholder="Header 7">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_7_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_7" :disabled="ItemStructureSetup.Field_7_Required ? null : true" v-model="ItemStructureSetup.Field_7_Header" placeholder="e.g. Year"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_7_Mandatory">
                                        <el-select ref="Mandatory_7" @change="checkHeader7()" :disabled="ItemStructureSetup.Field_7_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 8" prop="Field_8_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(8, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Required" placeholder="Header 8">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_8_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_8" :disabled="ItemStructureSetup.Field_8_Required ? null : true" v-model="ItemStructureSetup.Field_8_Header" placeholder="e.g. Expiry Date"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_8_Mandatory">
                                        <el-select ref="Mandatory_8" @change="checkHeader8()" :disabled="ItemStructureSetup.Field_8_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 9" prop="Field_9_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(9, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Required" placeholder="Header 9">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_9_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_9" :disabled="ItemStructureSetup.Field_9_Required ? null : true" v-model="ItemStructureSetup.Field_9_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_9_Mandatory">
                                        <el-select ref="Mandatory_9" @change="checkHeader9()" :disabled="ItemStructureSetup.Field_9_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 10" prop="Field_10_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(10, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Required" placeholder="Header 10">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_10_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_10" :disabled="ItemStructureSetup.Field_10_Required ? null : true" v-model="ItemStructureSetup.Field_10_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_10_Mandatory">
                                        <el-select ref="Mandatory_10" @change="checkHeader10()" :disabled="ItemStructureSetup.Field_10_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Mandatory" placeholder="Select Mandatory Option">   
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 11" prop="Field_11_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(11, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Required" placeholder="Header 11">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_11_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_11" :disabled="ItemStructureSetup.Field_11_Required ? null : true" v-model="ItemStructureSetup.Field_11_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_11_Mandatory">
                                        <el-select ref="Mandatory_11" @change="checkHeader11()" :disabled="ItemStructureSetup.Field_11_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 12" prop="Field_12_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(12, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Required" placeholder="Header 12">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_12_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_12" :disabled="ItemStructureSetup.Field_12_Required ? null : true" v-model="ItemStructureSetup.Field_12_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_12_Mandatory">
                                        <el-select ref="Mandatory_12" @change="checkHeader12()" :disabled="ItemStructureSetup.Field_12_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 13" prop="Field_13_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(13, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Required" placeholder="Header 13">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_13_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_13" :disabled="ItemStructureSetup.Field_13_Required ? null : true" v-model="ItemStructureSetup.Field_13_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_13_Mandatory">
                                        <el-select ref="Mandatory_13" @change="checkHeader13()" :disabled="ItemStructureSetup.Field_13_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 14" prop="Field_14_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(14, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Required" placeholder="Header 14">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_14_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_14" :disabled="ItemStructureSetup.Field_14_Required ? null : true" v-model="ItemStructureSetup.Field_14_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_14_Mandatory">
                                        <el-select ref="Mandatory_14" @change="checkHeader14()" :disabled="ItemStructureSetup.Field_14_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 15" prop="Field_15_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(15, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Required" placeholder="Header 15">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_15_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_15" :disabled="ItemStructureSetup.Field_15_Required ? null : true" v-model="ItemStructureSetup.Field_15_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_15_Mandatory">
                                        <el-select ref="Mandatory_15" @change="checkHeader15()" :disabled="ItemStructureSetup.Field_15_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 16" prop="Field_16_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(16, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Required" placeholder="Header 16">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_16_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_16" :disabled="ItemStructureSetup.Field_16_Required ? null : true" v-model="ItemStructureSetup.Field_16_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_16_Mandatory">
                                        <el-select ref="Mandatory_16" @change="checkHeader16()" :disabled="ItemStructureSetup.Field_16_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 17" prop="Field_17_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(17, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Required" placeholder="Header 17">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_17_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_17" :disabled="ItemStructureSetup.Field_17_Required ? null : true" v-model="ItemStructureSetup.Field_17_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_17_Mandatory">
                                        <el-select ref="Mandatory_17" @change="checkHeader17()" :disabled="ItemStructureSetup.Field_17_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 18" prop="Field_18_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(18, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Required" placeholder="Header 18">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_18_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_18" :disabled="ItemStructureSetup.Field_18_Required ? null : true" v-model="ItemStructureSetup.Field_18_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_18_Mandatory">
                                        <el-select ref="Mandatory_18" @change="checkHeader18()" :disabled="ItemStructureSetup.Field_18_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 19" prop="Field_19_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(19, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Required" placeholder="Header 19">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_19_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_19" :disabled="ItemStructureSetup.Field_19_Required ? null : true" v-model="ItemStructureSetup.Field_19_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_19_Mandatory">
                                        <el-select ref="Mandatory_19" @change="checkHeader19()" :disabled="ItemStructureSetup.Field_19_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="Set Header 20" prop="Field_20_Required">
                                        <el-select :disabled="Set_Required" @change="SetRequired(20, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_20_Required" placeholder="Header 20">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Header Description" prop="Field_20_Header">
                                    	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="tooltip-item2">
												<span class="fa-stack fa-1x">
												  <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												  <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											</span>
											<span style="bottom: -50px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Description Headers can't be Units of Measurements (UoM).</span>
											</span>
                    					</span>
                                        <el-input ref="Header_20" :disabled="ItemStructureSetup.Field_20_Required ? null : true" v-model="ItemStructureSetup.Field_20_Header" placeholder="e.g. Addtional Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Is this header mandatory when materials are added under this template?" prop="Field_20_Mandatory">
                                        <el-select ref="Mandatory_20" @change="checkHeader20()" :disabled="ItemStructureSetup.Field_20_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_20_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <hr>
                            <button type="button" @click="SubmitItemSetupForm" class="btn btn-success btn-block waves-effect text-center">Create Libraries of Materials Template</button>
                        </div>


                    </el-form>
                </div>
            </div>



												</el-col>

												
												</div>
											</transition>

										</el-row>
									</el-form>
							    </tab-content>


	
							    <!-- Project Details and Project Roles Assignment -->
							    <tab-content title="Delegation Of Authority And Roles Assignments" icon="fa fa-sitemap" :before-change="validateThirdStep"> <!-- :before-change="validateThirdStep" -->
	
									<!-- Company Wise Or Project Wise Question -->
									<el-row :gutter="20" style="display: none">
								    	<el-col :span="24">
											<div class="grid-content">

												<label>Procurement Setup Mode</label>
												
												<span style="z-index: 1" class="mytooltip tooltip-effect-4">
													<span class="fa-stack fa-1x">
														<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
														<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
													</span>
													<span style="bottom: -230px; left: 220px" class="tooltip-content4 clearfix">
														<span class="tooltip-text2">I’m offered the possibility to create separate set-ups, under my organization, for which all the procurement transactions will be conducted. Each set-up can have its own budget, its own approval workflow, its own personnel/roles combination, and its own delegation of authority. The number of separate set-ups is unlimited. Set-ups can be shops, projects, storerooms, subsidiaries, affiliates….or the whole of the organization </span>
													</span>
													
		                                      	</span>
									        	<el-select style="width: 100%; padding: 0px;" v-model="AccountSettingForm.procurementSetupMode" placeholder="Select Procurement Setup Mode">
												      <!-- <el-option label="Company Wide" value="Company Wide"></el-option> -->
												      <el-option selected="selected" label="Project Wise" value="Project Wise"></el-option>
												</el-select>
										        
											</div>
											<hr>
										</el-col>
									</el-row>



											<!-- If Project Wise -->
											<transition name="slide-fade">
												<el-form v-if="AccountSettingForm.procurementSetupMode == 'Project Wise'" :model="ProjectInfo" class="demo-form-inline" :rules="rules4" ref="AccountSettingForm3">
													
													<el-row v-if="ProjectsDetails.length > 0" :gutter="20">
														<el-col :span="24">
															<hr>
															<h4>Existing Set-ups:</h4>
						                                    <table style="background-color: #f9fffb" class="table table-bordered">
						                                        <thead>
						                                            <tr>
						                                                <th>Set-up Name</th>
						                                                <th>Set-up Period</th>
						                                                <th>Set-up Value</th>
						                                                <th>Action</th>
						                                            </tr>
						                                        </thead>
						                                        <tbody>
						                                            <tr v-for="(ProjectDetails, key, index) in ProjectsDetails" :key="key">
						                                                <td>{{ ProjectDetails.ProjectTitle }}</td>
						                                                <td>Start Date: {{ ProjectDetails.ProjectPeriod[0] | formatDateNoTime }}<br>End Date: {{ ProjectDetails.ProjectPeriod[1] | formatDateNoTime }}</td>
						                                                <td>{{ formatPrice(ProjectDetails.ProjectValue) }} {{ ProjectDetails.ProjectCompanyCurrency }}</td>
						                                                <td>
						                                                	<a class="btn btn-block btn-outline-success " href="#" @click="showProjectDetails(key, $event)">  View/Edit</a>
						                                                	<a class="btn btn-block btn-outline-danger" href="#" @click="RemoveProject(key, $event)"><!-- <i class="fa fa-remove"></i> --> Delete</a> 
						                                                </td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
							                                
							                                <br><hr>
							                            </el-col>
													</el-row>

													<el-row :gutter="20">
														
														<el-col :span="24">
															<h2>Set-up Information
																<span style="z-index: 1" class="mytooltip tooltip-effect-4">
						                                      		<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: -100px; left: 230px; width: 500px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">I’m offered the possibility to create separate "Set-ups", under my organization, for which all the procurement transactions will be conducted. Each "Set-up" can have its own budget, its own approval workflow, its own personnel/roles combination, and its own delegation of authority. The number of separate "Set-ups" is unlimited. "Set-ups" can be shops, projects, storerooms, subsidiaries, affiliates….or the whole of the organization. </span>
																	</span>
						                                      	</span>
															</h2>
														</el-col>


														<el-col :span="24">
															<div class="grid-content">
																<el-form-item prop="ProjectTitle">
																<span slot="label"><b>Enter Set-up Name</b></span>
																	<el-input v-model="ProjectInfo.ProjectTitle" placeholder="Enter Set-up name"></el-input>
														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="24">
															<div class="grid-content">
																<el-form-item prop="StoreSetup">
																<span slot="label"><b>Is this Set-up a Storeroom?</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">When a "Set-up" is marked as a “Storeroom”, Ogéo will prompt me to assign storeroom-related roles to the employees. </span>
																	</span>
		                                    					</span>

																<el-select filterable style="width: 100%; padding: 0px;" @change="StoreSetup" v-model="ProjectInfo.StoreSetup" placeholder="Mark As Store Set-up?">
																    <el-option label="Yes" value="Yes"></el-option>
																    <el-option label="No" value="No"></el-option>
																</el-select>

														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="24">
															<div class="grid-content">
																<el-form-item  prop="ProjectPeriod">
																<span slot="label"><b>Select Set-up Start And End Dates</b></span>
																	
																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																			<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																			<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																		</span>
																	<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">These are the dates between which all procurement transactions are authorized by Ogéo. </span>
																	</span>
		                                    					</span>

																	<el-date-picker
																	  style="width: 100%"
																      v-model="ProjectInfo.ProjectPeriod"
																      type="daterange"
																      range-separator="To"
																      start-placeholder="Start date"
																      end-placeholder="End date"
																      :default-time="['00:00:00', '23:59:59']"
																      value-format="yyyy-MM-dd HH:mm:ss">
																    </el-date-picker>
																	
														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="12">
															<div class="grid-content">
																<el-form-item  prop="ProjectValue">
																<span slot="label"><b>Enter The Set-up’s Budget</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																	<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																	<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																</span>
															<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																<span class="tooltip-text2">Before an approved "Purchase Order" can be assigned to the awardee vendor, a budget check is conducted: The "Purchase Order" will be suspended in case the sum of the "Purchase Order" value, and the value of the overall "Set-up’s" past raised "Purchase Orders", exceeds the "Set-up" Budget. Suspended "Purchase Orders" can only be released once the "Set-up" Budget is increased.</span>
															</span>
		                                    					</span>

																	<el-input type="text" v-on:change="commaprice()" v-model.number="ProjectInfo.ProjectValue" placeholder="Enter Set-up’s Budget"></el-input>
														        </el-form-item>
															</div>
														</el-col>

														<el-col :span="12">
															<div class="grid-content">
																<el-form-item prop="ProjectCompanyCurrency">
																<span slot="label"><b>Select The Set-up’s Budget Currency</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: 30px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">All the procurement transcations will be reflected with the selected currency.</span>
																	</span>
		                                    					</span>

																	<el-select filterable style="width: 100%; padding: 0px;" v-model="ProjectInfo.ProjectCompanyCurrency" placeholder="Select Currency">
																			
																	    <el-option label="AED" value="AED,"></el-option>
																	    <el-option label="SAR" value="SAR,"></el-option>
																	    <el-option label="USD" value="USD,"></el-option>
																		    
																		</el-select>
														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="12">
															<div class="grid-content">
																<el-form-item prop="ProjectPODOACriterion">
																<span slot="label"><b>Select the Delegation of Authority’s criterion applicable to Purchase Orders</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">Approving "Purchase Orders" is always done according to my organization’s Delegation of Authority (DoA). I’m offered the possibility to select the "Purchase Orders’" criterion of escalation and approval, from the following list: The Unit Rate of each "Purchase Order’s" line; The "Purchase Order" line value; or The overall value of the "Purchase Order". </span>
																	</span>
		                                    					</span>

																	<el-select style="width: 100%; padding: 0px;" v-model="ProjectInfo.ProjectPODOACriterion" placeholder="Select the Delegation of Authority’s criterion applicable to Purchase Orders">
																			
																	    <el-option label="The Unit Rate of each Purchase Order line" value="PO line Unit Rate Value"></el-option>
																	    <el-option label="The Purchase Order line value" value="PO line Value"></el-option>
																	    <el-option label="The overall value of the Purchase Order" value="PO value"></el-option>
																		    
																	</el-select>
														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="12">
															<div class="grid-content">
																<el-form-item prop="ProjectRNDOACriterion">
																<span slot="label"><b>Select the Delegation of Authority’s criterion applicable to Receipt Notes</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: 30px; left: -220px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">Approving "Receipt Notes" is always done according to my organization’s Delegation of Authority (DoA). I’m offered the possibility to select the "Receipt Notes’" criterion of escalation and approval, from the following list: The Unit Rate of each "Receipt Note’s" line; or The overall value of the "Receipt Note". </span>
																	</span>
		                                    					</span>

																	<el-select style="width: 100%; padding: 0px;" v-model="ProjectInfo.ProjectRNDOACriterion" placeholder="Select the Delegation of Authority’s criterion applicable to Receipt Notes">
																			
																	    <el-option label="The Unit Rate of each Receipt Note line" value="RN Line Unit Rate Value"></el-option>
																	    <el-option label="The Receipt Note line value" value="RN line Value"></el-option>

																	</el-select>
														        </el-form-item>
															</div>
														</el-col>


														<el-col :span="24">
															<div class="grid-content">
																<el-form-item prop="ProjectAuctionType">
																<span slot="label"><b>Select the proposals’ sourcing methodology</b></span>

																<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																	<span class="fa-stack fa-1x">
																		<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																		<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																	</span>
																	<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																		<span class="tooltip-text2">I’m offered the possibility to choose the methodology that my organization will adopt to source proposals from the approved Vendors. The available options are: Sealed bids; Live Auctions; or both. </span>
																	</span>
		                                    					</span>

																	<el-select filterable multiple style="width: 100%; padding: 0px;" v-model="ProjectInfo.ProjectAuctionType" placeholder="Select Action Type">
																		
																	    <el-option label="Live Auctions" value="Live Auctions"></el-option>
																	    <!-- <el-option label="Japanese Auction" value="Japanese Auction"></el-option> -->
																	    <el-option label="Sealed Bids" value="Sealed Bid"></el-option>
																		    
																		</el-select>
														        </el-form-item>
															</div>
														</el-col>

														

														<el-col :span="24">
															<div class="grid-content">
																<el-form-item prop="ProjectTsNCs">
																<span slot="label"><b>Procurement General Terms & Conditions</b></span>

																	<span style="z-index: 1" class="mytooltip tooltip-effect-1">
																		<span class="fa-stack fa-1x">
																			<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
																			<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
																		</span>
																		<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
																			<span class="tooltip-text2">I’m offered the possibility to set the General Terms & Conditions that will govern my organization’s with the Vendors. These terms will be automatically attached to all the Requests for Proposals that will be sent to the vendors.  </span>
																		</span>
			                                    					</span>

																	<el-input
																	  type="textarea"
																	  :rows="4"
																	  placeholder="Please Enter The Organization's Terms and Conditions"
																	  v-model="ProjectInfo.ProjectTsNCs">
																	</el-input>
												        		</el-form-item>
															</div>
														</el-col>
													</el-row>


											<el-row :gutter="20">
												<el-col :span="24">
													<div class="alert alert-info">
			                                            <!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button> -->
			                                            <!-- <h4 class="text-info"> Role Completing Information</h4> -->
			                                            <i class="fa fa-exclamation-circle"></i> If you are not sure how to assign the roles below, please click the button to play the tutorial video.
			                                            <button type="button" class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#VideoModal"> Tutoiral</button>
			                                        </div>
			                                    </el-col>
												

												<el-col :span="18">
			                                        <div class="card">
							                            <div class="card-body">
							                                <h4 class="card-title">Roles Assignments & Delegation of Authority</h4>
							                                <h6 class="card-subtitle">Please complete and/or update the list of employee(s) to which the below roles are assigned.</h6>
							                                <!-- Nav tabs -->
							                                <div class="vtabs">
							                                    <ul class="nav nav-tabs tabs-vertical" role="tablist">
							                                    	<li style="background-color: rgb(255, 47, 47, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#CAD" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Application Administrator</span> </a> </li>

							                                        <li style="background-color: rgb(1255, 179, 0, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#PRO" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Originator</span> </a> </li>

							                                        <li style="background-color: rgb(1255, 179, 0, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#PRV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Validator</span></a> </li>

							                                        <li style="background-color: rgb(77, 208, 225, 0.5);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RFQM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Request for Proposals Administrator</span></a> </li>

							                                        <li style="background-color: rgb(199, 0, 57, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#POO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Originator</span></a> </li>

							                                        <li style="background-color: rgb(199, 0, 57, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#POV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Validator</span></a> </li>

							                                        <li style="background-color: rgb(123, 31, 162, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RNO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Originator</span></a> </li>

							                                        <li style="background-color: rgb(123, 31, 162, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RNV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Validator</span></a> </li>

							                                        <li style="background-color: rgb(77, 182, 172, 1);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#SLM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Vendors Qualification Administrator</span></a> </li>

							                                        <li style="background-color: rgb(161, 136, 127, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#INV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Invoice Checker</span></a> </li>
	

							                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ALMR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Material Update Request Originator </span></a> </li>

							                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#LMA" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Administrator</span></a> </li>

							                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ALMV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Validator</span></a> </li>


							                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Originator</span></a> </li>
							                                        
							                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Validator</span></a> </li>
							                                        

							                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Originator</span></a> </li>
							                                        
							                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Validator</span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#SIIRPT" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom In-Charge</span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ASTMGR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Manager</span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RTIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Transaction Request Originator </span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ATSIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Transaction Request Validator </span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RTSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Items Update Request Originator </span></a> </li>

							                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ATSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Items Update Request Validator </span></a> </li>
								                                       

							                                    </ul>
							                                    <!-- Tab panes -->
							                                    <div  style="width: 100%" class="tab-content">
																	<div class="tab-pane StickeyPanel active show" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Roles Assignments & Delegation of Authority:</h3>
											                                    <p>Please select a tab from the left side and drag and drop the employee(s) in their specific roles.</p>
													                        </div>
											                            </div>
											                        </div>
							                                    	<div class="tab-pane StickeyPanel" id="CAD" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Application Administrator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Application Administrator(s) will manage the organization’s account on Ogéo. The Administrator will have the ability to assign roles to the employees and create "Set-ups". This is the most important role under Ogéo, and as such, shall be held by employees who are fully aware of the organization’s procurement procedures, rules and regulations.</p>

											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function, or to any other function which is responsible for driving the use of ERP systems (Centre of Excellence…)</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                            	Holder(s) of the Application Administrator role
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="CAD_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Application Administrator Role</span>
																					    </div>

																						<draggable :list="CAD_List" element="el-collapse" @add="onAddCAD" :options="{group:'people'}" >
																						    <el-collapse-item v-if="CAD_List.length > 0" v-for="(e, index) in CAD_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(CAD_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>

											                        <div class="tab-pane StickeyPanel" id="PRO" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Purchase Enquiry Originator <i class="italic">role assignment</i>:</h3>
											                                    
											                                    <p>The Purchase Enquiry Originator(s) will be tasked with creating multiline "Purchase Enquiries" for the "Set-up". On Ogéo, creating a "Purchase Enquiry", which can be created for either Materials or Services, sets in motion the process of procurement.</p>
											                                    
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function which is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry", or any other function that holds the "Set-up" P/L responsibility.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Purchase Enquiry Originator Role
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="PRO_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Purchase Enquiry Originator Role</span>
																					    </div>

																						<draggable :list="PRO_List" element="el-collapse" @add="onAddPRO" :options="{group:'people'}" >
																						    <el-collapse-item v-if="PRO_List.length > 0" v-for="(e, index) in PRO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(PRO_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


											                        <div class="tab-pane StickeyPanel" id="PRV" role="tabpanel">
																		<div class="row">
																			<div class="col-lg-12">
													                            <h3>Purchase Enquiry Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Purchase Enquiry Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Purchase Enquiries" created by the employees holding the Purchase Enquiry Originator role. To enable this, the "Purchase Enquiries’" Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p>
													                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function within the Customer’s organization that is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry" or any other function that holds the "Set-up" P/L responsibility.</p>

																				<el-select style="width: 100%;" v-model="PRV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="PRV_Number != null">
																				<div class="card" v-for="iteration in parseInt(PRV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Purchase Enquiry Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="PRV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Purchase Request Validator Role</span>
																					    </div>
																						
																						<draggable :list="PRV_List['level_' + iteration]" element="el-collapse" @add="onAddPRV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="PRV_List['level_' + iteration].length != 0" v-for="(e, index) in PRV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'PRV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(PRV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>


											                        <div class="tab-pane StickeyPanel" id="RFQM" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Request for Proposals Administrator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Request for Proposals Administrator(s) will be tasked with creating multiline "Requests for Proposals". The employees holding this role will be responsible for publishing the "Request for Proposal" to the approved bidding vendors, so that they can submit their offers to the organization on Ogéo. For the sake of governance, the "Requests for Proposals" are solely created on the back of: </p>
											                                    <ul>
											                                    	<li>Approved Purchase Enquiries; or</li>
											                                    	<li>Approved Rate Contract Creation Requests.</li>
											                                    </ul>
											                                    <p>The employees holding this role interact with the Vendors, conduct Live Auctions, and review and comment on the Ogéo-generated Commercial Evaluation reports. </p>
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Request for Proposals Role
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RFQM_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Request for Proposals Administrator Role</span>
																					    </div>

																						<draggable :list="RFQM_List" element="el-collapse" @add="onAddRFQM" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RFQM_List.length > 0" v-for="(e, index) in RFQM_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RFQM_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>



											                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanel" id="ALMR" role="tabpanel">
											                        	<div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Library of Material Update Request Originator  <i class="italic">role assignment</i>:</h3>
											                                    <p>The Library of Material Update Request Originator(s) will be tasked with requesting that new materials are added to the organization’s "Library of Materials". Such requests are subject to reviews and approvals before the subject materials are added to the "Library of Materials". </p>
											                                    <p> It’s important to note that the use of "Libraries of Materials", when originating "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time. </p>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Library of Material Update Request Originator 
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="ALMR_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Library of Material Update Request Originator Role</span>
																					    </div>

																						<draggable :list="ALMR_List" element="el-collapse" @add="onAddALMR" :options="{group:'people'}" >
																						    <el-collapse-item v-if="ALMR_List.length > 0" v-for="(e, index) in ALMR_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ALMR_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
																	</div>




											                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanel" id="LMA" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Library of Materials Administrator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Library of Material Administrator(s) will be tasked with reviewing the requests to add new materials to the organization’s "Library of Materials" as raised by the employees that hold the role of Library of Material Update Request Originator. The role involves updating the material’s information before the approval to add to the "Library of Materials" is sought. </p>
											                                    <p>It’s important to note that the use of "Libraries of Materials", to create "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time. </p>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Library of Materials Administrator
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="LMA_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Library of Materials Administrator Role</span>
																					    </div>

																						<draggable :list="LMA_List" element="el-collapse" @add="onAddLMA" :options="{group:'people'}" >
																						    <el-collapse-item v-if="LMA_List.length > 0" v-for="(e, index) in LMA_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(LMA_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


											                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanel" id="ALMV" role="tabpanel">
											                            <div class="row">
																			<div class="col-lg-12">
													                            <h3>Library of Materials Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Library of Material Validator(s) will be tasked with ruling on (approving/rejecting) the requests to add new items to the organization’s "Library of Materials" raised by the employees holding the role of Library of Material Administrator. To enable this, the organization must upload, onto Ogéo, their Library of Materials’ Delegation of Authority: The number of level of validation, and the respective seniority in the chain of approvals. (Ogéo can accommodate as many as 8 levels of approvals Level-1 Is the entry level approver whereas the Level-8 is the final approver).</p> 
												                            	<p>It’s important to note that the use of Libraries of Materials, to create "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time.</p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>

																				<el-select style="width: 100%;" v-model="ALMV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="ALMV_Number != null">
																				<div class="card" v-for="iteration in parseInt(ALMV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Library of Materials Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="ALMV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Library of Materials Validator Role</span>
																					    </div>
																						
																						<draggable :list="ALMV_List['level_' + iteration]" element="el-collapse" @add="onAddALMV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="ALMV_List['level_' + iteration].length != 0" v-for="(e, index) in ALMV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'ALMV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ALMV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>


											                        


											                        <div class="tab-pane StickeyPanel" id="POO" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Purchase Order Originator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Purchase Order Originator(s) will be tasked with creating multiline "Purchase Orders" for Materials and/or Services. For the sake of governance, the employees holding this role can create "Purchase Orders", solely on the back of:</p>
											                                    <ul>
											                                    	<li>The results of the finalised "Commercial Evaluations"; or</li>
											                                    	<li>The approved "Rate Contracts".</li>            
											                                    </ul>
											                                    <p>In addition, under certain circumstances (mainly if the awardee vendor fails to deliver the sourced materials and/or services according to the organization's Terms & Conditions), the Purchase Order Originator will be in position to initiate an already awarded "Purchase Order".</p>
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the materials and/or the service that is the subject of the Purchase Enquiry that is linked to the Purchase Order.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Purchase Order Originator Role
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="POO_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Purchase Order Originator Role</span>
																					    </div>

																						<draggable :list="POO_List" element="el-collapse" @add="onAddPOO" :options="{group:'people'}" >
																						    <el-collapse-item v-if="POO_List.length > 0" v-for="(e, index) in POO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(POO_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


												                    <div class="tab-pane StickeyPanel" id="POV" role="tabpanel">
												                    	<div class="row">
												                            <div class="col-lg-12">
													                            <h3>Purchase Order Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Purchase Order Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Purchase Orders" created by the employees holding the Purchase Order Originator role. To enable this, the Purchase Orders’ Delegation of Authority (i.e. the number of Purchase Orders’ levels of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p>
													                            <p>In addition, the Purchase Order Validator will be in position to rule on the "Purchase Order" cancelled by the Purchase Order Originator.</p>
													                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Purchase Order, which is itself linked to a Purchase Enquiry.</p>

																				<el-select style="width: 100%;" v-model="POV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="POV_Number != null">
																				<div class="card" v-for="iteration in parseInt(POV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Purchase Order Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="POV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Purchase Order Validator Role</span>
																					    </div>
																						
																						<draggable :list="POV_List['level_' + iteration]" element="el-collapse" @add="onAddPOV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="POV_List['level_' + iteration].length != 0" v-for="(e, index) in POV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'POV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(POV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>

																					    

																			        </div>

																			        <div align="center" v-if="iteration == POV_Number" class="card-footer">
																			        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
																			        </div>

																			        <div v-if="iteration < POV_Number" v-for="(currency, index) in ProjectInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
																			        	<template v-if="index == 0">
																				        	<div slot="footer" class="input-group">
													                                            <div class="input-group-prepend">
													                                                <span class="input-group-text">{{ currency }}</span>
													                                            </div>
													                                            <input :id="'POV_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
													                                            <input :id="'POV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" :placeholder="'Enter Financial Limit ('+ ProjectInfo.ProjectPODOACriterion+')' " >
													                                            <div class="input-group-append">
													                                                <span class="input-group-text">.00</span>
													                                            </div>
													                                        </div>
													                                    </template>
																			        </div>

																			    </div>
																			    </template>
													                    	</div>

													                    	
												                    	</div>
												                    </div>


											                        <div class="tab-pane StickeyPanel" id="RNO" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Receipt Note Originator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Receipt Note Originator(s) will be tasked with creating multiline "Receipt Notes" to document, on Ogéo, the receipting of the delivered materials and/or services. The employees holding this role create the "Receipt Note" at the time of the delivery by the Vendor, to whom the "Purchase Order" was issued. </p>
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the "Purchase Order", which is itself linked to a "Purchase Enquiry".</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Receipt Note Originator Role
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RNO_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Receipt Note Originator Role</span>
																					    </div>

																						<draggable :list="RNO_List" element="el-collapse" @add="onAddRNO" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RNO_List.length > 0" v-for="(e, index) in RNO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RNO_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


												                    <div class="tab-pane StickeyPanel" id="RNV" role="tabpanel">

												                        <div class="row">
												                            <div class="col-lg-12">
													                            <h3>Receipt Note Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Receipt Note Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Receipt Notes" created by the employees holding the Receipt Note Originator role. To enable this, the Receipt Notes’ Delegation of Authority (The number of Receipt Notes level of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up", must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level approver whereas the Level-8 is the final approver). </p>
													                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function, which is responsible for utilising the material and/or the service that is the subject of a "Purchase Order", which is itself linked to a "Purchase Enquiry".</p>

																				<el-select style="width: 100%;" v-model="RNV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="RNV_Number != null">
																				<div class="card" v-for="iteration in parseInt(RNV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Receipt Note Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="RNV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Receipt Note Validator Role</span>
																					    </div>
																						
																						<draggable :list="RNV_List['level_' + iteration]" element="el-collapse" @add="onAddRNV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="RNV_List['level_' + iteration].length != 0" v-for="(e, index) in RNV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'RNV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RNV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>

																					    

																			        </div>

																			        <div align="center" v-if="iteration == RNV_Number" class="card-footer">
																			        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
																			        </div>

																			        <div v-if="iteration < RNV_Number" v-for="(currency, index) in ProjectInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
																			        	<template v-if="index == 0">
																				        	<div slot="footer" class="input-group">
													                                            <div class="input-group-prepend">
													                                                <span class="input-group-text">{{ currency }}</span>
													                                            </div>
													                                            <input :id="'RNV_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
													                                            <input :id="'RNV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" :placeholder="'Enter Financial Limit ('+ ProjectInfo.ProjectRNDOACriterion+')'" >
													                                            <div class="input-group-append">
													                                                <span class="input-group-text">.00</span>
													                                            </div>
													                                        </div>
													                                    </template>
																			        </div>
																			    </div>
																			    </template>
													                    	</div>

													                    	
												                    	</div>
												                    </div>


											                        <div class="tab-pane StickeyPanel" id="SLM" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Vendors Qualification Administrator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Vendors Qualification Administrator(s) will be tasked with qualifying, approving and enlisting Vendors that the organization has chosen to work with, for all of its "Set-ups". These vendors will then be in position to access Ogéo in order to:</p>
											                                    <ul>
											                                    	<li>Receive "Requests for Proposals"; </li>
											                                    	<li>Submit bids; </li>
											                                    	<li>Participate in Live Auctions;</li>
											                                    	<li>Receive "Purchase Orders"; and </li>
											                                    	<li>Submit invoices. </li>
											                                    </ul>
											                                    <p>The process of vendors’ qualification involves assigning Ogéo’s access credentials to the vendors’ representatives.</p>
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will belong to the organization’s vendors.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Vendors Qualification Administrator Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="SLM_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Vendors Qualification Administrator Role</span>
																					    </div>

																						<draggable :list="SLM_List" element="el-collapse" @add="onAddSLM" :options="{group:'people'}" >
																						    <el-collapse-item v-if="SLM_List.length > 0" v-for="(e, index) in SLM_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(SLM_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>




											                        <div class="tab-pane StickeyPanel" id="INV" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>The Invoice Checker <i class="italic">role assignment</i>:</h3>
											                                    <p>The Invoice Checker(s) will be tasked with reviewing the invoices raised, through the Vendor Portal, to ensure that the invoied amount matches the amount keyed in by the Vendors' authorized employees.</p>
											                                    <p>Vendors can raise invoices on the back of the following transactions:</p>
											                                    <ul>
											                                    	<li>Amounts, contractually due to the vendors on the basis of awarded "Purchase Orders", become due for payment as evidenced by the origination  and approval of "Receipt Notes", and</li>
											                                    	<li>If applicable, amounts contractually retained by the organization, become due for release, after the elapse of the retention timeframe and the fulfilment of the "Purchase Orders".</li>
											                                    </ul>
											                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Finance Function (Accounts Payable).</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Invoice Checker:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="INV_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with The Invoice Checker Role</span>
																					    </div>

																						<draggable :list="INV_List" element="el-collapse" @add="onAddINV" :options="{group:'people'}" >
																						    <el-collapse-item v-if="INV_List.length > 0" v-for="(e, index) in INV_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(INV_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>




											                        <div class="tab-pane StickeyPanel" id="RCCO" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Rate Contract Creation Request Originator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Rate Contract Creation Request Originator(s) will be tasked with originating requests to establish "Rate Contracts" for selected materials. The employees holding this role need to access the "Library of Materials" to select the materials for which they need to see "Rate Contracts" established with Vendors.</p> 
											                                    <p>It’s important to note that the use of "Rate Contracts" enables a speedy sourcing of materials when the "Purchase Enquiries" are originated.</p>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the Customer’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Rate Contract Creation Request Originator Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RCCO_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Rate Contract Creation Request Originator Role</span>
																					    </div>

																						<draggable :list="RCCO_List" element="el-collapse" @add="onAddRCCO" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RCCO_List.length > 0" v-for="(e, index) in RCCO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RCCO_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>
											                        

											                        <div class="tab-pane StickeyPanel" id="RCCV" role="tabpanel">
											                            <div class="row">
																			<div class="col-lg-12">
													                            <h3>Rate Contract Creation Request Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Rate Contract Creation Request Validator(s) will be tasked with ruling on (approving/rejecting) the "Rate Contract" Creation Requests that were initiated by the authorized employees. To enable this, the organization must upload, onto Ogéo, their Rate Contracts Creation Requests’  Delegation of Authority: The number of level of validation, and the respective seniority in the chain of approvals. (Ogéo can accommodate as many as 8 levels of approvals Level-1 Is the entry level approver whereas the Level-8 is the final approver).</p>
													                            <p>It’s important to note that the use of "Rate Contracts" enables a speedy sourcing of materials when the "Purchase Enquiries" are originated.</p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>

																				<el-select style="width: 100%;" v-model="RCCV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="RCCV_Number != null">
																				<div class="card" v-for="iteration in parseInt(RCCV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Rate Contract Creation Request Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="RCCV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Contract Creation Request Approver Role</span>
																					    </div>
																						
																						<draggable :list="RCCV_List['level_' + iteration]" element="el-collapse" @add="onAddRCCV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="RCCV_List['level_' + iteration].length != 0" v-for="(e, index) in RCCV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'RCCV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RCCV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>


											                        <div class="tab-pane StickeyPanel" id="RCO" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Rate Contract Originator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Rate Contract Originator(s) will be tasked with initiating the process of creating "Rate Contracts", on the back of approved Rate Contract Creation Requests. Once the Rate Contracts are originated by the employees holding this role, they are sent for approval before the Vendors are asked to submit their proposals.</p>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Rate Contract Originator Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RCO_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Rate Contract Originator Role</span>
																					    </div>

																						<draggable :list="RCO_List" element="el-collapse" @add="onAddRCO" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RCO_List.length > 0" v-for="(e, index) in RCO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RCO_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>



											                        <div class="tab-pane StickeyPanel" id="RCV" role="tabpanel">
												                    	<div class="row">
												                            <div class="col-lg-12">
													                            <h3>Rate Contract Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Rate Contract Validator(s) will be tasked with ruling on (approving/rejecting) the "Rate Contracts". To enable this, the organization must upload, onto Ogéo, their Rate Contracts’ Delegation of Authority: The number of levels of validation, and the financial limit-based seniority in the chain of approvals (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
													                            <p>The "Rate Contracts" will solely be created on the back of the proposals submitted by the different vendors that received the Request For Proposals.  </p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>

																				<el-select style="width: 100%;" v-model="RCV_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="RCV_Number != null">
																				<div class="card" v-for="iteration in parseInt(RCV_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Rate Contract Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="RCV_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Rate Contract Validator Role</span>
																					    </div>
																						
																						<draggable :list="RCV_List['level_' + iteration]" element="el-collapse" @add="onAddRCV" :options="{group:'people'}" >

																						    <el-collapse-item v-if="RCV_List['level_' + iteration].length != 0" v-for="(e, index) in RCV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'POV_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RCV_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>

																					    

																			        </div>

																			        <div align="center" v-if="iteration == RCV_Number" class="card-footer">
																			        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
																			        </div>

																			        <div v-if="iteration < RCV_Number" v-for="(currency, index) in ProjectInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
																			        	<template v-if="index == 0">
																				        	<div slot="footer" class="input-group">
													                                            <div class="input-group-prepend">
													                                                <span class="input-group-text">{{ currency }}</span>
													                                            </div>
													                                            <input :id="'RCV_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
													                                            <input :id="'RCV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest figure)" :placeholder="'Enter Financial Limit (Overall value of the Rate Contract)'" >
													                                            <div class="input-group-append">
													                                                <span class="input-group-text">.00</span>
													                                            </div>
													                                        </div>
													                                    </template>
																			        </div>

																			    </div>
																			    </template>
													                    	</div>

													                    	
												                    	</div>
												                    </div>





												                   
	
												                    <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="ASTMGR" role="tabpanel">
											                            <div class="row">
																			<div class="col-lg-12">
													                            <h3>Storeroom Manager <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Storeroom Manager(s) have access to ALL the Storerooms information across the organizations.</p>
													                            <p>The Storeroom Manager(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities:</p>
													                            <ul>
													                            	<li>Ruling on (approving/rejecting) the request to add new “Storeroom Items”, as originated by the Storeroom In-Charge;</li>
													                            	<li>Ruling on (approving/rejecting) the request to suspend the “Storeroom Items” status, as originated by the Storeroom In-Charge;</li>
													                            	<li>Ruling on (approving/rejecting) the outcome of the periodic Stock Count Exercises, as originated by the Storeroom In-Charge; and</li>
													                            	<li>Originating and/or approving the Storeroom Items Transfer between Storerooms. (Level 1 will originate the transfer while Level 2 and above will approve)</li>
													                            </ul>
													                            <p>To enable this, the Storerooms’ Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations</p>

																				<el-select style="width: 100%;" v-model="ASTMGR_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="ASTMGR_Number != null">
																				<div class="card" v-for="iteration in parseInt(ASTMGR_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Storeroom Manager Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="ASTMGR_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom Manager Role</span>
																					    </div>
																						
																						<draggable :list="ASTMGR_List['level_' + iteration]" element="el-collapse" @add="onAddASTMGR" :options="{group:'people'}" >

																						    <el-collapse-item v-if="ASTMGR_List['level_' + iteration].length != 0" v-for="(e, index) in ASTMGR_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'ASTMGR_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ASTMGR_List['level_' + iteration], index, 'ASTMGR', iteration, e.email)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>

											                        <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="SIIRPT" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>Storeroom In-Charge <i class="italic">role assignment</i>:</h3>
											                                    <p>The Storeroom In-Charge will be tasked will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities: </p>
											                                    <ul>
											                                    	<li>Accepting the requests to issue Storeroom Items on the back of approved “Storeroom Item Issue Notes”, and actually issuing the concerned “Storeroom Items” from the Storeroom; </li>
											                                    	<li>Accepting the requests to return Storeroom Items on the back of approved “Storeroom Item Return Notes”, and actually accepting the return of the concerned Storeroom Items to the Storeroom; </li>
											                                    	<li>Originating the addition of new Storeroom Items, as approved by the Storeroom Items Update Request Validator;</li>
											                                    	<li>Originating the suspension of “Storeroom Items” status, as approved by the Storeroom Items Update Request Validator;</li>
											                                    	<li>Incrementing the levels of “Storeroom Items”, to document the receipting of such “Storeroom Items”, when the related “Receipt Notes’ are accepted by created by the employees holding the Receipt Note Validator role;</li>
											                                    	<li>Originating periodic Stock Count Exercises; and</li>
											                                    	<li>
											                                    		Executing forced “Storeroom Items” level movement on the back of:
											                                    		<ul>
											                                    			<li>Stock Count Exercise outcome, as approved by the Storeroom Manager; and</li>
											                                    			<li>
											                                    				Storeroom Items Transfer as  approved by Storeroom Manager and, as the case may be:
											                                    				<ul>
											                                    					<li>Actually issuing the concerned “Storeroom Items”, from the Storeroom, for the Storeroom Items Transfer to happen; or</li>
											                                    					<li>Actually accepting the return of the concerned “Storeroom Items” to the Storeroom, for the Storeroom Items Transfer to happen.</li>
											                                    				</ul>
											                                    			</li>
											                                    		</ul>
											                                    	</li>
											                                    </ul>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Storeroom In-Charge Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="SIIRPT_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom In-Charge Role</span>
																					    </div>

																						<draggable :list="SIIRPT_List" element="el-collapse" @add="onAddSIIRPT" :options="{group:'people'}" >
																						    <el-collapse-item v-if="SIIRPT_List.length > 0" v-for="(e, index) in SIIRPT_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(SIIRPT_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


											                        <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="RTIRS" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>The Storeroom Transaction Request Originator <i class="italic">role assignment</i>:</h3>
											                                    <p>The Storeroom Transaction Request Originator(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities:</p>
											                                    <ul>
											                                    	<li>Originating “Storeroom Item Issue Notes”; and </li>
											                                    	<li>Originating “Storeroom Item Return Notes”.</li>
											                                    </ul>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Function or any other Function which is responsible for utilising the “Storeroom Item” or any other function that holds a P/L responsibility.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Storeroom Transaction Request Originator Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RTIRS_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom Transaction Request Originator Role</span>
																					    </div>

																						<draggable :list="RTIRS_List" element="el-collapse" @add="onAddRTIRS" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RTIRS_List.length > 0" v-for="(e, index) in RTIRS_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RTIRS_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


											                        <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="ATSIRS" role="tabpanel">
											                            <div class="row">
																			<div class="col-lg-12">
													                            <h3>The Storeroom Transaction Request Validator <i class="italic">role assignment</i>:</h3>
													                            <p>The Storeroom Transaction Request Validator(s) will be tasked with ruling on (approving/rejecting) the requests created by the employees holding the Storeroom Transaction Request Originator role. </p>
													                            <p>To enable this, the Storeroom Transactions’ Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Function or any other Function which is responsible for utilising the “Storeroom Item” or any other function that holds a P/L responsibility.</p>


																				<el-select style="width: 100%;" v-model="ATSIRS_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="ATSIRS_Number != null">
																				<div class="card" v-for="iteration in parseInt(ATSIRS_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Storeroom Transaction Request Validator Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="ATSIRS_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom Transaction Request Validator Role</span>
																					    </div>
																						
																						<draggable :list="ATSIRS_List['level_' + iteration]" element="el-collapse" @add="onAddATSIRS" :options="{group:'people'}" >

																						    <el-collapse-item v-if="ATSIRS_List['level_' + iteration].length != 0" v-for="(e, index) in ATSIRS_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'ATSIRS_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ATSIRS_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>

											                        <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="RTSI" role="tabpanel">
											                            <div class="row">
											                            	<div class="col-lg-12">
											                                    <h3>The Storeroom Items Update Request Originator  <i class="italic">role assignment</i>:</h3>
											                                    <p>The Storeroom Items Update Request Originator(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities: </p>
											                                    <ul>
											                                    	<li>Requesting that new materials, extracted from the “Library of Materials” are turned into “Storeroom Items”; and </li>
											                                    	<li>Requesting, that the status of “Storeroom Items” is suspended for existing Storeroom Items; </li>
											                                    </ul>
											                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations. This role can only also be held by employees of the organization’s Operations Function.</p>
													
														                        <div class="card">
														                            <div class="card-header">
														                                Holder(s) of the Storeroom Items Update Request Originator Role:
														                            </div>
														                            <div class="card-body">

														                            	<div align="center" v-if="RTSI_List.length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom Items Update Request Originator Role</span>
																					    </div>

																						<draggable :list="RTSI_List" element="el-collapse" @add="onAddRTSI" :options="{group:'people'}" >
																						    <el-collapse-item v-if="RTSI_List.length > 0" v-for="(e, index) in RTSI_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(RTSI_List, index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
															                            
														                            </div>
														                        </div>
													                        </div>

													                        

											                            </div>
											                        </div>


											                        <div v-if="ProjectInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanel" id="ATSI" role="tabpanel">
											                            <div class="row">
																			<div class="col-lg-12">
													                            <h3>The Storeroom Items Update Request Validator <i class="italic">role assignment</i>:</h3>
													                            
													                            <p>The Storeroom Items Update Request Validator(s) will be tasked with ruling on (approving/rejecting) the requests created by the employees holding the Storeroom Items Update Request Originator role. </p>
													                            <p>To enable this, the Storeroom Items Update Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
													                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations. This role can only also be held by employees of the organization’s Operations Function.</p>

																				<el-select style="width: 100%;" v-model="ATSI_Number" placeholder="Enter number of validators">
																				    <el-option label="1" value="1"></el-option>
																				    <el-option label="2" value="2"></el-option>
																				    <el-option label="3" value="3"></el-option>
																				    <el-option label="4" value="4"></el-option>
																				    <el-option label="5" value="5"></el-option>
																				    <el-option label="6" value="6"></el-option>
																				    <el-option label="7" value="7"></el-option>
																				    <el-option label="8" value="8"></el-option>
																				</el-select>

																				<br><hr>
																				
																				<template v-if="ATSI_Number != null">
																				<div class="card" v-for="iteration in parseInt(ATSI_Number)" :key="iteration">
																			        <div class="card-header">
																			            Holder(s) of the Storeroom Items Update Request Role (Level-{{ iteration }}) Approval
																			        </div>
																			        <div class="card-body">

																			        	<div align="center" v-if="ATSI_List['level_' + iteration].length == 0">
																					     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																					    </div>
																					    <div align="center" v-else>
																					    	<span class="text-success">Emplyees List with Storeroom Items Update Request Role</span>
																					    </div>
																						
																						<draggable :list="ATSI_List['level_' + iteration]" element="el-collapse" @add="onAddATSI" :options="{group:'people'}" >

																						    <el-collapse-item v-if="ATSI_List['level_' + iteration].length != 0" v-for="(e, index) in ATSI_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																						    	<div v-bind:id="'ATSI_level_'+iteration" style="display: none"></div>
																						    	<div class="float-left">Name: {{e.fullName}}</div><br>
																						        <div class="float-left">Email: {{e.email}}</div><br>
																						        <div class="float-left">Designation: {{e.designation}}</div><br>
																						        <div class="float-right p-b-10">
																						        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ATSI_List['level_' + iteration], index)"> Remove Employee</a>
																						        </div>
																						     </el-collapse-item>
																						 
																						</draggable>
																			        </div>
																			    </div>
																				</template>
													                    	</div>
													                    	

											                            </div>
											                        </div>

													               


											                        


											                        
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
				                                </el-col>

				                                <el-col class="StickeyPanel" :span="6">
													
													<div class="row "> <!-- b-l -->

					                                	<div class="col-lg-12 "> <!-- p-t-10 b-l -->
					                                		<div class="card" style="margin-bottom: 5px">
									                            <div class="card-header">
									                                Employees List
									                            </div>
									                            <div style="height: 300px;  max-height: 300px; overflow-y: auto;" class="card-body">
									                            	<div class="drag">
										                                <!-- <draggable v-model="list" class="dragArea" :options="{group:{ name:'people',  pull:'clone', put:false }}">
																      		<div v-for="element in list">{{element.name}}</div>
																      	</draggable> -->
																		<draggable element="el-collapse" :list="EmployeesList" :options="{group:{ name:'people',  pull:'clone', put:false }}" >
																			
																		    <el-collapse-item v-if="EmployeesList.length != 0" v-for="(employee, index) in EmployeesList" :title="employee.fullName.substring(0, 20) + '...' " :name="employee.fullName" :key="employee.email">
																		        <div class="float-left">Name: {{employee.fullName}}</div><br>
																		        <div class="float-left"><b>Email:</b> {{employee.email}}</div><br>
																		        <div class="float-left"><b>Designation:</b> {{employee.designation}}</div><br>
																		        <div class="float-right p-b-10">
																	        		<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(EmployeesList, index, 'EmployeesList', 0, employee.email)"> Remove Employee</a>
																	        	</div>
																		     </el-collapse-item>
																	     
																		     <div align="center" v-if="EmployeesList.length == 0">
																		     	<span>Please Add Employee</span>
																		     </div>

																		</draggable>
										                            </div>
									                            </div>
									                        </div>
									                    </div>

					                                	<div class="col-lg-12 p-t-10"> <!-- b-l -->
												        	<!-- <label class="">New Employee Name</label> -->
												        	<input type="text" v-model="NewEmployee.fullName" class="form-control" placeholder="Enter Employee Name">
												        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.fullName">{{ NewEmployeeErrors.fullName[0] }}</span>
												      	</div>

												      	<div class="col-lg-12 p-t-10"> <!-- b-l -->
												        	<!-- <label class="">New Employee Email</label> -->
												        	<input type="email" v-model="NewEmployee.email" class="form-control" placeholder="Enter Employee Email">
												        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.email">{{ NewEmployeeErrors.email[0] }}</span>
												      	</div>

												      	<div class="col-lg-12 p-t-10 p-b-10"> <!--  b-b b-l -->
												        	<!-- <label class="">Designation</label> -->
												        	<input type="text" v-model="NewEmployee.designation"  class="form-control" placeholder="Enter Employee Designation">
												        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.designation">{{ NewEmployeeErrors.designation[0] }}</span>
												      	</div>

												      	<div class="col-lg-12 p-t-10 ">
													    	<a class="btn btn-success btn-block" style="color: white" @click="creatNewEmployee">Create New Employee</a>
													    </div>
												    </div>
				                                </el-col>
											</el-row>

											<el-row>
												<el-col :span="24">
													<br><hr>
													<a href="#" class="btn btn-block btn-primary" @click="CreateNewProject">Save Set-up Details</a>
													<hr>
												</el-col>
											</el-row>	
										</el-form>
					    			</transition>
							    </tab-content>
							    


							    <tab-content title="Review and Complete" icon="fa fa-flag-checkered">
									
									<el-row :gutter="20">
										<el-col :span="24">

											<hr>

											<h3 class="text-success" style="text-align: center;">Thank you for taking the time to fill all the details, By Clicking the below button you will start utilizing the most powerful procurement system on the planet.</h3>

											<hr>

											<article class="b-doc">
										      <div class="document">
											<h1 dir="ltr" style="text-align: center;">Please Review Our Terms And Conditions</h1>
											<p class="pandatip">PandaTip: These Website Standard Terms and Conditions provide some of the basic terms and conditions found on many websites. Certainly, the specifics of your website may call for additional terms and conditions. If yours is a website with just text and images, which owned by the Website, and your users are merely viewing and reading the contents of your website, you will likely need less extensive terms than someone who owns a more interactive website, which hosts personally identifiable information. Make sure to engage an attorney in the review of any terms and conditions you develop for your particular website.</p>
											<ol>
											<li dir="ltr">
											<p dir="ltr"><strong>Introduction</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">These Website Standard Terms And Conditions (these “Terms” or these “Website Standard Terms And Conditions”) contained herein on this webpage, shall govern your use of this website, including all pages within this website (collectively referred to herein below as this “Website”). These Terms apply in full force and effect to your use of this Website and by using this Website, you expressly accept all terms and conditions contained herein in full. You must not use this Website, if you have any objection to any of these Website Standard Terms And Conditions.</p>
											<p dir="ltr">This Website is not for use by any minors (defined as those who are not at least 18 years of age), and you must not use this Website if you a minor.</p>
											<ol start="2">
											<li dir="ltr">
											<p dir="ltr"><strong>Intellectual Property Rights</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">Other than content you own, which you may have opted to include on this Website, under these Terms, [COMPANY NAME] and/or its licensors own all rights to the intellectual property and material contained in this Website, and all such rights are reserved.</p>
											<p dir="ltr">You are granted a limited license only, subject to the restrictions provided in these Terms, for purposes of viewing the material contained on this Website,</p>
											<p class="pandatip">PandaTip: If the website is only for viewing, then you might be able to stop where we left off above. That said, you will likely need to provide more in the way of descriptive language around what users may use the website to do/for.</p>
											<ol start="3">
											<li dir="ltr">
											<p dir="ltr"><strong>Restrictions</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">You are expressly and emphatically restricted from all of the following:</p>
											<ol>
											<li dir="ltr">
											<p dir="ltr">publishing any Website material in any media;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">selling, sublicensing and/or otherwise commercializing any Website material;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">publicly performing and/or showing any Website material;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">using this Website in any way that is, or may be, damaging to this Website;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">using this Website in any way that impacts user access to this Website;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">using this Website contrary to applicable laws and regulations, or in a way that causes, or may cause, harm to the Website, or to any person or business entity;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website, or while using this Website;</p>
											</li>
											<li dir="ltr">
											<p dir="ltr">using this Website to engage in any advertising or marketing;</p>
											</li>
											</ol>
											<p dir="ltr">Certain areas of this Website are restricted from access by you and [COMPANY NAME]&nbsp;may further restrict access by you to any areas of this Website, at any time, in its sole and absolute discretion. &nbsp;Any user ID and password you may have for this Website are confidential and you must maintain confidentiality of such information.</p>
											<ol start="4">
											<li dir="ltr">
											<p dir="ltr"><strong>Your Content.</strong></p>
											</li>
											</ol>
											<p dir="ltr">In these Website Standard Terms And Conditions, “Your Content” shall mean any audio, video, text, images or other material you choose to display on this Website. With respect to Your Content, by displaying it, you grant [COMPANY NAME]&nbsp;a non-exclusive, worldwide, irrevocable, royalty-free, sublicensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.</p>
											<p dir="ltr">Your Content must be your own and must not be infringing on any third party’s rights. [COMPANY NAME]&nbsp;reserves the right to remove any of Your Content from this Website at any time, and for any reason, without notice.</p>
											<ol start="5">
											<li dir="ltr">
											<p dir="ltr"><strong>No warranties</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">This Website is provided “as is,” with all faults, and [COMPANY NAME]&nbsp;makes no express or implied representations or warranties, of any kind related to this Website or the materials contained on this Website. Additionally, nothing contained on this Website shall be construed as providing consult or advice to you.</p>
											<ol start="6">
											<li dir="ltr">
											<p dir="ltr"><strong>Limitation of liability</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">In no event shall [COMPANY NAME], nor any of its officers, directors and employees, be liable to you for anything arising out of or in any way connected with your use of this Website, whether such liability is under contract, tort or otherwise, and [COMPANY NAME], including its officers, directors and employees shall not be liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.</p>
											<ol start="7">
											<li dir="ltr">
											<p dir="ltr"><strong>Indemnification</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">You hereby indemnify to the fullest extent [COMPANY NAME]&nbsp;from and against any and all liabilities, costs, demands, causes of action, damages and expenses (including reasonable attorney’s fees) arising out of or in any way related to your breach of any of the provisions of these Terms.</p>
											<ol start="8">
											<li dir="ltr">
											<p dir="ltr"><strong>Severability</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">If any provision of these Terms is found to be unenforceable or invalid under any applicable law, such unenforceability or invalidity shall not render these Terms unenforceable or invalid as a whole, and such provisions shall be deleted without affecting the remaining provisions herein.</p>
											<ol start="9">
											<li dir="ltr">
											<p dir="ltr"><strong>Variation of Terms</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">[COMPANY NAME]&nbsp;is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review such Terms on a regular basis to ensure you understand all terms and conditions governing use of this Website.</p>
											<ol start="10">
											<li dir="ltr">
											<p dir="ltr"><strong>Assignment</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">[COMPANY NAME]&nbsp;shall be permitted to assign, transfer, and subcontract its rights and/or obligations under these Terms without any notification or consent required. However, .you shall not be permitted to assign, transfer, or subcontract any of your rights and/or obligations under these Terms.</p>
											<ol start="11">
											<li dir="ltr">
											<p dir="ltr"><strong>Entire Agreement</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">These Terms, including any legal notices and disclaimers contained on this Website, constitute the entire agreement between [COMPANY NAME]&nbsp;and you in relation to your use of this Website, and supersede all prior agreements and understandings with respect to the same.</p>
											<ol start="12">
											<li dir="ltr">
											<p dir="ltr"><strong>Governing Law &amp; Jurisdiction</strong>.</p>
											</li>
											</ol>
											<p dir="ltr">These Terms will be governed by and construed in accordance with the laws of the State of [STATE], and you submit to the non-exclusive jurisdiction of the state and federal courts located in [STATE] for the resolution of any disputes.</p>
											</div>

											    </article>
										</el-col>
									</el-row>		    	
							    </tab-content>

							    <el-button type="info" slot="prev">Back</el-button>
							    <el-button type="info" slot="next">Continue</el-button>
							    <el-button type="info" slot="finish">Complete System Setting</el-button>

							 </form-wizard>
		                	
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="VideoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-video" role="document">
			    <div class="modal-content">
				    <div class="modal-body modal-body-video">
				       	<a href="#" class="close-video" data-dismiss="modal" aria-label="Close">
				        	<span style="position: relative; top: -1p1; left: 12px;" class="fa fa-remove" aria-hidden="true"></span>
				        </a>        
				        <!-- 16:9 aspect ratio -->
						<div class="embed-responsive embed-responsive-16by9">
						  <iframe class="embed-responsive-item" src="" id="video"  allowscriptaccess="always"></iframe>
						</div>
				    </div>
			    </div>
			</div>
		</div> 


		<div id="ProjectDetailsModalId" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="projectDetailsModals" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h4 class="modal-title" id="projectDetailsModals">Set-up Title: {{ ProjectModalInfo.ProjectTitle }} (View/Edit)</h4>
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                </div>
	                <div class="modal-body">
						
						<el-form v-if="ProjectModalInfo != ''" :model="ProjectModalInfo" class="demo-form-inline" :rules="rules4" ref="AccountSettingForm3">

		                	<el-row :gutter="20">


		                		<el-col :span="24">
									<div class="grid-content">
										<el-form-item label="Enter Set-up Name" prop="ProjectTitle">
											<el-input v-model="ProjectModalInfo.ProjectTitle" placeholder="Enter Set-up name"></el-input>
								        </el-form-item>
									</div>
								</el-col>


								<el-col :span="24">
									<div class="grid-content">
										<el-form-item label="Is this Set-up a Storeroom?" prop="StoreSetup">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
												<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
											</span>
											<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">When a "Set-up" is marked as a “Storeroom”, Ogéo will prompt me to assign storeroom-related roles to the employees. </span>
											</span>
                    					</span>

										<el-select filterable style="width: 100%; padding: 0px;" @change="StoreSetupModal($event)" v-model="ProjectModalInfo.StoreSetup" placeholder="Mark As Store Set-up?">
										    <el-option label="Yes" value="Yes"></el-option>
										    <el-option label="No" value="No"></el-option>
										</el-select>

								        </el-form-item>
									</div>
								</el-col>



								<el-col :span="24">
									<div class="grid-content">
										<el-form-item label="Select Set-up Start And End Dates" prop="ProjectPeriod">
											
										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
													<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
													<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
											<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">These are the dates between which all procurement transactions are authorized by Ogéo. </span>
											</span>
                    					</span>

											<el-date-picker
											  style="width: 100%"
										      v-model="ProjectModalInfo.ProjectPeriod"
										      type="daterange"
										      range-separator="To"
										      start-placeholder="Start date"
										      end-placeholder="End date"
										      :default-time="['00:00:00', '23:59:59']"
										      value-format="yyyy-MM-dd HH:mm:ss">
										    </el-date-picker>
											
								        </el-form-item>
									</div>
								</el-col>



								<el-col :span="12">
									<div class="grid-content" id="vue">
										<el-form-item label="Enter The Set-up’s Budget" prop="ProjectValue">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
											<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
											<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
										</span>
									<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
										<span class="tooltip-text2">Before an approved "Purchase Order" can be assigned to the awardee vendor, a budget check is conducted: The "Purchase Order" will be suspended in case the sum of the "Purchase Order" value, and the value of the overall "Set-up’s" past raised "Purchase Orders", exceeds the "Set-up" Budget. Suspended "Purchase Orders" can only be released once the "Set-up" Budget is increased.</span>
									</span>
                    					</span>

											<el-input type="number" v-model.number="ProjectModalInfo.ProjectValue" placeholder="Enter Set-up’s Budget"></el-input>
								        </el-form-item>
									</div>
								</el-col>



								<el-col :span="12">
									<div class="grid-content">
										<el-form-item label="Select The Set-up’s Budget Currency" prop="ProjectCompanyCurrency">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
												<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
											</span>
											<span style="bottom: 30px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">All the procurement transcations will be reflected with the selected currency.</span>
											</span>
                    					</span>

											<el-select filterable style="width: 100%; padding: 0px;" v-model="ProjectModalInfo.ProjectCompanyCurrency" placeholder="Select Currency">
													
											    <el-option label="AED" value="AED,"></el-option>
											    <el-option label="SAR" value="SAR,"></el-option>
											    <el-option label="USD" value="USD,"></el-option>
												    
												</el-select>
								        </el-form-item>
									</div>
								</el-col>

	

								<el-col :span="12">
									<div class="grid-content">
										<el-form-item label="Select the Delegation of Authority’s criterion applicable to Purchase Orders" prop="ProjectPODOACriterion">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
												<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
											</span>
											<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Approving "Purchase Orders" is always done according to my organization’s Delegation of Authority (DoA). I’m offered the possibility to select the "Purchase Orders’" criterion of escalation and approval, from the following list: The Unit Rate of each "Purchase Order’s" line; The "Purchase Order" line value; or The overall value of the "Purchase Order". </span>
											</span>
                    					</span>

											<el-select style="width: 100%; padding: 0px;" v-model="ProjectModalInfo.ProjectPODOACriterion" placeholder="Select the Delegation of Authority’s criterion applicable to Purchase Orders">
													
											    <el-option label="The Unit Rate of each Purchase Order line" value="PO line Unit Rate Value"></el-option>
											    <el-option label="The Purchase Order line value" value="PO line Value"></el-option>
											    <el-option label="The overall value of the Purchase Order" value="PO value"></el-option>
												    
											</el-select>
								        </el-form-item>
									</div>
								</el-col>



								<el-col :span="12">
									<div class="grid-content">
										<el-form-item label="Select the Delegation of Authority’s criterion applicable to Receipt Notes" prop="ProjectRNDOACriterion">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
												<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
											</span>
											<span style="bottom: 30px; left: -220px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">Approving "Receipt Notes" is always done according to my organization’s Delegation of Authority (DoA). I’m offered the possibility to select the "Receipt Notes’" criterion of escalation and approval, from the following list: The Unit Rate of each "Receipt Note’s" line; or The overall value of the "Receipt Note". </span>
											</span>
                    					</span>

											<el-select style="width: 100%; padding: 0px;" v-model="ProjectModalInfo.ProjectRNDOACriterion" placeholder="Select the Delegation of Authority’s criterion applicable to Receipt Notes">
													
											    <el-option label="The Unit Rate of each Receipt Note line" value="RN Line Unit Rate Value"></el-option>
											    <el-option label="The Receipt Note line value" value="RN line Value"></el-option>

											</el-select>
								        </el-form-item>
									</div>
								</el-col>



								<el-col :span="24">
									<div class="grid-content">
										<el-form-item label="Select the proposals’ sourcing methodology" prop="ProjectAuctionType">

										<span style="z-index: 1" class="mytooltip tooltip-effect-1">
											<span class="fa-stack fa-1x">
												<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
												<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
											</span>
											<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
												<span class="tooltip-text2">I’m offered the possibility to choose the methodology that my organization will adopt to source proposals from the approved Vendors. The available options are: Sealed bids; Live Auctions; or both. </span>
											</span>
                    					</span>

											<el-select filterable multiple style="width: 100%; padding: 0px;" v-model="ProjectModalInfo.ProjectAuctionType" placeholder="Select Action Type">
												
											    <el-option label="Live Auctions" value="Live Auctions"></el-option>
											    <!-- <el-option label="Japanese Auction" value="Japanese Auction"></el-option> -->
											    <el-option label="Sealed Bids" value="Sealed Bid"></el-option>
												    
												</el-select>
								        </el-form-item>
									</div>
								</el-col>




								<el-col :span="24">
									<div class="grid-content">
										<el-form-item label="Procurement General Terms & Conditions" prop="ProjectTsNCs">

											<span style="z-index: 1" class="mytooltip tooltip-effect-1">
												<span class="fa-stack fa-1x">
													<i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
													<i style="color: white" class="fa fa-info fa-stack-1x"></i> 
												</span>
												<span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
													<span class="tooltip-text2">I’m offered the possibility to set the General Terms & Conditions that will govern my organization’s with the Vendors. These terms will be automatically attached to all the Requests for Proposals that will be sent to the vendors.  </span>
												</span>
                        					</span>

											<el-input
											  type="textarea"
											  :rows="4"
											  placeholder="Please Enter The Organization's Terms and Conditions"
											  v-model="ProjectModalInfo.ProjectTsNCs">
											</el-input>
						        		</el-form-item>
									</div>
								</el-col>
							</el-row>

							<el-row :gutter="20">
								<el-col :span="18">
	                                <div class="card">
			                            <div class="card-body">
			                                <h4 class="card-title">Roles Assignments & Delegation of Authority</h4>
							             	<h6 class="card-subtitle">Please complete and/or update the list of employee(s) to which the below roles are assigned.</h6>
			                                <!-- Nav tabs -->
			                                <div class="vtabs">
			                                    <ul class="nav nav-tabs tabs-vertical" role="tablist">
			                                        <li  style="background-color: rgb(216, 216, 216, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalCAD" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Application Administrator</span> </a> </li>

			                                        <li style="background-color: rgb(1255, 179, 0, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPRO" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Originator</span> </a> </li>

			                                        <li style="background-color: rgb(1255, 179, 0, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPRV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Validator</span></a> </li>

			                                        <li style="background-color: rgb(77, 208, 225, 0.5);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRFQM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Request for Proposals Administrator</span></a> </li>

			                                        <li style="background-color: rgb(199, 0, 57, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPOO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Originator</span></a> </li>

			                                        <li style="background-color: rgb(199, 0, 57, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPOV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Validator</span></a> </li>

			                                        <li style="background-color: rgb(123, 31, 162, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRNO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Originator</span></a> </li>

			                                        <li style="background-color: rgb(123, 31, 162, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRNV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Validator</span></a> </li>

			                                        <li style="background-color: rgb(77, 182, 172, 1);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSLM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Vendors Qualification Administrator</span></a> </li>


			                                        <li style="background-color: rgb(161, 136, 127, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalINV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Invoice Checker</span></a> </li>

			                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalALMR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Material Update Request Originator </span></a> </li>

			                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalLMA" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Administrator</span></a> </li>

			                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(88, 214, 141, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalALMV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Validator</span></a> </li>


			                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Originator</span></a> </li>
			                                        
			                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Validator</span></a> </li>
			                                        
			                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Originator</span></a> </li>
			                                        
			                                        <li style="background-color: rgb(233, 30, 99, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Validator</span></a> </li>


			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSIIRPT" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom In-Charge</span></a> </li>

			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalASTMGR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Manager</span></a> </li>

			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRTIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Transaction Request Originator </span></a> </li>

			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalATSIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Transaction Request Validator </span></a> </li>

			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRTSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Items Update Request Originator </span></a> </li>

			                                        <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(189, 189, 189, 0.6);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalATSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Items Update Request Validator </span></a> </li>


			                                    </ul>
			                                    <!-- Tab panes -->
			                                    <div style="width: 100%" class="tab-content">
													<div class="tab-pane active show StickeyPanelModal" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Roles Assignments & Delegation of Authority:</h3>
											             		<p>Please select a tab from the left side and drag and drop the employee(s) in their specific roles.</p>
									
										                        <!-- <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Roles Assignments & Delegation of Authority:
										                            </div>
										                            <div class="card-body">
																		<h1>Roles Assignments & Delegation of Authority:</h1>
										                            </div>
										                        </div> -->
										                        
									                        </div>

							                            </div>
							                        </div>
			                                    	<div class="tab-pane StickeyPanelModal" id="ModalCAD" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Application Administrator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Application Administrator(s) will manage the organization’s account on Ogéo. The Administrator will have the ability to assign roles to the employees and create "Set-ups". This is the most important role under Ogéo, and as such, shall be held by employees who are fully aware of the organization’s procurement procedures, rules and regulations.</p>

							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function, or to any other function which is responsible for driving the use of ERP systems (Centre of Excellence…)</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                            	Holder(s) of the Application Administrator role
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.CAD_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Application Administrator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.CAD_List" element="el-collapse" @add="onAddCADModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.CAD_List.length > 0" v-for="(e, index) in ProjectModalInfo.CAD_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.CAD_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div class="tab-pane StickeyPanelModal" id="ModalPRO" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Purchase Enquiry Originator <i class="italic">role assignment</i>:</h3>
											                                    
							                                    <p>The Purchase Enquiry Originator(s) will be tasked with creating multiline "Purchase Enquiries" for the "Set-up". On Ogéo, creating a "Purchase Enquiry", which can be created for either Materials or Services, sets in motion the process of procurement.</p>
							                                    
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function which is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry", or any other function that holds the "Set-up" P/L responsibility.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Purchase Enquiry Originator Role
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.PRO_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Purchase Enquiry Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.PRO_List" element="el-collapse" @add="onAddPROModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.PRO_List.length > 0" v-for="(e, index) in ProjectModalInfo.PRO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.PRO_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div class="tab-pane StickeyPanelModal" id="ModalPRV" role="tabpanel">
														<div class="row">
															<div class="col-lg-12">
									                            <h3>Purchase Enquiry Validator <i class="italic">role assignment</i>:</h3>
													                            
									                            <p>The Purchase Enquiry Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Purchase Enquiries" created by the employees holding the Purchase Enquiry Originator role. To enable this, the "Purchase Enquiries’" Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p>
									                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function within the Customer’s organization that is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry" or any other function that holds the "Set-up" P/L responsibility.</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.PRV_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.PRV_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.PRV_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Purchase Enquiry Validator Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.PRV_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Purchase Request Validator Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.PRV_List['level_' + iteration]" element="el-collapse" @add="onAddPRVModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.PRV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.PRV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'PRV_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.PRV_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>



							                        <div class="tab-pane StickeyPanelModal" id="ModalRFQM" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Request for Proposals Administrator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Request for Proposals Administrator(s) will be tasked with creating multiline "Requests for Proposals". The employees holding this role will be responsible for publishing the "Request for Proposal" to the approved bidding vendors, so that they can submit their offers to the organization on Ogéo. For the sake of governance, the "Requests for Proposals" are solely created on the back of: </p>
							                                    <ul>
							                                    	<li>Approved Purchase Enquiries; or</li>
							                                    	<li>Approved Rate Contract Creation Requests.</li>
							                                    </ul>
							                                    <p>The employees holding this role interact with the Vendors, conduct Live Auctions, and review and comment on the Ogéo-generated Commercial Evaluation reports. </p>
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Request for Proposals Role
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RFQM_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Request for Proposals Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RFQM_List" element="el-collapse" @add="onAddRFQMModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RFQM_List.length > 0" v-for="(e, index) in ProjectModalInfo.RFQM_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RFQM_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>



							                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanelModal" id="ModalALMR" role="tabpanel">
							                        	<div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Library of Material Update Request Originator  <i class="italic">role assignment</i>:</h3>
							                                    <p>The Library of Material Update Request Originator(s) will be tasked with requesting that new materials are added to the organization’s "Library of Materials". Such requests are subject to reviews and approvals before the subject materials are added to the "Library of Materials". </p>
							                                    <p> It’s important to note that the use of "Libraries of Materials", when originating "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time. </p>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Library of Material Update Request Originator 
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.ALMR_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Library of Material Update Request Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.ALMR_List" element="el-collapse" @add="onAddALMRModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.ALMR_List.length > 0" v-for="(e, index) in ProjectModalInfo.ALMR_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.ALMR_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
													</div>




							                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanelModal" id="ModalLMA" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Library of Materials Administrator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Library of Material Administrator(s) will be tasked with reviewing the requests to add new materials to the organization’s "Library of Materials" as raised by the employees that hold the role of Library of Material Update Request Originator. The role involves updating the material’s information before the approval to add to the "Library of Materials" is sought. </p>
							                                    <p>It’s important to note that the use of "Libraries of Materials", to create "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time. </p>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Library of Materials Administrator
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.LMA_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Library of Materials Administrator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.LMA_List" element="el-collapse" @add="onAddLMAModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.LMA_List.length > 0" v-for="(e, index) in ProjectModalInfo.LMA_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.LMA_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" class="tab-pane StickeyPanelModal" id="ModalALMV" role="tabpanel">
							                            <div class="row">
															<div class="col-lg-12">
									                            <h3>Library of Materials Validator <i class="italic">role assignment</i>:</h3>
													                            
									                            <p>The Library of Material Validator(s) will be tasked with ruling on (approving/rejecting) the requests to add new items to the organization’s "Library of Materials" raised by the employees holding the role of Library of Material Administrator. To enable this, the organization must upload, onto Ogéo, their Library of Materials’ Delegation of Authority: The number of level of validation, and the respective seniority in the chain of approvals. (Ogéo can accommodate as many as 8 levels of approvals Level-1 Is the entry level approver whereas the Level-8 is the final approver).</p> 
								                            	<p>It’s important to note that the use of Libraries of Materials, to create "Purchase Enquiries", generates a valuable amount of information that will ultimately help the organization take data-driven decisions to improve its sourcing methodology, and in the process, reduce its sourcing cost and procurement turnaround time.</p>
									                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to the Procurement Function or any other function which is responsible for continuous improvement (Centre of Excellence…)</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.ALMV_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.ALMV_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.ALMV_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Library of Materials Validator Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.ALMV_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Library of Materials Validator Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.ALMV_List['level_' + iteration]" element="el-collapse" @add="onAddALMVModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.ALMV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.ALMV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'ALMV_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.ALMV_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>


							                        


							                        <div class="tab-pane StickeyPanelModal" id="ModalPOO" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Purchase Order Originator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Purchase Order Originator(s) will be tasked with creating multiline "Purchase Orders" for Materials and/or Services. For the sake of governance, the employees holding this role can create "Purchase Orders", solely on the back of:</p>
							                                    <ul>
							                                    	<li>The results of the finalised "Commercial Evaluations"; or</li>
							                                    	<li>The approved "Rate Contracts".</li>            
							                                    </ul>
							                                    <p>In addition, under certain circumstances (mainly if the awardee vendor fails to deliver the sourced materials and/or services according to the organization's Terms & Conditions), the Purchase Order Originator will be in position to initiate an already awarded "Purchase Order".</p>
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the materials and/or the service that is the subject of the Purchase Enquiry that is linked to the Purchase Order.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Purchase Order Originator Role
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.POO_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Purchase Order Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.POO_List" element="el-collapse" @add="onAddPOOModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.POO_List.length > 0" v-for="(e, index) in ProjectModalInfo.POO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.POO_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


                    <div class="tab-pane StickeyPanelModal" id="ModalPOV" role="tabpanel">
                    	<div class="row">
                            <div class="col-lg-12">
	                            <p>The Purchase Order Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Purchase Orders" created by the employees holding the Purchase Order Originator role. To enable this, the Purchase Orders’ Delegation of Authority (i.e. the number of Purchase Orders’ levels of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p>
	                            <p>In addition, the Purchase Order Validator will be in position to rule on the "Purchase Order" cancelled by the Purchase Order Originator.</p>
	                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Purchase Order, which is itself linked to a Purchase Enquiry.</p>

								<el-select style="width: 100%;" v-model="ProjectModalInfo.POV_Number" placeholder="Enter number of validators">
								    <el-option label="1" value="1"></el-option>
								    <el-option label="2" value="2"></el-option>
								    <el-option label="3" value="3"></el-option>
								    <el-option label="4" value="4"></el-option>
								    <el-option label="5" value="5"></el-option>
								    <el-option label="6" value="6"></el-option>
								    <el-option label="7" value="7"></el-option>
								    <el-option label="8" value="8"></el-option>
								</el-select>

								<br><hr>
								
								<template v-if="ProjectModalInfo.POV_Number != null">
								<div class="card" v-for="iteration in parseInt(ProjectModalInfo.POV_Number)" :key="iteration">
							        <div class="card-header">
							            Holder(s) of the Purchase Order Validator Role (Level-{{ iteration }}) Approval
							        </div>
							        <div class="card-body">

							        	<div align="center" v-if="ProjectModalInfo.POV_List['level_' + iteration].length == 0">
									     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
									    </div>
									    <div align="center" v-else>
									    	<span class="text-success">Emplyees List with Purchase Order Validator Role</span>
									    </div>
										
										<draggable :list="ProjectModalInfo.POV_List['level_' + iteration]" element="el-collapse" @add="onAddPOVModal" :options="{group:'projectEmployees'}" >

										    <el-collapse-item v-if="ProjectModalInfo.POV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.POV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
										    	<div v-bind:id="'POV_level_'+iteration" style="display: none"></div>
										    	<div class="float-left">Name: {{e.fullName}}</div><br>
										        <div class="float-left">Email: {{e.email}}</div><br>
										        <div class="float-left">Designation: {{e.designation}}</div><br>
										        <div class="float-right p-b-10">
										        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.POV_List['level_' + iteration], index)"> Remove Employee</a>
										        </div>
										     </el-collapse-item>
										 
										</draggable>

									    

							        </div>

							        <div align="center" v-if="iteration == POV_Number" class="card-footer">
							        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
							        </div>

							        <div v-if="iteration < POV_Number" v-for="(currency, index) in ProjectModalInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
							        	<template v-if="index == 0">
								        	<div slot="footer" class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text">{{ currency }}</span>
	                                            </div>
	                                            <input :id="'POV_Modal_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
	                                            <input :id="'POV_Modal_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control">
	                                            <div class="input-group-append">
	                                                <span class="input-group-text">.00</span>
	                                            </div>
	                                        </div>
	                                    </template>
							        </div>
							    </div>
							    </template>
	                    	</div>

	                    	
                    	</div>
                    </div>


							                        <div class="tab-pane StickeyPanelModal" id="ModalRNO" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Receipt Note Originator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Receipt Note Originator(s) will be tasked with creating multiline "Receipt Notes" to document, on Ogéo, the receipting of the delivered materials and/or services. The employees holding this role create the "Receipt Note" at the time of the delivery by the Vendor, to whom the "Purchase Order" was issued. </p>
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the "Purchase Order", which is itself linked to a "Purchase Enquiry".</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Receipt Note Originator Role
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RNO_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Receipt Note Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RNO_List" element="el-collapse" @add="onAddRNOModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RNO_List.length > 0" v-for="(e, index) in ProjectModalInfo.RNO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RNO_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


                    <div class="tab-pane StickeyPanelModal" id="ModalRNV" role="tabpanel">

                        <div class="row">
                            <div class="col-lg-12">
	                            <h3>Receipt Note Validator <i class="italic">role assignment</i>:</h3>
													                            
	                            <p>The Receipt Note Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Receipt Notes" created by the employees holding the Receipt Note Originator role. To enable this, the Receipt Notes’ Delegation of Authority (The number of Receipt Notes level of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up", must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level approver whereas the Level-8 is the final approver). </p>
	                            <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function, which is responsible for utilising the material and/or the service that is the subject of a "Purchase Order", which is itself linked to a "Purchase Enquiry".</p>

								<el-select style="width: 100%;" v-model="ProjectModalInfo.RNV_Number" placeholder="Enter number of validators">
								    <el-option label="1" value="1"></el-option>
								    <el-option label="2" value="2"></el-option>
								    <el-option label="3" value="3"></el-option>
								    <el-option label="4" value="4"></el-option>
								    <el-option label="5" value="5"></el-option>
								    <el-option label="6" value="6"></el-option>
								    <el-option label="7" value="7"></el-option>
								    <el-option label="8" value="8"></el-option>
								</el-select>

								<br><hr>
								
								<template v-if="ProjectModalInfo.RNV_Number != null">
								<div class="card" v-for="iteration in parseInt(ProjectModalInfo.RNV_Number)" :key="iteration">
							        <div class="card-header">
							            Holder(s) of the Receipt Note Validator Role (Level-{{ iteration }}) Approval
							        </div>
							        <div class="card-body">

							        	<div align="center" v-if="ProjectModalInfo.RNV_List['level_' + iteration].length == 0">
									     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
									    </div>
									    <div align="center" v-else>
									    	<span class="text-success">Emplyees List with Receipt Note Validator Role</span>
									    </div>
										
										<draggable :list="ProjectModalInfo.RNV_List['level_' + iteration]" element="el-collapse" @add="onAddRNVModal" :options="{group:'projectEmployees'}" >

										    <el-collapse-item v-if="ProjectModalInfo.RNV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.RNV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
										    	<div v-bind:id="'RNV_level_'+iteration" style="display: none"></div>
										    	<div class="float-left">Name: {{e.fullName}}</div><br>
										        <div class="float-left">Email: {{e.email}}</div><br>
										        <div class="float-left">Designation: {{e.designation}}</div><br>
										        <div class="float-right p-b-10">
										        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RNV_List['level_' + iteration], index)"> Remove Employee</a>
										        </div>
										     </el-collapse-item>
										 
										</draggable>

									    

							        </div>

							        <div align="center" v-if="iteration == RNV_Number" class="card-footer">
							        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
							        </div>

							        <div v-if="iteration < RNV_Number" v-for="(currency, index) in ProjectModalInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
							        	<template v-if="index == 0">
								        	<div slot="footer" class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text">{{ currency }}</span>
	                                            </div>
	                                            <input :id="'RNV_Modal_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
	                                            <input :id="'RNV_Modal_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" >
	                                            <div class="input-group-append">
	                                                <span class="input-group-text">.00</span>
	                                            </div>
	                                        </div>
	                                    </template>
							        </div>
							    </div>
							    </template>
	                    	</div>

	                    	
                    	</div>
                    </div>


							                        <div class="tab-pane StickeyPanelModal" id="ModalSLM" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Vendors Qualification Administrator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Vendors Qualification Administrator(s) will be tasked with qualifying, approving and enlisting Vendors that the organization has chosen to work with, for all of its "Set-ups". These vendors will then be in position to access Ogéo in order to:</p>
							                                    <ul>
							                                    	<li>Receive "Requests for Proposals"; </li>
							                                    	<li>Submit bids; </li>
							                                    	<li>Participate in Live Auctions;</li>
							                                    	<li>Receive "Purchase Orders"; and </li>
							                                    	<li>Submit invoices. </li>
							                                    </ul>
							                                    <p>The process of vendors’ qualification involves assigning Ogéo’s access credentials to the vendors’ representatives.</p>
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will belong to the organization’s vendors.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Vendors Qualification Administrator Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.SLM_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Vendors Qualification Administrator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.SLM_List" element="el-collapse" @add="onAddSLMModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.SLM_List.length > 0" v-for="(e, index) in ProjectModalInfo.SLM_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.SLM_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>



							                        <div class="tab-pane StickeyPanelModal" id="ModalINV" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>The Invoice Checker <i class="italic">role assignment</i>:</h3>
							                                    <p>The Invoice Checker(s) will be tasked with reviewing the invoices raised, through the Vendor Portal, to ensure that the invoied amount matches the amount keyed in by the Vendors' authorized employees.</p>
							                                    <p>Vendors can raise invoices on the back of the following transactions:</p>
							                                    <ul>
							                                    	<li>Amounts, contractually due to the vendors on the basis of awarded "Purchase Orders", become due for payment as evidenced by the origination  and approval of "Receipt Notes", and</li>
							                                    	<li>If applicable, amounts contractually retained by the organization, become due for release, after the elapse of the retention timeframe and the fulfilment of the "Purchase Orders".</li>
							                                    </ul>
							                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Finance Function (Accounts Payable).</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Invoice Checker Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.INV_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Invoice Checker Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.INV_List" element="el-collapse" @add="onAddINVModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.INV_List.length > 0" v-for="(e, index) in ProjectModalInfo.INV_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.INV_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>



							                        <div class="tab-pane StickeyPanelModal" id="ModalRCCO" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Rate Contract Creation Request Originator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Rate Contract Creation Request Originator(s) will be tasked with originating requests to establish "Rate Contracts" for selected materials. The employees holding this role need to access the "Library of Materials" to select the materials for which they need to see "Rate Contracts" established with Vendors.</p> 
							                                    <p>It’s important to note that the use of "Rate Contracts" enables a speedy sourcing of materials when the "Purchase Enquiries" are originated.</p>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the Customer’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Rate Contract Creation Request Originator Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RCCO_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Rate Contract Creation Request Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RCCO_List" element="el-collapse" @add="onAddRCCOModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RCCO_List.length > 0" v-for="(e, index) in ProjectModalInfo.RCCO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RCCO_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>
							                        

							                        <div class="tab-pane StickeyPanelModal" id="ModalRCCV" role="tabpanel">
							                            <div class="row">
															<div class="col-lg-12">
									                            <h3>Rate Contract Creation Request Validator <i class="italic">role assignment</i>:</h3>
													                            
									                            <p>The Rate Contract Creation Request Validator(s) will be tasked with ruling on (approving/rejecting) the "Rate Contract" Creation Requests that were initiated by the authorized employees. To enable this, the organization must upload, onto Ogéo, their Rate Contracts Creation Requests’  Delegation of Authority: The number of level of validation, and the respective seniority in the chain of approvals. (Ogéo can accommodate as many as 8 levels of approvals Level-1 Is the entry level approver whereas the Level-8 is the final approver).</p>
									                            <p>It’s important to note that the use of "Rate Contracts" enables a speedy sourcing of materials when the "Purchase Enquiries" are originated.</p>
									                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.RCCV_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.RCCV_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.RCCV_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Rate Contract Creation Request Validator Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.RCCV_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Contract Creation Request Approver Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.RCCV_List['level_' + iteration]" element="el-collapse" @add="onAddRCCVModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.RCCV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.RCCV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'RCCV_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RCCV_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>


							                        <div class="tab-pane StickeyPanelModal" id="ModalRCO" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Rate Contract Originator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Rate Contract Originator(s) will be tasked with initiating the process of creating "Rate Contracts", on the back of approved Rate Contract Creation Requests. Once the Rate Contracts are originated by the employees holding this role, they are sent for approval before the Vendors are asked to submit their proposals.</p>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Rate Contract Originator Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RCO_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Rate Contract Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RCO_List" element="el-collapse" @add="onAddRCOModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RCO_List.length > 0" v-for="(e, index) in ProjectModalInfo.RCO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RCO_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


					<div class="tab-pane StickeyPanelModal" id="ModalRCV" role="tabpanel">
                    	<div class="row">
                            <div class="col-lg-12">
	                            <h3>Rate Contract Validator <i class="italic">role assignment</i>:</h3>
													                            
	                            <p>The Rate Contract Validator(s) will be tasked with ruling on (approving/rejecting) the "Rate Contracts". To enable this, the organization must upload, onto Ogéo, their Rate Contracts’ Delegation of Authority: The number of levels of validation, and the financial limit-based seniority in the chain of approvals (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
	                            <p>The "Rate Contracts" will solely be created on the back of the proposals submitted by the different vendors that received the Request For Proposals.  </p>
	                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for streamlining the process of procurement</p>

								<el-select style="width: 100%;" v-model="ProjectModalInfo.RCV_Number" placeholder="Enter number of validators">
								    <el-option label="1" value="1"></el-option>
								    <el-option label="2" value="2"></el-option>
								    <el-option label="3" value="3"></el-option>
								    <el-option label="4" value="4"></el-option>
								    <el-option label="5" value="5"></el-option>
								    <el-option label="6" value="6"></el-option>
								    <el-option label="7" value="7"></el-option>
								    <el-option label="8" value="8"></el-option>
								</el-select>

								<br><hr>
								
								<template v-if="ProjectModalInfo.RCV_Number != null">
								<div class="card" v-for="iteration in parseInt(ProjectModalInfo.RCV_Number)" :key="iteration">
							        <div class="card-header">
							            Holder(s) of the Rate Contract Validator Role (Level-{{ iteration }}) Approval
							        </div>
							        <div class="card-body">

							        	<div align="center" v-if="ProjectModalInfo.RCV_List['level_' + iteration].length == 0">
									     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
									    </div>
									    <div align="center" v-else>
									    	<span class="text-success">Emplyees List with Rate Contract Validator Role</span>
									    </div>
										
										<draggable :list="ProjectModalInfo.RCV_List['level_' + iteration]" element="el-collapse" @add="onAddRCVModal" :options="{group:'projectEmployees'}" >

										    <el-collapse-item v-if="ProjectModalInfo.RCV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.RCV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
										    	<div v-bind:id="'POV_level_'+iteration" style="display: none"></div>
										    	<div class="float-left">Name: {{e.fullName}}</div><br>
										        <div class="float-left">Email: {{e.email}}</div><br>
										        <div class="float-left">Designation: {{e.designation}}</div><br>
										        <div class="float-right p-b-10">
										        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RCV_List['level_' + iteration], index)"> Remove Employee</a>
										        </div>
										     </el-collapse-item>
										 
										</draggable>

									    

							        </div>

							        <div align="center" v-if="iteration == RCV_Number" class="card-footer">
							        	<span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
							        </div>

							        <div v-if="iteration < RCV_Number" v-for="(currency, index) in ProjectModalInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
							        	<template v-if="index == 0">
								        	<div slot="footer" class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text">{{ currency }}</span>
	                                            </div>
	                                            <input :id="'RCV_Modal_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
	                                            <input :id="'RCV_Modal_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control">
	                                            <div class="input-group-append">
	                                                <span class="input-group-text">.00</span>
	                                            </div>
	                                        </div>
	                                    </template>
							        </div>
							    </div>
							    </template>
	                    	</div>

	                    	
                    	</div>
                    </div>


		
                    								<div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalASTMGR" role="tabpanel">
							                            <div class="row">
															<div class="col-lg-12">
									                            <h3>Storeroom Manager <i class="italic">role assignment</i>:</h3>
													                            
									                            <p>The Storeroom Manager(s) have access to ALL the Storerooms information across the organizations.</p>
									                            <p>The Storeroom Manager(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities:</p>
									                            <ul>
									                            	<li>Ruling on (approving/rejecting) the request to add new “Storeroom Items”, as originated by the Storeroom In-Charge;</li>
									                            	<li>Ruling on (approving/rejecting) the request to suspend the “Storeroom Items” status, as originated by the Storeroom In-Charge;</li>
									                            	<li>Ruling on (approving/rejecting) the outcome of the periodic Stock Count Exercises, as originated by the Storeroom In-Charge; and</li>
									                            	<li>Originating and/or approving the Storeroom Items Transfer between Storerooms. (Level 1 will originate the transfer while Level 2 and above will approve)</li>
									                            </ul>
									                            <p>To enable this, the Storerooms’ Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
									                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.ASTMGR_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.ASTMGR_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.ASTMGR_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Storeroom Manager Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.ASTMGR_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom Manager Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.ASTMGR_List['level_' + iteration]" element="el-collapse" @add="onAddASTMGRModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.ASTMGR_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.ASTMGR_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'ASTMGR_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.ASTMGR_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>

							                        <div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalSIIRPT" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>Storeroom In-Charge <i class="italic">role assignment</i>:</h3>
							                                    <p>The Storeroom In-Charge will be tasked will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities: </p>
							                                    <ul>
							                                    	<li>Accepting the requests to issue Storeroom Items on the back of approved “Storeroom Item Issue Notes”, and actually issuing the concerned “Storeroom Items” from the Storeroom; </li>
							                                    	<li>Accepting the requests to return Storeroom Items on the back of approved “Storeroom Item Return Notes”, and actually accepting the return of the concerned Storeroom Items to the Storeroom; </li>
							                                    	<li>Originating the addition of new Storeroom Items, as approved by the Storeroom Items Update Request Validator;</li>
							                                    	<li>Originating the suspension of “Storeroom Items” status, as approved by the Storeroom Items Update Request Validator;</li>
							                                    	<li>Incrementing the levels of “Storeroom Items”, to document the receipting of such “Storeroom Items”, when the related “Receipt Notes’ are accepted by created by the employees holding the Receipt Note Validator role;</li>
							                                    	<li>Originating periodic Stock Count Exercises; and</li>
							                                    	<li>
							                                    		Executing forced “Storeroom Items” level movement on the back of:
							                                    		<ul>
							                                    			<li>Stock Count Exercise outcome, as approved by the Storeroom Manager; and</li>
							                                    			<li>
							                                    				Storeroom Items Transfer as  approved by Storeroom Manager and, as the case may be:
							                                    				<ul>
							                                    					<li>Actually issuing the concerned “Storeroom Items”, from the Storeroom, for the Storeroom Items Transfer to happen; or</li>
							                                    					<li>Actually accepting the return of the concerned “Storeroom Items” to the Storeroom, for the Storeroom Items Transfer to happen.</li>
							                                    				</ul>
							                                    			</li>
							                                    		</ul>
							                                    	</li>
							                                    </ul>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Storeroom In-Charge Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.SIIRPT_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom In-Charge Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.SIIRPT_List" element="el-collapse" @add="onAddSIIRPTModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.SIIRPT_List.length > 0" v-for="(e, index) in ProjectModalInfo.SIIRPT_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.SIIRPT_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalRTIRS" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>The Storeroom Transaction Request Originator <i class="italic">role assignment</i>:</h3>
							                                    <p>The Storeroom Transaction Request Originator(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities:</p>
							                                    <ul>
							                                    	<li>Originating “Storeroom Item Issue Notes”; and </li>
							                                    	<li>Originating “Storeroom Item Return Notes”.</li>
							                                    </ul>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Function or any other Function which is responsible for utilising the “Storeroom Item” or any other function that holds a P/L responsibility.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Storeroom Transaction Request Originator Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RTIRS_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom Transaction Request Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RTIRS_List" element="el-collapse" @add="onAddRTIRSModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RTIRS_List.length > 0" v-for="(e, index) in ProjectModalInfo.RTIRS_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RTIRS_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalATSIRS" role="tabpanel">
							                            <div class="row">
															<div class="col-lg-12">
									                            <h3>The Storeroom Transaction Request Validator <i class="italic">role assignment</i>:</h3>
									                            <p>The Storeroom Transaction Request Validator(s) will be tasked with ruling on (approving/rejecting) the requests created by the employees holding the Storeroom Transaction Request Originator role. </p>
									                            <p>To enable this, the Storeroom Transactions’ Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
									                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Operations Function or any other Function which is responsible for utilising the “Storeroom Item” or any other function that holds a P/L responsibility.</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.ATSIRS_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.ATSIRS_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.ATSIRS_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Storeroom Transaction Request Validator Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.ATSIRS_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom Transaction Request Validator Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.ATSIRS_List['level_' + iteration]" element="el-collapse" @add="onAddATSIRSModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.ATSIRS_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.ATSIRS_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'ATSIRS_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.ATSIRS_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>

							                        <div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalRTSI" role="tabpanel">
							                            <div class="row">
							                            	<div class="col-lg-12">
							                                    <h3>The Storeroom Items Update Request Originator  <i class="italic">role assignment</i>:</h3>
							                                    <p>The Storeroom Items Update Request Originator(s) will be tasked, for the “Set-up” (in this case a Storeroom), with the following activities: </p>
							                                    <ul>
							                                    	<li>Requesting that new materials, extracted from the “Library of Materials” are turned into “Storeroom Items”; and </li>
							                                    	<li>Requesting, that the status of “Storeroom Items” is suspended for existing Storeroom Items; </li>
							                                    </ul>
							                                    <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations. This role can only also be held by employees of the organization’s Operations Function.</p>
									
										                        <div class="card">
										                            <div class="card-header">
										                                Holder(s) of the Storeroom Items Update Request Originator Role:
										                            </div>
										                            <div class="card-body">

										                            	<div align="center" v-if="ProjectModalInfo.RTSI_List.length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom Items Update Request Originator Role</span>
																	    </div>

																		<draggable :list="ProjectModalInfo.RTSI_List" element="el-collapse" @add="onAddRTSIModal" :options="{group:'projectEmployees'}" >
																		    <el-collapse-item v-if="ProjectModalInfo.RTSI_List.length > 0" v-for="(e, index) in ProjectModalInfo.RTSI_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.RTSI_List, index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
											                            
										                            </div>
										                        </div>
									                        </div>

									                        

							                            </div>
							                        </div>


							                        <div v-if="ProjectModalInfo.StoreSetup == 'Yes'" class="tab-pane StickeyPanelModal" id="ModalATSI" role="tabpanel">
							                            <div class="row">
															<div class="col-lg-12">
									                            <h3>The Storeroom Items Update Request Validator <i class="italic">role assignment</i>:</h3>
													                            
									                            <p>The Storeroom Items Update Request Validator(s) will be tasked with ruling on (approving/rejecting) the requests created by the employees holding the Storeroom Items Update Request Originator role. </p>
									                            <p>To enable this, the Storeroom Items Update Delegation of Authority (i.e. the number of levels of validation; and the seniority in the chain of approvals) for the “Set-up” must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver).</p>
									                            <p style="font-style: italic;">Holder(s) of this role will typically belong to the organization’s Warehousing Functions, or to any other function within the Customer’s organization that is responsible for the Supply Chain Operations. This role can only also be held by employees of the organization’s Operations Function.</p>

																<el-select style="width: 100%;" v-model="ProjectModalInfo.ATSI_Number" placeholder="Enter number of validators">
																    <el-option label="1" value="1"></el-option>
																    <el-option label="2" value="2"></el-option>
																    <el-option label="3" value="3"></el-option>
																    <el-option label="4" value="4"></el-option>
																    <el-option label="5" value="5"></el-option>
																    <el-option label="6" value="6"></el-option>
																    <el-option label="7" value="7"></el-option>
																    <el-option label="8" value="8"></el-option>
																</el-select>

																<br><hr>
																
																<template v-if="ProjectModalInfo.ATSI_Number != null">
																<div class="card" v-for="iteration in parseInt(ProjectModalInfo.ATSI_Number)" :key="iteration">
															        <div class="card-header">
															            Holder(s) of the Storeroom Items Update Request Role (Level-{{ iteration }}) Approval
															        </div>
															        <div class="card-body">

															        	<div align="center" v-if="ProjectModalInfo.ATSI_List['level_' + iteration].length == 0">
																	     	<span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
																	    </div>
																	    <div align="center" v-else>
																	    	<span class="text-success">Emplyees List with Storeroom Items Update Request Role</span>
																	    </div>
																		
																		<draggable :list="ProjectModalInfo.ATSI_List['level_' + iteration]" element="el-collapse" @add="onAddATSIModal" :options="{group:'projectEmployees'}" >

																		    <el-collapse-item v-if="ProjectModalInfo.ATSI_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.ATSI_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
																		    	<div v-bind:id="'ATSI_level_'+iteration" style="display: none"></div>
																		    	<div class="float-left">Name: {{e.fullName}}</div><br>
																		        <div class="float-left">Email: {{e.email}}</div><br>
																		        <div class="float-left">Designation: {{e.designation}}</div><br>
																		        <div class="float-right p-b-10">
																		        	<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.ATSI_List['level_' + iteration], index)"> Remove Employee</a>
																		        </div>
																		     </el-collapse-item>
																		 
																		</draggable>
															        </div>
															    </div>
																</template>
									                    	</div>
									                    	

							                            </div>
							                        </div>

													
							                        
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
	                            </el-col>

	                            <el-col class="StickeyEmployeelModal" :span="6">
									
									<div class="row">

	                                	<div class="col-lg-12 p-t-10">
	                                		<div style="margin-bottom: 5px" class="card">
					                            <div class="card-header">
					                                Holder(s) of the Employees List
					                            </div>
					                            <div style="height: 300px;  max-height: 300px; overflow-y: auto;" class="card-body">
					                            	<div class="drag">
						                                <!-- <draggable v-model="list" class="dragArea" :options="{group:{ name:'projectEmployees',  pull:'clone', put:false }}">
												      		<div v-for="element in list">{{element.name}}</div>
												      	</draggable> -->
														<draggable element="el-collapse" :list="EmployeesList" :options="{group:{ name:'projectEmployees',  pull:'clone', put:false }}" >
															
														    <el-collapse-item v-if="EmployeesList.length != 0" v-for="(employee, index) in EmployeesList" :title="employee.fullName.substring(0, 20) + '...' " :name="employee.fullName" :key="employee.email">
														        <div class="float-left">Name: {{employee.fullName}}</div><br>
														        <div class="float-left"><b>Email:</b> {{employee.email}}</div><br>
														        <div class="float-left"><b>Designation:</b> {{employee.designation}}</div><br>
														        <div class="float-right p-b-10">
													        		<a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(EmployeesList, index, 'EmployeesList', 0, employee.email)"> Remove Employee</a>
													        	</div>
														     </el-collapse-item>
													     
														     <div align="center" v-if="EmployeesList.length == 0">
														     	<span>Please Add Employee</span>
														     </div>

														</draggable>
						                            </div>
					                            </div>
					                        </div>
					                    </div>

	                                	<div class="col-lg-12 p-t-10 ">
								        	<!-- <label class="">New Employee Name</label> -->
								        	<input type="text" v-model="NewEmployee.fullName" class="form-control" placeholder="Enter Employee Name">
								        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.fullName">{{ NewEmployeeErrors.fullName[0] }}</span>
								      	</div>

								      	<div class="col-lg-12 p-t-10 ">
								        	<!-- <label class="">New Employee Email</label> -->
								        	<input type="email" v-model="NewEmployee.email" class="form-control" placeholder="Enter Employee Email">
								        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.email">{{ NewEmployeeErrors.email[0] }}</span>
								      	</div>

								      	<div class="col-lg-12 p-t-10 p-b-10 ">
								        	<!-- <label class="">Designation</label> -->
								        	<input type="text" v-model="NewEmployee.designation"  class="form-control" placeholder="Enter Employee Designation">
								        	<span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.designation">{{ NewEmployeeErrors.designation[0] }}</span>
								      	</div>

								      	<div class="col-lg-12 p-t-10">
									    	<a class="btn btn-success btn-block" style="color: white" @click="creatNewEmployee">Create New Employee</a>
									    </div>
								    </div>
	                            </el-col>
							</el-row>
						</el-form>
	                    
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
	                    <button type="button" @click="updateProjectDetails" class="btn btn-success waves-effect text-left">Save and Update</button>
	                </div>
	            </div>
	            <!-- /.modal-content -->
	        </div>
	        <!-- /.modal-dialog -->
	    </div>

	</div>

</template>


<script>
	
	//import { CustomJs } from '../../helpers/custom.js';
	import validateJs from 'validate.js';
	import draggable from 'vuedraggable';
	import moment from 'moment';

	export default {
		name: 'account-setting',
		components: { 
			draggable,
		},
		data(){
			return{
				logopreview: "",
		  hideUploadEdit: false,
    AllTimeZone:[
  'Europe/Andorra',
  'Asia/Dubai',
  'Asia/Kabul',
  'Europe/Tirane',
  'Asia/Yerevan',
  'Antarctica/Casey',
  'Antarctica/Davis',
  'Antarctica/DumontDUrville', 
  'Antarctica/Mawson',
  'Antarctica/Palmer',
  'Antarctica/Rothera',
  'Antarctica/Syowa',
  'Antarctica/Troll',
  'Antarctica/Vostok',
  'America/Argentina/Buenos_Aires',
  'America/Argentina/Cordoba',
  'America/Argentina/Salta',
  'America/Argentina/Jujuy',
  'America/Argentina/Tucuman',
  'America/Argentina/Catamarca',
  'America/Argentina/La_Rioja',
  'America/Argentina/San_Juan',
  'America/Argentina/Mendoza',
  'America/Argentina/San_Luis',
  'America/Argentina/Rio_Gallegos',
  'America/Argentina/Ushuaia',
  'Pacific/Pago_Pago',
  'Europe/Vienna',
  'Australia/Lord_Howe',
  'Antarctica/Macquarie',
  'Australia/Hobart',
  'Australia/Currie',
  'Australia/Melbourne',
  'Australia/Sydney',
  'Australia/Broken_Hill',
  'Australia/Brisbane',
  'Australia/Lindeman',
  'Australia/Adelaide',
  'Australia/Darwin',
  'Australia/Perth',
  'Australia/Eucla',
  'Asia/Baku',
  'America/Barbados',
  'Asia/Dhaka',
  'Europe/Brussels',
  'Europe/Sofia',
  'Atlantic/Bermuda',
  'Asia/Brunei',
  'America/La_Paz',
  'America/Noronha',
  'America/Belem',
  'America/Fortaleza',
  'America/Recife',
  'America/Araguaina',
  'America/Maceio',
  'America/Bahia',
  'America/Sao_Paulo',
  'America/Campo_Grande',
  'America/Cuiaba',
  'America/Santarem',
  'America/Porto_Velho',
  'America/Boa_Vista',
  'America/Manaus',
  'America/Eirunepe',
  'America/Rio_Branco',
  'America/Nassau',
  'Asia/Thimphu',
  'Europe/Minsk',
  'America/Belize',
  'America/St_Johns',
  'America/Halifax',
  'America/Glace_Bay',
  'America/Moncton',
  'America/Goose_Bay',
  'America/Blanc-Sablon',
  'America/Toronto',
  'America/Nipigon',
  'America/Thunder_Bay',
  'America/Iqaluit',
  'America/Pangnirtung',
  'America/Atikokan',
  'America/Winnipeg',
  'America/Rainy_River',
  'America/Resolute',
  'America/Rankin_Inlet',
  'America/Regina',
  'America/Swift_Current',
  'America/Edmonton',
  'America/Cambridge_Bay',
  'America/Yellowknife',
  'America/Inuvik',
  'America/Creston',
  'America/Dawson_Creek',
  'America/Fort_Nelson',
  'America/Vancouver',
  'America/Whitehorse',
  'America/Dawson',
  'Indian/Cocos',
  'Europe/Zurich',
  'Africa/Abidjan',
  'Pacific/Rarotonga',
  'America/Santiago',
  'America/Punta_Arenas',
  'Pacific/Easter',
  'Asia/Shanghai',
  'Asia/Urumqi',
  'America/Bogota',
  'America/Costa_Rica',
  'America/Havana',
  'Atlantic/Cape_Verde',
  'America/Curacao',
  'Indian/Christmas',
  'Asia/Nicosia',
  'Asia/Famagusta',
  'Europe/Prague',
  'Europe/Berlin',
  'Europe/Copenhagen',
  'America/Santo_Domingo',
  'Africa/Algiers',
  'America/Guayaquil',
  'Pacific/Galapagos',
  'Europe/Tallinn',
  'Africa/Cairo',
  'Africa/El_Aaiun',
  'Europe/Madrid',
  'Africa/Ceuta',
  'Atlantic/Canary',
  'Europe/Helsinki',
  'Pacific/Fiji',
  'Atlantic/Stanley',
  'Pacific/Chuuk',
  'Pacific/Pohnpei',
  'Pacific/Kosrae',
  'Atlantic/Faroe',
  'Europe/Paris',
  'Europe/London',
  'Asia/Tbilisi',
  'America/Cayenne',
  'Africa/Accra',
  'Europe/Gibraltar',
  'America/Godthab',
  'America/Danmarkshavn',
  'America/Scoresbysund',
  'America/Thule',
  'Europe/Athens',
  'Atlantic/South_Georgia',
  'America/Guatemala',
  'Pacific/Guam',
  'Africa/Bissau',
  'America/Guyana',
  'Asia/Hong_Kong',
  'America/Tegucigalpa',
  'America/Port-au-Prince',
  'Europe/Budapest',
  'Asia/Jakarta',
  'Asia/Pontianak',
  'Asia/Makassar',
  'Asia/Jayapura',
  'Europe/Dublin',
  'Asia/Jerusalem',
  'Asia/Kolkata',
  'Indian/Chagos',
  'Asia/Baghdad',
  'Asia/Tehran',
  'Atlantic/Reykjavik',
  'Europe/Rome',
  'America/Jamaica',
  'Asia/Amman',
  'Asia/Tokyo',
  'Africa/Nairobi',
  'Asia/Bishkek',
  'Pacific/Tarawa',
  'Pacific/Enderbury',
  'Pacific/Kiritimati',
  'Asia/Pyongyang',
  'Asia/Seoul',
  'Asia/Almaty',
  'Asia/Qyzylorda',
  'Asia/Qostanay', 
  'Asia/Aqtobe',
  'Asia/Aqtau',
  'Asia/Atyrau',
  'Asia/Oral',
  'Asia/Beirut',
  'Asia/Colombo',
  'Africa/Monrovia',
  'Europe/Vilnius',
  'Europe/Luxembourg',
  'Europe/Riga',
  'Africa/Tripoli',
  'Africa/Casablanca',
  'Europe/Monaco',
  'Europe/Chisinau',
  'Pacific/Majuro',
  'Pacific/Kwajalein',
  'Asia/Yangon',
  'Asia/Ulaanbaatar',
  'Asia/Hovd',
  'Asia/Choibalsan',
  'Asia/Macau',
  'America/Martinique',
  'Europe/Malta',
  'Indian/Mauritius',
  'Indian/Maldives',
  'America/Mexico_City',
  'America/Cancun',
  'America/Merida',
  'America/Monterrey',
  'America/Matamoros',
  'America/Mazatlan',
  'America/Chihuahua',
  'America/Ojinaga',
  'America/Hermosillo',
  'America/Tijuana',
  'America/Bahia_Banderas',
  'Asia/Kuala_Lumpur',
  'Asia/Kuching',
  'Africa/Maputo',
  'Africa/Windhoek',
  'Pacific/Noumea',
  'Pacific/Norfolk',
  'Africa/Lagos',
  'America/Managua',
  'Europe/Amsterdam',
  'Europe/Oslo',
  'Asia/Kathmandu',
  'Pacific/Nauru',
  'Pacific/Niue',
  'Pacific/Auckland',
  'Pacific/Chatham',
  'America/Panama',
  'America/Lima',
  'Pacific/Tahiti',
  'Pacific/Marquesas',
  'Pacific/Gambier',
  'Pacific/Port_Moresby',
  'Pacific/Bougainville',
  'Asia/Manila',
  'Asia/Karachi',
  'Europe/Warsaw',
  'America/Miquelon',
  'Pacific/Pitcairn',
  'America/Puerto_Rico',
  'Asia/Gaza',
  'Asia/Hebron',
  'Europe/Lisbon',
  'Atlantic/Madeira',
  'Atlantic/Azores',
  'Pacific/Palau',
  'America/Asuncion',
  'Asia/Qatar',
  'Indian/Reunion',
  'Europe/Bucharest',
  'Europe/Belgrade',
  'Europe/Kaliningrad',
  'Europe/Moscow',
  'Europe/Simferopol',
  'Europe/Kirov',
  'Europe/Astrakhan',
  'Europe/Volgograd',
  'Europe/Saratov',
  'Europe/Ulyanovsk',
  'Europe/Samara',
  'Asia/Yekaterinburg',
  'Asia/Omsk',
  'Asia/Novosibirsk',
  'Asia/Barnaul',
  'Asia/Tomsk',
  'Asia/Novokuznetsk',
  'Asia/Krasnoyarsk',
  'Asia/Irkutsk',
  'Asia/Chita',
  'Asia/Yakutsk',
  'Asia/Khandyga',
  'Asia/Vladivostok',
  'Asia/Ust-Nera',
  'Asia/Magadan',
  'Asia/Sakhalin',
  'Asia/Srednekolymsk',
  'Asia/Kamchatka',
  'Asia/Anadyr',
  'Asia/Riyadh',
  'Pacific/Guadalcanal',
  'Indian/Mahe',
  'Africa/Khartoum',
  'Europe/Stockholm',
  'Asia/Singapore',
  'America/Paramaribo',
  'Africa/Juba',
  'Africa/Sao_Tome',
  'America/El_Salvador',
  'Asia/Damascus',
  'America/Grand_Turk',
  'Africa/Ndjamena',
  'Indian/Kerguelen',
  'Asia/Bangkok',
  'Asia/Dushanbe',
  'Pacific/Fakaofo',
  'Asia/Dili',
  'Asia/Ashgabat',
  'Africa/Tunis',
  'Pacific/Tongatapu',
  'Europe/Istanbul',
  'America/Port_of_Spain',
  'Pacific/Funafuti',
  'Asia/Taipei',
  'Europe/Kiev',
  'Europe/Uzhgorod',
  'Europe/Zaporozhye',
  'Pacific/Wake',
  'America/New_York',
  'America/Detroit',
  'America/Kentucky/Louisville',
  'America/Kentucky/Monticello',
  'America/Indiana/Indianapolis',
  'America/Indiana/Vincennes',
  'America/Indiana/Winamac',
  'America/Indiana/Marengo',
  'America/Indiana/Petersburg',
  'America/Indiana/Vevay',
  'America/Chicago',
  'America/Indiana/Tell_City',
  'America/Indiana/Knox',
  'America/Menominee',
  'America/North_Dakota/Center',
  'America/North_Dakota/New_Salem',
  'America/North_Dakota/Beulah',
  'America/Denver',
  'America/Boise',
  'America/Phoenix',
  'America/Los_Angeles',
  'America/Anchorage',
  'America/Juneau',
  'America/Sitka',
  'America/Metlakatla',
  'America/Yakutat',
  'America/Nome',
  'America/Adak',
  'Pacific/Honolulu',
  'America/Montevideo',
  'Asia/Samarkand',
  'Asia/Tashkent',
  'America/Caracas',
  'Asia/Ho_Chi_Minh',
  'Pacific/Efate',
  'Pacific/Wallis',
  'Pacific/Apia',
  'Africa/Johannesburg'
],
			countries: [],
			cities: [],
			    EmployeesList: [],
			    ProjectKey: "",
			    CAD_List: [],
			    PRO_List: [],
			    PRV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    PRV_Number: null,
			    ALMR_List: [],
			    LMA_List: [],
			    ALMV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    ALMV_Number: null,
			    RFQM_List: [],
			    POO_List: [],
			    POV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    POV_Number: null,
			    RNO_List: [],
			    RNV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    RNV_Number: null,
			    SLM_List: [],
			    INV_List: [],

			    ASTMGR_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    ASTMGR_Number: null,
                SIIRPT_List: [],
                RTIRS_List: [],
                ATSIRS_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    ATSIRS_Number: null,
                RTSI_List: [],
                ATSI_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    ATSI_Number: null,

			    RCCO_List: [],
			    RCCV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    RCCV_Number: null,
			    RCO_List: [],
			    RCV_List: {
			    	level_1: [],
			    	level_2: [],
			    	level_3: [],
			    	level_4: [],
			    	level_5: [],
			    	level_6: [],
			    	level_7: [],
			    	level_8: []
			    },
			    RCV_Number: null,
			    POV_Financial_Details: [],
			    RNV_Financial_Details: [],
			    RCV_Financial_Details: [],
				EmployeeRange: [
					{
			          value: '1 - 5',
			          label: '1 - 5'
			        },{
			          value: '6 - 10',
			          label: '6 - 10'
			        }, {
			          value: '11 - 50',
			          label: '11 - 50'
			        }, {
			          value: '51 - 100',
			          label: '51 - 100'
			        }, {
			          value: '101 - 500',
			          label: '101 - 500'
			        }, {
			          value: '501 - 1000',
			          label: '501 - 1000'
			        }, {
			          value: '1001 - 5000',
			          label: '1001 - 5000'
			        }, {
			          value: '5001 - 10000+',
			          label: '5001 - 10000+'
			        }
		        ],
		        NewEmployee: {
		        	fullName: "",
					email: "",
					designation: "",
		        },
		        NewEmployeeErrors: null,
		        loading: false,
                FirstStepData:{
					CompanyLogo: "",
                    companyName: "",
                    companyTime:"",
                    CompanyEmployeeRange: [],
                    CompanyIndustry: [],
                    CompanyCities: [],
                    CompanyCountries: [],
				},
				SecondStepData:{
                    companyPEPrefix: "",
					companyRFQPrefix: "",
					companyComEvalPrefix: "",
					companyPOPrefix: "",
					companySTRIPrefix: "",
					companySTRRPrefix: "",
					companyRNPrefix: "",
					companyAdditionalField: "",
					companyStoreAdditionalField: "",
				},
				ThirdStepData:{
				  companyLoMManditory:"",
				  companyLoMPrefix: "",
				},
				AccountSettingForm: {
					companyName: "",
					companyTime:"",
					CompanyEmployeeRange: [],
					CompanyIndustry: [],
					CompanyCities: [],
					CompanyCountries: [],
					SubscriptionType: "",
					BillingInfo: "",
					companyPEPrefix: "",
					companyRFQPrefix: "",
					companyComEvalPrefix: "",
					companyPOPrefix: "",
					companySTRIPrefix: "",
					companySTRRPrefix: "",
					companyRNPrefix: "",
					companyLoMManditory: "",
					companyLoMPrefix: "",
					procurementSetupMode: "Project Wise",
					companyAdditionalField: "",
					companyStoreAdditionalField: "",
					PODOACriterion: "",
					RNDOACriterion: "",
					CompanyCurrency: "",
					CompanyBudget: "",
					companyTsNCs: "",
					AuctionType: "",
				},
				ProjectsDetails: [],
				ShowProjectDetails: false,
				ProjectModalInfo: "",
				ProjectInfo: {
					StoreSetup: "",
					ProjectTitle: "",
					ProjectPeriod: "",
					ProjectValue: "",
					//ProjectValueCurrency: "",
					ProjectPODOACriterion: "",
					ProjectRNDOACriterion: "",
					ProjectAuctionType: [],
					ProjectCompanyCurrency: "",
					ProjectTsNCs: ""
				},
				Industries: [],
				// Countries: [],
				searchedCities: [],
			    rules1: {
					companyName: [{
						required: true,
						message: 'Please enter organization name',
						trigger: 'blur'
					}, {
						min: 3,
						message: 'Minimum Length is 3 characters',
						trigger: 'blur'
					}],
					CompanyEmployeeRange: [{
						required: true,
						message: 'Please select number of employees zone',
						trigger: 'blur'
					}],
					CompanyIndustry: [{
						required: true,
						message: 'Please select an insdustry',
						trigger: 'blur'
					}],
					CompanyCities: [{
						required: true,
						message: 'Please select a city',
						trigger: 'blur'
					}],
					CompanyCountries: [{
						required: true,
						message: 'Please select a country',
						trigger: 'blur'
					}],
				},
				rules2: {
					companyPEPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companyRFQPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companyComEvalPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companyPOPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companySTRIPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companySTRRPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companyRNPrefix: [{
						max: 4,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
					companyAdditionalField: [{
						required: true,
						message: 'This field is mandatory',
						trigger: 'blur'
					}],
					companyStoreAdditionalField: [{
						required: true,
						message: 'This field is mandatory',
						trigger: 'blur'
					}],
			    },
			    rules3: {
			    	procurementSetupMode: [{
						required: true,
						message: 'Please setup Mode',
						trigger: 'change'
					}],
			    	PODOACriterion: [{
			    		required: true,
			    		message: "Please select PO DOA Criterion",
			    		trigger: "change"
			    	}],
			    	RNDOACriterion: [{
			    		required: true,
			    		message: "Please select RN DOA Criterion",
			    		trigger: "change"
			    	}],
			    	CompanyCurrency: [{
			    		required: true,
			    		message: "Please select currency",
			    		trigger: ["blur", "change"]
			    	}],
			    	CompanyBudget: [{
			    		required: true,
			    		message: "Please enter company budget",
			    		trigger: ["blur", "change"]
			    	}],
			    	AuctionType: [{
			    		required: true,
			    		message: "Please select auction type",
			    		trigger: ["blur", "change"]
			    	}],
			    },
			    rules4: {
			    	procurementSetupMode: [{
						required: true,
						message: 'Please setup Mode',
						trigger: 'change'
					}],
			    	StoreSetup: [{
			    		required: true,
			    		message: "Please Select Setup Type",
			    		trigger: "blur"
			    	}],
			    	ProjectTitle: [{
			    		required: true,
			    		message: "Please Enter Set-up Title",
			    		trigger: "blur"
			    	}],
			    	ProjectPeriod: [{
			    		required: true,
			    		message: "Please Select Project Period",
			    		trigger: "change"
			    	}],
			    	ProjectValue: [{
			    		required: true,
			    		message: "Please Enter The Set-up’s Budget",
			    		trigger: "blur"
			    	}],
			    	ProjectPODOACriterion: [{
			    		required: true,
			    		message: "Please Enter Set-up PO DOA Criterion",
			    		trigger: "change"
			    	}],
			    	ProjectRNDOACriterion: [{
			    		required: true,
			    		message: "Please Enter Set-up RN DOA Criterion",
			    		trigger: "change"
			    	}],
			    	ProjectAuctionType: [{
			    		required: true,
			    		message: "Please Select Applicable Auction Types",
			    		trigger: "change"
			    	}],
			    	ProjectCompanyCurrency: [{
			    		required: true,
			    		message: "Please Select Applicable Currency",
			    		trigger: "change"
			    	}]
			    },
			    LoMrules: {
			    	companyLoMManditory: [{
						required: true,
						message: 'Please select LoM Mode',
						trigger: 'change'
					}],
					companyLoMPrefix: [{
						max: 3,
						message: 'Maximum Length is 4 characters',
						trigger: 'blur'
					}],
			    },
			    EmployeeCreateRules: {
			    	fullName: {
                        presence: true,
                        length: {
                            minimum: 3,
                            message: "must be atleast 3 characters"
                        }
                    },
                    email: {
                        presence: true,
                        email: true
                    },
                    designation: {
                        presence: true,
                        length: {
                            minimum: 3,
                            message: 'must be atleast 3 characters'
                        }
                    }	
			    },

			    /* Item Template Creation */
			    DataTableItemTemplate: "",
			    Set_Required: false,
			    TemplatesDetails: [],
                ItemStructureSetup: {	
                    ID: "",
                    Template_Name: "",
                    Field_1_Required: true,
                    Field_1_Header: "",
                    Field_1_Mandatory: "Yes",
                    Field_2_Required: false,
                    Field_2_Header: "",
                    Field_2_Mandatory: "",
                    Field_3_Required: false,
                    Field_3_Header: "",
                    Field_3_Mandatory: "",
                    Field_4_Required: false,
                    Field_4_Header: "",
                    Field_4_Mandatory: "",
                    Field_5_Required: false,
                    Field_5_Header: "",
                    Field_5_Mandatory: "",
                    Field_6_Required: false,
                    Field_6_Header: "",
                    Field_6_Mandatory: "",
                    Field_7_Required: false,
                    Field_7_Header: "",
                    Field_7_Mandatory: "",
                    Field_8_Required: false,
                    Field_8_Header: "",
                    Field_8_Mandatory: "",
                    Field_9_Required: false,
                    Field_9_Header: "",
                    Field_9_Mandatory: "",
                    Field_10_Required: false,
                    Field_10_Header: "",
                    Field_10_Mandatory: "",
                    Field_11_Required: false,
                    Field_11_Header: "",
                    Field_11_Mandatory: "",
                    Field_12_Required: false,
                    Field_12_Header: "",
                    Field_12_Mandatory: "",
                    Field_13_Required: false,
                    Field_13_Header: "",
                    Field_13_Mandatory: "",
                    Field_14_Required: false,
                    Field_14_Header: "",
                    Field_14_Mandatory: "",
                    Field_15_Required: false,
                    Field_15_Header: "",
                    Field_15_Mandatory: "",
                    Field_16_Required: false,
                    Field_16_Header: "",
                    Field_16_Mandatory: "",
                    Field_17_Required: false,
                    Field_17_Header: "",
                    Field_17_Mandatory: "",
                    Field_18_Required: false,
                    Field_18_Header: "",
                    Field_18_Mandatory: "",
                    Field_19_Required: false,
                    Field_19_Header: "",
                    Field_19_Mandatory: "",
                    Field_20_Required: false,
                    Field_20_Header: "",
                    Field_20_Mandatory: "",
                    ConsolidatedTitles: "",
                    Action: "",
                },
                FormRules: {
                    Template_Name: [{
                        required: true,
                        message: "Template Name Required",
                        trigger: ["blur"]
                    }],
                    Field_1_Required: [{
                        required: true,
                        message: "This Field Is Mandatory",
                        trigger: ["blur", "change"]
                    }],
                    Field_1_Header: [{
                        required: true,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_1_Mandatory: [{
                        required: true,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_2_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_2_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_2_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_3_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_3_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_3_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_4_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_4_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_4_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_5_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_5_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_5_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_6_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_6_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_6_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_7_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_7_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_7_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_8_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_8_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_8_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_9_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_9_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_9_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_10_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_10_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_10_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_11_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_12_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_13_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_14_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_15_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_16_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_17_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_18_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_19_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
                    Field_20_Mandatory: [{
                        required: false,
                        message: "Please Select Mandatory Options",
                        trigger: ["blur", "change"]
                    }],
				},
				fileList: [],
				SetupCompleted: false,
			}
		
		},
		watch: {
			price: function(newValue) {
			const result = newValue.replace(/\D/g, "")
				.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			Vue.nextTick(() => this.ProjectInfo.ProjectValue = result);
			}
		},

		computed:{
            currentUser(){
                return this.$store.getters.currentUser
            }
        },
		created() {
            this.getCountries()
        },
		methods:{
			checkHeader1(){
				if(this.ItemStructureSetup.Field_1_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_1_Header = this.ItemStructureSetup.Field_1_Header + '*';
				} 
			},
			checkHeader2(){
				if(this.ItemStructureSetup.Field_2_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_2_Header = this.ItemStructureSetup.Field_2_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_2_Header = this.ItemStructureSetup.Field_2_Header.slice(0, -1);
				} 
			},
			checkHeader3(){
				if(this.ItemStructureSetup.Field_3_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_3_Header = this.ItemStructureSetup.Field_3_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_3_Header = this.ItemStructureSetup.Field_3_Header;
				} 
			},
			checkHeader4(){
				if(this.ItemStructureSetup.Field_4_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_4_Header = this.ItemStructureSetup.Field_4_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_4_Header = this.ItemStructureSetup.Field_4_Header;
				} 
			},
			checkHeader5(){
				if(this.ItemStructureSetup.Field_5_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_5_Header = this.ItemStructureSetup.Field_5_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_5_Header = this.ItemStructureSetup.Field_5_Header;
				} 
			},
			checkHeader6(){
				if(this.ItemStructureSetup.Field_6_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_6_Header = this.ItemStructureSetup.Field_6_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_6_Header = this.ItemStructureSetup.Field_6_Header;
				} 
			},
			checkHeader7(){
				if(this.ItemStructureSetup.Field_7_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_7_Header = this.ItemStructureSetup.Field_7_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_7_Header = this.ItemStructureSetup.Field_7_Header;
				} 
			},
			checkHeader8(){
				if(this.ItemStructureSetup.Field_8_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_8_Header = this.ItemStructureSetup.Field_8_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_8_Header = this.ItemStructureSetup.Field_8_Header;
				} 
			},
			checkHeader9(){
				if(this.ItemStructureSetup.Field_9_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_9_Header = this.ItemStructureSetup.Field_9_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_9_Header = this.ItemStructureSetup.Field_9_Header;
				} 
			},
			checkHeader10(){
				if(this.ItemStructureSetup.Field_10_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_10_Header = this.ItemStructureSetup.Field_10_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_10_Header = this.ItemStructureSetup.Field_10_Header;
				} 
			},
			checkHeader11(){
				if(this.ItemStructureSetup.Field_11_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_11_Header = this.ItemStructureSetup.Field_11_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_11_Header = this.ItemStructureSetup.Field_11_Header;
				} 
			},
			checkHeader12(){
				if(this.ItemStructureSetup.Field_12_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_12_Header = this.ItemStructureSetup.Field_12_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_12_Header = this.ItemStructureSetup.Field_12_Header;
				} 
			},
			checkHeader13(){
				if(this.ItemStructureSetup.Field_13_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_13_Header = this.ItemStructureSetup.Field_13_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_13_Header = this.ItemStructureSetup.Field_13_Header;
				} 
			},
			checkHeader14(){
				if(this.ItemStructureSetup.Field_14_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_14_Header = this.ItemStructureSetup.Field_14_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_14_Header = this.ItemStructureSetup.Field_14_Header;
				} 
			},
			checkHeader15(){
				if(this.ItemStructureSetup.Field_15_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_15_Header = this.ItemStructureSetup.Field_15_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_15_Header = this.ItemStructureSetup.Field_15_Header;
				} 
			},
			checkHeader16(){
				if(this.ItemStructureSetup.Field_16_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_16_Header = this.ItemStructureSetup.Field_16_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_16_Header = this.ItemStructureSetup.Field_16_Header;
				} 
			},
			checkHeader17(){
				if(this.ItemStructureSetup.Field_17_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_17_Header = this.ItemStructureSetup.Field_17_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_17_Header = this.ItemStructureSetup.Field_17_Header;
				} 
			},
			checkHeader18(){
				if(this.ItemStructureSetup.Field_18_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_18_Header = this.ItemStructureSetup.Field_18_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_18_Header = this.ItemStructureSetup.Field_18_Header;
				} 
			},
			checkHeader19(){
				if(this.ItemStructureSetup.Field_19_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_19_Header = this.ItemStructureSetup.Field_19_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_19_Header = this.ItemStructureSetup.Field_19_Header;
				} 
			},
			checkHeader20(){
				if(this.ItemStructureSetup.Field_20_Mandatory == 'Yes' )
				{
					this.ItemStructureSetup.Field_20_Header = this.ItemStructureSetup.Field_20_Header + '*';
					
				}
				else{
					this.ItemStructureSetup.Field_20_Header = this.ItemStructureSetup.Field_20_Header;
				} 
			},
			commaprice() {
                this.ProjectInfo.ProjectValue = this.ProjectInfo.ProjectValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			},
			getCountries() {
                axios.get('api/get/countries')
                    .then((res) => {
                        this.countries = res.data
                    })
                    .catch((err) => {
                    })
            },
			getCities() {
				if(this.FirstStepData.CompanyCountries){
					axios.get('api/get/cities/' + this.FirstStepData.CompanyCountries)
						.then((res) => {
							this.cities = res.data
						})
						.catch((err) => {
						})
				}
            },
			/* Item Template Methods */
		    deleteTemplate(RecordID){

                Swal({
                    title: 'Delete This Template',
                    text: "Are you sure you what to delete this template.",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Delete it!',
                    cancelButtonText: 'No'
                }).then((result) => {
                    if (result.value) {
                        this.TemplatesDetails.splice(RecordID, 1);                 
                       	Swal('Template Removed Successfully', 'Template was removed from the list successfully', 'success');
                    }

                    
                })
            },
            SubmitItemSetupForm: function() {
            	let self = this;
            	let duplicated = false;
            	self.ItemStructureSetup.ConsolidatedTitles = "";
                this.$refs.ItemStructureSetupForm.validate((validation) => {

                	/* Check Template Name Exists */
                	$.each(self.TemplatesDetails, function(index, Template) {
                		if(Template.Template_Name == self.ItemStructureSetup.Template_Name){
                			Swal('Duplicated Template Name', 'Duplicated Template Names are not allowed.', 'warning');
	                		 /* iterate through array or object */
	                		 validation = false;
	                		 duplicated = true;
	                		 return false;
                		}
                	});

                    if(validation){
                    	let TemplateIndexLocation = self.TemplatesDetails.length;
                    	$.each(this.ItemStructureSetup, function(index, val) {

                    		if(val != '' && index.includes('Header')){
                    			self.ItemStructureSetup.ConsolidatedTitles = self.ItemStructureSetup.ConsolidatedTitles + val + ' | ';	
                    		}
                    	});
                    	self.ItemStructureSetup.Action = '<button type="button" class="btn btn-block btn-danger"><i class="fa fa-remove"></i> </button>';
                    	self.ItemStructureSetup.ID = TemplateIndexLocation;
                    	self.TemplatesDetails.push(Object.assign({}, self.ItemStructureSetup));
						Swal('Template Added Successfully', 'The Library of Materials Has a New Template', 'success');                            
                    } else if (validation == false && duplicated == false) {
                    	Swal('Missing Info', 'Please Fill The Mandatory Fields', 'warning');
                    }
                })
            },
            SetRequired: function(fieldNumber, event){
                let SelectedHeader = 'Field_'+fieldNumber+'_Header';
                let MandaHeader = 'Field_'+fieldNumber+'_Mandatory';
                console.log(event);
                if(!event){
                    this.FormRules[SelectedHeader][0].required = true;
                    this.FormRules[MandaHeader][0].required = true;
                } else {
                    this.FormRules[SelectedHeader][0].required = false;
                    this.FormRules[MandaHeader][0].required = false;
                }    
            },
			handleExceed: function(files, fileList){
				
                Swal('The Limit is ' + fileList.length + ' Logo', 'The limit is ' + fileList.length + ' logo per company, if you would like to upload more than one logo please contact Ogéo support team', 'warning'); 
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
				
            },
			deleteLogoPreview(){
				axios.get('api/delete/logopreview'+ this.logopreview)
				.then((res) => {
					this.$refs.CompanyLogo.clearFiles();
					this.logopreview = ''
				})
			},
			handleEditChange() {
				if(!this.$refs.CompanyLogo.uploadFiles[0]){
					Swal('Information is missing', 'Please enter the needed information to continue the registration process.', 'warning')
					resolve(false);
				}
			
				let formData = new FormData();
				formData.append('CompanyLogo',this.$refs.CompanyLogo.uploadFiles[0].raw);

				axios.post( 'api/save/companyLogo',
				formData,
				{
					headers: {
						'Content-Type': 'multipart/form-data'
					}
				}
					).then((response) => {
						this.logopreview = response.data.file
			
					resolve(valid);

					})
					.catch(function(){
						resolve(false);
						Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
					});				
			},
			showProjectDetails: function(key, event){
				if (event) event.preventDefault();



			
				this.ProjectModalInfo = "";
				this.ProjectKey = key;
				this.ProjectModalInfo = Object.assign({}, this.ProjectsDetails[key]);
				console.log(	this.ProjectModalInfo);
				/* Handle if the original selection was non store and to be changed to store */
				if(this.ProjectModalInfo.StoreSetup == "No"){

					this.ProjectModalInfo.ASTMGR_List = this.ASTMGR_List;
					this.ProjectModalInfo.SIIRPT_List = []; 
					this.ProjectModalInfo.RTIRS_List = []; 
					this.ProjectModalInfo.ATSIRS_List = {
				    	level_1: [],
				    	level_2: [],
				    	level_3: [],
				    	level_4: [],
				    	level_5: [],
				    	level_6: [],
				    	level_7: [],
				    	level_8: []
				    },
					this.ProjectModalInfo.RTSI_List = []; 
					this.ProjectModalInfo.ATSI_List = {
				    	level_1: [],
				    	level_2: [],
				    	level_3: [],
				    	level_4: [],
				    	level_5: [],
				    	level_6: [],
				    	level_7: [],
				    	level_8: []
				    };
				}

				this.$forceUpdate();

				this.$refs.AccountSettingForm3.validate((validation) => {
					$('#ProjectDetailsModalId').modal('toggle');

					//adding Purchase Order Validator and Receipt Note Validator values in input fields
					$.each(this.ProjectModalInfo.POV_Financial_Details, function(index, val) {
						$('#POV_Modal_List_level_'+val['POV_Level']+'_limit_'+index).val(parseInt(val['Limit']));
						$('#POV_Modal_List_level_'+val['POV_Level']+'_currency_'+index).val(parseInt(val['Currency']));
					});
					$.each(this.ProjectModalInfo.RNV_Financial_Details, function(index, val) {
						$('#RNV_Modal_List_level_'+val['POV_Level']+'_limit_'+index).val(parseInt(val['Limit']));
						$('#RNV_Modal_List_level_'+val['POV_Level']+'_currency_'+index).val(parseInt(val['Currency']));
					});
					$.each(this.ProjectModalInfo.RCV_Financial_Details, function(index, val) {
						$('#RCV_Modal_List_level_'+val['POV_Level']+'_limit_'+index).val(parseInt(val['Limit']));
						$('#RCV_Modal_List_level_'+val['POV_Level']+'_currency_'+index).val(parseInt(val['Currency']));
					});

				})
			},
			updateProjectDetails: function() {

				console.log(this.ProjectModalInfo);

				//Check the roles completness
				const allRoles = {};
				allRoles['Application Administrator Role'] = this.ProjectModalInfo.CAD_List; 
				allRoles['Purchase Enquiry Originator Role'] = this.ProjectModalInfo.PRO_List; 
				allRoles['Purchase Enquiry Validator Role'] = this.ProjectModalInfo.PRV_List;

				if(this.AccountSettingForm.companyLoMManditory != 'FreeText') { 
					allRoles['Library of Material Update Request Originator Role'] = this.ProjectModalInfo.ALMR_List; 
					allRoles['Library of Materials Administrator Role'] = this.ProjectModalInfo.LMA_List; 
					allRoles['Library of Materials Validator Role'] = this.ProjectModalInfo.ALMV_List; 
				}

				allRoles['Request for Proposals Administrator Role'] = this.ProjectModalInfo.RFQM_List; 
				allRoles['Purchase Order Originator Role'] = this.ProjectModalInfo.POO_List; 
				allRoles['Purchase Order Validator Role'] = this.ProjectModalInfo.POV_List; 
				allRoles['Receipt Note Originator Role'] = this.ProjectModalInfo.RNO_List; 
				allRoles['Receipt Note Validator Role'] = this.ProjectModalInfo.RNV_List; 
				allRoles['Vendors Qualification Administrator Role'] = this.ProjectModalInfo.SLM_List; 
				allRoles['Invoice Checker Role'] = this.ProjectModalInfo.INV_List; 

				/* handles changes to store info in modification mode and reseting Roles values if no store is re-selected */
				if(this.ProjectModalInfo.StoreSetup == "Yes"){
					allRoles['Storeroom Manager Role'] = this.ProjectModalInfo.ASTMGR_List; 
					allRoles['Storeroom In-Charge Role'] = this.ProjectModalInfo.SIIRPT_List; 
					allRoles['Storeroom Transaction Request Originator Role'] = this.ProjectModalInfo.RTIRS_List; 
					allRoles['Storeroom Transaction Request Validator Role'] = this.ProjectModalInfo.ATSIRS_List; 
					allRoles['Storeroom Items Update Request Originator Role'] = this.ProjectModalInfo.RTSI_List; 
					allRoles['Storeroom Items Update Request Validator Role'] = this.ProjectModalInfo.ATSI_List;
				} else {
					this.ProjectModalInfo.ASTMGR_List = this.ProjectModalInfo.ASTMGR_List;
				    this.ProjectModalInfo.ASTMGR_Number = null;
	                this.ProjectModalInfo.SIIRPT_List = [];
	                this.ProjectModalInfo.RTIRS_List = [];
	                this.ProjectModalInfo.ATSIRS_List = {
				    	level_1: [],
				    	level_2: [],
				    	level_3: [],
				    	level_4: [],
				    	level_5: [],
				    	level_6: [],
				    	level_7: [],
				    	level_8: []
				    };
				    this.ProjectModalInfo.ATSIRS_Number = null;
	                this.ProjectModalInfo.RTSI_List = [];
	                this.ProjectModalInfo.ATSI_List = {
				    	level_1: [],
				    	level_2: [],
				    	level_3: [],
				    	level_4: [],
				    	level_5: [],
				    	level_6: [],
				    	level_7: [],
				    	level_8: []
				    };
				    this.ProjectModalInfo.ATSI_Number = null;
				}

				allRoles['Rate Contract Creation Request Originator Role'] = this.ProjectModalInfo.RCCO_List; 
				allRoles['Rate Contract Creation Request Validator Role'] = this.ProjectModalInfo.RCCV_List; 
				allRoles['Rate Contract Originator Role'] = this.ProjectModalInfo.RCO_List; 
				allRoles['Rate Contract Validator Role'] = this.ProjectModalInfo.RCV_List;
				
				let RolesError = false;

				$.each(allRoles, function(RoleName, RoleInfo) {
					// console.log(RoleInfo);
					// console.log(Array.isArray(RoleInfo));
					// console.log(RoleInfo.length == 0);
					// Exclude Role Names With RC
					if(!RoleName.includes("Rate Contract")){
						if(Array.isArray(RoleInfo)){
							if(RoleInfo.length == 0){
								Swal(""+RoleName+" Has No Employees", "You have not added any employees to "+RoleName+".", 'warning');
								RolesError = true;
								return false;
							}
						} else {
							
							let NoEmployees = true;
							$.each(RoleInfo, function(index, RoleLevel) {
								if(RoleLevel.length > 0){
									NoEmployees = false;
								}
							});

							if(NoEmployees){
								Swal(""+RoleName+" Has No Employees", "You have not added any employees to "+RoleName+".", 'warning');
								RolesError = true;
								return false;
							}
						}
					}
				});

				//do not move wizard next if there are role errors
				if(RolesError){
					return false;
				}

				let POV_Number = this.ProjectModalInfo.POV_Number;
				let RNV_Number = this.ProjectModalInfo.RNV_Number;
				let RCV_Number = this.ProjectModalInfo.RCV_Number;

				//check completeness of the Purchase Order Validator and Receipt Note Validator value entries
				for (var x = 1; POV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#POV_Modal_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Purchase Order Validator of Level ("+x+")", 'warning');
								return false;
							}
						}
					}
				}
				//check completeness of the Purchase Order Validator and Receipt Note Validator value entries
				for (var x = 1; RNV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#RNV_Modal_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Receipt Note Validator Level ("+x+")", 'warning');
								return false;
							}
						}
					}
				}
				//check completeness of the Rate Contract Validator value entries
				for (var x = 1; RCV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#RCV_Modal_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Rate Contract Validator Level ("+x+")", 'warning');
								return false;
							}
						}
					}
				}

				/*Storing Purchase Order Validator and Receipt Note Validator and Rate Contract Validator Values Correctly*/
				this.ProjectModalInfo.POV_Financial_Details = [];
				this.ProjectModalInfo.RNV_Financial_Details = [];
				this.ProjectModalInfo.RCV_Financial_Details = [];

				//Update Purchase Order Validator financial limits
				for (var x = 1; POV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							this.ProjectModalInfo.POV_Financial_Details.push({
								POV_Level: x, 
								Currency: $('#POV_Modal_List_level_'+x+'_currency_'+i).val(),
								Limit: $('#POV_Modal_List_level_'+x+'_limit_'+i).val(),
							});
						}
					}
				}

				//Update Receipt Note Validator financial limits
				for (var x = 1; RNV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							this.ProjectModalInfo.RNV_Financial_Details.push({
								RNV_Level: x, 
								Currency: $('#RNV_Modal_List_level_'+x+'_currency_'+i).val(),
								Limit: $('#RNV_Modal_List_level_'+x+'_limit_'+i).val(),
							});
						}
					}
				}

				//Update Rate Contract Validator financial limits
				for (var x = 1; RCV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							this.ProjectModalInfo.RCV_Financial_Details.push({
								RCV_Level: x, 
								Currency: $('#RCV_Modal_List_level_'+x+'_currency_'+i).val(),
								Limit: $('#RCV_Modal_List_level_'+x+'_limit_'+i).val(),
							});
						}
					}
				}


				this.ProjectsDetails[this.ProjectKey] = Object.assign({}, this.ProjectModalInfo);
				this.$forceUpdate();

				if(this.ProjectModalInfo.StoreSetup == "Yes"){
					/* Update this.ASTMGR_List from current this.ProjectModalInfo.ASTMGR_List and all projects  elf.$data.ProjectsDetails[index].ASTMGR_List */
					this.ASTMGR_List = this.ProjectModalInfo.ASTMGR_List;
					let self = this;
					$.each(this.$data.ProjectsDetails, function(index, project) {
			  			self.$data.ProjectsDetails[index].ASTMGR_List = self.ProjectModalInfo.ASTMGR_List;
			  			self.$data.ProjectsDetails[index].ASTMGR_Number = self.ProjectModalInfo.ASTMGR_Number;
			  		});
				}

				/*Close Update Modal */
				$('#ProjectDetailsModalId').modal('toggle');
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
			CreateNewProject: function (event) {
				if (event) event.preventDefault();

				//Check for duplicated Names when adding new project (Must be done here)


				//Check the roles completness
				const allRoles = {};
				allRoles['Application Administrator Role'] = this.CAD_List; 
				allRoles['Purchase Enquiry Originator Role'] = this.PRO_List; 
				allRoles['Purchase Enquiry Validator Role'] = this.PRV_List; 
				 
				if(this.AccountSettingForm.companyLoMManditory != 'FreeText') {
					allRoles['Library of Material Update Request Originator Role'] = this.ALMR_List;
					allRoles['Library of Materials Administrator Role'] = this.LMA_List; 
					allRoles['Library of Materials Validator Role'] = this.ALMV_List; 
				}
				
				allRoles['Request for Proposals Administrator Role'] = this.RFQM_List; 
				allRoles['Purchase Order Originator Role'] = this.POO_List; 
				allRoles['Purchase Order Validator Role'] = this.POV_List; 
				allRoles['Receipt Note Originator Role'] = this.RNO_List; 
				allRoles['Receipt Note Validator Role'] = this.RNV_List; 
				allRoles['Vendors Qualification Administrator Role'] = this.SLM_List; 
				allRoles['Invoice Checker Role'] = this.INV_List; 

				allRoles['Rate Contract Creation Request Originator Role'] = this.RCCO_List; 
				allRoles['Rate Contract Creation Request Validator Role'] = this.RCCV_List; 
				allRoles['Rate Contract Originator Role'] = this.RCO_List; 
				allRoles['Rate Contract Validator Role'] = this.RCV_List;

				if(this.ProjectInfo.StoreSetup == "Yes"){
					allRoles['Storeroom Manager Role'] = this.ASTMGR_List; 
					allRoles['Storeroom In-Charge Role'] = this.SIIRPT_List; 
					allRoles['Storeroom Transaction Request Originator Role'] = this.RTIRS_List; 
					allRoles['Storeroom Transaction Request Validator Role'] = this.ATSIRS_List; 
					allRoles['Storeroom Items Update Request Originator Role'] = this.RTSI_List; 
					allRoles['Storeroom Items Update Request Validator Role'] = this.ATSI_List; 
				}

				let RolesError = false;

				$.each(allRoles, function(RoleName, RoleInfo) {
					// Exclude Role Names With RC
					if(!RoleName.includes("Rate Contract")){

						if(Array.isArray(RoleInfo)){
							if(RoleInfo.length == 0){
								Swal(""+RoleName+" Has No Employees", "You have not added any employees to "+RoleName+".", 'warning');
								RolesError = true;
								return false;
							}
						} else {
							
							let NoEmployees = true;
							$.each(RoleInfo, function(index, RoleLevel) {
								if(RoleLevel.length > 0){
									NoEmployees = false;
								}
							});

							if(NoEmployees){
								Swal(""+RoleName+" Has No Employees", "You have not added any employees to "+RoleName+".", 'warning');
								RolesError = true;
								return false;
							}
						}
					}
				});

				//do not move wizard next if there are role errors
				if(RolesError){
					return false;
				}

				let POV_Number = this.POV_Number;
				let RNV_Number = this.RNV_Number;
				let RCV_Number = this.RCV_Number;


				//check completeness of the Purchase Order Validator and Receipt Note Validator value entries
				for (var x = 1; POV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#POV_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Purchase Order Validator of Level ("+x+")", 'warning');
								return false;
							}
						}							
					}
				}

				//check completeness of the Purchase Order Validator and Receipt Note Validator value entries
				for (var x = 1; RNV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#RNV_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Receipt Note Validator of Level ("+x+")", 'warning');
								return false;
							}
						}
						
					}
				}


				//check completeness of the Rate Contract Validator value entries
				for (var x = 1; RCV_Number > x; x++) {
					for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
						if(i == 0){
							if($('#RCV_List_level_'+x+'_limit_'+i).val() == ""){
								Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Rate Contract Validator of Level ("+x+")", 'warning');
								return false;
							}
						}
						
					}
				}


				//Check fields completness
				this.$refs.AccountSettingForm3.validate((validation) => {

					//only stop/return when validation is false when 
					if(validation){ 

						let PRV_Number = this.PRV_Number;
						let ALMV_Number = this.ALMV_Number;
						let POV_Number = this.POV_Number;
						let RNV_Number = this.RNV_Number;
						let RCCV_Number = this.RCCV_Number;
						let RCV_Number = this.RCV_Number;

						this.POV_Financial_Details= [];
						this.RNV_Financial_Details= [];
						this.RCV_Financial_Details= [];

						//getting financial limits for POV
						for (var x = 1; POV_Number > x; x++) {
							for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
								if(i == 0){
									this.POV_Financial_Details.push({
										POV_Level: x, 
										Currency: $('#POV_List_level_'+x+'_currency_'+i).val(),
										Limit: $('#POV_List_level_'+x+'_limit_'+i).val(),
									});
								}
							}
						}

						//getting financial limits for RNV
						for (var x = 1; RNV_Number > x; x++) {
							for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
								if(i == 0){
									this.RNV_Financial_Details.push({
										RNV_Level: x, 
										Currency: $('#RNV_List_level_'+x+'_currency_'+i).val(),
										Limit: $('#RNV_List_level_'+x+'_limit_'+i).val(),
									});
								}
							}
						}

						//getting financial limits for RCV
						for (var x = 1; RCV_Number > x; x++) {
							for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
								if(i == 0){
									this.RCV_Financial_Details.push({
										RCV_Level: x, 
										Currency: $('#RCV_List_level_'+x+'_currency_'+i).val(),
										Limit: $('#RCV_List_level_'+x+'_limit_'+i).val(),
									});
								}
							}
						}

						console.log(this.POV_Financial_Details);
						console.log(this.RNV_Financial_Details);
						console.log(this.RCV_Financial_Details);
						
						//Copy and Store all assigned Roles into new object
						if(this.ProjectInfo.StoreSetup == "Yes"){
							
							let ASTMGR_Number = this.ASTMGR_Number;
							let SIIRPT_Number = this.SIIRPT_Number;
							let RTIRS_Number = this.RTIRS_Number;
							let ATSIRS_Number = this.ATSIRS_Number;
							let RTSI_Number = this.RTSI_Number;
							let ATSI_Number = this.ATSI_Number;
							
							let AllTempRoles = {
								CAD_List: JSON.parse(JSON.stringify(this.CAD_List)),
								PRO_List: JSON.parse(JSON.stringify(this.PRO_List)),
								PRV_List: JSON.parse(JSON.stringify(this.PRV_List)),
								ALMR_List: JSON.parse(JSON.stringify(this.ALMR_List)),
								LMA_List: JSON.parse(JSON.stringify(this.LMA_List)),
								ALMV_List: JSON.parse(JSON.stringify(this.ALMV_List)),
								RFQM_List: JSON.parse(JSON.stringify(this.RFQM_List)),
								POO_List: JSON.parse(JSON.stringify(this.POO_List)),
								POV_List: JSON.parse(JSON.stringify(this.POV_List)),
								RNO_List: JSON.parse(JSON.stringify(this.RNO_List)),
								RNV_List: JSON.parse(JSON.stringify(this.RNV_List)),
								SLM_List: JSON.parse(JSON.stringify(this.SLM_List)),
								INV_List: JSON.parse(JSON.stringify(this.INV_List)),

								RCCO_List: JSON.parse(JSON.stringify(this.RCCO_List)),
								RCCV_List: JSON.parse(JSON.stringify(this.RCCV_List)),
								RCO_List: JSON.parse(JSON.stringify(this.RCO_List)),
								RCV_List: JSON.parse(JSON.stringify(this.RCV_List)),
								POV_Financial_Details: JSON.parse(JSON.stringify(this.POV_Financial_Details)),
								RNV_Financial_Details: JSON.parse(JSON.stringify(this.RNV_Financial_Details)),
								

								ASTMGR_List: JSON.parse(JSON.stringify(this.ASTMGR_List)),
								SIIRPT_List: JSON.parse(JSON.stringify(this.SIIRPT_List)),
								RTIRS_List: JSON.parse(JSON.stringify(this.RTIRS_List)),
								ATSIRS_List: JSON.parse(JSON.stringify(this.ATSIRS_List)),
								RTSI_List: JSON.parse(JSON.stringify(this.RTSI_List)),
								ATSI_List: JSON.parse(JSON.stringify(this.ATSI_List)),

								ASTMGR_Number: ASTMGR_Number,
								ATSIRS_Number: ATSIRS_Number,
								ATSI_Number: ATSI_Number,
								
								PRV_Number: PRV_Number,
							    ALMV_Number: ALMV_Number,
							    POV_Number: POV_Number,
							    RNV_Number: RNV_Number,
							    RCCV_Number: RCCV_Number,
							    RCV_Number: RCV_Number,
								RCV_Financial_Details: JSON.parse(JSON.stringify(this.RCV_Financial_Details)),
							}

							//handling breakline in terms and condiditions
							this.ProjectInfo.ProjectTsNCs = this.ProjectInfo.ProjectTsNCs.replace(/\r\n|\r|\n/g,'<br>');

							this.ProjectsDetails.push(Object.assign({}, this.ProjectInfo, AllTempRoles));

							let self = this;

							$.each(this.$data.ProjectsDetails, function(index, project) {
					  			self.$data.ProjectsDetails[index].ASTMGR_List = self.ASTMGR_List;
					  			self.$data.ProjectsDetails[index].ASTMGR_Number = ASTMGR_Number;
					  		});
							

							//Reseting Project Info
							this.ProjectInfo.ProjectTitle = "";
							this.ProjectInfo.StoreSetup = "";
							this.ProjectInfo.ProjectPeriod = "";
							this.ProjectInfo.ProjectValue = "";
							this.ProjectInfo.ProjectPODOACriterion = "";
							this.ProjectInfo.ProjectRNDOACriterion = "";
							this.ProjectInfo.ProjectAuctionType = [];
							this.ProjectInfo.ProjectCompanyCurrency = "";
							this.ProjectInfo.ProjectTsNCs = "";

						} else {
							
							let AllTempRoles = {
								CAD_List: JSON.parse(JSON.stringify(this.CAD_List)),
								PRO_List: JSON.parse(JSON.stringify(this.PRO_List)),
								PRV_List: JSON.parse(JSON.stringify(this.PRV_List)),
								ALMR_List: JSON.parse(JSON.stringify(this.ALMR_List)),
								LMA_List: JSON.parse(JSON.stringify(this.LMA_List)),
								ALMV_List: JSON.parse(JSON.stringify(this.ALMV_List)),
								RFQM_List: JSON.parse(JSON.stringify(this.RFQM_List)),
								POO_List: JSON.parse(JSON.stringify(this.POO_List)),
								POV_List: JSON.parse(JSON.stringify(this.POV_List)),
								RNO_List: JSON.parse(JSON.stringify(this.RNO_List)),
								RNV_List: JSON.parse(JSON.stringify(this.RNV_List)),
								SLM_List: JSON.parse(JSON.stringify(this.SLM_List)),
								INV_List: JSON.parse(JSON.stringify(this.INV_List)),

								RCCO_List: JSON.parse(JSON.stringify(this.RCCO_List)),
								RCCV_List: JSON.parse(JSON.stringify(this.RCCV_List)),
								RCO_List: JSON.parse(JSON.stringify(this.RCO_List)),
								RCV_List: JSON.parse(JSON.stringify(this.RCV_List)),
								POV_Financial_Details: JSON.parse(JSON.stringify(this.POV_Financial_Details)),
								RNV_Financial_Details: JSON.parse(JSON.stringify(this.RNV_Financial_Details)),
								
								PRV_Number: PRV_Number,
							    ALMV_Number: ALMV_Number,
							    POV_Number: POV_Number,
							    RNV_Number: RNV_Number,
							    RCCV_Number: RCCV_Number,
							    RCV_Number: RCV_Number,
								RCV_Financial_Details: JSON.parse(JSON.stringify(this.RCV_Financial_Details)),

								ASTMGR_Number: this.ASTMGR_Number,
								ATSIRS_Number: this.ATSIRS_Number,
								ATSI_Number: this.ATSI_Number,
							}
							
							//handling breakline in terms and condiditions
							this.ProjectInfo.ProjectTsNCs = this.ProjectInfo.ProjectTsNCs.replace(/\r\n|\r|\n/g,'<br>');

							this.ProjectsDetails.push(Object.assign({}, this.ProjectInfo, AllTempRoles));

							//Reseting Project Info
							this.ProjectInfo.ProjectTitle = "";
							this.ProjectInfo.ProjectPeriod = "";
							this.ProjectInfo.ProjectValue = "";
							this.ProjectInfo.ProjectPODOACriterion = "";
							this.ProjectInfo.ProjectRNDOACriterion = "";
							this.ProjectInfo.ProjectAuctionType = [];
							this.ProjectInfo.ProjectCompanyCurrency = "";
							this.ProjectInfo.ProjectTsNCs = "";
						}

						
						
						

						//Reseting Role Info
						Swal({
		                  title: 'Would You like to preserve current role structure',
		                  text: "Current role structure can be preserved, this will save time on the next project creation.",
		                  type: 'warning',
		                  showCancelButton: true,
		                  confirmButtonColor: '#3085d6',
		                  cancelButtonColor: '#d33',
		                  confirmButtonText: 'Yes, Preserve it!',
		                  cancelButtonText: 'No, Reset it!'
		                }).then((result) => {
		                    if (!result.value) {

								this.CAD_List= [];
								this.PRO_List= [];
							    this.PRV_List= {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.PRV_Number = null;
							    this.ALMR_List = [];
							    this.LMA_List = [];
							    this.ALMV_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.ALMV_Number = null;
							    this.RFQM_List = [];
							    this.POO_List = [];
							    this.POV_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    },
							    this.POV_Number = null;
							    this.RNO_List = [];
							    this.RNV_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    },
							    this.RNV_Number = null;
							    this.SLM_List = [];
							    this.INV_List = [];
							    /* This role is acorss stores so its not reset at any point */
							    // this.ASTMGR_List = {
							    // 	level_1: [],
							    // 	level_2: [],
							    // 	level_3: [],
							    // 	level_4: [],
							    // 	level_5: [],
							    // 	level_6: [],
							    // 	level_7: [],
							    // 	level_8: []
							    // };
							    // this.ASTMGR_Number = null;
				                this.SIIRPT_List = [];
				                this.RTIRS_List = [];
				                this.ATSIRS_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.ATSIRS_Number = null;
				                this.RTSI_List = [];
				                this.ATSI_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.ATSI_Number = null;

							    this.RCCO_List = [];
							    this.RCCV_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.RCCV_Number = null;
							    this.RCO_List = [];
							    this.RCV_List = {
							    	level_1: [],
							    	level_2: [],
							    	level_3: [],
							    	level_4: [],
							    	level_5: [],
							    	level_6: [],
							    	level_7: [],
							    	level_8: []
							    };
							    this.RCV_Number = null;
							    this.POV_Financial_Details = [];
							    this.RNV_Financial_Details = [];
							    this.RCV_Financial_Details = [];

		                    }
		                });

						
						this.scrollTo(400, 1000);

						// Swal({ type: 'success', title: 'Project Saved', text: "Project Details Saved, You Can Enter New Project Details", showConfirmButton: false, timer: 1500
						// });
		
					// } else {
					// 	this.scrollTo(400, 1000);
					// 	return validation;
					}
					
				});	
			},
			RemoveProject: function(key, event) {
				if (event) event.preventDefault();
				this.ProjectsDetails.splice(key, 1);
			},
			formatPrice(value) {
		        let val = (value/1).toFixed(2).replace(',', '.')
		        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		    },
			submitUpload: function() {
		    	this.$refs.upload.submit();
		    },
		    onAddCAD: function(evt) {

		    	console.log(this.CAD_List);
		    	const NewlyAdded = this.CAD_List[evt.newIndex];
				const exsits = this.CAD_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.CAD_List, evt.newIndex); 
                	Swal('Employee Exists', 'Employee already exists in Application Administrator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                })
                	}

            },
            onAddPRO: function(evt) {
		    	console.log(this.PRO_List);
		    	const NewlyAdded = this.PRO_List[evt.newIndex];
				const exsits = this.PRO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.PRO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Enquiry Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) } 
            },
		    onAddPRV: function(evt) {
		    	console.log(this.PRV_List);
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);
		    	
		    	const NewlyAdded = this.PRV_List[ListName][evt.newIndex];
				const exsits = this.PRV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.PRV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Purchase Enquiry Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddALMR: function(evt) {
		    	const NewlyAdded = this.ALMR_List[evt.newIndex];
				const exsits = this.ALMR_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ALMR_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Library of Material Update Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddLMA: function(evt) {
		    	const NewlyAdded = this.LMA_List[evt.newIndex];
				const exsits = this.LMA_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.LMA_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Library of Materials Administrator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddALMV: function(evt) {

		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.ALMV_List[ListName][evt.newIndex];
				const exsits = this.ALMV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ALMV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Library of Materials Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddRFQM: function(evt) {
		    	const NewlyAdded = this.RFQM_List[evt.newIndex];
				const exsits = this.RFQM_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RFQM_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Request for Proposals Administrator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddPOO: function(evt) {
		    	console.log(this.POO_List);
		    	const NewlyAdded = this.POO_List[evt.newIndex];
				const exsits = this.POO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.POO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Order Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddPOV: function(evt) {

		    	// $.toast({
				// 	heading: 'Welcome to Monster admin',
				// 	text: 'Use the predefined ones, or specify a custom position object.',
				// 	position: 'top-right',
				// 	loaderBg:'#ff6849',
				// 	icon: 'warning',
				// 	hideAfter: 3500, 
				// 	stack: 6
				// });

		
				var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);

				console.log(ListName);
				console.log(this.POV_List[ListName]);
		    	
		    	const NewlyAdded = this.POV_List[ListName][evt.newIndex];
				const exsits = this.POV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.POV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Purchase Order Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }	    	
		    },
		    onAddRNO: function(evt) {
		    	const NewlyAdded = this.RNO_List[evt.newIndex];
				const exsits = this.RNO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RNO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Receipt Note Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRNV: function(evt) {
		    	
		    	// $.toast({
				// 	heading: 'Welcome to Monster admin',
				// 	text: 'Use the predefined ones, or specify a custom position object.',
				// 	position: 'top-right',
				// 	loaderBg:'#ff6849',
				// 	icon: 'warning',
				// 	hideAfter: 3500, 
				// 	stack: 6
				// });

				var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);

				console.log(ListName);
				console.log(this.RNV_List[ListName]);
		    	
		    	const NewlyAdded = this.RNV_List[ListName][evt.newIndex];
				const exsits = this.RNV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.RNV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Receipt Note Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddSLM: function(evt) {
		    	const NewlyAdded = this.SLM_List[evt.newIndex];
				const exsits = this.SLM_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.SLM_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Vendors Qualification Administrator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddINV: function(evt) {
		    	const NewlyAdded = this.INV_List[evt.newIndex];
				const exsits = this.INV_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.INV_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Invoice Checker List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },



			onAddASTMGR: function(evt) {


				var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(7);

		    	const NewlyAdded = this.ASTMGR_List[ListName][evt.newIndex];
				const exsits = this.ASTMGR_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ASTMGR_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Manager List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }

				
		    },
		    onAddSIIRPT: function(evt) {
		    	const NewlyAdded = this.SIIRPT_List[evt.newIndex];
				const exsits = this.SIIRPT_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.SIIRPT_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom In-Charge List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRTIRS: function(evt) {
		    	const NewlyAdded = this.RTIRS_List[evt.newIndex];
				const exsits = this.RTIRS_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RTIRS_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom Transaction Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddATSIRS: function(evt) {
		    	console.log(this.ATSIRS_List);
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(7);
		    	
		    	const NewlyAdded = this.ATSIRS_List[ListName][evt.newIndex];
				const exsits = this.ATSIRS_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ATSIRS_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Transaction Request Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddRTSI: function(evt) {
		    	const NewlyAdded = this.RTSI_List[evt.newIndex];
				const exsits = this.RTSI_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RTSI_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom Items Update Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddATSI: function(evt) {
		    	console.log(this.ATSI_List);
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.ATSI_List[ListName][evt.newIndex];
				const exsits = this.ATSI_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ATSI_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Items Update Request Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    


		    onAddRCCO: function(evt) {
		    	const NewlyAdded = this.RCCO_List[evt.newIndex];
				const exsits = this.RCCO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RCCO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Rate Contract Creation Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRCCV: function(evt) {
		    	
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.RCCV_List[ListName][evt.newIndex];
				const exsits = this.RCCV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.RCCV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Rate Contract Creation Request Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddRCO: function(evt) {
		    	const NewlyAdded = this.RCO_List[evt.newIndex];
				const exsits = this.RCO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.RCO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Rate Contract Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRCV: function(evt) {
		    	
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);
		    	
		    	const NewlyAdded = this.RCV_List[ListName][evt.newIndex];
				const exsits = this.RCV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.RCV_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Rate Contract Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    deleteEmployee(DataList, index, ListName = "Non-ASTMGR", DeletLevel = 0, DeletedEmail){
		    		
		    	Swal({
				  title: 'Are you sure?',
				  text: "You can still added employee again!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.value) {

				  	/* Check if the employee exists in any roles*/
				  	if(ListName == 'EmployeesList'){

				  		let RolesError = false;

				  		/* Check employee existance in existing projects */
						$.each(this.$data.ProjectsDetails, function(key, Project) {
							$.each(Project, function(index, ProjectDetails) {
								var RoleName= index.substr(0, index.indexOf('_'));
								console.log(RoleName);
								if(index.substr(index.length - 5) == '_List'){
									console.log(Project);
									if(Array.isArray(ProjectDetails)){
										if(ProjectDetails.length > 0){
											$.each(ProjectDetails, function(index, Employee) {
												
												if(Employee.email == DeletedEmail){
													Swal(""+ RoleName +" Has This Employee in "+ Project.ProjectTitle +"", "Employee Must Be Removed From This Role First", 'warning');
													RolesError = true;
													return false;
												}
											})
											
										}
									} else {
										
										$.each(ProjectDetails, function(index, RoleLevel) {
											var RoleName= index.substr(0, index.indexOf('_'));
											if(RoleLevel.length > 0){
												$.each(RoleLevel, function(index, Employee) {
													if(Employee.email == DeletedEmail){
														Swal(""+ RoleName +" Has This Employee in "+ Project.ProjectTitle +"", "Employee Must Be Removed From This Role First", 'warning');
														RolesError = true;
														return false;
													}
												});										
											}
										});
									}

								}
							});
						});


				  		//Check the roles completness
						const allRoles = {};
						allRoles['Application Administrator Role'] = this.CAD_List; 
						allRoles['Purchase Enquiry Originator Role'] = this.PRO_List; 
						allRoles['Purchase Enquiry Validator Role'] = this.PRV_List; 
						 
						if(this.AccountSettingForm.companyLoMManditory != 'FreeText') {
							allRoles['Library of Material Update Request Originator Role'] = this.ALMR_List;
							allRoles['Library of Materials Administrator Role'] = this.LMA_List; 
							allRoles['Library of Materials Validator Role'] = this.ALMV_List; 
						}
						
						allRoles['Request for Proposals Administrator Role'] = this.RFQM_List; 
						allRoles['Purchase Order Originator Role'] = this.POO_List; 
						allRoles['Purchase Order Validator Role'] = this.POV_List; 
						allRoles['Receipt Note Originator Role'] = this.RNO_List; 
						allRoles['Receipt Note Validator Role'] = this.RNV_List; 
						allRoles['Vendors Qualification Administrator Role'] = this.SLM_List; 
						allRoles['Invoice Checker Role'] = this.INV_List; 

						allRoles['Rate Contract Creation Request Originator Role'] = this.RCCO_List; 
						allRoles['Rate Contract Creation Request Validator Role'] = this.RCCV_List; 
						allRoles['Rate Contract Originator Role'] = this.RCO_List; 
						allRoles['Rate Contract Validator Role'] = this.RCV_List;

						if(this.ProjectInfo.StoreSetup == "Yes"){
							allRoles['Storeroom Manager Role'] = this.ASTMGR_List; 
							allRoles['Storeroom In-Charge Role'] = this.SIIRPT_List; 
							allRoles['Storeroom Transaction Request Originator Role'] = this.RTIRS_List; 
							allRoles['Storeroom Transaction Request Validator Role'] = this.ATSIRS_List; 
							allRoles['Storeroom Items Update Request Originator Role'] = this.RTSI_List; 
							allRoles['Storeroom Items Update Request Validator Role'] = this.ATSI_List; 
						}

						

						$.each(allRoles, function(RoleName, RoleInfo) {

							//console.log(RoleName, RoleInfo, Array.isArray(RoleInfo), RoleInfo.length > 0);
							if(Array.isArray(RoleInfo)){
								if(RoleInfo.length > 0){
									$.each(RoleInfo, function(index, Employee) {
										if(Employee.email == DeletedEmail){
											Swal(""+RoleName+" Has This Employee", "Employee Must Be Removed From This Role First", 'warning');
											RolesError = true;
											return false;
										}
									})
									
								}
							} else {
								
								$.each(RoleInfo, function(index, RoleLevel) {
									if(RoleLevel.length > 0){
										$.each(RoleLevel, function(index, Employee) {
											if(Employee.email == DeletedEmail){
												Swal(""+RoleName+" Has This Employee", "Employee Must Be Removed From This Role First", 'warning');
												RolesError = true;
												return false;
											}
										});										
									}
								});
							}
							
						});



						

						//do not move wizard next if there are role errors
						if(!RolesError){
							this.$delete(DataList, index);
				  			Swal(
						      'Deleted!',
						      'This employee is no longer holding the role',
						      'success'
						    )
						}

			    		
			    	} else {

			    		/* check if data list is Storeroom Manager in and check if the existing projects have this role and prevent deletion */
					  	if(ListName == 'ASTMGR'){
					  		let level_counter = 1;
					  		let employeeMatch = false;
					  		let projectName = "";

					  		$.each(this.$data.ProjectsDetails, function(index0, project) {
					  			$.each(project.ASTMGR_List, function(index1, level) {
					  				if(DeletLevel == level_counter){
					  					if(project.ASTMGR_List['level_' + level_counter].length > 0){
					  						$.each(project.ASTMGR_List['level_' + level_counter], function(index, employee) {
					  							if(employee.email == DeletedEmail){
					  								employeeMatch = true;
					  								projectName = project.ProjectTitle;
					  							}
					  						});
					  					}
					  				}
					  				level_counter++;
					  			});
					  			level_counter = 1;
					  		});

					  		if(employeeMatch){
					  			Swal(
							      'Cannot Be Deleted!',
							      'Employee Cannot be deleted from the list. Please remove it from store: (' + projectName + ') first.',
							      'error'
							    )
					  		} else {
					  			this.$delete(DataList, index);
					  			Swal(
							      'Deleted!',
							      'This employee is no longer holding the role',
							      'success'
							    )
					  		}
					  		

					  	} else {
					  		this.$delete(DataList, index);
					  		Swal(
						      'Deleted!',
						      'This employee is no longer holding the role',
						      'success'
						    )
					  	}

			    	}


				  	
				    
				  }
				})
		    },
			creatNewEmployee() {

				const constraints = this.EmployeeCreateRules;
                const NewEmployeeErrors = validateJs(this.$data.NewEmployee, constraints);
                if(NewEmployeeErrors) {
                    this.NewEmployeeErrors = NewEmployeeErrors;
                    return;
                }

                const NewlyAdded = this.NewEmployee;
                const exsits = this.EmployeesList.filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return true;
				    }
				});

                if(exsits.length > 0){
                	Swal('Employee Exists', 'Employee already exists in Employees List', 'warning')
                } else {

                	this.EmployeesList.push({
				      	fullName: this.NewEmployee.fullName,
						email: this.NewEmployee.email,
						designation: this.NewEmployee.designation,
				    });

                	this.NewEmployee.fullName = "";
                	this.NewEmployee.email = "";
                	this.NewEmployee.designation = "";
			    	this.NewEmployeeErrors = null;
			    	Swal('Employee has been created successfully', '', 'success');
                }			
			},
			StoreSetup($event) {
				//show corresponding roles for stores
				//Restore 
				console.log(this.ProjectInfo.StoreSetup)
			},
			StoreSetupModal($event) {
				//show corresponding roles for stores
				console.log(this.ProjectModalInfo.StoreSetup)
			},
			getIndustries() {

	            axios.get('/data/industries.json').
	            	then((response) => {
			       		this.Industries = response.data.industries;
			      	})
	            	.catch(error => { 
	            		console.log(error); 
	            	});
			},

         getFirstStep() {
			 
	           axios.post( '/api/users/get/firstStep',
                       
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {
								console.log(response.data);
							this.FirstStepData=response.data.company;
							// var obj = {
							// 	name : response.data.company.CompanyLogo,
							// 	url : 'uploads/Logos/'+response.data.company.CompanyLogo
							// }
							// console.log(obj);
							// this.fileList.push(obj);
							 this.$store.commit('updateUserStep', response.data.step);
							 console.log(this.currentUser);
							 this.$refs.onboarding_wizard.changeTab(0,this.currentUser.step)

							})
							.catch(function(){
								
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
						
		 
			},


			    getSecondStep() {

	           axios.post( '/api/users/get/secondStep',
                       
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {
								console.log(response.data);
                            this.SecondStepData=response.data.company;

							})
							.catch(function(){
								
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
						
		 
			},

			getThirdStep(){
                    axios.post( '/api/users/get/thirdStep',
                       
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {
								console.log(response.data);
							this.ThirdStepData=response.data.company;
							this.TemplatesDetails=response.data.templates;

							})
							.catch(function(){
								
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
			},


					getFourthStep(){
                    axios.post( '/api/users/get/fourthStep',
                       
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {
								console.log(response.data);
							this.ProjectsDetails=response.data.projects;
							
							})
							.catch(function(){
								
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
			},




			onComplete() {

				//Post All Data To Back End We Have Multiple Projects
			//	if(this.ProjectsDetails.length > 0){
					
					// let formData = new FormData();

                    // formData.append('CompanyLogo',this.$refs.CompanyLogo.uploadFiles[0].raw);
                    // formData.append('ProjectsDetails', JSON.stringify(this.$data.ProjectsDetails));
                    // formData.append('AccountSettingForm', JSON.stringify( this.$data.AccountSettingForm));
                    // formData.append('TemplatesDetails', JSON.stringify( this.$data.TemplatesDetails));

                    axios.post( '/api/users/complete_onboading',
                        
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
                    ).then((response) => {

                    	//update User localStorage Data
		                axios.get('/api/users/get_user_details')
			                .then(response => {
			            	
			            		this.SetupCompleted = true; // this will allow us to move to next route without navigating aways message

			                    this.$store.commit('setUser', response.data);

			                    Swal({ type: 'success', title: 'System Setting Completed', text: "Congratulations, You have completed system setup, you will be redirected to start utilizing the system.", showConfirmButton: true, timer: 10000});


			                    //Redirect to manage project page
			            		this.$router.push('/app/manage_projects');
			                    
			                })

	                })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
                    });
              //  } 
	
	        },
			validateFirstStep() {
				//Check if Logo is uploaded

				return new Promise((resolve, reject) => {
					this.$refs.AccountSettingForm1.validate((valid) => {
						if(!this.$refs.CompanyLogo.uploadFiles[0]){
		                    Swal('Information is missing', 'Please enter the needed information to continue the registration process.', 'warning')
		                    resolve(false);
						}
						console.log(this.FirstStepData);
						let formData = new FormData();
						formData.append('CompanyLogo',this.$refs.CompanyLogo.uploadFiles[0].raw);
						formData.append('FirstStepData', JSON.stringify(this.$data.FirstStepData));

						axios.post( '/api/users/set/firstStep',
						formData,
						{
							headers: {
								'Content-Type': 'multipart/form-data'
							}
						}
							).then((response) => {

							console.log(response.data);	

							resolve(valid);

							})
							.catch(function(){
								resolve(false);
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
						
					});

					
				})
			},
			validateSecondStep() {
				return new Promise((resolve, reject) => {
					this.$refs.AccountSettingForm2.validate((valid) => {
                    	let formData = new FormData();
					
						formData.append('SecondStepData', JSON.stringify(this.$data.SecondStepData));

					  axios.post( '/api/users/set/secondStep',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {

							console.log(response.data);	

							resolve(valid);

							})
							.catch(function(){
								resolve(false);
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});

						
					});
				})
			},
			LoMvalidateStep() {
				return new Promise((resolve, reject) => {
					this.$refs.AccountSettingFormLoM.validate((valid) => {
						
						let formData = new FormData();
				
						formData.append('ThirdStepData', JSON.stringify(this.$data.ThirdStepData));
						formData.append('TemplatesDetails', JSON.stringify(this.$data.TemplatesDetails));
						console.log(JSON.stringify(this.$data.TemplatesDetails));

					  axios.post( '/api/users/set/thirdStep',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {

							console.log(response.data);	

							resolve(valid);

							})
							.catch(function(){
								resolve(false);
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
					});
				})
			},

			
			validateThirdStep() {

				if(this.AccountSettingForm.procurementSetupMode == "Project Wise"){
					if(this.ProjectsDetails == 0){
						
						Swal({ type: 'warning', title: 'No Set-ups Found', text: "To proceed please make sure you have created at least one Set-up.", showConfirmButton: true, timer: 10000});

						return false;

					} else {

						this.scrollTo(0, 100);

						let formData = new FormData();
				
						formData.append('ProjectsDetails', JSON.stringify(this.$data.ProjectsDetails));
						formData.append('AccountSettingForm', JSON.stringify(this.$data.AccountSettingForm));
						console.log(JSON.stringify(this.$data.ProjectsDetails));

					  axios.post( '/api/users/set/fourthStep',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
							).then((response) => {

							console.log(response.data);	

							resolve(valid);

							})
							.catch(function(){
								resolve(false);
								Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Account Setup Form)', 'error');
							});
								
						return true;
					}

				} else {
					Swal({ type: 'warning', title: 'Select Setup Type', text: "To proceed please select procurement setup type", showConfirmButton: true, timer: 10000});
				}			
			},
			onAddCADModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.CAD_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.CAD_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.CAD_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Application Administrator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
			onAddPROModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.PRO_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.PRO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.PRO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Enquiry Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddPRVModal: function(evt) {

		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.PRV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.PRV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.PRV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Purchase Enquiry Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
	            }
		    },
		    onAddALMRModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.ALMR_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.ALMR_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.ALMR_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Library of Material Update Request Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddLMAModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.LMA_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.LMA_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.LMA_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Library of Materials Administrator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddALMVModal: function(evt) {

		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.ALMV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.ALMV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.ALMV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Library of Materials Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
	            }
		    },
		    onAddRFQMModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RFQM_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RFQM_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RFQM_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Request for Proposals Administrator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddPOOModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.POO_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.POO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.POO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Order Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddPOVModal: function(evt) {

		    	// $.toast({
				// 	heading: 'Welcome to Monster admin',
				// 	text: 'Use the predefined ones, or specify a custom position object.',
				// 	position: 'top-right',
				// 	loaderBg:'#ff6849',
				// 	icon: 'warning',
				// 	hideAfter: 3500, 
				// 	stack: 6
				// });

				var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);

				console.log(ListName);
				console.log(this.ProjectModalInfo.POV_List[ListName]);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.POV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.POV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.POV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Purchase Order Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
	            }
		    },
		    onAddRNOModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RNO_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RNO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RNO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Receipt Note Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRNVModal: function(evt) {
		    	
		    	// $.toast({
				// 	heading: 'Welcome to Monster admin',
				// 	text: 'Use the predefined ones, or specify a custom position object.',
				// 	position: 'top-right',
				// 	loaderBg:'#ff6849',
				// 	icon: 'warning',
				// 	hideAfter: 3500, 
				// 	stack: 6
				// });

				var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);

				//console.log(ListName);
				//console.log(this.ProjectModalInfo.RNV_List[ListName]);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.RNV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.RNV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.RNV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Receipt Note Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
	            }
		    },
		    onAddSLMModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.SLM_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.SLM_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.SLM_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Vendors Qualification Administrator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
			onAddINVModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.INV_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.INV_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.INV_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Invoice Checker Role List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },


		    onAddASTMGRModal: function(evt) {

		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(7);

		    	const NewlyAdded = this.ASTMGR_List[ListName][evt.newIndex];
				const exsits = this.ASTMGR_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ASTMGR_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Manager List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddSIIRPTModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.SIIRPT_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.SIIRPT_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.SIIRPT_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom In-Charge List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRTIRSModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RTIRS_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RTIRS_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RTIRS_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom Transaction Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddATSIRSModal: function(evt) {
		    	console.log(evt.to.children);
		    	console.log(this.ProjectModalInfo.ATSIRS_List);
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(7);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.ATSIRS_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.ATSIRS_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ProjectModalInfo.ATSIRS_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Transaction Request Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },
		    onAddRTSIModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RTSI_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RTSI_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RTSI_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Storeroom Items Update Request Originator List', 'warning') } else { 
                		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddATSIModal: function(evt) {
		    	console.log(evt.to.children);
		    	console.log(this.ProjectModalInfo.ATSI_List);
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.ATSI_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.ATSI_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
                	this.$delete(this.ProjectModalInfo.ATSI_List[ListName], evt.newIndex);
                	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Storeroom Items Update Request Validator List", timer: 2500
					});
                } else {
                	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
                }
		    },


		    onAddRCCOModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RCCO_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RCCO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RCCO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Rate Contract Creation Request Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRCCVModal: function(evt) {
		    	
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(5);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.RCCV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.RCCV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.RCCV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Rate Contract Creation Request Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
	                })
	            }
		    },
		    onAddRCOModal: function(evt) {
		    	const NewlyAdded = this.ProjectModalInfo.RCO_List[evt.newIndex];
				const exsits = this.ProjectModalInfo.RCO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
	            if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.RCO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Rate Contract Originator List', 'warning') } else { 
	            		this.$bvToast.toast('The Employee has been assigned the role successfully', {
		                  title: 'Employee Assigned Successfully',
		                  autoHideDelay: 3000,
		                  variant: 'success',
		                  solid: true,
		                }) }
		    },
		    onAddRCVModal: function(evt) {
		    	
		    	var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
				ListName = ListName.slice(4);
		    	
		    	const NewlyAdded = this.ProjectModalInfo.RCV_List[ListName][evt.newIndex];
				const exsits = this.ProjectModalInfo.RCV_List[ListName].filter(function(elem) {
				    if(elem.email == NewlyAdded.email) {
				    	return elem;
				    }
				});
				
				if(exsits.length > 1){
	            	this.$delete(this.ProjectModalInfo.RCV_List[ListName], evt.newIndex);
	            	Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Rate Contract Validator List", timer: 2500
					});
	            } else {
	            	this.$bvToast.toast('The Employee has been assigned the role successfully', {
	                  title: 'Employee Assigned Successfully',
	                  autoHideDelay: 3000,
	                  variant: 'success',
	                  solid: true,
	                })
	            }
		    },

		},
		
		mounted(){

			//console.log(this.$refs.CompanyLogo.uploadFiles);

			//Add Logged in user initially to the list
			this.EmployeesList.push({
            	fullName: this.currentUser.Name,
            	email: this.currentUser.Email,
            	designation: this.currentUser.Designation,
			})
			
		
			

			//CustomJs();

			var $videoSrc = "https://www.youtube.com/embed/nKd2QVrQVIM";  
			
			// when the modal is opened autoplay it  
			$('#VideoModal').on('shown.bs.modal', function (e) {   
				// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
				$("#video").attr('src',$videoSrc + "?rel=0&amp;showinfo=0&amp;modestbranding=1&amp;autoplay=1" ); 
			})
			  
			  
			// stop playing the youtube video when I close the modal
			$('#VideoModal').on('hide.bs.modal', function (e) {
			    // a poor man's stop video
			    $("#video").attr('src',$videoSrc); 
			}) 
			    

			this.getIndustries();
			// this.getCity();
			this.getFirstStep();
			this.getSecondStep();
			this.getThirdStep();
			this.getFourthStep();
				

	    },

		beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));

            if(currentUser.hasOwnProperty('CAD') && currentUser.CompanyId == null){
            	
                //check with the backend if user has SAD privileges
                axios.get('/api/users/get_user_details')
                    .then(response => {
                        //console.log(response.data);
                        if(response.data.hasOwnProperty('CAD') && response.data.CompanyId == null){
                            next();
						} 
						  next();
						// else {

                        //     Swal("Fraud Offence", "You do not have the right to access this page, this instance will be reported. \n. ("+ response.data.Name +")" , 'error');

                        //     //this instance must be reported to since there is fraud envolved.
                        //     next('/login');
                        // }
                    })

			 } 
			   next();
			 //else {

            // 	if(from.path != '/'){
            // 		Swal("Access Denied", "You do not have the right to access this page", 'error');
            // 	}

            //     next('/login');
                
            //}       
        },
        beforeRouteLeave (to, from, next) {
            if(!this.SetupCompleted){
                Swal({
                    title: 'Navigate Away?',
                    text: "Are you sure you want to navigate away, all unsubmitted data will be lost?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes!'
                }).then((result) => {
                    if (result.value) {

                    	if(to.path == '/'){ // This check if we are actually logging out
                    		this.$store.dispatch('logout')
		                	.then(() => {
		                		next()
		                	});
                    	} else {
                    		next()
                    	}

                        

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

	.smallerfont {
		font-size: 5px;
	}

    #ProjectDetailsModalId .modal-dialog {
        min-width:70%;
    }
	
	/* Enter and leave animations can use different */
	/* durations and timing functions.              */
	.slide-fade-enter-active {
	  transition: all .3s ease;
	}
	.slide-fade-leave-active {
	  transition: all .3s cubic-bezier(1.0, 0.5, 0.8, 1.0);
	}
	.slide-fade-enter, .slide-fade-leave-to
	/* .slide-fade-leave-active below version 2.1.8 */ {
	  transform: translateY(10px);
	  opacity: 0;
	}


	.modal-dialog-video {
    	max-width: 800px;
	  	text-align: left;
	  	margin-top: 10%; 
    	vertical-align: middle;
  	}

	.modal-body-video {
	 	position:relative;
	  	padding:0px;
	}

	.close-video {
	    background: #fc4b6c; 
	  	font-size:2rem;
	  	font-weight: normal;
	  	color:#fff;
	  	position:absolute;
	  	right:-25px;
	  	top:-25px;
	  	z-index:999;
		width: 50px;
	    height: 50px;
	    -moz-border-radius: 70px; 
	    -webkit-border-radius: 70px; 
	    border-radius: 70px;
	  	opacity:1;
	}

	.itemTable >tr>td{
      height:20px;
      padding:0px;
      border-top: 0px;
    }
	

	.StickeyPanel { 
		position: -webkit-sticky; 
		position: sticky; 
		top: 130px;
	}

	.StickeyPanelModal { 
		position: -webkit-sticky; 
		position: sticky; 
		top: 15px;
	}

	.StickeyEmployeelModal { 
		position: -webkit-sticky; 
		position: sticky; 
		top: 5px;
	}

</style>
