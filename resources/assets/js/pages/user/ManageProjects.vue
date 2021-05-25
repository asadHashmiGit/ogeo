<template>

	<!-- Validation wizard -->
	<div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Set-up Management</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Setup Management</li>
                    </ol>
                </div>
            </div>


            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div v-if="projectsLoaded" class="card-body">

                            <el-form :model="ProjectInfo" class="demo-form-inline" :rules="rules" ref="AccountSettingForm">

                                        
                                <el-row v-if="ProjectsDetails.length > 0" :gutter="20">
                                    <el-col :span="24">
                                        
                                        <h3 class="box-title">Current Set-up(s) List:</h3>
                                        <table style="background-color: #f9fffb" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Set-up Name</th>
                                                    <th>Is this Set-up a Storeroom?</th>
                                                    <th>Set-up Period</th>
                                                    <th>Set-up Budget</th>
                                                    <th>Consumed Budget</th>
                                                    <th>Available Budget</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(ProjectDetails, key, index) in ProjectsDetails" :key="index">
                                                    <td>{{ ProjectDetails.ProjectTitle }}</td>
                                                    <td width="50px">{{ ProjectDetails.StoreSetup }}</td>
                                                    <td><b>Start Date: </b>{{ ProjectDetails.ProjectPeriod[0] | formatDateNoTime }}<br><b>End Date: </b>{{ ProjectDetails.ProjectPeriod[1] | formatDateNoTime }}</td>
                                                    <td align="right">{{ formatPrice(ProjectDetails.ProjectValue) }} {{ ProjectDetails.ProjectCompanyCurrency }}</td>
                                                    <td align="right">{{ formatPrice(ProjectDetails.ConsumedBudget) }} {{ ProjectDetails.ProjectCompanyCurrency }}</td>
                                                    <td align="right">{{ formatPrice(ProjectDetails.ProjectValue - ProjectDetails.ConsumedBudget) }} {{ ProjectDetails.ProjectCompanyCurrency }}</td>
                                                    <td width="18%">
                                                        <a class="btn btn-success float-left" href="#" @click="showProjectDetails(key, $event)"><i class="fa fa-edit"></i></a>
                                                        <a class="btn btn-primary float-left m-l-5" href="#" @click="ShowRoles(key, $event)"><i class="fa fa-group"></i></a> 
                                                        <a class="btn btn-danger float-left m-l-5" href="#" @click="RemoveProject(key, $event)"><i class="fa fa-remove"></i></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
                                        <br><hr>
                                    </el-col>
                                </el-row>
                                
                                
                                
                                <!-- Creating New Set-up -->
                                <el-row>
                                    <el-col v-if="CreateNewProjectShow" :span="24">
                                        <a href="#" class="btn btn-block btn-success" @click="CreateNewProjectShow = false">Hide Set-up Creation Form</a>
                                        <hr>
                                    </el-col>
                                    <el-col  v-else :span="24">
                                        <a href="#" class="btn btn-block btn-success" @click="CreateNewProjectShow = true">Start A New Set-up Creation</a>
                                        <hr>
                                    </el-col>
                                </el-row>


                                <el-row v-if="CreateNewProjectShow" :gutter="20">
                                    
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
                                            <el-form-item label="Enter Set-up Name" prop="ProjectTitle">
                                                <el-input v-model="ProjectInfo.ProjectTitle" placeholder="Enter Set-up name"></el-input>
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

                                            <el-select filterable style="width: 100%; padding: 0px;" @change="StoreSetup" v-model="ProjectInfo.StoreSetup" placeholder="Mark As Store Set-up?">
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

                                                <el-input type="number" v-model.number="ProjectInfo.ProjectValue" placeholder="Enter Set-up’s Budget"></el-input>
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

                                                <el-select style="width: 100%; padding: 0px;" v-model="ProjectInfo.ProjectRNDOACriterion" placeholder="Select the Delegation of Authority’s criterion applicable to Receipt Notes">
                                                        
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
                                                  v-model="ProjectInfo.ProjectTsNCs">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>
                                </el-row>

                                <el-row :gutter="20" v-if="CreateNewProjectShow" >
                                    <el-col :span="24">
                                        <div class="alert alert-info">
                                            <!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button> -->
                                            <!-- <h4 class="text-info"> Role Completing Information</h4> -->
                                            <i class="fa fa-exclamation-circle"></i> If you are not sure how to fill the roles below please watch this short video.
                                            <button type="button" class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#VideoModal"> Play Tutorial</button>
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
                                                        <li style="background-color: rgb(252, 51, 23);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#CAD" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Application Administrator</span> </a> </li>

                                                        <li style="background-color: rgb(255, 236, 146);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#PRO" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Originator</span> </a> </li>

                                                        <li style="background-color: rgb(255, 236, 146);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#PRV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Validator</span></a> </li>

                                                        <li style="background-color: rgb(205, 228, 190);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RFQM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Request for Proposals Administrator</span></a> </li>

                                                        <li style="background-color: rgb(194, 194, 144);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#POO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Originator</span></a> </li>

                                                        <li style="background-color: rgb(194, 194, 144);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#POV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Validator</span></a> </li>

                                                        <li style="background-color: rgb(221, 221, 221);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RNO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Originator</span></a> </li>

                                                        <li style="background-color: rgb(221, 221, 221);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RNV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Validator</span></a> </li>

                                                        <li style="background-color: rgb(255, 204, 255);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#SLM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Vendors Qualification Administrator</span></a> </li>

                                                        <li style="background-color: rgb(161, 136, 127, 0.8);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#INV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Invoice Checker</span></a> </li>


                                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ALMR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Material Update Request Originator </span></a> </li>

                                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#LMA" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Administrator</span></a> </li>

                                                        <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ALMV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Validator</span></a> </li>


                                                        <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Originator</span></a> </li>
                                                        
                                                        <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Validator</span></a> </li>
                                                        

                                                        <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Originator</span></a> </li>
                                                        
                                                        <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Validator</span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#SIIRPT" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom In-Charge</span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ASTMGR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Manager</span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RTIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Transaction Request Originator </span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ATSIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Transaction Request Validator </span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#RTSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Items Update Request Originator </span></a> </li>

                                                        <li v-if="ProjectInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ATSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Items Update Request Validator </span></a> </li>
                                                           

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

                                                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function, or to any other function which is responsible for driving the use of ERP systems (Centre of Excellence…)”</p>
                                        
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                    
                                                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function which is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry", or any other function that holds the "Set-up" P/L responsibility.”</p>
                                        
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function within the Customer’s organization that is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry" or any other function that holds the "Set-up" P/L responsibility.”</p>

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
                                                                            Holder(s) of the Purchase Request Validator Role (Level-{{ iteration }}) Approval
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                            Holder(s) of the Request for Proposals Administrator Role
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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



                                                        <div class="tab-pane StickeyPanel" id="ALMR" role="tabpanel">
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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




                                                        <div class="tab-pane StickeyPanel" id="LMA" role="tabpanel">
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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


                                                        <div class="tab-pane StickeyPanel" id="ALMV" role="tabpanel">
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
                                                                                <span class="text-success">Emplyees List with Addition to the Library of Materials Validator Role</span>
                                                                            </div>
                                                                            
                                                                            <draggable :list="ALMV_List['level_' + iteration]" element="el-collapse" @add="onAddALMV" :options="{group:'people'}" >

                                                                                <el-collapse-item v-if="ALMV_List['level_' + iteration].length != 0" v-for="(e, index) in ALMV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div v-bind:id="'ALMV_level_'+iteration" style="display: none"></div>
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the materials and/or the service that is the subject of the Purchase Enquiry that is linked to the Purchase Order.”</p>
                                        
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                    <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Purchase Order, which is itself linked to a Purchase Enquiry.”</p>

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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <input :id="'POV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Enter Financial Limit" >
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

                                                        <div class="tab-pane StickeyPanel" id="SUBV" role="tabpanel">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <h3>Set-up Budget Validator <i class="italic">role assignment</i>:</h3>
                                                                    <p>The Set-up’s Budget Modification Request Validator(s)1 will be tasked with reviewing requests to
                                                                        amend information pertaining to an existing “Set-up”. Such requests are raised by those holding
                                                                        the role of Set-up’s Budget Modification Request Originator
                                                                        Holder(s) of this role will typically belong to the Customer’s Operations Functions or to
                                                                        any other function which is responsible which holds the "Set-up" Profit & Loss
                                                                        responsibility.
                                                                    </p>            
                                                                    
                                                                    <!-- <p>The Set-up Budget Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Set-up Budgets" created by the employees holding the Set-up Budget Originator role. To enable this, the Set-up Budgets’ Delegation of Authority (i.e. the number of Set-up Budgets’ levels of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p> -->
                                                                    <!-- <p>In addition, the Set-up Budget Validator will be in position to rule on the "Set-up Budget" cancelled by the Set-up Budget Originator.</p> -->
                                                                    <!-- <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Set-up Budget, which is itself linked to a Set-up Budget.”</p> -->

                                                                    <el-select style="width: 100%;" v-model="SUBV_Number" placeholder="Enter number of validators">
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
                                                                    
                                                                    <template v-if="SUBV_Number != null">
                                                                    <div class="card" v-for="iteration in parseInt(SUBV_Number)" :key="iteration">
                                                                        <div class="card-header">
                                                                            Holder(s) of the Set-up Budget Validator Role (Level-{{ iteration }}) Approval
                                                                        </div>
                                                                        <div class="card-body">

                                                                            <div align="center" v-if="SUBV_List['level_' + iteration].length == 0">
                                                                                <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                                                            </div>
                                                                            <div align="center" v-else>
                                                                                <span class="text-success">Emplyees List with Purchase Order Validator Role</span>
                                                                            </div>
                                                                            
                                                                            <draggable :list="SUBV_List['level_' + iteration]" element="el-collapse" @add="onAddSUBV" :options="{group:'people'}" >

                                                                                <el-collapse-item v-if="SUBV_List['level_' + iteration].length != 0" v-for="(e, index) in SUBV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div v-bind:id="'SUBV_level_'+iteration" style="display: none"></div>
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
                                                                                    <div class="float-left">Email: {{e.email}}</div><br>
                                                                                    <div class="float-left">Designation: {{e.designation}}</div><br>
                                                                                    <div class="float-right p-b-10">
                                                                                        <a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(SUBV_List['level_' + iteration], index)"> Remove Employee</a>
                                                                                    </div>
                                                                                 </el-collapse-item>
                                                                             
                                                                            </draggable>

                                                                            

                                                                        </div>

                                                                        <div align="center" v-if="iteration == SUBV_Number" class="card-footer">
                                                                            <span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
                                                                        </div>

                                                                        <div v-if="iteration < SUBV_Number" v-for="(currency, index) in ProjectInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
                                                                            <template v-if="index == 0">
                                                                                <div slot="footer" class="input-group">
                                                                                    <div class="input-group-prepend">
                                                                                        <span class="input-group-text">{{ currency }}</span>
                                                                                    </div>
                                                                                    <input :id="'SUBV_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
                                                                                    <input :id="'SUBV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Enter Financial Limit" >
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <input :id="'RNV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Enter Financial Limit" >
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
                                                                            Holder(s) of the Vendors' Listing Administrator Role:
                                                                        </div>
                                                                        <div class="card-body">

                                                                            <div align="center" v-if="SLM_List.length == 0">
                                                                                <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                                                            </div>
                                                                            <div align="center" v-else>
                                                                                <span class="text-success">Emplyees List with Vendors' Listing Administrator Role</span>
                                                                            </div>

                                                                            <draggable :list="SLM_List" element="el-collapse" @add="onAddSLM" :options="{group:'people'}" >
                                                                                <el-collapse-item v-if="SLM_List.length > 0" v-for="(e, index) in SLM_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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

                                                        <div class="tab-pane StickeyPanel" id="SUBO" role="tabpanel">
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
                                                                            Holder(s) of the Vendors' Listing Administrator Role:
                                                                        </div>
                                                                        <div class="card-body">

                                                                            <div align="center" v-if="SUBO_List.length == 0">
                                                                                <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                                                            </div>
                                                                            <div align="center" v-else>
                                                                                <span class="text-success">Emplyees List with Vendors' Listing Administrator Role</span>
                                                                            </div>

                                                                            <draggable :list="SUBO_List" element="el-collapse" @add="onAddSUBO" :options="{group:'people'}" >
                                                                                <el-collapse-item v-if="SUBO_List.length > 0" v-for="(e, index) in SUBO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
                                                                                    <div class="float-left">Email: {{e.email}}</div><br>
                                                                                    <div class="float-left">Designation: {{e.designation}}</div><br>
                                                                                    <div class="float-right p-b-10">
                                                                                        <a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(SUBO_List, index)"> Remove Employee</a>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                <span class="text-success">Emplyees List with Rate Contract Creation Request Validator Role</span>
                                                                            </div>
                                                                            
                                                                            <draggable :list="RCCV_List['level_' + iteration]" element="el-collapse" @add="onAddRCCV" :options="{group:'people'}" >

                                                                                <el-collapse-item v-if="RCCV_List['level_' + iteration].length != 0" v-for="(e, index) in RCCV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div v-bind:id="'RCCV_level_'+iteration" style="display: none"></div>
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <input :id="'RCV_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Enter Financial Limit" >
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                                                            Holder(s) of the Storeroom Items Update Request Validator Role (Level-{{ iteration }}) Approval
                                                                        </div>
                                                                        <div class="card-body">

                                                                            <div align="center" v-if="ATSI_List['level_' + iteration].length == 0">
                                                                                <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                                                            </div>
                                                                            <div align="center" v-else>
                                                                                <span class="text-success">Emplyees List with Storeroom Items Update Request Validator Role</span>
                                                                            </div>
                                                                            
                                                                            <draggable :list="ATSI_List['level_' + iteration]" element="el-collapse" @add="onAddATSI" :options="{group:'people'}" >

                                                                                <el-collapse-item v-if="ATSI_List['level_' + iteration].length != 0" v-for="(e, index) in ATSI_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                    <div v-bind:id="'ATSI_level_'+iteration" style="display: none"></div>
                                                                                    <div class="float-left">Full Name: {{e.fullName}}</div><br>
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
                                        
                                        <div class="row">

                                            <div class="col-lg-12 p-t-10">
                                                <div style="margin-bottom: 5px" class="card">
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
                                                                    <!-- <div class="float-left">Full Name: {{employee.fullName}}</div><br> -->
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

                                            <div class="col-lg-12 p-t-10">
                                                <!-- <label class="">New Employee Name</label> -->
                                                <input type="text" v-model="NewEmployee.fullName" class="form-control" placeholder="Enter Employee Name">
                                                <span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.fullName">{{ NewEmployeeErrors.fullName[0] }}</span>
                                            </div>

                                            <div class="col-lg-12 p-t-10">
                                                <!-- <label class="">New Employee Email</label> -->
                                                <input type="email" v-model="NewEmployee.email" class="form-control" placeholder="Enter Employee Email">
                                                <span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.email">{{ NewEmployeeErrors.email[0] }}</span>
                                            </div>

                                            <div class="col-lg-12 p-t-10 p-b-10">
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

                                <el-row v-if="CreateNewProjectShow">
                                    <el-col :span="24">
                                        <br><hr>
                                        <a href="#" class="btn btn-block btn-primary" @click="CreateNewProject">Create New Set-up</a>
                                        <hr>
                                    </el-col>
                                </el-row>
                                

                            </el-form>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <div id="ProjectDetailsModalId" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="projectDetailsModals" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div v-if="projectsLoaded" class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="projectDetailsModals">Set-up Title: {{ ProjectModalInfo.ProjectTitle }} (View/Edit)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        
                        <el-form v-if="ProjectModalInfo != ''" :model="ProjectModalInfo" class="demo-form-inline" :rules="rules" ref="AccountSettingForm">

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
                                    <div class="grid-content">
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
                                                    <li  style="background-color: rgb(252, 51, 23);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalCAD" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Application Administrator</span> </a> </li>

                                                    <li style="background-color: rgb(255, 236, 146);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPRO" role="tab" aria-selected="true"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Originator</span> </a> </li>

                                                    <li style="background-color: rgb(255, 236, 146);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPRV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Enquiry Validator</span></a> </li>

                                                    <li style="background-color: rgb(205, 228, 190);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRFQM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Request for Proposals Administrator</span></a> </li>

                                                    <li style="background-color: rgb(194, 194, 144);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPOO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Originator</span></a> </li>

                                                    <li style="background-color: rgb(194, 194, 144);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalPOV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Purchase Order Validator</span></a> </li>

                                                    <li style="background-color: rgb(221, 221, 221);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRNO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Originator</span></a> </li>

                                                    <li style="background-color: rgb(221, 221, 221);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRNV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Receipt Note Validator</span></a> </li>

                                                    <li style="background-color: rgb(255, 204, 255);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSLM" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Vendors Qualification Administrator</span></a> </li>

                                                    <li style="background-color: rgb(97, 165, 183)" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSUBO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Budget Update Request Originator</span></a> </li>

                                                    <li style="background-color: rgb(97, 165, 183)" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSUBV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Budget Update Request Validator</span></a> </li>

                                                    


                                                    <li style="background-color: rgb(249, 163, 7);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalINV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Invoice Checker</span></a> </li>

                                                    <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalALMR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Material Update Request Originator </span></a> </li>

                                                    <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalLMA" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Administrator</span></a> </li>

                                                    <li v-if="AccountSettingForm.companyLoMManditory != 'FreeText'" style="background-color: rgb(128, 219, 91);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalALMV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Library of Materials Validator</span></a> </li>


                                                    <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Originator</span></a> </li>
                                                    
                                                    <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Creation Request Validator</span></a> </li>
                                                    
                                                    <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCO" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Originator</span></a> </li>
                                                    
                                                    <li style="background-color: rgb(230,126,136);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRCV" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Rate Contract Validator</span></a> </li>


                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalSIIRPT" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom In-Charge</span></a> </li>

                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalASTMGR" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Storeroom Manager</span></a> </li>

                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRTIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Transaction Request Originator </span></a> </li>

                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalATSIRS" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Transaction Request Validator </span></a> </li>

                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalRTSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Items Update Request Originator </span></a> </li>

                                                    <li v-if="ProjectModalInfo.StoreSetup == 'Yes'" style="background-color: rgb(165,165,195);" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ModalATSI" role="tab" aria-selected="false"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">The Storeroom Items Update Request Validator </span></a> </li>


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

                                                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Procurement Function, or to any other function which is responsible for driving the use of ERP systems (Centre of Excellence…)”</p>
                                    
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
                                                                
                                                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function which is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry", or any other function that holds the "Set-up" P/L responsibility.”</p>
                                    
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
                                                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions, or to any other function within the Customer’s organization that is responsible for utilising the materials and/or the services which are the subject of the "Purchase Enquiry" or any other function that holds the "Set-up" P/L responsibility.”</p>

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
                                                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the materials and/or the service that is the subject of the Purchase Enquiry that is linked to the Purchase Order.”</p>
                                    
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
                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Purchase Order, which is itself linked to a Purchase Enquiry.”</p>

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
                    <div class="tab-pane StickeyPanelModal" id="ModalSUBV" role="tabpanel">
                        <div class="row">
                            <div class="col-lg-12">
                                <p>The Set-up’s Budget Modification Request Validator(s)1 will be tasked with reviewing requests to
                                    amend information pertaining to an existing “Set-up”. Such requests are raised by those holding
                                    the role of Set-up’s Budget Modification Request Originator
                                    Holder(s) of this role will typically belong to the Customer’s Operations Functions or to
                                    any other function which is responsible which holds the "Set-up" Profit & Loss
                                    responsibility.
                                </p>
                                <!-- <p>The Set-up Budget Validator(s) will be tasked with ruling on (approving/rejecting) the multiline "Set-up Budget" created by the employees holding the Set-up Budget Originator role. To enable this, the Set-up Budget Delegation of Authority (i.e. the number of Set-up Budget levels of validation, and the financial limit-based seniority in the chain of approvals) for the "Set-up" must be uploaded onto Ogéo. (Ogéo can accommodate as many as 8 levels of approvals. Level-1 Is the entry level validator whereas the Level-8 is the final approver). </p>
                                <p>In addition, the Set-up Budget Validator will be in position to rule on the "Set-up Budget" cancelled by the Set-up Budget Originator.</p>
                                <p style="font-style: italic" class="italic">Holder(s) of this role will typically belong to the organization’s Operations Functions or to any other function which is responsible for utilising the material and/or the service that is the subject of the Set-up Budget, which is itself linked to a Set-up Budget .”</p> -->

                                <el-select style="width: 100%;" v-model="ProjectModalInfo.SUBV_Number" placeholder="Enter number of validators">
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
                                
                                <template v-if="ProjectModalInfo.SUBV_Number != null">
                                <div class="card" v-for="iteration in parseInt(ProjectModalInfo.SUBV_Number)" :key="iteration">
                                    <div class="card-header">
                                        Holder(s) of the Set-up Budget Validator Role (Level-{{ iteration }}) Approval
                                    </div>
                                    <div class="card-body">

                                        <div align="center" v-if="ProjectModalInfo.SUBV_List['level_' + iteration].length == 0">
                                            <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                        </div>
                                        <div align="center" v-else>
                                            <span class="text-success">Emplyees List with Set-up Budget Validator Role</span>
                                        </div>
                                        
                                        <draggable :list="ProjectModalInfo.SUBV_List['level_' + iteration]" element="el-collapse" @add="onAddSUBVModal" :options="{group:'projectEmployees'}" >

                                            <el-collapse-item v-if="ProjectModalInfo.SUBV_List['level_' + iteration].length != 0" v-for="(e, index) in ProjectModalInfo.SUBV_List['level_' + iteration]" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                <div v-bind:id="'SUBV_level_'+iteration" style="display: none"></div>
                                                <div class="float-left">Name: {{e.fullName}}</div><br>
                                                <div class="float-left">Email: {{e.email}}</div><br>
                                                <div class="float-left">Designation: {{e.designation}}</div><br>
                                                <div class="float-right p-b-10">
                                                    <a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.SUBV_List['level_' + iteration], index)"> Remove Employee</a>
                                                </div>
                                             </el-collapse-item>
                                         
                                        </draggable>

                                        

                                    </div>

                                    <div align="center" v-if="iteration == SUBV_Number" class="card-footer">
                                        <span class="text-primary" slot="footer">Top Level Does Not Require Financial Limit</span>
                                    </div>

                                    <div v-if="iteration < SUBV_Number" v-for="(currency, index) in ProjectModalInfo.ProjectCompanyCurrency.split(',')" class="card-footer">
                                        <template v-if="index == 0">
                                            <div slot="footer" class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">{{ currency }}</span>
                                                </div>
                                                <input :id="'SUBV_Modal_List_level_'+iteration+'_currency_'+index" type="hidden" :value="currency" style="display: none">
                                                <input :id="'SUBV_Modal_List_level_'+iteration+'_limit_'+index" type="number" value="" class="form-control">
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

                                                    <div class="tab-pane StickeyPanelModal" id="ModalSUBO" role="tabpanel">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <h3>Set-up Budget Request <i class="italic">role assignment</i>:</h3>
                                                                <p>The Set-up’s Budget Modification Request Originator(s) will be tasked with originating
                                                                    requests to amend information pertaining to an existing “Set-up”. These amendments
                                                                    are strictly limited to increasing or decreasing the originally assigned budget (i.e. at the
                                                                    Set-up creation time), and/or pushing back the Set-up end date
                                                                    Holder(s) of this role will typically belong to the Customer’s Operations Functions or to
                                                                    any other function which is responsible which holds the "Set-up" Profit & Loss
                                                                    responsibility.
                                                                </p>
                                                                <!-- <p>The Set-up Budget Request(s) will be tasked with qualifying, approving and enlisting Vendors that the organization has chosen to work with, for all of its "Set-ups". These vendors will then be in position to access Ogéo in order to:</p>
                                                                <ul>
                                                                    <li>Receive "Requests for Proposals"; </li>
                                                                    <li>Submit bids; </li>
                                                                    <li>Participate in Live Auctions;</li>
                                                                    <li>Receive "Purchase Orders"; and </li>
                                                                    <li>Submit invoices. </li>
                                                                </ul>
                                                                <p>The process of vendors’ qualification involves assigning Ogéo’s access credentials to the vendors’ representatives.</p>
                                                                <p style="font-style: italic" class="italic">Holder(s) of this role will belong to the organization’s vendors.</p> -->
                                    
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        Holder(s) of the Set-up Budget Orignator:
                                                                    </div>
                                                                    <div class="card-body">

                                                                        <div align="center" v-if="ProjectModalInfo.SUBO_List.length == 0">
                                                                            <span class="text-danger">Drag and Drop the employee(s) name(s) below this line from the employees’ list on the right.</span>
                                                                        </div>
                                                                        <div align="center" v-else>
                                                                            <span class="text-success">Emplyees List with Set-up Budget Orignator</span>
                                                                        </div>

                                                                        <draggable :list="ProjectModalInfo.SUBO_List" element="el-collapse" @add="onAddSUBOModal" :options="{group:'projectEmployees'}" >
                                                                            <el-collapse-item v-if="ProjectModalInfo.SUBO_List.length > 0" v-for="(e, index) in ProjectModalInfo.SUBO_List" :title="index+1 +'. '+e.fullName.substring(0, 75) + '...' " :name="e.fullName" :key="e.email">
                                                                                <div class="float-left">Name: {{e.fullName}}</div><br>
                                                                                <div class="float-left">Email: {{e.email}}</div><br>
                                                                                <div class="float-left">Designation: {{e.designation}}</div><br>
                                                                                <div class="float-right p-b-10">
                                                                                    <a style="font-size: 12px" href="#" class="btn btn-danger" v-on:click.prevent="deleteEmployee(ProjectModalInfo.SUBO_List, index)"> Remove Employee</a>
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
                                                    Employees List
                                                    <!-- <form id="mainForm">
                                                        <div class="form-group">
                                                            <table class="table">
                                                                <tr>
                                                                    <label>Select File for Upload</label>
                                                                    <input type="file" name="select_file" />
                                                                    <input @click.prevent="getExcelFile" type="submit" name="upload" class="btn btn-primary" value="Upload">
                                                                   
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </form> -->
                                                </div>
                                                <div style="height: 300px;  max-height: 300px; overflow-y: auto;" class="card-body">
                                                    <div class="drag">
                                                        <!-- <draggable v-model="list" class="dragArea" :options="{group:{ name:'projectEmployees',  pull:'clone', put:false }}">
                                                            <div v-for="element in list">{{element.name}}</div>
                                                        </draggable> -->
                                                        <draggable element="el-collapse" :list="EmployeesList" :options="{group:{ name:'projectEmployees',  pull:'clone', put:false }}" >
                                                            
                                                            <el-collapse-item v-if="EmployeesList.length != 0" v-for="(employee, index) in EmployeesList" :title="employee.fullName.substring(0, 20) + '...' " :name="employee.fullName" :key="employee.email">
                                                                <!-- <div class="float-left">Name: {{employee.fullName}}</div><br> -->
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

                                        <div class="col-lg-12 p-t-10">
                                            <!-- <label class="">New Employee Name</label> -->
                                            <input type="text" v-model="NewEmployee.fullName" class="form-control" placeholder="Enter Employee Name">
                                            <span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.fullName">{{ NewEmployeeErrors.fullName[0] }}</span>
                                        </div>

                                        <div class="col-lg-12 p-t-10">
                                            <!-- <label class="">New Employee Email</label> -->
                                            <input type="email" v-model="NewEmployee.email" class="form-control" placeholder="Enter Employee Email">
                                            <span class="text-danger" style="font-size: 12px" v-if="NewEmployeeErrors && NewEmployeeErrors.email">{{ NewEmployeeErrors.email[0] }}</span>
                                        </div>

                                        <div class="col-lg-12 p-t-10 p-b-10">
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

        <div id="ShowRolesModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ShowRolesModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Set-up's Details and Roles Hierarchy As of: {{ CurrentDateTime }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="RolesModalLoaded">
                        <div class="row">
                            <div class="col-6">
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Set-up Title:</b></td>
                                        <td>{{ RolesModalInfo.RawData.title }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Set-up Start Date:</b></td>
                                        <td>
                                            {{ RolesModalInfo.RawData.start_date | formatDateNoTime }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Set-up End Date:</b></td>
                                        <td>
                                            {{ RolesModalInfo.RawData.end_date | formatDateNoTime }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Set-up Initial Budget:</b></td>
                                        <td>
                                            {{ formatPrice(RolesModalInfo.RawData.value) }} {{ RolesModalInfo.RawData.currency }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Set-up Availalbe Budget:</b></td>
                                        <td>
                                            {{ formatPrice(RolesModalInfo.RawData.value - RolesModalInfo.RawData.consumed_budget) }} {{ RolesModalInfo.RawData.currency }}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-6">
                                <table class="table">
                                    <tr>
                                        <td width="60%"><b>Purchase Order DoA Criterion:</b></td>
                                        <td>{{ RolesModalInfo.RawData.po_doa_criterion }}</td>
                                    </tr>
                                    <tr>
                                        <td width="60%"><b>Receipt Note DoA Criterion:</b></td>
                                        <td>{{ RolesModalInfo.RawData.rn_doa_criterion }}</td>
                                    </tr>
                                    <tr>
                                        <td width="60%"><b>Rate Contract Creation DoA Criterion:</b></td>
                                        <td> Total Rate Contract Value</td>
                                    </tr>
                                    <tr>
                                        <td width="60%"><b>Auction Types</b></td>
                                        <td> 
                                            <ul v-for="AuctionType in RolesModalInfo.ProjectAuctionType">
                                                <li>{{ AuctionType }}</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>


                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-primary">
                                        <h5 style="color: white">Purchase Enquiry Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Purchase Enquiry Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.PRO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}} 
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Purchase Enquiry Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.PRV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}}
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>



                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-primary">
                                        <h5 style="color: white">Requests for Proposals Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            
                                            <div class="col-lg-12 p-t-10 b-all">
                                                <h5>Request for Proposals Administrator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RFQM_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}} 
                                                    </li>
                                                </ol>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Library of Materials Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Library of Material Update Request Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.ALMR_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Library of Materials Administrator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.LMA_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Library of Materials Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.ALMV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Purchase Order Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Purchase Order Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.POO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Purchase Order Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.POV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Set-up Budget Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Set-up Budget Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.SUBO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Set-up Budget Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.SUBV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Receiving/Vendor Engagement Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Receipt Note Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RNO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Receipt Note Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.RNV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Vendors Qualification Administrator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.SLM_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Vendors Qualification Administrator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.SUBO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Rate Contract Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Rate Contract Creation Request Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RCCO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Rate Contract Creation Request Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.RCCV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Rate Contract Originator</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RCO_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Rate Contract Validator</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.RCV_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header bg-info">
                                        <h5 style="color: white">Storeroom Roles</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Store Incharge</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.SIIRPT_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Stores Manager</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.ASTMGR_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Requesters to Issue and Return Stocks</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RTIRS_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Approver to Issue and Return Stocks</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.ATSIRS_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Requester To Stock Items</h5>
                                                <ol>
                                                    <li v-for="(Role, index) in RolesModalInfo.RTSI_List">
                                                        <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                        <b><u>Email:</u></b> {{Role.email}}<br>
                                                        <b><u>Designation:</u></b> {{Role.designation}}
                                                    </li>
                                                </ol>
                                            </div>
                                            <div class="col-lg-6 p-t-10 b-all">
                                                <h5>Approver To Stock Items Request</h5>
                                                <ul v-for="(RoleLevel, key, index) in RolesModalInfo.ATSI_List">
                                                    <li v-if="RoleLevel.length > 0">{{ key.replace("_", " ").toUpperCase() }}:
                                                        <ol v-for="Role in RoleLevel">
                                                            <li>
                                                                <b><u>Name:</u></b> {{Role.fullName}}<br>
                                                                <b><u>Email:</u></b> {{Role.email}}<br>
                                                                <b><u>Designation:</u></b> {{Role.designation}} 
                                                            </li>
                                                        </ol>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
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

    import { CustomJs } from '../../helpers/custom.js';
    import validateJs from 'validate.js';
    import draggable from 'vuedraggable';
    import moment from 'moment';

    export default {
        name: "manage-setups",
        components: { 
            draggable,
        },
        data() {
            return {
                imageUrl:"",
                projectsLoaded: false,
                CurrentDateTime: "",
                CreateNewProjectShow: false,
                RolesModalLoaded: false,
                RolesModalInfo: {},
                stikyKit: {
                  options: {
                    offset_top: 140
                  },
                },
                stikyKitTabs: {
                  options: {
                    offset_top: 140
                  },
                },
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
                SUBV_List: {
                    level_1: [],
                    level_2: [],
                    level_3: [],
                    level_4: [],
                    level_5: [],
                    level_6: [],
                    level_7: [],
                    level_8: []
                },
                SUBV_Number: null,
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
                SUBO_List: [],
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
                ProjectsDetails: [],
                ProjectInfo: {
                    SetupMode: "",
                    ProjectTitle: "",
                    StoreSetup: "",
                    ProjectPeriod: [],
                    ProjectValue: "",
                    ProjectPODOACriterion: "",
                    ProjectRNDOACriterion: "",
                    ProjectAuctionType: [],
                    ProjectCompanyCurrency: "",
                    ProjectTsNCs: "",
                    RawData: ""
                },
                AccountSettingForm: {
                    companyLoMManditory: "",
                },
                ProjectModalInfo: "",
                NewEmployee: {
                    fullName: "",
                    email: "",
                    designation: "",
                },
                NewEmployeeErrors: null,
                rules: {
                    ProjectTitle: [{
                        required: true,
                        message: "Please Enter Project Title",
                        trigger: "blur"
                    }],
                    StoreSetup: [{
                        required: true,
                        message: "Please Enter Set-up Type",
                        trigger: "blur"
                    }],
                    ProjectPeriod: [{
                        required: true,
                        message: "Please Select Project Period",
                        trigger: "change"
                    }],
                    ProjectValue: [{
                        required: true,
                        message: "Please Enter Project Value",
                        trigger: "blur"
                    }],
                    ProjectPODOACriterion: [{
                        required: true,
                        message: "Please Enter Project PO DOA Criterion",
                        trigger: "change"
                    }],
                    ProjectRNDOACriterion: [{
                        required: true,
                        message: "Please Enter Project RN DOA Criterion",
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
                POV_Financial_Details: [],
                SUBV_Financial_Details: [],
                RNV_Financial_Details: [],
                exceluser:[]
            }
        },
        computed:{
            currentUser(){
                return this.$store.getters.currentUser
            }
        },
        methods: {
            handleAvatarChange(file, fileList) {
            
                const isExcel = file.raw.type === 'image/xlsx';
                // const isPNG = file.raw.type === 'image/png';
                const isLt2M = file.raw.size / 1024 / 1024 < 2;

                if ((isJPG) && isLt2M) {
                    
                    if(fileList.length == 2){
                        fileList.shift();
                    }

                    this.imageUrl = URL.createObjectURL(fileList[0].raw);
                    console.log(this.imageUrla)
                } else {
                    
                    fileList.shift();
                    fileList.shift();
                    this.imageUrl = "";
                    
                    this.$message.error('Avatar picture must be JPG or PNG format with size not exceeding 2MB!!');
                    return false;
                }
                
            },
            // downloadExcelFile(){
            //     // alert('function');
            //     axios.get('/api/users/download_excel/download/')
            //     .then((response) => {
                    
            //     })
            // },
            // getExcelFile(){
            //     var $mainForm = $('#mainForm');
            //     var data = new FormData(mainForm);
            //     axios.post('/api/users/import_excel/import', data)
            //     .then((response) => {
            //         this.exceluser = response.data.data
            //         this.creatNewEmployeeExcel()
            //     })
            //     // $.each(this.exceluser, function(index, project) {
                    
            //     //     this.EmployeesList.push({
            //     //         fullName: this.project.employee_name,
            //     //         email: this.project.employee_email,
            //     //         designation: this.project.employee_name,
            //     //     });
            //     // });
            // },
            ShowRoles (key, event){
                if (event) event.preventDefault();
                this.RolesModalLoaded = true
                this.RolesModalInfo = this.ProjectsDetails[key];
                this.CurrentDateTime = moment().format('YYYY-MMM-DD HH:mm:ss');
                console.log(this.RolesModalInfo);
                $('#ShowRolesModal').modal('toggle');
            
            },   
            showProjectDetails: function(key, event){
                if (event) event.preventDefault();
                this.ProjectModalInfo = "";
                this.ProjectKey = key;
                this.ProjectModalInfo = Object.assign({}, this.ProjectsDetails[key]);

                this.$forceUpdate();

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

                    this.$forceUpdate();
                }


                //adding Purchase Order Validator and Receipt Note Validator values in input fields
                $.each(this.ProjectModalInfo.SUBV_Financial_Details, function(index, val) {
                    $('#SUBV_Modal_List_level_'+val['SUBV_Level']+'_limit_'+index).val(parseInt(val['Limit']));
                    $('#SUBV_Modal_List_level_'+val['SUBV_Level']+'_currency_'+index).val(parseInt(val['Currency']));
                });
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


                this.$forceUpdate();

                $('#ProjectDetailsModalId').modal('toggle');
                
            },
            updateProjectDetails: function() {

                console.log(this.ProjectModalInfo);
                const allRoles = {};
                allRoles['Application Administrator Role'] = this.ProjectModalInfo.CAD_List; 
                allRoles['Purchase Enquiry Originator Role'] = this.ProjectModalInfo.PRO_List; 
                allRoles['Purchase Enquiry Validator Role'] = this.ProjectModalInfo.PRV_List; 
                allRoles['Library of Material Update Request Originator Role'] = this.ProjectModalInfo.ALMR_List; 
                allRoles['Library of Materials Administrator Role'] = this.ProjectModalInfo.LMA_List; 
                allRoles['Library of Materials Validator Role'] = this.ProjectModalInfo.ALMV_List; 
                allRoles['Request for Proposals Administrator Role'] = this.ProjectModalInfo.RFQM_List; 
                allRoles['Purchase Order Originator Role'] = this.ProjectModalInfo.POO_List; 
                allRoles['Purchase Order Validator Role'] = this.ProjectModalInfo.POV_List; 
                allRoles['Receipt Note Originator Role'] = this.ProjectModalInfo.RNO_List; 
                allRoles['Receipt Note Validator Role'] = this.ProjectModalInfo.RNV_List; 
                allRoles['Vendors Qualification Administrator Role'] = this.ProjectModalInfo.SLM_List;
                allRoles['Set-up Budget Orignator'] = this.ProjectModalInfo.SUBO_List;
                allRoles['Set-up Budget Validator Role'] = this.ProjectModalInfo.SUBV_List; 
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
                let SUBV_Number = this.ProjectModalInfo.SUBV_Number;
                let RNV_Number = this.ProjectModalInfo.RNV_Number;
                let RCV_Number = this.ProjectModalInfo.RCV_Number;

                //check completeness of the Set-up Budget Validator and Receipt Note Validator value entries
                for (var x = 1; SUBV_Number > x; x++) {
                    for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
                        if(i == 0){
                            if($('#SUBV_Modal_List_level_'+x+'_limit_'+i).val() == ""){
                                Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Set-up Budget Validator of Level ("+x+")", 'warning');
                                return false;
                            }
                        }                           
                    }
                }
                //check completeness of the Purchase Order Validator and Receipt Note Validator value entries
                for (var x = 1; POV_Number > x; x++) {
                    for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
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
                    for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
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


                this.$refs.AccountSettingForm.validate((validation) => {

                    if(validation){

                        /*Storing Purchase Order Validator and Receipt Note Validator and Rate Contract Validator Values Correctly*/
                        this.ProjectModalInfo.SUBV_Financial_Details = [];
                        this.ProjectModalInfo.POV_Financial_Details = [];
                        this.ProjectModalInfo.RNV_Financial_Details = [];
                        this.ProjectModalInfo.RCV_Financial_Details = [];

                        //getting financial limits for SUBV
                        for (var x = 1; SUBV_Number > x; x++) {
                            for (var i = 0; this.$data.ProjectModalInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
                                if(i == 0){
                                    this.ProjectModalInfo.SUBV_Financial_Details.push({
                                        POV_Level: x, 
                                        Currency: $('#SUBV_Modal_List_level_'+x+'_currency_'+i).val(),
                                        Limit: $('#SUBV_Modal_List_level_'+x+'_limit_'+i).val(),
                                    });
                                }
                            }
                        }
                        //getting financial limits for POV
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

                        //getting financial limits for RNV
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
                                    this.ProjectModalInfo.ProjectModalInfo.RCV_Financial_Details.push({
                                        RCV_Level: x, 
                                        Currency: $('#RCV_Modal_List_level_'+x+'_currency_'+i).val(),
                                        Limit: $('#RCV_Modal_List_level_'+x+'_limit_'+i).val(),
                                    });
                                }
                            }
                        }


                        this.ProjectModalInfo = Object.assign({}, this.ProjectModalInfo,{ SUBV_Financial_Details: this.ProjectModalInfo.SUBV_Financial_Details}, { POV_Financial_Details: this.ProjectModalInfo.POV_Financial_Details}, {RNV_Financial_Details: this.ProjectModalInfo.RNV_Financial_Details }, {RCV_Financial_Details: this.ProjectModalInfo.RCV_Financial_Details });


                        this.ProjectsDetails[this.ProjectKey] = Object.assign({}, this.ProjectModalInfo);
                        this.$forceUpdate();

                        let self = this;

                        axios.post('/api/users/update_project_details', [this.$data.ProjectModalInfo])
                            .then((response) => {


                                if(this.ProjectModalInfo.StoreSetup == "Yes"){
                                    /* Update this.ASTMGR_List from current this.ProjectModalInfo.ASTMGR_List and all projects self.$data.ProjectsDetails[index].ASTMGR_List */
                                    self.ASTMGR_List = self.ProjectModalInfo.ASTMGR_List;
                                    self.ASTMGR_Number = self.ASTMGR_Number;
                                    
                                    $.each(this.ProjectsDetails, function(index, project) {
                                        self.ProjectsDetails[index].ASTMGR_List = self.ProjectModalInfo.ASTMGR_List;
                                        self.ProjectsDetails[index].ASTMGR_Number = self.ProjectModalInfo.ASTMGR_Number;
                                    });

                                    this.$forceUpdate();
                                }

                                Swal('Success', response.data.message, 'success');
                                
                                this.$forceUpdate();

                                $('#ProjectDetailsModalId').modal('toggle');

                            })
                            .catch(error=>{
                                Swal('Failed', error.response.data.message, 'warning');
                            });
                    }

                })
                

                //Swal({ type: 'success', title: 'System Setting Completed', text: "Congratulations, You have completed system setup, You can enjoy the system now.", showConfirmButton: true, timer: 10000});


                
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
                allRoles['Set-up Budget Orignator'] = this.SUBO_List; 
                allRoles['Set-up Budget Validator Role'] = this.SUBV_List; 
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


                let SUBV_Number = this.SUBV_Number;
                let POV_Number = this.POV_Number;
                let RNV_Number = this.RNV_Number;
                let RCV_Number = this.RCV_Number;

                //check completeness of the Set-up Budget Validator and Receipt Note Validator value entries
                for (var x = 1; SUBV_Number > x; x++) {
                    for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
                        if(i == 0){
                            if($('#SUBV_List_level_'+x+'_limit_'+i).val() == ""){
                                Swal("Missing A Financial Limit Information", "Please Check the Financial Limit for the Set-up Budget Validator of Level ("+x+")", 'warning');
                                return false;
                            }
                        }                           
                    }
                }
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
                this.$refs.AccountSettingForm.validate((validation) => {

                    //only stop/return when validation is false when 
                    if(validation){

                        let PRV_Number = this.PRV_Number;
                        let ALMV_Number = this.ALMV_Number;
                        let POV_Number = this.POV_Number;
                        let SUBV_Number = this.SUBV_Number;
                        let RNV_Number = this.RNV_Number;
                        let RCCV_Number = this.RCCV_Number;
                        let RCV_Number = this.RCV_Number;

                        this.POV_Financial_Details = [];
                        this.SUBV_Financial_Details = [];
                        this.RNV_Financial_Details = [];
                        this.RCV_Financial_Details = [];


                        //getting financial limits for SUBV
                        for (var x = 1; SUBV_Number > x; x++) {
                            for (var i = 0; this.$data.ProjectInfo.ProjectCompanyCurrency.split(',').length > i; i++) {
                                if(i == 0){
                                    this.SUBV_Financial_Details.push({
                                        POV_Level: x, 
                                        Currency: $('#SUBV_List_level_'+x+'_currency_'+i).val(),
                                        Limit: $('#SUBV_List_level_'+x+'_limit_'+i).val(),
                                    });
                                }
                            }
                        }
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


                        console.log(this.ProjectInfo.StoreSetup);

                        let self = this;
                    
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
                                SUBV_List: JSON.parse(JSON.stringify(this.SUBV_List)),
                                RNO_List: JSON.parse(JSON.stringify(this.RNO_List)),
                                RNV_List: JSON.parse(JSON.stringify(this.RNV_List)),
                                SLM_List: JSON.parse(JSON.stringify(this.SLM_List)),
                                SUBO_List: JSON.parse(JSON.stringify(this.SUBO_List)),
                                INV_List: JSON.parse(JSON.stringify(this.INV_List)),

                                RCCO_List: JSON.parse(JSON.stringify(this.RCCO_List)),
                                RCCV_List: JSON.parse(JSON.stringify(this.RCCV_List)),
                                RCO_List: JSON.parse(JSON.stringify(this.RCO_List)),
                                RCV_List: JSON.parse(JSON.stringify(this.RCV_List)),
                                POV_Financial_Details: JSON.parse(JSON.stringify(this.POV_Financial_Details)),
                                SUBV_Financial_Details: JSON.parse(JSON.stringify(this.SUBV_Financial_Details)),
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
                                SUBV_Number: SUBV_Number,
                                RNV_Number: RNV_Number,
                                RCCV_Number: RCCV_Number,
                                RCV_Number: RCV_Number,
                                RCV_Financial_Details: JSON.parse(JSON.stringify(this.RCV_Financial_Details)),
                            }

                            //handling breakline in terms and condiditions
                            this.ProjectInfo.ProjectTsNCs = this.ProjectInfo.ProjectTsNCs.replace(/\r\n|\r|\n/g,'<br>');

                            this.ProjectsDetails.push(Object.assign({}, this.ProjectInfo, AllTempRoles));
                            let NewProject = [];
                            NewProject.push(Object.assign({}, this.ProjectInfo, AllTempRoles));

                            

                            //Post New Project to Database
                            axios.post('/api/data/create_new_project', NewProject)
                                .then((response) => {
                                
                                    if(this.ProjectInfo.StoreSetup == "Yes"){
                                        /* Update this.ASTMGR_List from current this.ProjectModalInfo.ASTMGR_List and all projects self.$data.ProjectsDetails[index].ASTMGR_List */
                                        $.each(this.ProjectsDetails, function(index, project) {
                                            self.ProjectsDetails[index].ASTMGR_List = self.ASTMGR_List;
                                            self.ProjectsDetails[index].ASTMGR_Number = self.ASTMGR_Number;
                                        });

                                        this.$forceUpdate();
                                    }

                                    Swal('Success', response.data.message, 'success');

                                    this.$forceUpdate();

                                })
                                .catch(error=>{
                                    Swal('Failed', error.response.data.message, 'warning');
                                });
                            
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
                                SUBV_List: JSON.parse(JSON.stringify(this.SUBV_List)),
                                RNO_List: JSON.parse(JSON.stringify(this.RNO_List)),
                                RNV_List: JSON.parse(JSON.stringify(this.RNV_List)),
                                SLM_List: JSON.parse(JSON.stringify(this.SLM_List)),
                                SUBO_List: JSON.parse(JSON.stringify(this.SUBO_List)),
                                INV_List: JSON.parse(JSON.stringify(this.INV_List)),

                                RCCO_List: JSON.parse(JSON.stringify(this.RCCO_List)),
                                RCCV_List: JSON.parse(JSON.stringify(this.RCCV_List)),
                                RCO_List: JSON.parse(JSON.stringify(this.RCO_List)),
                                RCV_List: JSON.parse(JSON.stringify(this.RCV_List)),
                                POV_Financial_Details: JSON.parse(JSON.stringify(this.POV_Financial_Details)),
                                SUBV_Financial_Details: JSON.parse(JSON.stringify(this.SUBV_Financial_Details)),
                                RNV_Financial_Details: JSON.parse(JSON.stringify(this.RNV_Financial_Details)),
                                
                                PRV_Number: PRV_Number,
                                ALMV_Number: ALMV_Number,
                                POV_Number: POV_Number,
                                SUBV_Number: SUBV_Number,
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

                            //this.ProjectsDetails.push(Object.assign({}, this.ProjectInfo, AllTempRoles));
                            let NewProject = [];
                            NewProject.push(Object.assign({}, this.ProjectInfo, AllTempRoles));


                            console.log(NewProject);

                            //Post New Project to Database
                            axios.post('/api/data/create_new_project', NewProject)
                                .then((response) => {
                                
                                    if(this.ProjectInfo.StoreSetup == "Yes"){
                                        /* Update this.ASTMGR_List from current this.ProjectModalInfo.ASTMGR_List and all projects self.$data.ProjectsDetails[index].ASTMGR_List */
                                        $.each(this.ProjectsDetails, function(index, project) {
                                            self.ProjectsDetails[index].ASTMGR_List = self.ASTMGR_List;
                                            self.ProjectsDetails[index].ASTMGR_Number = self.ASTMGR_Number;
                                        });

                                        this.$forceUpdate();
                                    }

                                    Swal('Success', response.data.message, 'success');

                                    this.$forceUpdate();

                                })
                                .catch(error=>{
                                    Swal('Failed', error.response.data.message, 'warning');
                                });

                        }

                    
                        
                        //Reseting Project Info
                        this.ProjectInfo.ProjectTitle = "";
                        this.ProjectInfo.StoreSetup = "";
                        this.ProjectInfo.ProjectPeriod = [];
                        this.ProjectInfo.ProjectValue = "";
                        this.ProjectInfo.ProjectPODOACriterion = "";
                        this.ProjectInfo.ProjectRNDOACriterion = "";
                        this.ProjectInfo.ProjectAuctionType = [];
                        this.ProjectInfo.ProjectCompanyCurrency = "";
                        this.ProjectInfo.ProjectTsNCs = "";
                        this.ProjectInfo.RawData = "";

                        // //Reseting Role Info
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
                                this.SUBV_List = {
                                    level_1: [],
                                    level_2: [],
                                    level_3: [],
                                    level_4: [],
                                    level_5: [],
                                    level_6: [],
                                    level_7: [],
                                    level_8: []
                                },
                                this.SUBV_Number = null;
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
                                this.SUBO_List = [];
                                this.INV_List = [];
                                /* This role is acorss stores so its not reset at any point */
                                // this.ASTMGR_List = {
                                //  level_1: [],
                                //  level_2: [],
                                //  level_3: [],
                                //  level_4: [],
                                //  level_5: [],
                                //  level_6: [],
                                //  level_7: [],
                                //  level_8: []
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
                                this.SUBV_Financial_Details = [];
                                this.RNV_Financial_Details = [];
                                this.RCV_Financial_Details = [];

                            }
                        });

                        
                        this.scrollTo(400, 1000);

                        // Swal({ type: 'success', title: 'Project Saved', text: "Project Details Saved, You Can Enter New Project Details", showConfirmButton: false, timer: 1500
                        // });
        
                    } else {
                        this.scrollTo(400, 1000);
                        return validation;
                    }
                    
                }); 
            },
            RemoveProject: function(key, event) {
                if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This is a permenent delete. All data will be lost?",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {

                        //Delete From DB
                        axios.post('/api/data/project_deactivate', this.ProjectsDetails[key]).
                        then((response) => {
                            this.ProjectsDetails.splice(key, 1);
                            Swal(
                              'Deleted!',
                              'Project has been sucessfully deleted.',
                              'success'
                            );                
                        })
                        .catch(error => { 
                            console.log(error); 
                        });


                    
                    }
                })
                
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
                if(exsits.length > 1){ this.$delete(this.CAD_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Application Administrator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddPRO: function(evt) {
                const NewlyAdded = this.PRO_List[evt.newIndex];
                const exsits = this.PRO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.PRO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Enquiry Originator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) } 
            },
            onAddPRV: function(evt) {

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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddPOO: function(evt) {
                const NewlyAdded = this.POO_List[evt.newIndex];
                const exsits = this.POO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.POO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Purchase Order Originator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddPOV: function(evt) {

                // $.toast({
                //  heading: 'Welcome to Monster admin',
                //  text: 'Use the predefined ones, or specify a custom position object.',
                //  position: 'top-right',
                //  loaderBg:'#ff6849',
                //  icon: 'warning',
                //  hideAfter: 3500, 
                //  stack: 6
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddRNV: function(evt) {
                
                // $.toast({
                //  heading: 'Welcome to Monster admin',
                //  text: 'Use the predefined ones, or specify a custom position object.',
                //  position: 'top-right',
                //  loaderBg:'#ff6849',
                //  icon: 'warning',
                //  hideAfter: 3500, 
                //  stack: 6
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddSUBO: function(evt) {
                const NewlyAdded = this.SUBO_List[evt.newIndex];
                const exsits = this.SUBO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.SUBO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Set-up Budget Originator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddSUBV: function(evt) {

                var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
                ListName = ListName.slice(4);

                console.log(ListName);
                console.log(this.SUBV_List[ListName]);
                
                const NewlyAdded = this.SUBV_List[ListName][evt.newIndex];
                const exsits = this.SUBV_List[ListName].filter(function(elem) {
                    if(elem.email == NewlyAdded.email) {
                        return elem;
                    }
                });
                
                if(exsits.length > 1){
                    this.$delete(this.SUBV_List[ListName], evt.newIndex);
                    Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Set-up Budget Validator List", timer: 2500
                    });
                } else {
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    })
                }           
            },
            onAddINV: function(evt) {
                const NewlyAdded = this.INV_List[evt.newIndex];
                const exsits = this.INV_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.INV_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Invoice Checker List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                   this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                        allRoles['Set-up Budget Orignator'] = this.SUBO_List; 
                        allRoles['Set-up Budget Validator Role'] = this.SUBV_List; 
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
            // creatNewEmployeeExcel() {
            //     // alert('enters');
            //     const NewlyAdded = this.exceluser;
            //     for(var i=0;i<this.exceluser.length;i++){
            //         this.EmployeesList.push({
            //             fullName: this.exceluser[i].employee_name,
            //             email: this.exceluser[i].employee_email,
            //             designation: this.exceluser[i].employee_name,
            //         });
            //     }

            //     this.NewEmployee.fullName = "";
            //     this.NewEmployee.email = "";
            //     this.NewEmployee.designation = "";
            //     this.NewEmployeeErrors = null;
            //     Swal('Employee Is Added', 'New Employee has been added to Employees List', 'success');

            // },
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
                    Swal('Employee Is Added', 'New Employee has been added to Employees List', 'success');
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
            onAddCADModal: function(evt) {
                const NewlyAdded = this.ProjectModalInfo.CAD_List[evt.newIndex];
                const exsits = this.ProjectModalInfo.CAD_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.CAD_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Application Administrator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddPOVModal: function(evt) {

                // $.toast({
                //  heading: 'Welcome to Monster admin',
                //  text: 'Use the predefined ones, or specify a custom position object.',
                //  position: 'top-right',
                //  loaderBg:'#ff6849',
                //  icon: 'warning',
                //  hideAfter: 3500, 
                //  stack: 6
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddRNVModal: function(evt) {
                
                // $.toast({
                //  heading: 'Welcome to Monster admin',
                //  text: 'Use the predefined ones, or specify a custom position object.',
                //  position: 'top-right',
                //  loaderBg:'#ff6849',
                //  icon: 'warning',
                //  hideAfter: 3500, 
                //  stack: 6
                // });

                var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
                ListName = ListName.slice(4);

                console.log(ListName);
                console.log(this.ProjectModalInfo.RNV_List[ListName]);
                
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddSUBOModal: function(evt) {
                const NewlyAdded = this.ProjectModalInfo.SUBO_List[evt.newIndex];
                const exsits = this.ProjectModalInfo.SUBO_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.SUBO_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Set-up Budget Originator List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    }) }
            },
            onAddSUBVModal: function(evt) {
                var ListName = evt.to.children[0].children[1].children[0].children[0].attributes[0].nodeValue;
                ListName = ListName.slice(4);

                console.log(ListName);
                console.log(this.ProjectModalInfo.SUBV_List[ListName]);
                
                const NewlyAdded = this.ProjectModalInfo.SUBV_List[ListName][evt.newIndex];
                const exsits = this.ProjectModalInfo.SUBV_List[ListName].filter(function(elem) {
                    if(elem.email == NewlyAdded.email) {
                        return elem;
                    }
                });
                
                if(exsits.length > 1){
                    this.$delete(this.ProjectModalInfo.SUBV_List[ListName], evt.newIndex);
                    Swal({ type: 'warning', title: 'Employee Exists', text: "Employee already exists in Set-up Budget Validator List", timer: 2500
                    });
                } else {
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    })
                }           
            },
            onAddINVModal: function(evt) {
                const NewlyAdded = this.ProjectModalInfo.INV_List[evt.newIndex];
                const exsits = this.ProjectModalInfo.INV_List.filter(function(elem) { if(elem.email == NewlyAdded.email) { return elem; } });
                if(exsits.length > 1){ this.$delete(this.ProjectModalInfo.INV_List, evt.newIndex); Swal('Employee Exists', 'Employee already exists in Invoice Checker List', 'warning') } else { 
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                   this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
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
                    this.$bvToast.toast('Employee has been assigned the role successfully', {
                      title: 'Employee Assigned Successfully',
                      autoHideDelay: 3000,
                      variant: 'success',
                      solid: true,
                    })
                }
            },
            getRoleFixed: function(project, roleName, multiLevel){
                var Role = {};
                var NoLevelsRoles = [];

                if(multiLevel){
                    var LastLevelNumber = 0;
                    //console.log(project, roleName);
                    /* Check if the roles exists in the first place */
                    if(project.hasOwnProperty(roleName)){
                        $.each(project[roleName], function(levelNumber, employees) {
                            LastLevelNumber = levelNumber;
                            Role['level_'+levelNumber] = [];
                            $.each(employees, function(index, employee) {
                                Role['level_'+levelNumber][index] = {
                                    "fullName": employee.user.name,
                                    "email":employee.user.email,
                                    "designation":employee.user.designation
                                };
                            });
                        });
                    }

                    //Create Empty Levels for the role
                    LastLevelNumber++;
                    for(LastLevelNumber; LastLevelNumber <= 8;){
                        Role['level_'+LastLevelNumber] = [];
                        LastLevelNumber++;
                    }
                    return Role;

                } else {
                    //console.log(project.hasOwnProperty(roleName), roleName, project[roleName], project)
                    if(project.hasOwnProperty(roleName)){
                        $.each(project[roleName][1], function(index, employee) {
                            NoLevelsRoles.push({
                                "fullName": employee.user.name,
                                "email":employee.user.email,
                                "designation":employee.user.designation
                            });
                        });
                    }
                    return NoLevelsRoles;
                    
                }

                
                
            },
            getProjectData: function() {

                var self = this;
                var auctionTypes = [];

                self.ASTMGR_Number = 0;

                axios.get('/api/data/get_complete_projects').
                    then((response) => {

                        console.log(response.data);

                        axios.get('/api/data/get_company_details')
                            .then((SecondResponse) => {
                                self.AccountSettingForm.companyLoMManditory = SecondResponse.data.lom_manditory;
                            })
                        //console.log(response.data);
                        //Store Project Details
                        $.each(response.data, function(index, project) {
                            
                            //console.log(project.setup_type);
                            auctionTypes = [];
                            auctionTypes = project.auction_types.split(',');

                            //Storing Project's Basic Details
                            self.ProjectInfo.ProjectId = project.id;
                            self.ProjectInfo.SetupMode = project.company.setup_mode;
                            self.ProjectInfo.ProjectTitle = project.title;
                            self.ProjectInfo.StoreSetup = project.setup_type;
                            self.ProjectInfo.ConsumedBudget = project.consumed_budget;
                            self.ProjectInfo.ProjectPeriod.push(project.start_date);
                            self.ProjectInfo.ProjectPeriod.push(project.end_date);
                            self.ProjectInfo.ProjectValue = project.value;
                            self.ProjectInfo.ProjectPODOACriterion = project.po_doa_criterion;
                            self.ProjectInfo.ProjectRNDOACriterion = project.rn_doa_criterion;
                            $.each(auctionTypes, function(index, auctionType) {
                                 self.ProjectInfo.ProjectAuctionType.push(auctionType);
                            });
                            self.ProjectInfo.ProjectCompanyCurrency = project.currency;
                            self.ProjectInfo.ProjectTsNCs = project.terms_n_conditions;
                            self.ProjectInfo.RawData = project;

                            self.ASTMGR_List = self.getRoleFixed(project,'ASTMGR', true);

                            //Storing Prject Roles Details
                            //Copy and Store all assigned Roles into new object
                            if(project.setup_type == "Yes"){

                                let AllTempRoles = {
                                    CAD_List: self.getRoleFixed(project, 'CAD', false),
                                    PRO_List: self.getRoleFixed(project, 'PRO', false),
                                    PRV_List: self.getRoleFixed(project,'PRV', true),
                                    ALMR_List: self.getRoleFixed(project,'ALMR', false),
                                    LMA_List: self.getRoleFixed(project,'LMA', false),
                                    ALMV_List: self.getRoleFixed(project,'ALMV', true),
                                    RFQM_List: self.getRoleFixed(project,'RFQM', false),
                                    POO_List: self.getRoleFixed(project,'POO', false),
                                    POV_List: self.getRoleFixed(project,'POV', true),
                                    RNO_List: self.getRoleFixed(project,'RNO', false),
                                    RNV_List: self.getRoleFixed(project,'RNV', true),
                                    SLM_List: self.getRoleFixed(project,'SLM', false),
                                    SUBO_List: self.getRoleFixed(project,'SUBO', false),
                                    SUBV_List: self.getRoleFixed(project,'SUBV', true),
                                    INV_List: self.getRoleFixed(project,'INV', false),

                                    ASTMGR_List: self.getRoleFixed(project,'ASTMGR', true),
                                    SIIRPT_List: self.getRoleFixed(project,'SIIRPT', false),
                                    RTIRS_List: self.getRoleFixed(project,'RTIRS', false),
                                    ATSIRS_List: self.getRoleFixed(project,'ATSIRS', true),
                                    RTSI_List: self.getRoleFixed(project,'RTSI', false),
                                    ATSI_List: self.getRoleFixed(project,'ATSI', true),
                                    
                                    RCCO_List: self.getRoleFixed(project,'RCCO', false),
                                    RCCV_List: self.getRoleFixed(project,'RCCV', true),
                                    RCO_List: self.getRoleFixed(project,'RCO', false),
                                    RCV_List: self.getRoleFixed(project,'RCV', true),
                                    
                                    PRV_Number: project.PRV_Number,
                                    ALMV_Number: project.ALMV_Number,
                                    POV_Number: project.POV_Number,
                                    SUBV_Number: project.SUBV_Number,
                                    RNV_Number: project.RNV_Number,
                                    RCCV_Number: project.RCCV_Number,
                                    RCV_Number: project.RCV_Number,
                                    ASTMGR_Number: project.ASTMGR_Number,
                                    ATSIRS_Number: project.ATSIRS_Number,
                                    ATSI_Number: project.ATSI_Number,

                                }

                                self.ProjectsDetails.push(Object.assign({}, self.ProjectInfo, AllTempRoles));

                                self.ProjectInfo.SetupMode = "";
                                self.ProjectInfo.ProjectTitle = "";
                                self.ProjectInfo.StoreSetup = "";
                                self.ProjectInfo.ProjectPeriod = [];
                                self.ProjectInfo.ProjectValue = "";
                                self.ProjectInfo.ProjectPODOACriterion = "";
                                self.ProjectInfo.ProjectRNDOACriterion = "";
                                self.ProjectInfo.ProjectAuctionType = [];
                                self.ProjectInfo.ProjectCompanyCurrency = "";
                                self.ProjectInfo.ProjectTsNCs = "";
                                self.ProjectInfo.RawData = "";

                                self.projectsLoaded = true;

                                if(self.ASTMGR_Number < project.ASTMGR_Number){
                                    self.ASTMGR_Number = project.ASTMGR_Number;
                                }

                            } else {

                                let AllTempRoles = {
                                    CAD_List: self.getRoleFixed(project, 'CAD', false),
                                    PRO_List: self.getRoleFixed(project, 'PRO', false),
                                    PRV_List: self.getRoleFixed(project,'PRV', true),
                                    ALMR_List: self.getRoleFixed(project,'ALMR', false),
                                    LMA_List: self.getRoleFixed(project,'LMA', false),
                                    ALMV_List: self.getRoleFixed(project,'ALMV', true),
                                    RFQM_List: self.getRoleFixed(project,'RFQM', false),
                                    POO_List: self.getRoleFixed(project,'POO', false),
                                    POV_List: self.getRoleFixed(project,'POV', true),
                                    RNO_List: self.getRoleFixed(project,'RNO', false),
                                    RNV_List: self.getRoleFixed(project,'RNV', true),
                                    SLM_List: self.getRoleFixed(project,'SLM', false),
                                    SUBO_List: self.getRoleFixed(project,'SUBO', false),
                                    SUBV_List: self.getRoleFixed(project,'SUBV', true),
                                    INV_List: self.getRoleFixed(project,'INV', false),

                                    //ASTMGR_List: self.getRoleFixed(project,'ASTMGR', true),
                                    
                                    RCCO_List: self.getRoleFixed(project,'RCCO', false),
                                    RCCV_List: self.getRoleFixed(project,'RCCV', true),
                                    RCO_List: self.getRoleFixed(project,'RCO', false),
                                    RCV_List: self.getRoleFixed(project,'RCV', true),
                                    
                                    PRV_Number: project.PRV_Number,
                                    ALMV_Number: project.ALMV_Number,
                                    POV_Number: project.POV_Number,
                                    SUBV_Number: project.SUBV_Number,
                                    RNV_Number: project.RNV_Number,
                                    RCCV_Number: project.RCCV_Number,
                                    RCV_Number: project.RCV_Number,
                                    ASTMGR_Number: project.ASTMGR_Number,

                                }

                                if(self.ASTMGR_Number < project.ASTMGR_Number){
                                    self.ASTMGR_Number = project.ASTMGR_Number;
                                }

                                self.ProjectsDetails.push(Object.assign({}, self.ProjectInfo, AllTempRoles));

                                self.ProjectInfo.SetupMode = "";
                                self.ProjectInfo.ProjectTitle = "";
                                self.ProjectInfo.StoreSetup = "";
                                self.ProjectInfo.ProjectPeriod = [];
                                self.ProjectInfo.ProjectValue = "";
                                self.ProjectInfo.ProjectPODOACriterion = "";
                                self.ProjectInfo.ProjectRNDOACriterion = "";
                                self.ProjectInfo.ProjectAuctionType = [];
                                self.ProjectInfo.ProjectCompanyCurrency = "";
                                self.ProjectInfo.ProjectTsNCs = "";
                                self.ProjectInfo.RawData = "";

                                self.projectsLoaded = true;

                            }
                        
                        });

                        console.log(self.ProjectsDetails);
                        
                    })
                    .catch(error => { 
                        console.log(error); 
                    });
            }
        },
        mounted(){

            this.EmployeesList.push({
                fullName: this.currentUser.Name,
                email: this.currentUser.Email,
                designation: this.currentUser.Designation,
            })

            //CustomJs();

        },
        created(){
            this.getProjectData();


        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));
            //console.log(currentUser);
            if(currentUser.hasOwnProperty('CAD') && currentUser.CompanyId != null){
                //check with the backend if user has SAD privileges
                axios.get('/api/users/get_user_details')
                    .then(response => {
                        //console.log(response.data);
                        if(response.data.hasOwnProperty('CAD') && response.data.CompanyId != null){
                            
                            next();
                            
                        } else {

                            Swal("High Fraud Offence", "You do not have the right to access this page, this instance will be reported. \n. ("+ currentUser.name +")" , 'error');

                            //this instance must be reported to since there is fraud envolved.
                            next('/login');
                        }
                    })

            } else {


                $.toast({
                    heading: 'No Access Rights.',
                    text: 'You do not have the privilege to access this menu.',
                    position: 'top-right',
                    loaderBg:'#ff6849',
                    icon: 'error',
                    hideAfter: 3000, 
                    stack: 6
                });


                next('/login');
                
                //Swal("Access Denied", "You do not have the right to access this page, this instance will be reported. \n. ("+ currentUser.name +")" , 'error');

                //instance can be reported to backend here


               
            }       
        }
    }
</script>


<style>

    #ProjectDetailsModalId .modal-dialog {
        min-width:80%;
    }

    #ShowRolesModal .modal-dialog {
        min-width:80%;
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
