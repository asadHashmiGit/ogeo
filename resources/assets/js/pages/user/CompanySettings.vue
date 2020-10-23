<template>

	<!-- Validation wizard -->
	<div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Organization Settings</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Organization Settings</li>
                    </ol>
                </div>
            </div>

            <el-form :model="AccountSettingForm" class="demo-form-inline" :rules="LoMrules" ref="AccountSettingFormLoM">
                <el-row :gutter="20">
                    <el-col :span="24">
                        <div class="grid-content">
                            <el-form-item label="Mandatorily use Libraries of Materials for Purchase Enquiries?" prop="companyLoMManditory">
                                <span style="z-index: 10" class="mytooltip tooltip-effect-1">
                                    <span class="tooltip-item2">
                                        <span class="fa-stack fa-1x">
                                          <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
                                          <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
                                        </span>
                                    </span>
                                    <span style="bottom: -280px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
                                        <span class="tooltip-text2">I’m offered the possibility to impose that Purchase Enquiries (PEs), created for materials, can only be raised for items extracted from my organization’s Libraries of Materials. This will prevent the use of free text (and all the potential mistakes it can bring) to describe the materials that are the subject of such PEs.  The use of Libraries of Materials will effectively assist my organization in building up actionable data analytics. Example of such insights can include what materials are purchased, at what rates and frequency and from which vendors. This, in return, will make it easy for my organization to establish profitable rate contracts with vendors. </span>
                                    </span>
                                </span>
                                <el-select style="width: 100%; padding: 0px;" v-model="AccountSettingForm.companyLoMManditory" placeholder="Select Yes/No">
                                      <el-option label="Free Text + Libraries" value="LibrariesNFreeText"></el-option>
                                      <el-option label="Libraries Only" value="Libraries"></el-option>
                                      <el-option label="Free Text Only" value="FreeText"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="24">
                        <hr>
                        <button type="button" @click="UpdateCompanyDetails" class="btn btn-success btn-block waves-effect text-center">Update Company Details</button>
                    </el-col>
                </el-row>
            </el-form>


           <!--  <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">


                        
                        
                            <el-form :model="AccountSettingForm" class="demo-form-inline" :rules="LoMrules" ref="AccountSettingFormLoM">
                                <el-row :gutter="20">
                                    <el-col :span="24">
                                        <div class="grid-content">
                                            <el-form-item label="Mandatorily use Libraries of Materials for Purchase Enquiries?" prop="companyLoMManditory">
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                    <span class="tooltip-item2">
                                                        <span class="fa-stack fa-1x">
                                                          <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
                                                          <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
                                                        </span>
                                                    </span>
                                                    <span style="bottom: -230px; left: 220px" class="tooltip-content4 clearfix">
                                                        <span class="tooltip-text2">I’m offered the possibility to impose that Purchase Enquiries (PEs), created for materials, can only be raised for items extracted from my organization’s Libraries of Materials. This will prevent the use of free text (and all the potential mistakes it can bring) to describe the materials that are the subject of such PEs.  The use of Libraries of Materials will effectively assist my organization in building up actionable data analytics. Example of such insights can include what materials are purchased, at what rates and frequency and from which vendors. This, in return, will make it easy for my organization to establish profitable rate contracts with vendors. </span>
                                                    </span>
                                                </span>
                                                <el-select style="width: 100%; padding: 0px;" v-model="AccountSettingForm.companyLoMManditory" placeholder="Select Yes/No">
                                                      <el-option label="Yes" value="Yes"></el-option>
                                                      <el-option label="No" value="No"></el-option>
                                                </el-select>
                                            </el-form-item>
                                        </div>
                                    </el-col>
                                    
                                    <transition name="slide-fade" v-if="AccountSettingForm.companyLoMManditory == 'LibrariesNFreeText' || AccountSettingForm.companyLoMManditory == 'Libraries'">
                                        <div>
                                        <el-col :span="24" >







    <div class="card">
        <div class="card-header">
            <h4>Item Template Setup</h4>
        </div>
        <div class="card-body">
            <h3 class="text-danger">Item Templates Creation</h3>
            <p class="text-danger">You are allowed to create as many templates as you wish. Each template can have up to 20 customizable fields. You must select if the field is required to be set or not then assign it's header name. For Example: (Aimad to provide an Example)</p>

            <hr>
           
            <div class="card">
                <div class="card-header">
                    <h4>Item Templates Table</h4>
                </div>
                <div class="card-body">
                    <table ref="ItemsTemplatesList" id="ItemsTemplatesList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Template Name</th>
                                <th style="min-width: 500px">Assigned Headers</th>
                                <th >Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(Tempate, index) in TemplatesDetails">
                                <td>{{ index + 1 }}</td>
                                <td>{{ Tempate.Template_Name }}</td>
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
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 1" prop="Field_1_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(1, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Required" placeholder="Set Field 1">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_1_Header">
                                <el-input ref="Header_1" :disabled="ItemStructureSetup.Field_1_Required ? null : true" v-model="ItemStructureSetup.Field_1_Header" placeholder="e.g. Category"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_1_Mandatory">
                                <el-select ref="Mandatory_1" :disabled="ItemStructureSetup.Field_1_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 2" prop="Field_2_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(2, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Required" placeholder="Set Field 2">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_2_Header">
                                <el-input ref="Header_2" :disabled="ItemStructureSetup.Field_2_Required ? null : true" v-model="ItemStructureSetup.Field_2_Header" placeholder="e.g. Subcategory"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_2_Mandatory">
                                <el-select ref="Mandatory_2" :disabled="ItemStructureSetup.Field_2_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 3" prop="Field_3_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(3, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Required" placeholder="Set Field 3">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_3_Header">
                                <el-input ref="Header_3" :disabled="ItemStructureSetup.Field_3_Required ? null : true" v-model="ItemStructureSetup.Field_3_Header" placeholder="e.g. Sub Subcategory"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_3_Mandatory">
                                <el-select ref="Mandatory_3" :disabled="ItemStructureSetup.Field_3_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 4" prop="Field_4_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(4, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Required" placeholder="Set Field 4">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_4_Header">
                                <el-input ref="Header_4" :disabled="ItemStructureSetup.Field_4_Required ? null : true" v-model="ItemStructureSetup.Field_4_Header" placeholder="e.g. Make/Brand"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_4_Mandatory">
                                <el-select ref="Mandatory_4" :disabled="ItemStructureSetup.Field_4_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 5" prop="Field_5_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(5, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Required" placeholder="Set Field 5">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_5_Header">
                                <el-input ref="Header_5" :disabled="ItemStructureSetup.Field_5_Required ? null : true" v-model="ItemStructureSetup.Field_5_Header" placeholder="e.g. Model"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_5_Mandatory">
                                <el-select ref="Mandatory_5" :disabled="ItemStructureSetup.Field_5_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 6" prop="Field_6_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(6, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Required" placeholder="Set Field 6">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_6_Header">
                                <el-input ref="Header_6" :disabled="ItemStructureSetup.Field_6_Required ? null : true" v-model="ItemStructureSetup.Field_6_Header" placeholder="e.g. Serial Number"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_6_Mandatory">
                                <el-select ref="Mandatory_6" :disabled="ItemStructureSetup.Field_6_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 7" prop="Field_7_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(7, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Required" placeholder="Set Field 7">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_7_Header">
                                <el-input ref="Header_7" :disabled="ItemStructureSetup.Field_7_Required ? null : true" v-model="ItemStructureSetup.Field_7_Header" placeholder="e.g. Year"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_7_Mandatory">
                                <el-select ref="Mandatory_7" :disabled="ItemStructureSetup.Field_7_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 8" prop="Field_8_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(8, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Required" placeholder="Set Field 8">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_8_Header">
                                <el-input ref="Header_8" :disabled="ItemStructureSetup.Field_8_Required ? null : true" v-model="ItemStructureSetup.Field_8_Header" placeholder="e.g. Expiry Date"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_8_Mandatory">
                                <el-select ref="Mandatory_8" :disabled="ItemStructureSetup.Field_8_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 9" prop="Field_9_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(9, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Required" placeholder="Set Field 9">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_9_Header">
                                <el-input ref="Header_9" :disabled="ItemStructureSetup.Field_9_Required ? null : true" v-model="ItemStructureSetup.Field_9_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_9_Mandatory">
                                <el-select ref="Mandatory_9" :disabled="ItemStructureSetup.Field_9_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 10" prop="Field_10_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(10, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Required" placeholder="Set Field 10">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_10_Header">
                                <el-input ref="Header_10" :disabled="ItemStructureSetup.Field_10_Required ? null : true" v-model="ItemStructureSetup.Field_10_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_10_Mandatory">
                                <el-select ref="Mandatory_10" :disabled="ItemStructureSetup.Field_10_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Mandatory" placeholder="Select Mandatory Option">   
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 11" prop="Field_11_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(11, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Required" placeholder="Set Field 11">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_11_Header">
                                <el-input ref="Header_11" :disabled="ItemStructureSetup.Field_11_Required ? null : true" v-model="ItemStructureSetup.Field_11_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_11_Mandatory">
                                <el-select ref="Mandatory_11" :disabled="ItemStructureSetup.Field_11_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 12" prop="Field_12_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(12, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Required" placeholder="Set Field 12">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_12_Header">
                                <el-input ref="Header_12" :disabled="ItemStructureSetup.Field_12_Required ? null : true" v-model="ItemStructureSetup.Field_12_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_12_Mandatory">
                                <el-select ref="Mandatory_12" :disabled="ItemStructureSetup.Field_12_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 13" prop="Field_13_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(13, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Required" placeholder="Set Field 13">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_13_Header">
                                <el-input ref="Header_13" :disabled="ItemStructureSetup.Field_13_Required ? null : true" v-model="ItemStructureSetup.Field_13_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_13_Mandatory">
                                <el-select ref="Mandatory_13" :disabled="ItemStructureSetup.Field_13_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 14" prop="Field_14_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(14, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Required" placeholder="Set Field 14">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_14_Header">
                                <el-input ref="Header_14" :disabled="ItemStructureSetup.Field_14_Required ? null : true" v-model="ItemStructureSetup.Field_14_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_14_Mandatory">
                                <el-select ref="Mandatory_14" :disabled="ItemStructureSetup.Field_14_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 15" prop="Field_15_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(15, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Required" placeholder="Set Field 15">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_15_Header">
                                <el-input ref="Header_15" :disabled="ItemStructureSetup.Field_15_Required ? null : true" v-model="ItemStructureSetup.Field_15_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_15_Mandatory">
                                <el-select ref="Mandatory_15" :disabled="ItemStructureSetup.Field_15_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 16" prop="Field_16_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(16, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Required" placeholder="Set Field 16">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_16_Header">
                                <el-input ref="Header_16" :disabled="ItemStructureSetup.Field_16_Required ? null : true" v-model="ItemStructureSetup.Field_16_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_16_Mandatory">
                                <el-select ref="Mandatory_16" :disabled="ItemStructureSetup.Field_16_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 17" prop="Field_17_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(17, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Required" placeholder="Set Field 17">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_17_Header">
                                <el-input ref="Header_17" :disabled="ItemStructureSetup.Field_17_Required ? null : true" v-model="ItemStructureSetup.Field_17_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_17_Mandatory">
                                <el-select ref="Mandatory_17" :disabled="ItemStructureSetup.Field_17_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 18" prop="Field_18_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(18, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Required" placeholder="Set Field 18">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_18_Header">
                                <el-input ref="Header_18" :disabled="ItemStructureSetup.Field_18_Required ? null : true" v-model="ItemStructureSetup.Field_18_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_18_Mandatory">
                                <el-select ref="Mandatory_18" :disabled="ItemStructureSetup.Field_18_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 19" prop="Field_19_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(19, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Required" placeholder="Set Field 19">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_19_Header">
                                <el-input ref="Header_19" :disabled="ItemStructureSetup.Field_19_Required ? null : true" v-model="ItemStructureSetup.Field_19_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_19_Mandatory">
                                <el-select ref="Mandatory_19" :disabled="ItemStructureSetup.Field_19_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Set Field 20" prop="Field_20_Required">
                                <el-select :disabled="Set_Required" @change="SetRequired(20, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_20_Required" placeholder="Set Field 20">
                                    <el-option label="Yes" :value="true"></el-option>    
                                    <el-option label="No" :value="false"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="grid-content">
                            <el-form-item label="Enter Field Header" prop="Field_20_Header">
                                <el-input ref="Header_20" :disabled="ItemStructureSetup.Field_20_Required ? null : true" v-model="ItemStructureSetup.Field_20_Header" placeholder="e.g. Addtional Header"></el-input>
                            </el-form-item>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="grid-content">
                            <el-form-item label="Mandatory Fillable Field" prop="Field_20_Mandatory">
                                <el-select ref="Mandatory_20" :disabled="ItemStructureSetup.Field_20_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_20_Mandatory" placeholder="Select Mandatory Option">
                                    <el-option label="Yes" value="Yes"></el-option>
                                    <el-option label="No" value="No"></el-option>    
                                </el-select>
                            </el-form-item>
                        </div>
                    </div>
                </div>


                <div class="col-lg-12">
                    <hr>
                    <button type="button" @click="SubmitItemSetupForm" class="btn btn-success btn-block waves-effect text-center">Submit Item Setup Form</button>
                </div>


            </el-form>
        </div>
    </div>



                                        </el-col>

                                        
                                        </div>
                                    </transition>

                                </el-row>
                            </el-form>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                    <hr>
                    <button type="button" @click="SubmitItemSetupForm" class="btn btn-success btn-block waves-effect text-center">Submit Item Setup Form</button>
                </div>
                </div>

            </div> -->

        </div>
    </div>


</template>

<script>

    import { CustomJs } from '../../helpers/custom.js';
    import validateJs from 'validate.js';
    import draggable from 'vuedraggable';

    export default {
        name: "manage-projects",
        components: { 
            draggable,
        },
        data() {
            return {

                AccountSettingForm: {
                    companyName: "",
                    CompanyEmployeeRange: [],
                    CompanyIndustry: [],
                    CompanyCities: [],
                    SubscriptionType: "",
                    BillingInfo: "",
                    companyPEPrefix: "",
                    companyRFQPrefix: "",
                    companyComEvalPrefix: "",
                    companyPOPrefix: "",
                    companyRNPrefix: "",
                    companyLoMManditory: "",
                    companyLoMPrefix: "",
                    procurementSetupMode: "Project Wise",
                    companyAdditionalField: "",
                    PODOACriterion: "",
                    RNDOACriterion: "",
                    CompanyCurrency: "",
                    CompanyBudget: "",
                    companyTsNCs: "",
                    AuctionType: "",
                },

                /* Item Template Creation */
                DataTableItemTemplate: "",
                Set_Required: false,
                TemplatesDetails: [],
                ItemStructureSetup: {   
                    ID: "",
                    Template_Name: "",
                    Field_1_Required: false,
                    Field_1_Header: "",
                    Field_1_Mandatory: "",
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
                LoMrules: {
                    companyLoMManditory: [{
                        required: true,
                        message: 'Please select LoM Mode',
                        trigger: 'change'
                    }],
                    companyLoMPrefix: [{
                        max: 3,
                        message: 'Maximum Length is 3 characters',
                        trigger: 'blur'
                    }],
                },
                FormRules: {
                    Template_Name: [{
                        required: true,
                        message: "Template Name Required",
                        trigger: ["blur", "change"]
                    }],
                    Field_1_Required: [{
                        required: false,
                        message: "Do You Want to Set This Field",
                        trigger: ["blur", "change"]
                    }],
                    Field_1_Header: [{
                        required: false,
                        message: "Enter Header Name",
                        trigger: "blur"
                    }],
                    Field_1_Mandatory: [{
                        required: false,
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
            }
        },
        computed:{
            currentUser(){
                return this.$store.getters.currentUser
            }
        },
        methods: {
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
                self.ItemStructureSetup.ConsolidatedTitles = "";
                this.$refs.ItemStructureSetupForm.validate((validation) => {

                    if(validation){
                        let TemplateIndexLocation = self.TemplatesDetails.length;
                        $.each(this.ItemStructureSetup, function(index, val) {
                            if(val != '' && index.includes('Header')){
                                self.ItemStructureSetup.ConsolidatedTitles = self.ItemStructureSetup.ConsolidatedTitles + val +' | ';   
                            }
                        });
                        self.ItemStructureSetup.Action = '<button type="button" class="btn btn-block btn-danger"><i class="fa fa-remove"></i> </button>';
                        self.ItemStructureSetup.ID = TemplateIndexLocation;
                        self.TemplatesDetails.push(Object.assign({}, self.ItemStructureSetup));
                        Swal('Template Added Successfully', 'Template was added to the list successfully', 'success');                            
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
            getCompanyData: function() {

                var self = this;
                var auctionTypes = [];

                self.ASTMGR_Number = 0;

                axios.get('/api/data/get_complete_company_details').
                    then((response) => {

                        console.log(response.data);
                        
                        self.AccountSettingForm.companyName = response.data.name;
                        self.AccountSettingForm.CompanyEmployeeRange = response.data.employees_range;
                        self.AccountSettingForm.CompanyIndustry = response.data.industry;
                        self.AccountSettingForm.CompanyCities = response.data.cities;
                        self.AccountSettingForm.companyPEPrefix = response.data.pe_prefix;
                        self.AccountSettingForm.companyRFQPrefix = response.data.rfq_prefix;
                        self.AccountSettingForm.companyComEvalPrefix = response.data.ce_prefix;
                        self.AccountSettingForm.companyPOPrefix = response.data.po_prefix;
                        self.AccountSettingForm.companyRNPrefix = response.data.rn_prefix;
                        self.AccountSettingForm.companyLoMManditory = response.data.lom_manditory;
                        self.AccountSettingForm.companyLoMPrefix = response.data.lom_prefix;
                            
                        console.log(self.AccountSettingForm);
                        
                    })
                    .catch(error => { 
                        console.log(error); 
                    });
            },
            UpdateCompanyDetails(){

                if (event) event.preventDefault();

                axios.post('/api/users/update_company_details', this.AccountSettingForm)
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Compnay Details Update)', 'error');
                    });

            }
        },
        mounted(){

            // this.EmployeesList.push({
            //     fullName: this.currentUser.name,
            //     email: this.currentUser.Email,
            //     designation: this.currentUser.Designation,
            // })

            // CustomJs();

        },
        created(){
            this.getCompanyData();

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
