<template>
        
    <div class="row">
        <div id='Rate_Contract_Request_Form' class="col-lg-7">
            <div class="card" v-if="CompanyDetailsLoaded">
                <div class="card-header">
                    <h4>Create A Rate Contract Creation Request</h4>
                </div>
                <div class="card-body" v-if="this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'">
                    <el-form :model="RateContractItemLine" class="demo-form-inline" :rules="rules" ref="RateContractRequestForm">

                        <el-row :gutter="20">  


                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Job Number" prop="JobNumber">

                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="RateContractItemLine.JobNumber" placeholder="Select Job Number">
                                            
                                            <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>                      
        
                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select an Item from the list" prop="ItemNumber">
                                        <el-select style="width: 100%"
                                            v-model="RateContractItemLine.ItemNumber"
                                            filterable
                                            remote
                                            :remote-method="searchItems"
                                            :loading="searchItemsLoading"
                                            placeholder="Search and Select an Item">
                                            <el-option
                                                v-for="item in FoundItems"
                                                :key="item.id"
                                                :label="item.id"
                                                :value="item.id">
                                                <div class="row">
                                                    <div class="col-lg-2" style="padding-left: 0px; padding-top: 5px; padding-buttom: 0px; padding-right: 0px;" >
                                                       <img  class="img-thumbnail vertical-middle" :src="hostName+'/uploads/ItemMasterPictures/'+item.picture">
                                                        
                                                    </div>
                                                    <div class="col-lg-3" style="padding-left: 10px; padding-top: 10px; padding-buttom: 0px; padding-right: 0px; line-height: 10px;" >
                                                        <table class="table itemTable">
                                                            <tr>
                                                                <td width="25%"><b>Item Number:</b></td>
                                                                <td> IM-{{ item.id }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ item.item_template.field_1 }}:</b></td>
                                                                <td> {{ item.field_1 }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ item.item_template.field_2 }}:</b></td>
                                                                <td>{{ item.field_2 }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ item.item_template.field_3 }}:</b></td>
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

                            <!-- <el-col :span="24" v-if="this.CompanySetup.lom_manditory == 'FreeText'" >
                                <div class="grid-content">
                            
                                    <el-form-item label="Enter Material Description" prop="ItemDescription">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Complete Description Of The Item Required."
                                            v-model="RateContractItemLine.ItemDescription">
                                        </el-input>
                                    </el-form-item>
                            
                                    <span style="margin-top: -20px;" class="float-right">1,000/{{RateContractItemLine.ItemDescription.length}}</span>
                                </div>
                            </el-col> -->

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Rate Contract Start And End Date" prop="RateContractPeriod">
                                        
                                    <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                        <span class="fa-stack fa-1x">
                                                <i style="color: #FF2F2F" class="fa fa-circle fa-lg fa-stack-1x"></i>
                                                <i style="color: white" class="fa fa-info fa-stack-1x"></i> 
                                            </span>
                                        <span style="bottom: -80px; left: 220px; width: 500px;" class="tooltip-content4 clearfix">
                                            <span class="tooltip-text2">Something here. </span>
                                        </span>
                                    </span>

                                        <el-date-picker
                                          style="width: 100%"
                                          v-model="RateContractItemLine.RateContractItemPeriod"
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

                            <el-col :span="12" >
                                <div class="grid-content">

                                    <el-form-item label="Enter Expected Consumption Quantity" prop="Quantity">
                                        <el-input min='0.0000001' type="number" placeholder="Enter Expected Consumption Quantity" v-model="RateContractItemLine.Quantity">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>
                            
                            <el-col :span="12" >
                                <div class="grid-content">

                                    <el-form-item label="Enter Unit Of Measurement" prop="UnitOfMeasurement">

                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                    <strong>The Unit of Measurement</strong> shall be selected carefully by the user as it will a very important part of the Request for Proposal that shall be sent to the vendors. Examples of Units of Measurement: carton(s) of 300 milliliters bottles; length(s) of 6 meters; box(es) of 150 units; …..
                                                </span>
                                            </span>
                                        </span>

                                        <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="RateContractItemLine.UnitOfMeasurement" placeholder="Enter Unit Of Measurement">
                                                
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

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Documents Required From The Vendors" prop="RequiredDocuments">
                                            
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                    These are the documents that the vendors need to submit along with their commercial proposals, so that their proposals can be assessed.
                                                </span>
                                            </span>
                                        </span>

                                        <el-select filterable collapse-tags allow-create multiple style="width: 100%; padding: 0px;" v-model="RateContractItemLine.RequiredDocuments" placeholder="Select Required Docuement">
                                            
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

                            <!-- <el-col :span="24" >
                                <div class="grid-content">
                                    <el-form-item label="Will You Consider Offering An Advanced Payment For This?" prop="AdvancedPayment">

                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="RateContractItemLine.AdvancedPayment" placeholder="Advanced Payment Offered?">
                                                
                                            <el-option label="Yes" value="Yes"></el-option>
                                            <el-option label="No" value="No"></el-option>
                                                
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col> -->


                            <!-- Delivery Location Selection -->
                            <!-- <el-col style="display:none" :span="8" >
                                <el-form-item label="Delivery Longitude" prop="Longitude">
                                    <el-input type="number"  placeholder="Enter Location Longitude Or Select From Map" v-model="RateContractItemLine.Longitude"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col style="display:none" :span="8" >
                                <el-form-item label="Delivery Latitude" prop="Latitude">
                                    <el-input type="number" placeholder="Enter Location Longitude Or Select From Map" v-model="RateContractItemLine.Latitude"></el-input>
                                </el-form-item>
                            </el-col>
                            
                            <el-col :span="24" >
                                <el-form-item label="Select the Delivery Location On The Map">
                            
                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                        <span class="tooltip-item2">
                                            <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
                                            
                                        </span>
                                        <span class="tooltip-content4 clearfix">
                                            <span class="tooltip-text2">
                                                You may only select one delivery location address. In case the material needs to be delivered to more than one location, a new Item Line, with a different delivery location address, needs to be created.
                                            </span> <br>
                                            <span class="tooltip-text2">
                                                You may only drop one pin. In case the material needs to be delivered to more than one location, a new Item Line with a different pin drop, needs to be created.
                                            </span>
                                        </span>
                                    </span>
                            
                                    <button type="button"  data-toggle="modal" id="get_map" data-target="#DeliveryLocation" class="btn btn-primary btn-block waves-effect text-center">Select Delivery Location</button>
                                </el-form-item>
                            </el-col> -->
                            
                            <el-col :span="24" >
                                <el-form-item label="Delivery Location Name" prop="LocationName">
                                    <el-input type="text" placeholder="Enter Delivery Location Name" v-model="RateContractItemLine.LocationName"></el-input>
                                </el-form-item>
                            </el-col>

                            <el-col :span="24" >
                                <div class="grid-content">

                                    <el-form-item label="Addtional Notes" prop="ItemLineNote">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Additional Item Line Note."
                                            v-model="RateContractItemLine.ItemLineNote">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            
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
                                <h4>The Rate Contract Items Lines</h4>
                            </div>
                            <div id="Rate_Contract_List_Table" class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr.</th>
                                            <th>Item Details</th>
                                            <th>Quanity</th>
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
                                                <!-- <a class="btn btn-warning float-left" href="#" @click="showItemDetails(key, $event)"><i class="fa fa-edit"></i></a> -->
                                                <a class="btn btn-danger float-left m-l-5" href="#" @click="RemoveItem(key, $event)"><i class="fa fa-remove"></i></a> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <button type="button" @click="SubmitRateContractItemList" class="btn btn-primary btn-block waves-effect text-center">Submit Rate Contract Creation Request</button>
                            </div>
                        </div>
                    </el-col>
                </el-row>
                 <el-row v-else :gutter="20">
                    <div class="card">
                        <div class="card-header">
                            <h4>Rate Contract Item List</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Line.</th>
                                        <th>Item Details</th>
                                        <th>Quantity</th>
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
                            <button type="button" class="btn btn-primary btn-block waves-effect text-center disabled">Submit Rate Contract Creation Request </button>
                        </div>
                    </div>
                 </el-row>
            </div>
        </div>
        
        <div class="row">
            
        
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


        <div class="modal fade" id="RCItemDetailsModalId" tabindex="-1" aria-labelledby="RCItemDetailsModalId" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Item Serial Number ({{ RCItemModalInfoKey + 1 }})</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>

                    <div class="modal-body">
                        <p class="text-muted">{{ RCItemModalInfo.ItemDescription }}</p>
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
                JobNumbers: [],
                CompanyDetailsLoaded: false,
                FoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                RateContractItemLine: {
                    JobNumber: "",
                    ItemNumber: "",
                    ItemDescription: "",
                    RateContractItemPeriod: "",
                    Quantity: "",
                    UnitOfMeasurement: "",
                    AdvancedPayment: "",
                    RequiredDocuments: "",
                    ItemLineNote: "",
                    Longitude: '',
                    Latitude: '',
                    LocationName: ''
                },
                RateContractAllItems: [],
                RCItemModalInfoKey: "",
                RCItemModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    JobNumber: [{
                        required: true,
                        message: "Please Select Job Number",
                        trigger: ["blur", "change"]
                    }],
                    UnderlyingTransaction: [{
                        required: false,
                        message: "Please Underlying Transaction",
                        trigger: "blur"
                    }],
                    ItemNumber: [{
                        required: false,
                        message: "Please Select an Item",
                        trigger: "blur"
                    }],
                    ItemDescription: [{
                        required: false,
                        message: "Please Enter Item Description",
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
        methods: {
            searchItems(value) {
                this.RateContractItemLine.ItemNumber = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_items', {searchQuery: value})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                        console.log(this.FoundItems);
                    })
            },
            AddItem: function() {

                // if(this.RateContractItemLine.Latitude == ""){
                //     Swal('Missing Map Location', 'Please Select a Location on Map to create Item Line', 'warning');
                //     return false;
                // }

                this.$refs.RateContractRequestForm.validate((validation) => {


                    if(validation){
                        this.RateContractAllItems.push(Object.assign({}, this.RateContractItemLine));

                        /*this.RateContractItemLine.ItemNumber = "";
                        this.RateContractItemLine.ItemDescription = "";
                        this.RateContractItemLine.RateContractItemPeriod = "";
                        this.RateContractItemLine.Quantity = "";
                        this.RateContractItemLine.UnitOfMeasurement = "";
                        this.RateContractItemLine.AdvancedPayment = "";
                        this.RateContractItemLine.RequiredDocuments = "";
                        this.RateContractItemLine.ItemLineNote = "";
                        this.RateContractItemLine.Longitude = "";
                        this.RateContractItemLine.Latitude = "";
                        this.RateContractItemLine.LocationName = "";*/

                        // this.scrollTo(0, 1000);
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
               


            /*
             * Google Map inside modal
             */
            // var initializeMap = function(id) {

            //     var myLatLng = {lat: 25.2707688, lng: 55.3227913};

            //     // Map Options
            //     var mapOptions = {
            //         zoom: 10,
            //         center: new google.maps.LatLng(25.2707688, 55.3227913),
            //         mapTypeId: google.maps.MapTypeId.ROADMAP,
            //     };


            //     // Initialize the map with options (inside #map element)
            //     var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            //     var marker = new google.maps.Marker({
            //         position: myLatLng,
            //         map: map,
            //         draggable: true

            //     });


            //     google.maps.event.addListener(marker, 'position_changed', function () {
            //         self.RateContractItemLine.Longitude = marker.getPosition().lat();
            //         self.RateContractItemLine.Latitude = marker.getPosition().lng();
            //     });


            //     // When modal window is open, this script resizes the map and resets the map center
            //     $("#DeliveryLocation").on("shown.bs.modal", function(e) {
            //       google.maps.event.trigger(map, "resize");
            //       return map.setCenter(myLatLng);
            //     });

            // };

            // google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));
            
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

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

</style>