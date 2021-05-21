<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Library of Materials Templates</h4>
                </div>
                <div class="card-body">
                    <!-- <p class="text-danger">This is item strucutre setup page. You are allowed to have a one time setup to structure your item master, The setup is not reversable and once submitted can not be reverted again as it defines the item database structure which will be use across your company. You can define and name your fields to any name as well as mark those fieldsa as required or non-required to indicate whether they must be filled during new item creation. As you select the field please be mindfull of the applicability of the required fields across all possible items which might be created. Additionally, the system will automatically add one field which is "Item Description Field" and it will be mandatory. <b class="font-bold">Please note that the fields below are following hierarchical structure which will help in categorizing, classifying and selecting the items along with ease of item creation. If the field is maked as non-mandatory then it does not follow hierarchial structure.</b></p> -->

                    <h3 class="text-danger">Templates’ Creation</h3>
                    <p class="text-danger">You are allowed to create as many templates as you wish. Each template can have up to 20 customizable headers. You must decide whether or not capturing a header’s information, during the addition of a material to the Library, is mandatory. Example: <u>Template Name:</u> Light bulbs, <u>Header 1:</u> Type (LED, Fluorescent, HID...) | <u>Header 2:</u> Bulb Base | <u>Header 3:</u> Wattage (W) | <u>Header 4:</u> Voltage (V) ……</p

                    <hr>
                   
                    <div class="card">
                        <div class="card-header">
                            <h4>Library of Materials Templates List</h4>
                        </div>
                        <div class="card-body">
                            <table ref="table" id="ItemsTemplatesList" class="display responsive table table-bordered table-hover" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Template Name</th>
                                        <th>Mandatory Header</th>
                                        <th>Assigned Headers</th>
                                        <th>Linked Items</th>
                                        <th>Created At</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>


                    <hr>

                    <h3>Create New Template:</h3>
                    
                    
                    <el-form :model="ItemStructureSetup" class="demo-form-inline" :rules="FormRules" ref="ItemStructureSetupForm">
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Template_Name">
                                        <span slot="label"><b>Template Name</b></span>
                                        <el-input ref="Template_Name" v-model="ItemStructureSetup.Template_Name" placeholder="Enter Template Name"></el-input>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_1_Required">
                                        <span slot="label"><b>Set Header 1</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(1, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Required" placeholder="Header 1">
                                            <el-option label="Yes" :value="true"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_1_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>

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
                                    <el-form-item label="temp" prop="Field_1_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_1" :disabled="ItemStructureSetup.Field_1_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_1_Mandatory" placeholder="Select Mandatory Option">
                                            <el-option label="Yes" value="Yes"></el-option>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-2">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_2_Required">
                                        <span slot="label"><b>Set Header 2</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(2, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Required" placeholder="Header 2">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_2_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_2_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_2" :disabled="ItemStructureSetup.Field_2_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_2_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_3_Required">
                                        <span slot="label"><b>Set Header 3</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(3, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Required" placeholder="Header 3">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_3_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_3_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_3" :disabled="ItemStructureSetup.Field_3_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_3_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_4_Required">
                                        <span slot="label"><b>Set Header 4</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(4, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Required" placeholder="Header 4">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_4_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_4_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_4" :disabled="ItemStructureSetup.Field_4_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_4_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_5_Required">
                                        <span slot="label"><b>Set Header 5</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(5, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Required" placeholder="Header 5">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_5_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_5_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_5" :disabled="ItemStructureSetup.Field_5_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_5_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_6_Required">
                                        <span slot="label"><b>Set Header 6</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(6, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Required" placeholder="Header 6">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_6_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_6_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_6" :disabled="ItemStructureSetup.Field_6_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_6_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_7_Required">
                                        <span slot="label"><b>Set Header 7</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(7, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Required" placeholder="Header 7">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_7_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_7_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_7" :disabled="ItemStructureSetup.Field_7_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_7_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_8_Required">
                                        <span slot="label"><b>Set Header 8</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(8, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Required" placeholder="Header 8">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_8_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_8_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_8" :disabled="ItemStructureSetup.Field_8_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_8_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_9_Required">
                                        <span slot="label"><b>Set Header 9</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(9, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Required" placeholder="Header 9">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_9_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_9_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_9" :disabled="ItemStructureSetup.Field_9_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_9_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_10_Required">
                                        <span slot="label"><b>Set Header 10</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(10, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Required" placeholder="Header 10">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_10_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_10_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_10" :disabled="ItemStructureSetup.Field_10_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_10_Mandatory" placeholder="Select Mandatory Option">   
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
                                    <el-form-item label="temp" prop="Field_11_Required">
                                        <span slot="label"><b>Set Header 11</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(11, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Required" placeholder="Header 11">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_11_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_11_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_11" :disabled="ItemStructureSetup.Field_11_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_11_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_12_Required">
                                        <span slot="label"><b>Set Header 12</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(12, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Required" placeholder="Header 12">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_12_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_12_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_12" :disabled="ItemStructureSetup.Field_12_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_12_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_13_Required">
                                        <span slot="label"><b>Set Header 13</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(13, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Required" placeholder="Header 13">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_13_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_13_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_13" :disabled="ItemStructureSetup.Field_13_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_13_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_14_Required">
                                        <span slot="label"><b>Set Header 14</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(14, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Required" placeholder="Header 14">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_14_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_14_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_14" :disabled="ItemStructureSetup.Field_14_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_14_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_15_Required">
                                        <span slot="label"><b>Set Header 15</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(15, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Required" placeholder="Header 15">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_15_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_15_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_15" :disabled="ItemStructureSetup.Field_15_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_15_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_16_Required">
                                        <span slot="label"><b>Set Header 16</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(16, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Required" placeholder="Header 16">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_16_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_16_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_16" :disabled="ItemStructureSetup.Field_16_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_16_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_17_Required">
                                        <span slot="label"><b>Set Header 17</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(17, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Required" placeholder="Header 17">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_17_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_17_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_17" :disabled="ItemStructureSetup.Field_17_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_17_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_18_Required">
                                        <span slot="label"><b>Set Header 18</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(18, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Required" placeholder="Header 18">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_18_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_18_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_18" :disabled="ItemStructureSetup.Field_18_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_18_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_19_Required">
                                        <span slot="label"><b>Set Header 19</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(19, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Required" placeholder="Header 19">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_19_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_19_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
                                        <el-select ref="Mandatory_19" :disabled="ItemStructureSetup.Field_19_Required ? null : true" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_19_Mandatory" placeholder="Select Mandatory Option">
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
                                    <el-form-item label="temp" prop="Field_20_Required">
                                        <span slot="label"><b>Set Header 20</b></span>
                                        <el-select :disabled="Set_Required" @change="SetRequired(20, $event)" style="width: 100%; padding: 0px;" v-model="ItemStructureSetup.Field_20_Required" placeholder="Header 20">
                                            <el-option label="Yes" :value="true"></el-option>    
                                            <el-option label="No" :value="false"></el-option>    
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="Field_20_Header">
                                        <span slot="label"><b>Enter Header Description</b></span>
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
                                    <el-form-item label="temp" prop="Field_20_Mandatory">
                                        <span slot="label"><b>Is this header mandatory when materials are added under this template?</b></span>
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
                            <button type="button" @click="SubmitItemSetupForm" class="btn btn-success btn-block waves-effect text-center">Create Library of Materials Template</button>
                        </div>


                    </el-form>
                </div>
            </div>
        </div>
    </div>
            
</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'item-template-setup',
        data(){
            return{
                DataTable: '',
                Set_Required: false,
                ItemStructureSetup: {
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

                },
                FormRules: {
                    Template_Name: [{
                        required: true,
                        message: "Template Name Required",
                        trigger: ["blur", "change"]
                    }],
                    Field_1_Required: [{
                        required: true,
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                        message: "This Field Is Required",
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
                }
            }
        },
        methods: {
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

                        axios.post('/api/users/delete_item_master_template', {TemplateID: RecordID})
                            .then((response) => {

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                this.DataTable.draw('full-hold');

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                            });

                    }

                    
                })

            },
            SetRequired: function(fieldNumber, event){
                let SelectedHeader = 'Field_'+fieldNumber+'_Header';
                let MandaHeader = 'Field_'+fieldNumber+'_Mandatory';
                // console.log(event);
                if(event){
                    this.FormRules[SelectedHeader][0].required = true;
                    this.FormRules[MandaHeader][0].required = true;
                } else {
                    this.FormRules[SelectedHeader][0].required = false;
                    this.FormRules[MandaHeader][0].required = false;
                }
                
            },
            SubmitItemSetupForm: function() {
                let self = this;
                let duplicated = false;
                self.ItemStructureSetup.ConsolidatedTitles = "";
                this.$refs.ItemStructureSetupForm.validate((validation) => {

                    if(validation){

                        axios.post('/api/users/item_master_setup', this.ItemStructureSetup)
                            .then((response) => {

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'ErrorInItemTemplateCreation');
                            });
                    }
                })
               
            },
        },
        computed: {
            
        },
        mounted(){


            let self = this;


            const table = $('#ItemsTemplatesList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_item_master_templates',
                columns: [
                    { data: 'template_group_id', name: 'template_group_id' },
                    { data: 'template_name', name: 'template_name' },
                    { data: 'u_o_m', name: 'u_o_m' },
                    { data: 'description', name: 'description' },
                    { data: 'items_count', name: 'items_count' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 1 },
                    { responsivePriority: 2, targets: 5 },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'ItemMasterTemplatesList' },
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


            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }

                self.deleteTemplate(RecordID);
               
            });


            self.DataTable = table;

        },
    }

</script>