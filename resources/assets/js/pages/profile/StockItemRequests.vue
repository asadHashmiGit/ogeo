<template>

	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item Requests</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="StockItemRequestList" class="responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Request #</th>
                                <th>Grouping ID</th>
                                <th>Created By</th>
                                <th>Requested Item</th>
                                <th>Start Period</th>
                                <th>End Period</th>
                                <th>Consumption Frequency</th>
                                <th>Quantity</th>
                                <th>UoM</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="StockItemRequestModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemRequestModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Request Number: {{ ViewModalInfo.id }} (View)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Request Number (ID):</b></td>
                                        <td>RCR-{{ ViewModalInfo.id }}</td>
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
                                        <td style="width: 40%"><b>Item Description:</b></td>
                                        <td>{{ ViewModalInfo.item_description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Consumption Frequency </b></td>
                                        <td>{{ ViewModalInfo.consumption_frequency }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Expected Consumption Quantity </b></td>
                                        <td>{{ ViewModalInfo.quantity }} ({{ ViewModalInfo.u_o_m }})</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>Period Start: {{ ViewModalInfo.si_start_period.substring(0,10) }} <br> Period End : {{ ViewModalInfo.si_end_period.substring(0,10) }}</td>
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

        <div id="StockItemRequestModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemRequestModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Request: {{ EditModalInfo.id }} (Edit)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Request (ID):</b></td>
                                        <td>SIR-{{ EditModalInfo.id }}</td>
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
                                <el-form :model="EditModalInfo" class="demo-form-inline" :rules="rules" ref="StockItemRequestEditForm">

			                        <el-row :gutter="20">
                                        

                                        
                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="Select Store Number" prop="project_id">

                                                    <el-select filterable style="width: 100%; padding: 0px;" v-model="EditModalInfo.project_id" placeholder="Select Job Number">
                                                        
                                                        <el-option v-for="(StoreNumber, StoreNumberId, index) in StoreNumbers" :key="StoreNumberId" :label="'Number: '+ StoreNumberId + '   -   Name: '+StoreNumber" :value="StoreNumberId"></el-option>
                                                        
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </el-col>
                                        


			                            <el-col :span="24" v-if="this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'">
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


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="Select Stock Item Request Start Date" prop="StockItemRequestStartPeriod">
                                                    
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
                                                      v-model="EditModalInfo.si_start_period"
                                                      type="date"
                                                      placeholder="Start date"
                                                      :default-time="['00:00:00']"
                                                      value-format="yyyy-MM-dd HH:mm:ss">
                                                    </el-date-picker>
                                                    
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="Select Stock Item Request End Date" prop="StockItemRequestEndPeriod">
                                                    
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
                                                      v-model="EditModalInfo.si_end_period"
                                                      type="date"
                                                      placeholder="End date"
                                                      :default-time="['23:59:59']"
                                                      value-format="yyyy-MM-dd HH:mm:ss">
                                                    </el-date-picker>
                                                    
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="Item Expepected Consumption Frequency" prop="consumption_frequency">
                                                    
                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                        <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2"><strong>Euclid</strong>, Description can be added here.</span>
                                                        </span>
                                                    </span>

                                                    <el-select style="width: 100%; padding: 0px;" v-model="EditModalInfo.consumption_frequency">
                                                        <el-option label="Daily" value="Daily"></el-option>  
                                                        <el-option label="Weekly" value="Weekly"></el-option>  
                                                        <el-option label="Biweekly" value="Biweekly"></el-option>  
                                                        <el-option label="Monthly" value="Monthly"></el-option>  
                                                        <el-option label="Bimonthly" value="Bimonthly"></el-option>  
                                                        <el-option label="Quarterly" value="Quarterly"></el-option>  
                                                        <el-option label="Half Yearly" value="Half Yearly"></el-option>  
                                                        <el-option label="Yearly" value="Yearly"></el-option>  
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </el-col>

			                            <el-col :span="12">
			                                <div class="grid-content">

			                                    <el-form-item label="Enter Item Quantity" prop="quantity">
			                                        <el-input type="number" placeholder="Enter Item Quantity" v-model="EditModalInfo.quantity">
			                                        </el-input>
			                                    </el-form-item>

			                                </div>
			                            </el-col>
			                            
			                            <el-col :span="12">
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


			                            <el-col :span="24" >
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

			                            <button type="button" @click="SubmitUpdateStockItemRequest" class="btn btn-success btn-block waves-effect text-center">Update Stock Item Request</button>

			                            <el-col :span="24">
                                            <hr>
                                            <button type="button" @click="CancelStockItemRequest" class="btn btn-danger btn-block waves-effect text-center">Cancel Item Contract Rate Request</button>
                                        </el-col>

			                        </el-row>
			                    </el-form>
                            </div>
                        </div>                 
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>


<script>

	import validate from 'validate.js';

    export default {
        name: 'stock-item-requests',
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
                StoreNumbers: [],
                FoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                EditModalInfo: {
                    project_id: "",
                    item_id: "",
                    item_description: "",
                    si_start_period: "",
                    si_end_period: "",
                    consumption_frequency: "Weekly",
                    quantity: "",
                    u_o_m: "",
                    notes: "",
                },
                StockItemAllItems: [],
                SIRItemModalInfoKey: "",
                SIRItemModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    project_id: [{
                        required: true,
                        message: "Please Select Job Number",
                        trigger: ["blur", "change"]
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
                    consumption_frequency: [{
                        required: true,
                        message: "Please Enter Consumption Frequency",
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
                },
                
            }
        },
        methods: {
        	CancelStockItemRequest(){

                let self = this;

                axios.post('/api/stores/cancel_stock_item_request', {ItemStockItemRequestId: this.EditModalInfo.id})
                    .then(function(response){
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 5000
                        });

                        self.DataTable.ajax.reload( null, false );
                        
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                    });


                this.$nextTick(() => {
                    $('#StockItemRequestModalEdit').modal('toggle');
                    this.DataTable.draw('full-hold');
                });

            }, 

        	searchItems(value) {
                this.EditModalInfo.item_id = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_items_non_stock', {searchQuery: value})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                    })
            },

            SubmitUpdateStockItemRequest() {

                let self = this;
                if (event) event.preventDefault();
                
                axios.post('/api/stores/update_stock_item_request', this.EditModalInfo)
                    .then(function(response){
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Stock Item Request Submit)', 'error');
                    });

                    $('#StockItemRequestModalEdit').modal('toggle');
              

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
                axios.post('/api/data/get_stock_item_requests_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#StockItemRequestModalView').modal('toggle');
                    })

                this.viewDataLoaded = false;  
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                let self = this;
                axios.post('/api/data/get_stock_item_requests_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        //console.log(this.EditModalInfo);
                        this.editDataLoaded = true;
                        $('#StockItemRequestModalEdit').modal('toggle');
                    })

                this.editDataLoaded = false;
            },
            
        },
        mounted(){

        	const self = this

            axios.get('/api/data/get_user_stores_list')
                .then((FirstResponse) => {
                    this.StoreNumbers = FirstResponse.data;
                    //console.log(this.StoreNumbers);
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {

                        this.CompanySetup = SecondResponse.data;

                        if(this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'){
                            this.rules.item_id[0].required = true;
                        } else {
                            this.rules.item_description[0].required = true;
                        }

                    });
                });


            var groupColumn = 1;

            const table = $('#StockItemRequestList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_stock_item_requests',
                columns: [
                    { data: 'stock_item_request_ingroup_id', name: 'stock_item_request_ingroup_id' },
                    { data: 'stock_item_request_group_id', name: 'stock_item_request_group_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'si_start_period', name: 'si_start_period' },
                    { data: 'si_end_period', name: 'si_end_period' },
                    { data: 'consumption_frequency', name: 'consumption_frequency' },
                    { data: 'quantity', name: 'quantity' },
                    { data: 'u_o_m', name: 'u_o_m' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { visible: false, targets: groupColumn },
                    { responsivePriority: 1, targets: 10 },
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
                    { extend: 'excel', className: 'btn btn-success', title: 'RateContractRequests' },
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
                    //console.log(data.status);
                    if(data.status.indexOf('Created and Assigned to') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('sent for stock creation') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Stock Item Created') !== -1) {
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

    #StockItemRequestModalView .modal-dialog {
        min-width:80%;
    }

    #StockItemRequestModalEdit .modal-dialog {
        min-width:80%;
    }



</style>