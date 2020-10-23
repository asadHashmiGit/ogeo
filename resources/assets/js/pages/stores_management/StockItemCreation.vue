<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item Creation</h4>
                </div>
                <div class="card-body">
					<el-form :model="StockItemDetails" class="demo-form-inline" :rules="rules" ref="ItemCreationForm">
                        
                        <div class="row">
                            
                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Select Stock Item Purchase Enquiry Generation Type" prop="PEGenerationType">
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                            <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">Additonal Notes Can Added</span>
                                            </span>
                                        </span>
                                        <el-select style="width: 100%; padding: 0px;" v-model="StockItemDetails.PEGenerationType" placeholder="Select Purchase Enquiry Generation Type">
                                            <el-option label="Automatic Generation" value="Automatic"></el-option>  
                                            <el-option label="Manual Generation" value="Manual"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="grid-content">
                                    <el-form-item label="Select Stocking Start & End Window" prop="StockingPeriod">
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                            <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2"><strong>Euclid</strong>, also known as Euclid of Alexandria, was a Greek mathematician, often referred to as the "Father of Geometry". He was active in Alexandria during the reign of Ptolemy I. <a href="http://en.wikipedia.org/wiki/Euclid">Wikipedia</a></span>
                                            </span>
                                        </span>
                                        
                                        <el-date-picker
                                          style="width: 100%"
                                          v-model="StockItemDetails.StockingPeriod"
                                          type="datetimerange"
                                          range-separator="To"
                                          start-placeholder="Start date"
                                          end-placeholder="End date"
                                          :default-time="['00:00:00', '23:59:59']"
                                          value-format="yyyy-MM-dd HH:mm:ss">
                                        </el-date-picker>
                                        
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="grid-content">

                                    <el-form-item label="Minimum Inventory Level?" prop="ReplenishmentLevel">
                                        <el-input min='0.0000001' type="number" placeholder="Enter Minimum Inventory Level" v-model="StockItemDetails.ReplenishmentLevel">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="grid-content">

                                    <el-form-item label="Optimal Order Quantity" prop="ReplenishmentQuantity">
                                        <el-input min='0.0000001' type="number" placeholder="Enter Optimal Order Quantity" v-model="StockItemDetails.ReplenishmentQuantity">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="grid-content">

                                    <el-form-item label="Addtional Notes" prop="StockItemNote">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Additional Note."
                                            v-model="StockItemDetails.StockItemNote">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <hr>
                                <h4> Item Location in the selected store <span v-if="StoreName != ''">{{ '('+StoreName+')' }}</span></h4>
                            </div>
                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Bin Location" prop="Bin">
                                        <el-input placeholder="Enter Bin Location" v-model="StockItemDetails.Bin">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Shelf Location" prop="Shelf">
                                        <el-input placeholder="Enter Shelf Location" v-model="StockItemDetails.Shelf">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Rack Location" prop="Rack">
                                        <el-input placeholder="Enter Rack Location" v-model="StockItemDetails.Rack">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Area Location" prop="Area">
                                        <el-input placeholder="Enter Area Location" v-model="StockItemDetails.Area">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-4">
                                <div class="grid-content">
                                    <el-form-item label="Enter Alley Location" prop="Alley">
                                        <el-input placeholder="Enter Alley Location" v-model="StockItemDetails.Alley">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>


                            

                        </div>


                        <div class="row" >
                            <div class="col-lg-12">

                                <div class="col-lg-12 p-l-0 p-r-0 p-t-10 b-all" style="min-height: 275px; max-height: 600px; overflow-y: auto; overflow-x: hidden;">

                                    <!-- Show Loader -->
                                    <div align="center" v-if="StockItemRequestsRecordsLoading">
                                        <h2>Gathering Data...</h2>
                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                    </div>
                                    <div class="row" v-if="StockItemRequestList.length > 0">
                                        <div style="display: flex; align-items: stretch; width: 95%" v-for="(StockItemRequest, key) in StockItemRequestList" class="col-lg-6 ">
                                          
                                            <div style="cursor: pointer; margin-bottom: 7px" @click="selectedItem(StockItemRequest, $event)" :data-sir="StockItemRequest.id" :data-projid="StockItemRequest.project_id" :data-frequency="StockItemRequest.consumption_frequency" :data-quantity="StockItemRequest.quantity" :id="'StockItemRequest_Id_'+StockItemRequest.id" :class="['card card-body', 'RequestItem_Id_'+StockItemRequest.item.id, 'RequestProject_Id_'+StockItemRequest.project_id]">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <h4>Requested To Store At: {{ StockItemRequest.project.title }}</h4>
                                                        <div class="checkbox checkbox-success check_box_css">
                                                            <input :class="['checkbox_'+StockItemRequest.item.id, 'checkbox_projectid_'+StockItemRequest.project_id]" type="checkbox" :value="'checked_'+StockItemRequest.item.id">
                                                            <label :for="'checkbox'+StockItemRequest.item.id"></label>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-2 text-center">
                                                        <img v-if="StockItemRequest.item.field_1 != '' && StockItemRequest.item.field_1 != null" :src="hostName+'/uploads/ItemMasterPictures/'+StockItemRequest.item.picture" class="img-rounded img-responsive">
                                                        <img v-else :src="hostName+'/assets/images/'+StockItemRequest.item.picture" class="img-rounded img-responsive">
                                                    </div>
                                                    
                                                    <div class="col-lg-3 p-l-0">
                                                        <h6 class="box-title m-b-0"><b>SIR #:</b> {{ StockItemRequest.stock_item_request_group_id }}-{{ StockItemRequest.stock_item_request_ingroup_id }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Item #:</b> {{ StockItemRequest.item.id }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Freq:</b> {{ StockItemRequest.consumption_frequency }}</h6>
                                                        <h6 class="box-title m-b-0"><b>Qty:</b> {{ StockItemRequest.quantity }}</h6>
                                                        <h6 class="box-title m-b-0"><b>UOM:</b> {{ StockItemRequest.u_o_m }}</h6>
                                                        <h6 class="box-title m-b-0 text-primary" style="cursor: pointer;" @mouseover="showPurchaseOrders(StockItemRequest.id)">
                                                            <el-tooltip placement="top-start" effect="light">
                                                                <div slot="content">
                                                                    <div v-if="PurchaseOrdersDataLoaded">
                                                                        <div style="max-width: 600px" class="row">
                                                                            <div class="col-lg-12">
                                                                                <h6>Additional Information</h6>
                                                                                <table style="min-width: 500px" class="table table-bordered">
                                                                                    <thead>
                                                                                        <td align="center"><b>Order</b></td>
                                                                                        <td align="center"><b>Total Quantity</b></td>
                                                                                        <td align="center"><b>Price</b></td>
                                                                                        <td align="center"><b>Lead Time</b></td>
                                                                                        <td align="center"><b>Vendors</b></td>
                                                                                    </thead>
                                                                                    <tbody v-if="StockItemRequest.length > 0">
                                                                                        <tr v-for="(RateContract, key, index) in ItemRateContractDetails" :key="index">
                                                                                            <td align="center">{{ formatPrice(RateContract.vendor_responses[0].unit_rate) }} {{ RateContract.vendor_responses[0].currency }}</td>
                                                                                            <td align="center">{{ RateContract.vendor_responses[0].lead_days }} Day(s)</td>
                                                                                            <td align="center">{{ RateContract.vendor_responses[0].rate_contract_request.rc_end_period.substring(0, 10) }}</td>
                                                                                            <td align="center">{{ RateContract.vendor_responses[0].rate_contract_request.rc_end_period.substring(0, 10) }}</td>
                                                                                            <td align="center">{{ RateContract.vendor_responses[0].rate_contract_request.rc_end_period.substring(0, 10) }}</td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                    <tbody v-else>
                                                                                        <tr>
                                                                                            <td align="center" colspan="5"> No Previous Purchase Order Found </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div align="center" v-else>
                                                                        <h2>Gathering Data...</h2>
                                                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                                                    </div>
                                                                    
                                                                </div>
                                                                <i style="line-height: 0px">More Info</i>
                                                            </el-tooltip>
                                                        </h6>
                                                        
                                                            

                                                        

                                                    </div>
                                                    <div class="col-lg-7">
                                                        <span v-if="StockItemRequest.item.field_1 != '' && StockItemRequest.item.field_1 != null">
                                                        {{ StockItemRequest.item.item_template.field_1 }}: {{ StockItemRequest.item.field_1 }}
                                                        </span>
                                                        <span v-else>
                                                            <h6 class="box-title m-b-0"><b>Item Description:</b></h6>
                                                            {{ StockItemRequest.item_description }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_2 != '' && StockItemRequest.item.field_2 != null">
                                                            | {{ StockItemRequest.item.item_template.field_2 }}: {{ StockItemRequest.item.field_2 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_3 != '' && StockItemRequest.item.field_3 != null">
                                                            | {{ StockItemRequest.item.item_template.field_3 }}: {{ StockItemRequest.item.field_3 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_4 != '' && StockItemRequest.item.field_4 != null">
                                                            | {{ StockItemRequest.item.item_template.field_4 }}: {{ StockItemRequest.item.field_4 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_5 != '' && StockItemRequest.item.field_5 != null">
                                                            | {{ StockItemRequest.item.item_template.field_5 }}: {{ StockItemRequest.item.field_5 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_6 != '' && StockItemRequest.item.field_6 != null">
                                                            | {{ StockItemRequest.item.item_template.field_6 }}: {{ StockItemRequest.item.field_6 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_7 != '' && StockItemRequest.item.field_7 != null">
                                                            | {{ StockItemRequest.item.item_template.field_7 }}: {{ StockItemRequest.item.field_7 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_8 != '' && StockItemRequest.item.field_8 != null">
                                                            | {{ StockItemRequest.item.item_template.field_8 }}: {{ StockItemRequest.item.field_8 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_9 != '' && StockItemRequest.item.field_9 != null">
                                                            | {{ StockItemRequest.item.item_template.field_9 }}: {{ StockItemRequest.item.field_9 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_10 != '' && StockItemRequest.item.field_10 != null">
                                                            | {{ StockItemRequest.item.item_template.field_10 }}: {{ StockItemRequest.item.field_10 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_11 != '' && StockItemRequest.item.field_11 != null">
                                                            | {{ StockItemRequest.item.item_template.field_11 }}: {{ StockItemRequest.item.field_11 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_12 != '' && StockItemRequest.item.field_12 != null">
                                                            | {{ StockItemRequest.item.item_template.field_12 }}: {{ StockItemRequest.item.field_12 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_13 != '' && StockItemRequest.item.field_13 != null">
                                                            | {{ StockItemRequest.item.item_template.field_13 }}: {{ StockItemRequest.item.field_13 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_14 != '' && StockItemRequest.item.field_14 != null">
                                                            | {{ StockItemRequest.item.item_template.field_14 }}: {{ StockItemRequest.item.field_14 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_15 != '' && StockItemRequest.item.field_15 != null">
                                                            | {{ StockItemRequest.item.item_template.field_15 }}: {{ StockItemRequest.item.field_15 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_16 != '' && StockItemRequest.item.field_16 != null">
                                                            | {{ StockItemRequest.item.item_template.field_16 }}: {{ StockItemRequest.item.field_16 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_17 != '' && StockItemRequest.item.field_17 != null">
                                                            | {{ StockItemRequest.item.item_template.field_17 }}: {{ StockItemRequest.item.field_17 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_18 != '' && StockItemRequest.item.field_18 != null">
                                                            | {{ StockItemRequest.item.item_template.field_18 }}: {{ StockItemRequest.item.field_18 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_19 != '' && StockItemRequest.item.field_19 != null">
                                                            | {{ StockItemRequest.item.item_template.field_19 }}: {{ StockItemRequest.item.field_19 }}
                                                        </span>

                                                        <span v-if="StockItemRequest.item.field_20 != '' && StockItemRequest.item.field_20 != null">
                                                            | {{ StockItemRequest.item.item_template.field_20 }}: {{ StockItemRequest.item.field_20 }}
                                                        </span>

                                                        <hr>
                                                        
                                                
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div align="center" v-if="!StockItemRequestsRecordsLoading && StockItemRequestList.length == 0">
                                        <h2>No New Stock Item Requests</h2>
                                    </div>
                                    
                                </div>


                            </div>
                            
                            
                            <div class="col-lg-12"><hr></div>


                            <div class="col-lg-12">
                                <button type="button" @click="CreateStockItem" class="btn btn-success btn-block waves-effect text-center">Create Stock Item</button>
                            </div>



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
        name: 'stock-item-creation',
        data(){
            return{
                hostName: window.location.protocol+'//'+window.location.hostname,
                StockItemRequestsRecordsLoading: true,
                CompanySetup: {},
                StoreNumbers: [],
                PurchaseOrdersDataLoaded: false,
            	StockItemRequestList: "",
                StoreName: "",
                StockItemDetails: {
                	StoreID: "",
                    StockingPeriod: "",
                	PEGenerationType: "Automatic",
                    ReplenishmentQuantity: "",
                    ReplenishmentLevel: "",
                    Bin: "",
                    Shelf: "",
                    Rack: "",
                    Area: "",
                    Alley: "",
                    StockItemNote: "",
                	StockItemRequests: [],
                    ItemIDs: [],
                },
                rules: {
                    StockingPeriod: [{
                        required: true,
                        message: "Please select closure date",
                        trigger: ["blur", "change"]
                    }],
                    PEGenerationType: [{
                        required: true,
                        message: "Please select sourcing type",
                        trigger: ["blur", "change"]
                    }],
                    ReplenishmentQuantity: [{
                        required: true,
                        message: "Please enter Replenishment Quantity",
                        trigger: ["blur"]
                    }],
                    ReplenishmentLevel: [{
                        required: true,
                        message: "Please enter Replenishment Level",
                        trigger: ["blur"]
                    }],
                    StockItemNote: [{
                        required: false,
                        message: "Please enter notes",
                        trigger: ["blur"]
                    }],
                    StockItemRequests: [{
                        required: true,
                        message: "Please select atleast one stock item request",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            showPurchaseOrders(ItemId){
                this.PurchaseOrdersDataLoaded = true;
            },
            selectedItem(StockItemRequest, event) {
                let self = this;

                self.StoreName = StockItemRequest.project.title;
                self.StockItemDetails.StoreID = StockItemRequest.project_id;

                //StockItemRequest.project.store_setup_cost
                //StockItemRequest.project.annual_holding_cost_per_unit
                //StockItemRequest.consumption_frequency
                //StockItemRequest.quantity

                if(self.StockItemDetails.ItemIDs.length == 0){
                    $(".RequestItem_Id_"+StockItemRequest.item.id + ".RequestProject_Id_"+StockItemRequest.project_id).addClass('selectedItem');
                    $(".RequestItem_Id_"+StockItemRequest.item.id + ".RequestProject_Id_"+StockItemRequest.project_id).css('background-color', 'rgb(69, 249, 132, 0.1)');
                    $(".checkbox_"+StockItemRequest.item.id + ".checkbox_projectid_"+StockItemRequest.project_id).attr('checked', 'checked');
                    // self.StockItemDetails.ItemIDs.push(ItemID);
                    self.StockItemDetails.ItemIDs.push({ItemID: StockItemRequest.item.id, ProjectId: StockItemRequest.project_id});
                    let LeadTime = 18;
                    self.StockItemDetails.ReplenishmentLevel = 0;
                    self.StockItemDetails.ReplenishmentQuantity = 0;
                    /* Add all Stock Item requests to list */
                    $.each($('.RequestItem_Id_'+StockItemRequest.item.id + ".RequestProject_Id_"+StockItemRequest.project_id), function(index, details) {
                        
                        if(details.dataset.frequency == 'Daily'){

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * (1/7)) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 365) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Weekly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 7/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 52) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Biweekly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 14/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 26) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Monthly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 30/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 12) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Bimonthly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 60/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 6) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Quarterly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 90/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 4) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Half Yearly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 180/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 2) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else if (details.dataset.frequency == 'Yearly') {

                            self.StockItemDetails.ReplenishmentLevel = ((details.dataset.quantity * 1.1 * 365/7) * LeadTime/7) + self.StockItemDetails.ReplenishmentLevel;
                            self.StockItemDetails.ReplenishmentQuantity = Math.pow((2 * (details.dataset.quantity * 1) * StockItemRequest.project.annual_holding_cost_per_unit / StockItemRequest.project.store_setup_cost), 0.5) + self.StockItemDetails.ReplenishmentQuantity;

                        } else {
                            self.StockItemDetails.ReplenishmentLevel = 0;
                        }

                        
                        
                        self.StockItemDetails.StockItemRequests.push(details.dataset.sir);
                    });

                    self.StockItemDetails.ReplenishmentLevel = self.StockItemDetails.ReplenishmentLevel.toFixed(2);
                    self.StockItemDetails.ReplenishmentQuantity = self.StockItemDetails.ReplenishmentQuantity.toFixed(2);

                    //console.log(self.StockItemDetails.StockItemRequests);
                    //console.log(self.StockItemDetails.ItemIDs);

                } else {

                    var DifferentItem = false;
                    for(var i = 0; i < self.StockItemDetails.ItemIDs.length; i++) {
                        if (self.StockItemDetails.ItemIDs[i].ItemID == StockItemRequest.item.id && self.StockItemDetails.ItemIDs[i].ProjectId == StockItemRequest.project_id) {
                            DifferentItem = true;
                            break;
                        }
                    }

                    if(!DifferentItem){
                        Swal('Stock Item Request Miss Match', 'Only Similar Items Can be Grouped Together.', 'info');
                        return false;
                    } else {
                        $(".RequestItem_Id_"+StockItemRequest.item.id + ".RequestProject_Id_"+StockItemRequest.project_id).removeClass('selectedItem');
                        $(".RequestItem_Id_"+StockItemRequest.item.id + ".RequestProject_Id_"+StockItemRequest.project_id).css('background-color', '');
                        $(".checkbox_"+StockItemRequest.item.id + ".checkbox_projectid_"+StockItemRequest.project_id).attr('checked', false);
                        //self.StockItemDetails.ItemIDs.splice(this.StockItemDetails.ItemIDs.indexOf(StockItemRequest.item.id), 1);
                        self.StockItemDetails.ItemIDs = [];
                        self.StockItemDetails.StockItemRequests = [];
                        self.StockItemDetails.ReplenishmentLevel = 0;
                        self.StockItemDetails.ReplenishmentQuantity = 0;
                        self.StoreName = "";
                    }
                }
                
            },
            CreateStockItem(){
                //check that there is at least one purchase enquiry selected...
                if(this.StockItemDetails.StockItemRequests.length == 0){
                    Swal('No Stock Item Request Selected', 'You must select atleast one Stock Item Request in order to proceed', 'warning');
                } else {
                    this.$refs.ItemCreationForm.validate((validation) => {

                        if(validation){

                            axios.post('/api/stores/create_new_stock_item', this.StockItemDetails)
                                .then((response) => {
                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 5000
                                    });

                                    this.StockItemDetails.PEGenerationType = "Automatic";
                                    this.StockItemDetails.StockingPeriod = "";
                                    this.StockItemDetails.ReplenishmentLevel = "";
                                    this.StockItemDetails.ReplenishmentQuantity = "";
                                    this.StockItemDetails.StockItemNote = "";
                                    this.StockItemDetails.StockItemRequests = "";
                                    this.StockItemDetails.StockItemRequestList = [];

                                    this.StockItemRequestsRecordsLoading = true;
                                    axios.post('/api/data/get_stock_item_request_list_for_creation')
                                        .then((response) => {
                                            this.StockItemRequestList = response.data;
                                            console.log(this.StockItemRequestList);
                                            this.$nextTick(() => {
                                                this.StockItemRequestsRecordsLoading = false;
                                            })        
                                        });


                                    //Refresh The Dual List Table

                                })
                                .catch(function(){
                                    Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Create Stock Item)', 'error');
                                });

                            
                        }
                        
                    })
                }


                

                
            }
        },
        mounted(){

            let self = this;

            axios.post('/api/data/get_stock_item_request_list_for_creation')
                .then((response) => {
                    this.StockItemRequestList = response.data;
                    console.log(this.StockItemRequestList);
                    this.$nextTick(() => {
                        this.StockItemRequestsRecordsLoading = false;
                    })        
                });

            axios.get('/api/data/get_user_stores_list')
                .then((FirstResponse) => {
                    this.StoreNumbers = FirstResponse.data;
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {
                        this.CompanySetup = SecondResponse.data;
                    });
                });
	
        }

    }


</script>

<style scoped>
    

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