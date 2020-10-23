<template>

	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Purchase Enquiry List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="NewPEList" class="responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Purchase Enquiry #</th>
                                <th>Grouping ID</th>
                                <th>Created By</th>
                                <th>Purchase Enquiry Type</th>
                                <th>Requested Item</th>
                                <th>Service Desc.</th>
                                <th>Quantity</th>
                                <th>UoM</th>
                                <th>Advanced Payment</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="PurchaseEnquiryModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Enquiry Number: {{ ViewModalInfo.id }} (View)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Purchase Enquiry Number (ID):</b></td>
                                        <td>PE-{{ ViewModalInfo.purchase_enquiry_group_id }} - {{ ViewModalInfo.purchase_enquiry_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Set-up Name:</b></td>
                                        <td>{{ ViewModalInfo.project_id }} - {{ ViewModalInfo.project.title }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Item </b></td>
                                        <td>{{ ViewModalInfo.item_description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Quantity: </b></td>
                                        <td>{{ ViewModalInfo.quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Advanced: </b></td>
                                        <td>{{ ViewModalInfo.advanced_payment }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Delivery Location: </b></td>
                                        <td>{{ ViewModalInfo.location_name }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="col-lg-12">
                            <hr> 
                        </div>

                        <div class="col-lg-12">
                            <h3>Approvals History:</h3>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Action Description</th>
                                        <th>Action By</th>
                                        <th>Next Action By</th>
                                        <th>Current Approval Level</th>
                                        <th>Next Approval Level</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ item.description }}</td>
                                        <td>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.next_action_owners }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td>{{ item.next_approval_level }}</td>
                                        <td>{{ item.decision }}</td>
                                        <td>{{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                    </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>

        <div id="PurchaseEnquiryModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PurchaseEnquiryModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Purchase Enquiry Number: {{ EditModalInfo.id }} (Edit)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Purchase Enquiry Number (ID):</b></td>
                                        <td>PE-{{ EditModalInfo.id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ EditModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ EditModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ EditModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ EditModalInfo.approval_level }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <el-form :model="EditModalInfo" class="demo-form-inline" :rules="rules" ref="PurchaseEnquiryForm">

			                        <el-row :gutter="20">
                                        

                                        <transition v-if="CompanySetup.setup_mode == 'Project Wise'">
                                            <el-col :span="24">
                                                <div class="grid-content">
                                                    <el-form-item label="Select Job Number" prop="project_id">

                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="EditModalInfo.project_id" placeholder="Select Job Number">
                                                            
                                                            <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </transition>
			                            

			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Service'">
			                                <div class="grid-content">
			                                    
			                                    <el-form-item label="Enter Service Description" prop="service_description">
			                                        <el-input
			                                            type="textarea"
			                                            :rows="6"
			                                            placeholder="Enter Complete Description Of The Service Required."
			                                            v-model="EditModalInfo.service_description">
			                                        </el-input>
			                                    </el-form-item>
			                                    
			                                </div>
			                            </el-col>


			                            <button v-if="EditModalInfo.enquiry_type == 'Service'" type="button" @click="SubmitUpdateService" class="btn btn-success btn-block waves-effect text-center">Submit Purchase Enquiry For Service</button>


			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Materials' && this.CompanySetup.additional_required_1 == 'Yes'">
			                                <div class="grid-content">
			                                    <el-form-item label="Underlying Transaction Ref#" prop="underlying_transaction">

			                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
			                                            <span class="tooltip-item2">
			                                                <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
			                                                
			                                            </span>
			                                            <span class="tooltip-content4 clearfix">
			                                                <span class="tooltip-text2">
			                                                    <strong>Quasars</strong> are believed to be powered by accretion of material into supermassive black holes in the nuclei of distant galaxies, making these luminous versions of the general...
			                                                </span>
			                                            </span>
			                                        </span>

			                                        <el-input v-model="EditModalInfo.underlying_transaction" placeholder="e.g. PE#1213412-ER Or 35633-1 Or 213/2018/4521"></el-input>

			                                    </el-form-item>
			                                </div>
			                            </el-col>


			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Materials' && (this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries')">
			                                <div class="grid-content">
			                                    <el-form-item label="Select an Item from the list" prop="item_id">
			                                        <el-select style="width: 100%"
			                                            v-model="EditModalInfo.item_id"
			                                            filterable
			                                            remote
			                                            :remote-method="searchItems"
			                                            :loading="searchItemsLoading"
			                                            placeholder="Search and Select an Item">
			                                            <el-option
			                                                v-for="item in FoundItems"
			                                                :key="item.id"
			                                                :label="item.field_1+' | '+item.field_2+' | '+item.field_3"
			                                                :value="item.id">
			                                                <div class="row">
			                                                    <div class="col-lg-2" style="padding-left: 0px; padding-top: 5px; padding-buttom: 0px; padding-right: 0px;" >
			                                                       <img  class="img-thumbnail vertical-middle" :src="hostName+'/uploads/ItemMasterPictures/'+item.picture">
			                                                        
			                                                    </div>
			                                                    <div class="col-lg-3" style="padding-left: 10px; padding-top: 10px; padding-buttom: 0px; padding-right: 0px; line-height: 10px;" >
			                                                        <table class="table itemTable">
			                                                            <tr>
			                                                                <td width="20%"><b>Item Number:</b></td>
			                                                                <td> IM-{{ item.id }}</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td><b>Field 1:</b></td>
			                                                                <td> {{ item.field_1 }}</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td><b>Field 2:</b></td>
			                                                                <td>{{ item.field_2 }}</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td><b>Field 3:</b></td>
			                                                                <td>{{ item.field_3 }}</td>
			                                                            </tr>
			                                                        </table>
			                                                    </div>
			                                                    <div class="col-lg-6" style="padding-left: 10px; padding-top: 10px; padding-buttom: 0px; padding-right: 0px;">
			                                                        <div>
			                                                            <p><b>Description:</b> {{ item.description }}</p>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                                
			                                            </el-option>
			                                        </el-select>

			                                    </el-form-item>
			                                </div>
			                            </el-col>


			                        


			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Materials' && this.CompanySetup.lom_manditory == 'FreeText'" >
			                                <div class="grid-content">

			                                    <el-form-item label="Enter Item Description" prop="item_description">
			                                        <el-input
			                                            type="textarea"
			                                            :rows="4"
			                                            placeholder="Enter Complete Description Of The Item Required."
			                                            v-model="EditModalInfo.item_description">
			                                        </el-input>
			                                    </el-form-item>

			                                </div>
			                            </el-col>

			                            <el-col :span="12" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <div class="grid-content">

			                                    <el-form-item label="Enter Item Quantity" prop="quantity">
			                                        <el-input type="number" placeholder="Enter Item Quantity" v-model="EditModalInfo.quantity">
			                                        </el-input>
			                                    </el-form-item>

			                                </div>
			                            </el-col>
			                            
			                            <el-col :span="12" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <div class="grid-content">

			                                    <el-form-item label="Select Unit Of Measurement" prop="u_o_m">

			                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="EditModalInfo.u_o_m" placeholder="Select Unit Of Measurement">
			                                                
			                                            <el-option label="Metre" value="Metre"></el-option>
			                                            <el-option label="Millimeter" value="Millimeter"></el-option>
			                                            <el-option label="Centimeter" value="Centimeter"></el-option>
			                                            <el-option label="Decimeter" value="Decimeter"></el-option>
			                                            <el-option label="Kilometer" value="Kilometer"></el-option>
			                                            <el-option label="Light Year Light" value="Year"></el-option>
			                                            <el-option label="Parsec" value="Parsec"></el-option>
			                                            <el-option label="Inch" value="Inch"></el-option>
			                                            <el-option label="Foot" value="Foot"></el-option>
			                                            <el-option label="Yard" value="Yard"></el-option>
			                                            <el-option label="Mile" value="Mile"></el-option>
			                                            <el-option label="Nautical Mile Nautical" value="Mile"></el-option>
			                                            <el-option label="Square meter Square" value="meter"></el-option>
			                                            <el-option label="Acre" value="Acre"></el-option>
			                                            <el-option label="Are" value="Are"></el-option>
			                                            <el-option label="Hectare" value="Hectare"></el-option>
			                                            <el-option label="Square inches Square" value="inches"></el-option>
			                                            <el-option label="Square feet Square" value="feet"></el-option>
			                                            <el-option label="Square yards Square" value="yards"></el-option>
			                                            <el-option label="Square miles Square" value="miles"></el-option>
			                                            <el-option label="Cubic meter Cubic" value="meter"></el-option>
			                                            <el-option label="Liter" value="Liter"></el-option>
			                                            <el-option label="Milliliter" value="Milliliter"></el-option>
			                                            <el-option label="Centiliter" value="Centiliter"></el-option>
			                                            <el-option label="Deciliter" value="Deciliter"></el-option>
			                                            <el-option label="Hectoliter" value="Hectoliter"></el-option>
			                                            <el-option label="Cubic Inch" value="Cubic Inch"></el-option>
			                                            <el-option label="Cubic Foot" value="Cubic Foot"></el-option>
			                                            <el-option label="Cubic Yard Cubic" value="Cubic Yard"></el-option>
			                                            <el-option label="Acre-Foot"value="Acre-Foot"></el-option>
			                                            <el-option label="Teaspoon" value="Teaspoon"></el-option>
			                                            <el-option label="Tablespoon" value="Tablespoon"></el-option>
			                                            <el-option label="Fluid ounce Fluid" value="ounce"></el-option>
			                                            <el-option label="Cup" value="Cup"></el-option>
			                                            <el-option label="Gill" value="Gill"></el-option>
			                                            <el-option label="Pint" value="Pint"></el-option>
			                                            <el-option label="Quart" value="Quart"></el-option>
			                                            <el-option label="Gallon" value="Gallon"></el-option>
			                                            <el-option label="Radian" value="Radian"></el-option>
			                                            <el-option label="Degree" value="Degree"></el-option>
			                                            <el-option label="Steradian" value="Steradian"></el-option>
			                                            <el-option label="Second" value="Second"></el-option>
			                                            <el-option label="Minute" value="Minute"></el-option>
			                                            <el-option label="Hour" value="Hour"></el-option>
			                                            <el-option label="Day" value="Day"></el-option>
			                                            <el-option label="Year" value="Year"></el-option>
			                                            <el-option label="Hertz" value="Hertz"></el-option>
			                                            <el-option label="Decibel" value="Decibel"></el-option>
			                                            <el-option label="Miles per hour Miles per" value="hour"></el-option>
			                                            <el-option label="Gravity Metric Gravity" value="Metric"></el-option>
			                                            <el-option label="Feet per second Feet per" value="second"></el-option>
			                                            <el-option label="Grams" value="Grams"></el-option>
			                                            <el-option label="Kilogram" value="Kilogram"></el-option>
			                                            <el-option label="Grain" value="Grain"></el-option>
			                                            <el-option label="Dram" value="Dram"></el-option>
			                                            <el-option label="Ounce" value="Ounce"></el-option>
			                                            <el-option label="Pound" value="Pound"></el-option>
			                                            <el-option label="Hundredweight" value="Hundredweight"></el-option>
			                                            <el-option label="Ton" value="Ton"></el-option>
			                                            <el-option label="Tonne" value="Tonne"></el-option>
			                                            <el-option label="Slug" value="Slug"></el-option>
			                                            <el-option label="Density" value="Density"></el-option>
			                                            <el-option label="Newton" value="Newton"></el-option>
			                                            <el-option label="Kilopond" value="Kilopond"></el-option>
			                                            <el-option label="Pond" value="Pond"></el-option>
			                                            <el-option label="Newton meter Newton" value="meter"></el-option>
			                                            <el-option label="Joule" value="Joule"></el-option>
			                                            <el-option label="Watt" value="Watt"></el-option>
			                                            <el-option label="Kilowatt" value="Kilowatt"></el-option>
			                                            <el-option label="Horsepower" value="Horsepower"></el-option>
			                                            <el-option label="Pascal" value="Pascal"></el-option>
			                                            <el-option label="Bar" value="Bar"></el-option>
			                                            <el-option label="Pounds per square inch" value="Pounds per squareinch"></el-option>
			                                            <el-option label="Kelvin" value="Kelvin"></el-option>
			                                            <el-option label="Centigrade" value="Centigrade"></el-option>
			                                            <el-option label="Calorie" value="Calorie"></el-option>
			                                            <el-option label="Fahrenheit" value="Fahrenheit"></el-option>
			                                            <el-option label="Candela" value="Candela"></el-option>
			                                            <el-option label="Candela per square metre" value="Candela per square metre"></el-option>
			                                            <el-option label="Lumen" value="Lumen"></el-option>
			                                            <el-option label="Lux" value="Lux"></el-option>
			                                            <el-option label="Lumen Seconds Lumen" value="Seconds"></el-option>
			                                            <el-option label="Diopter" value="Diopter"></el-option>
			                                            <el-option label="Ampere" value="Ampere"></el-option>
			                                            <el-option label="Coulomb" value="Coulomb"></el-option>
			                                            <el-option label="Volt" value="Volt"></el-option>
			                                            <el-option label="Ohm" value="Ohm"></el-option>
			                                            <el-option label="Farad" value="Farad"></el-option>
			                                            <el-option label="Siemens" value="Siemens"></el-option>
			                                            <el-option label="Henry" value="Henry"></el-option>
			                                            <el-option label="Weber" value="Weber"></el-option>
			                                            <el-option label="Tesla" value="Tesla"></el-option>
			                                            <el-option label="Becquerel" value="Becquerel"></el-option>
			                                            <el-option label="Mole" value="Mole"></el-option>
			                                            <el-option label="Paper Bale" value="Paper Bale"></el-option>
			                                            <el-option label="Dozen" value="Dozen"></el-option>
			                                                
			                                        </el-select>
			                                    </el-form-item>

			                                </div>
			                            </el-col>

			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <div class="grid-content">
			                                    <el-form-item label="Advanced Payment Offered?" prop="advanced_payment">

			                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="EditModalInfo.advanced_payment" placeholder="Advanced Payment Offered?">
			                                                
			                                            <el-option label="Yes" value="Yes"></el-option>
			                                            <el-option label="No" value="No"></el-option>
			                                                
			                                        </el-select>
			                                    </el-form-item>
			                                </div>
			                            </el-col>

			                            <!-- Delivery Location Selection -->
			                            <el-col :span="8" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <el-form-item label="Delivery Longitude" prop="longitude">
			                                    <el-input type="number"  placeholder="Enter Location Longitude Or Select From Map" v-model="EditModalInfo.longitude"></el-input>
			                                </el-form-item>
			                            </el-col>
			                            <el-col :span="8" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <el-form-item label="Delivery Latitude" prop="latitude">
			                                    <el-input type="number" placeholder="Enter Location Longitude Or Select From Map" v-model="EditModalInfo.latitude"></el-input>
			                                </el-form-item>
			                            </el-col>
			                            <el-col :span="8" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <el-form-item label="Locate On Map">
			                                    <button v-if="EditModalInfo.enquiry_type == 'Materials'" type="button"  data-toggle="modal" id="get_map" data-target="#DeliveryLocation" class="btn btn-primary btn-block waves-effect text-center">Select Delivery Location</button>
			                                </el-form-item>
			                            </el-col>



			                            <el-col :span="24" v-if="EditModalInfo.enquiry_type == 'Materials'" >
			                                <div class="grid-content">

			                                    <el-form-item label="Addtional Notes" prop="notes">
			                                        <el-input
			                                            type="textarea"
			                                            :rows="4"
			                                            placeholder="Enter Purchase Enqiury Line Note."
			                                            v-model="EditModalInfo.notes">
			                                        </el-input>
			                                    </el-form-item>
			                                </div>
			                            </el-col>

			                            <button v-if="EditModalInfo.enquiry_type == 'Materials'" type="button" @click="SubmitUpdatePurchaseRequest" class="btn btn-success btn-block waves-effect text-center">Update Purchase Enquiry</button>

			                            <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="CancelPurchaseEnquiry" class="btn btn-danger btn-block waves-effect text-center">Cancel Purchase Enquiry</button>
                                        </el-col>

			                        </el-row>
			                    </el-form>
                            </div>
                        </div>                 
                    </div>
                </div>
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
                        <p class="text-muted">Select Delivery Location by Dragging and Drops the Marker on Map</p>
                    </div>
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Done</button>
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

                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                hostName: window.location.protocol+'//'+window.location.hostname,
                CompanySetup: {},
                stikyKit: {
                    options: {
                        offset_top: 140
                    },
                },
                JobNumbers: [],
                FoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                EditModalInfo: {
                    underlying_transaction: "",
                    project_id: "",
                    enquiry_type: "",
                    service_description: "",
                    item_id: "",
                    item_description: "",
                    quantity: "",
                    u_o_m: "",
                    advanced_payment: "",
                    notes: "",
                    longitude: '',
                    latitude: ''
                },
                PurchaseEnquiryAll: [],
                PEModalInfoKey: "",
                PEModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    project_id: [{
                        required: true,
                        message: "Please Select Job Number",
                        trigger: ["blur", "change"]
                    }],
                    underlying_transaction: [{
                        required: false,
                        message: "Please Underlying Transaction",
                        trigger: "blur"
                    }],
                    enquiry_type: [{
                        required: true,
                        message: "Please Select Transaction Type",
                        trigger: ["blur", "change"]
                    }],
                    service_description: [{
                        required: true,
                        message: "Please Enter Service Description",
                        trigger: "blur"
                    }],
                    item_id: [{
                        required: false,
                        message: "Please Select an Item",
                        trigger: "blur"
                    }],
                    item_description: [{
                        required: false,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    quantity: [{
                        required: true,
                        message: "Please Enter Quantity",
                        trigger: "blur"
                    }],
                    u_o_m: [{
                        required: true,
                        message: "Please Select Unit of Measurement",
                        trigger: ["blur", "change"]
                    }],
                    advanced_payment: [{
                        required: true,
                        message: "Please Select Advanced Payment Requirements.",
                        trigger: "blur"
                    }],
                    longitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    latitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }]
                },
                
            }
        },
        methods: {


        	CancelPurchaseEnquiry(){
                axios.post( '/api/purchase_enquiry/cancel_purchase_enquiry_request', {PurchaseEnquiryId: this.EditModalInfo.id})
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });


                this.$nextTick(() => {
                    $('#PurchaseEnquiryModalEdit').modal('toggle');
                    this.DataTable.draw('full-hold');
                });

            }, 

        	searchItems(value) {
                this.EditModalInfo.item_id = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_items', {searchQuery: value})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                    })
            },

            SubmitUpdateService() {
                if (event) event.preventDefault();

                this.PurchaseEnquiryAll.push(Object.assign({}, this.EditModalInfo));

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

                this.$nextTick(() => {
                    $('#PurchaseEnquiryModalEdit').modal('toggle');
                    this.DataTable.draw('full-hold');
                });

            },

            SubmitUpdatePurchaseRequest() {
                if (event) event.preventDefault();
                
                axios.post('/api/purchase_enquiry/update_purchase_enquiry_request', this.EditModalInfo)
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


                this.$nextTick(() => {
                    $('#PurchaseEnquiryModalEdit').modal('toggle');
                    this.DataTable.draw('full-hold');
                });

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

            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#PurchaseEnquiryModalView').modal('toggle');
                    })

                this.viewDataLoaded = false;  
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_purchase_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        //console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#PurchaseEnquiryModalEdit').modal('toggle');
                    })

                this.editDataLoaded = false;
            },
            
        },
        mounted(){

        	const self = this

            axios.get('/api/data/get_user_projects_list')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
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
                           this.rules.UnderlyingTransaction[0].required = true; 
                        }

                        if(this.CompanySetup.setup_mode == 'Company Wide'){
                            this.EditModalInfo.project_id = Object.keys(this.JobNumbers)[0];
                        }

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
                    self.EditModalInfo.longitude = marker.getPosition().lat();
                    self.EditModalInfo.latitude = marker.getPosition().lng();
                });


                // When modal window is open, this script resizes the map and resets the map center
                $("#DeliveryLocation").on("shown.bs.modal", function(e) {
                  google.maps.event.trigger(map, "resize");
                  return map.setCenter(myLatLng);
                });

            };

            google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));

            var groupColumn = 1;

            const table = $('#NewPEList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_purchase_enquiries',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'purchase_enquiry_group_id', name: 'purchase_enquiry_group_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'enquiry_type', name: 'enquiry_type' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'service_description', name: 'service_description' },
                    { data: 'quantity', name: 'quantity' },
                    { data: 'u_o_m', name: 'u_o_m' },
                    { data: 'advanced_payment', name: 'advanced_payment' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { visible: false, targets: groupColumn },
                    { responsivePriority: 1, targets: 11 },
                    { responsivePriority: 2, targets: 0 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ groupColumn, 'ASC' ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'PEList' },
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
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
         
                    api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                        if ( last !== group ) {
                            $(rows).eq( i ).before(
                                '<tr class="group"><td colspan="12">Grouping ID: '+group+'</td></tr>'
                            );
         
                            last = group;
                        }
                    } );
                },
                "rowCallback": function( row, data, index ) {
                    console.log(data.status);
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

            

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                console.log(RecordID);
                self.showViewModal(elquentClass, RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showEditModal(elquentClass, RecordID);
            });

            self.DataTable = table;

        },
    }
	
</script>

<style scoped>

    .font-500{
        font-weight: 500;
    }

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
        width:80%;
    }

    .itemTable >tr>td{
      height:20px;
      padding:0px;
      border-top: 0px;
    }

    .el-select-dropdown__item{
        height: 100% !important;
    }

    .el-select-dropdown__wrap{
        max-height: 800px !important
    }

    .el-select-dropdown .el-popper {
        max-width: 700px !important
    }

    #PurchaseEnquiryModalView .modal-dialog {
        min-width:80%;
    }

    #PurchaseEnquiryModalEdit .modal-dialog {
        min-width:80%;
    }



</style>