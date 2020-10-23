<template>
        
    <div class="row">
        <div id='Stock_Item_Request_Form' class="col-lg-7">
            <div class="card" v-if="CompanyDetailsLoaded">
                <div class="card-header">
                    <h4>New Stock Item Request</h4>
                </div>
                <div class="card-body" v-if="this.CompanySetup.lom_manditory == 'LibrariesNFreeText' || this.CompanySetup.lom_manditory == 'Libraries'">
                    <el-form :model="StockItemRequestItemLine" class="demo-form-inline" :rules="rules" ref="RateContractRequestForm">

                        <el-row :gutter="20">  


                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Store To Stock" prop="StoreNumber">

                                        <el-select filterable style="width: 100%; padding: 0px;" @change="storeChange($event)" v-model="StockItemRequestItemLine.StoreNumber" placeholder="Select Store To Stock">
                                            
                                            <el-option v-for="(StoreNumber, StoreNumberId, index) in StoreNumbers" :key="StoreNumberId" :label="'Number: '+ StoreNumberId + '   -   Name: '+StoreNumber" :value="StoreNumberId"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>                      
        
                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select an Item from the list" prop="ItemNumber">
                                        <el-select style="width: 100%"
                                            v-model="StockItemRequestItemLine.ItemNumber"
                                            ref="ItemSelect"
                                            filterable
                                            remote
                                            :remote-method="searchItems"
                                            :loading="searchItemsLoading"
                                            
                                            placeholder="Search and Select an Item">
                                            <el-option
                                                v-for="item in FoundItems"
                                                :key="item.id"
                                                :label="item.id"
                                                :value="item.id"
                                                >
                                                <div @click="checkStocked(item.ExistsInStore, $event)" :class="{ 'stockedItem' : item.ExistsInStore}" class="row">
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

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Stocking Period (Start And End Dates)" prop="StockItemRequestPeriod">
                                        
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
                                          v-model="StockItemRequestItemLine.StockItemRequestPeriod"
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


                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Item Expepected Consumption Frequency" prop="ConsumptionFrequency">
                                        
                                        <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                            <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2"><strong>Euclid</strong>, Description can be added here.</span>
                                            </span>
                                        </span>

                                        <el-select style="width: 100%; padding: 0px;" v-model="StockItemRequestItemLine.ConsumptionFrequency">
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


                            <el-col :span="12" >
                                <div class="grid-content">

                                    <el-form-item label="Enter Expected Consumption Quantity" prop="Quantity">
                                        <el-input min='0.0000001' type="number" placeholder="Enter Expected Consumption Quantity" v-model="StockItemRequestItemLine.Quantity">
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
                                            <span style="z-index: 1" class="tooltip-content4 clearfix">
                                                <span style="z-index: 1;" class="tooltip-text2">
                                                    <strong>The Unit of Measurement</strong> shall be selected carefully by the user as it will a very important part of the Request for Proposal that shall be sent to the vendors. Examples of Units of Measurement: carton(s) of 300 milliliters bottles; length(s) of 6 meters; box(es) of 150 units; …..
                                                </span>
                                            </span>
                                        </span>

                                        <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="StockItemRequestItemLine.UnitOfMeasurement" placeholder="Enter Unit Of Measurement">
                                                
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

                                    <el-form-item label="Addtional Notes" prop="ItemLineNote">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Additional Item Line Note."
                                            v-model="StockItemRequestItemLine.ItemLineNote">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            
                            <button type="button" @click="AddItem" class="btn btn-success btn-block waves-effect text-center">Add The Item To Stock Item Request List</button>

                        </el-row>
                    </el-form>

                </div>
                <div class="card-body" v-else>
                    <el-row :gutter="20">  
                        <el-col :span="24">
                            <h3 align="center" class="text-danger">Stock Item Request Are Available Only For Library of Materials Structure</h3>
                        </el-col>
                    </el-row>
                </div>
            </div>
            <div class="card" v-else>
                <div class="card-header">
                    <h4>New Stock Item Request</h4>
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
        <div id="Stock_Item_List" class="col-lg-5">
            <div v-stick-in-parent="stikyKit">
                <el-row v-if="StockItemRequestAllItems.length > 0" :gutter="20">
                    <el-col :span="24">
                        <div class="card">
                            <div class="card-header">
                                <h4>The Stock Item Items Lines</h4>
                            </div>
                            <div id="Stock_Item_List_Table" class="card-body">
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
                                        <tr v-for="(StockItemRequest, key, index) in StockItemRequestAllItems" :key="index">
                                            <td>{{ key + 1 }}</td>
                                            <td v-if="StockItemRequest.ItemNumber != ''">Item#: IM-{{ StockItemRequest.ItemNumber }}</td>
                                            <td v-else>{{ StockItemRequest.ItemDescription.substring(0, 20) + '...' }}</td>
                                            <td>{{ StockItemRequest.Quantity }}</td>
                                            <td width="25%">
                                                <!-- <a class="btn btn-warning float-left" href="#" @click="showItemDetails(key, $event)"><i class="fa fa-edit"></i></a> -->
                                                <a class="btn btn-danger float-left m-l-5" href="#" @click="RemoveItem(key, $event)"><i class="fa fa-remove"></i></a> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <button type="button" @click="SubmitStockItemRequestList" class="btn btn-primary btn-block waves-effect text-center">Submit Stock Item Creation Request</button>
                            </div>
                        </div>
                    </el-col>
                </el-row>
                 <el-row v-else :gutter="20">
                    <div class="card">
                        <div class="card-header">
                            <h4>Stock Request Item List</h4>
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
                                        <td class="text-center" colspan="4">Stock Item Request List is Empty</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-primary btn-block waves-effect text-center disabled">Submit Stock Item Creation Request </button>
                        </div>
                    </div>
                 </el-row>
            </div>
        </div>
        



        <div class="modal fade" id="StockItemDetailsModalId" tabindex="-1" aria-labelledby="StockItemDetailsModalId" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Item Serial Number ({{ StockItemModalInfoKey + 1 }})</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>

                    <div class="modal-body">
                        <p class="text-muted">{{ StockItemModalInfo.ItemDescription }}</p>
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
                StoreNumbers: [],
                CompanyDetailsLoaded: false,
                FoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                StockItemRequestItemLine: {
                    StoreNumber: "",
                    ItemNumber: "",
                    ItemDescription: "",
                    StockItemRequestPeriod: "",
                    ConsumptionFrequency: "Weekly",
                    Quantity: "",
                    UnitOfMeasurement: "",
                    ItemLineNote: "",
                },
                StockItemRequestAllItems: [],
                StockItemModalInfoKey: "",
                StockItemModalInfo: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    StoreNumber: [{
                        required: true,
                        message: "Please Select Store To Stock",
                        trigger: ["change"]
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
                    ConsumptionFrequency: [{
                        required: true,
                        message: "Please Enter Consumption Frequency",
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
                        trigger: ["change"]
                    }],

                },
            }
        },
        methods: {
            storeChange(value){
                this.searchItemsLoading = false;
                this.StockItemRequestItemLine.ItemNumber = "";
                this.FoundItems = [];
            },
            checkStocked(StockedItem, e) {
                if(StockedItem){
                    /* Clear Selection */
                    this.StockItemRequestItemLine.ItemNumber = "";
                    this.$refs.ItemSelect.deleteSelected(e);
                    /* Alert User */
                    Swal('This Item is A Store Item', 'The Selected Item Is Already A Store Item', 'info'); 
                }
            },
            searchItems(value) {
                
                /* check if the selected item exists in the store */
                if(this.StockItemRequestItemLine.StoreNumber == ""){
                    Swal('Please Select Store First', 'Please Select Store before contiune.', 'warning');
                    this.StockItemRequestItemLine.ItemNumber = "";
                    return false
                }

                this.StockItemRequestItemLine.ItemNumber = "";
                this.searchItemsLoading = true;

                // onChange: _.debounce(function(event) {
                //     // do stuff
                // }, 1000)

                axios.post('/api/data/get_search_items_non_stock', {searchQuery: value, StoreID: this.StockItemRequestItemLine.StoreNumber})
                    .then((response) => {
                        this.FoundItems = response.data;
                        this.searchItemsLoading = false;
                        console.log(this.FoundItems);
                    })
            },
            AddItem: function() {

                let DuplicateItem = false;
                let self = this;

                // Prevent Duplication of the request 
                $.each(this.StockItemRequestAllItems, function(index, SingleStockItemRequest) {
                    if(SingleStockItemRequest.ItemNumber == self.StockItemRequestItemLine.ItemNumber && SingleStockItemRequest.StoreNumber == self.StockItemRequestItemLine.StoreNumber ){
                        DuplicateItem = true;
                        return false;
                    }
                });

                if(DuplicateItem){
                    Swal('Duplicated Item', 'The Selected Item Is Already in The Stock Item Request List For The Selected Store', 'warning'); 
                    return false
                }
                

                this.$refs.RateContractRequestForm.validate((validation) => {
                    if(validation){
                        this.StockItemRequestAllItems.push(Object.assign({}, this.StockItemRequestItemLine));

                        /*this.StockItemRequestItemLine.ItemNumber = "";
                        this.StockItemRequestItemLine.ItemDescription = "";
                        this.StockItemRequestItemLine.StockItemRequestPeriod = "";
                        this.StockItemRequestItemLine.Quantity = "";
                        this.StockItemRequestItemLine.UnitOfMeasurement = "";
                        this.StockItemRequestItemLine.ItemLineNote = ""; */
                        // this.scrollTo(0, 1000);
                    }
                })
            },
            showItemDetails: function(key, event) {
                if (event) event.preventDefault();

                this.StockItemModalInfoKey = key;
                this.StockItemModalInfo = Object.assign({}, this.StockItemRequestAllItems[key]);
                this.$forceUpdate();

                $('#StockItemDetailsModalId').modal('toggle');

            },
            RemoveItem: function(key, event) {
                if (event) event.preventDefault();

                Swal({
                  title: 'Are you sure?',
                  text: "This Will Remove This Item From The Stock Item Request.",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, Remove It!'
                }).then((result) => {
                    if (result.value) {
                        this.StockItemRequestAllItems.splice(key, 1);
                    }
                })

            },
            SubmitStockItemRequestList() {
                if (event) event.preventDefault();
                console.log(this.StockItemRequestAllItems);
                axios.post('/api/stores/post_stock_item_request', this.StockItemRequestAllItems)
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Stock Item Request Submit)', 'error');
                    });

                //Clear All Data
                this.StockItemRequestAllItems = "";
                this.StockItemRequestItemLine.StoreNumber = "";
                this.StockItemRequestItemLine.ItemNumber = "";
                this.StockItemRequestItemLine.ItemDescription = "";
                this.StockItemRequestItemLine.StockItemRequestPeriod = "";
                this.StockItemRequestItemLine.Quantity = "";
                this.StockItemRequestItemLine.UnitOfMeasurement = "";
                this.StockItemRequestItemLine.ItemLineNote = "";
                this.StockItemRequestAllItems = [];

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

            axios.get('/api/data/get_user_stores_list')
                .then((FirstResponse) => {
                    this.StoreNumbers = FirstResponse.data;
                    console.log(this.StoreNumbers);
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

            if(this.StockItemRequestAllItems.length > 0){
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

    #Stock_Item_List_Table{
        max-height: 570px;
        overflow-y: scroll;
    }

    #Stock_Item_Request_Form{
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

    #StockItemDetailsModalId .modal-dialog {
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

    .stockedItem {
        background-color: rgb(245,9,36,0.2);
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

</style>