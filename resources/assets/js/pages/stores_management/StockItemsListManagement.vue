<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="StockItemList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Stock #</th>
                                <th>Store</th>
                                <th>Created By</th>
                                <th>Requested Item</th>
                                <th>Start Period</th>
                                <th>End Period</th>
                                <th>Replenish Level</th>
                                <th>Replenish Quantity</th>
                                <th>Current Stock Level</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="StockItemModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ ViewModalInfo.id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item (ID):</b></td>
                                        <td>StockID-{{ ViewModalInfo.stock_item_group_id }}</td>
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
                                        <td><b>Requested Period </b></td>
                                        <td>Period Start: {{ ViewModalInfo.start_date.substring(0,10) }} <br> Period End : {{ ViewModalInfo.end_date.substring(0,10) }}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ ViewModalInfo.item.id }} <br> Item Description:{{ ViewModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ ViewModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ ViewModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ ViewModalInfo.stock_level }} </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                        
                                         
                    </div>
                </div>
            </div>
        </div>


        <div id="StockItemModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalEdit" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ EditModalInfo.stock_item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Number (ID):</b></td>
                                        <td>StockID-{{ EditModalInfo.stock_item_group_id }}</td>
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
                                        <td><b>Requested Period </b></td>
                                        <td>{{ EditModalInfo.start_date }} - {{ EditModalInfo.end_date }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ EditModalInfo.item.id }} <br>Item Description:{{ EditModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ EditModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ EditModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ EditModalInfo.stock_level }} </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12">
                            <el-form :model="EditModalInfo" class="demo-form-inline" :rules="editRules" ref="EditModalFormInfoID">
                                <el-row :gutter="20">
                                    <el-col :span="24">
                                        <div class="grid-content">
                                            <el-form-item label="Select Stock Item Purchase Enquiry Generation Type" prop="pe_generation_type">
                                                <span style="z-index: 1" class="mytooltip tooltip-effect-1">
                                                    <span class="tooltip-item2"><i class="fa fa-info-circle fa-lg text-success"></i></span>
                                                    <span class="tooltip-content4 clearfix">
                                                        <span class="tooltip-text2">Additonal Notes Can Added</span>
                                                    </span>
                                                </span>
                                                <el-select class="font-900" style="width: 100%; padding: 0px;" v-model="EditModalInfo.pe_generation_type" placeholder="Select Purchase Enquiry Generation Type">
                                                    <el-option label="Automatic Generation" value="Automatic"></el-option>  
                                                    <el-option label="Manual Generation" value="Manual"></el-option> 
                                                </el-select>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="12">
                                        <div class="grid-content">
                                            <el-form-item label="Select Stock Start Date" prop="start_date">
                                                
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
                                                  v-model="EditModalInfo.start_date"
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
                                            <el-form-item label="Select Stock End Date" prop="end_date">
                                                
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
                                                  v-model="EditModalInfo.end_date"
                                                  type="date"
                                                  placeholder="End date"
                                                  :default-time="['23:59:59']"
                                                  value-format="yyyy-MM-dd HH:mm:ss">
                                                </el-date-picker>
                                                
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="12">
                                        <div class="grid-content">

                                            <el-form-item label="Minimum Iventory Level" prop="replenish_level">
                                                <el-input min='0.0000001' type="number" placeholder="Enter Minimum Iventory Level" v-model="EditModalInfo.replenish_level">
                                                </el-input>
                                            </el-form-item>

                                        </div>
                                    </el-col>


                                    <el-col :span="12">
                                        <div class="grid-content">

                                            <el-form-item label="Optimal Order Quantity" prop="replenish_quantity">
                                                <el-input min='0.0000001' type="number" placeholder="Enter Optimal Order Quantity" v-model="EditModalInfo.replenish_quantity">
                                                </el-input>
                                            </el-form-item>

                                        </div>
                                    </el-col>

                                    <el-col :span="24">
                                        <hr>
                                        <h4> Item Location: ({{  EditModalInfo.project.title }})</span></h4>
                                    </el-col>
                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Bin Location" prop="Bin">
                                                <el-input placeholder="Enter Bin Location" v-model="EditModalInfo.bin">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>

                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Shelf Location" prop="Shelf">
                                                <el-input placeholder="Enter Shelf Location" v-model="EditModalInfo.shelf">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Rack Location" prop="Rack">
                                                <el-input placeholder="Enter Rack Location" v-model="EditModalInfo.rack">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Area Location" prop="Area">
                                                <el-input placeholder="Enter Area Location" v-model="EditModalInfo.area">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="8">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Alley Location" prop="Alley">
                                                <el-input placeholder="Enter Alley Location" v-model="EditModalInfo.alley">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>


                                    <el-col :span="24">
                                        <div class="grid-content">

                                            <el-form-item label="Addtional Notes" prop="notes">
                                                <el-input
                                                    type="textarea"
                                                    :rows="4"
                                                    placeholder="Enter Additional Note."
                                                    v-model="EditModalInfo.notes">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </el-col>
                       
                                    <el-col :span="24">
                                        <button type="button" @click="EditStockItemDetails" class="btn btn-primary btn-block waves-effect">Edit Stock Item Details</button>
                                    </el-col>
                                </el-row>

                            </el-form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div id="StockItemModalReplenish" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalReplenish" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ ReplenishModalInfo.stock_item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="replenishDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Number (ID):</b></td>
                                        <td>StockID-{{ ReplenishModalInfo.stock_item_group_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ ReplenishModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ ReplenishModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ReplenishModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>{{ ReplenishModalInfo.start_date }} - {{ ReplenishModalInfo.end_date }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ ReplenishModalInfo.item.id }} <br>Item Description:{{ ReplenishModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ ReplenishModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ ReplenishModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ ReplenishModalInfo.stock_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Rate Contract Availability </b></td>
                                        <td style="cursor: pointer;" class="text-primary" @mouseover="showRateContract(ReplenishModalInfo.item.id)">
                                            <el-tooltip  placement="top-start" effect="light">
                                                <div slot="content">
                                                    <div v-if="RateContractDataLoaded">
                                                        <table style="min-width: 500px;" class="table table-bordered">
                                                            <thead>
                                                                <td align="center"><b>Price</b></td>
                                                                <td align="center"><b>Lead Time</b></td>
                                                                <td align="center"><b>Contract End Date</b></td>
                                                            </thead>
                                                            <tbody v-if="ItemRateContractDetails.length > 0">
                                                                <tr v-for="(RateContract, key, index) in ItemRateContractDetails" :key="index">
                                                                    <td align="center">{{ formatPrice(RateContract.vendor_responses[0].unit_rate) }} {{ RateContract.vendor_responses[0].currency }}</td>
                                                                    <td align="center">{{ RateContract.vendor_responses[0].lead_days }} Day(s)</td>
                                                                    <td align="center">{{ RateContract.vendor_responses[0].rate_contract_request.rc_end_period.substring(0, 10) }}</td>
                                                                </tr>
                                                            </tbody>
                                                            <tbody v-else>
                                                                <tr>
                                                                    <td align="center" colspan="3"> NO CONTRACT AVAILABLE </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div align="center" v-else>
                                                        <h2>Gathering Data...</h2>
                                                        <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                                    </div>
                                                    
                                                </div>
                                                <i style="line-height: 0px">View Rates</i>
                                            </el-tooltip>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-lg-12">
                            <el-form :model="ReplenishModalFormInfo" class="demo-form-inline" :rules="replenishRules" ref="ReplenishFormModal">
                                <el-row :gutter="20">
                                    <el-col :span="24">
                                        <hr>
                                        <h4>Purchase Enquiry Details</h4>
                                        <el-row :gutter="20">

                                            
                                           <!--  <el-col :span="12" >
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

                                                        <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="ReplenishModalFormInfo.UnitOfMeasurement" placeholder="Enter Unit Of Measurement">
                                                                
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
                                            </el-col> -->

                                            <el-col :span="12" v-if="this.CompanySetup.additional_required_1 == 'Yes'">
                                                <div class="grid-content">
                                                    <el-form-item label="Enter The Underlying Transaction Reference" prop="UnderlyingTransaction">

                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success">(Explanation <span class="fa fa-info-circle fa-lg text-success"></span>)</span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    <strong>The Underlying Transaction Reference</strong> is fundamentally the cause that has led to the creation of this specific Purchase Enquiry. It can be a particular Job Ticket, a Sales Order, a Work Order…etc
                                                                </span>
                                                            </span>
                                                        </span>

                                                        <el-input v-model="ReplenishModalFormInfo.UnderlyingTransaction" placeholder="e.g. PE#1213412-ER Or 35633-1 Or 213/2018/4521"></el-input>

                                                    </el-form-item>
                                                </div>
                                            </el-col>


                                            <el-col :span="12" >
                                                <div class="grid-content">

                                                    <el-form-item label="Enter Needed Quantity" prop="Quantity">
                                                        <el-input min='0.0000001' type="number" placeholder="Enter Item Quantity" v-model="ReplenishModalFormInfo.Quantity">
                                                        </el-input>
                                                    </el-form-item>

                                                </div>
                                            </el-col>


                                            <el-col :span="12" >
                                                <div class="grid-content">
                                                    <el-form-item label="Will You Consider Offering An Advanced Payment For This?" prop="AdvancedPayment">
                                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="ReplenishModalFormInfo.AdvancedPayment" placeholder="Advanced Payment Offered?">
                                                                
                                                            <el-option label="Yes" value="Yes"></el-option>
                                                            <el-option label="No" value="No"></el-option>
                                                                
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>

                                            <el-col :span="8" >
                                                <div class="grid-content">
                                                    <el-form-item label="Documents Required From The Vendors" prop="RequiredDocuments">
                                                            
                                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                            <span class="tooltip-item2">
                                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                                
                                                            </span>
                                                            <span class="tooltip-content4 clearfix">
                                                                <span class="tooltip-text2">
                                                                    These are the documents that the vendors need to submit along with their commercial proposals, so that their proposals can be assessed.
                                                                </span>
                                                            </span>
                                                        </span>

                                                        <el-select filterable collapse-tags allow-create multiple style="width: 100%; padding: 0px;" v-model="ReplenishModalFormInfo.RequiredDocuments" placeholder="Select Required Docuement">
                                                            
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

                                            <el-col :span="8" >
                                                <el-form-item label="Location Name" prop="LocationName">
                                                    <el-input type="text" placeholder="Enter Location Name" v-model="ReplenishModalFormInfo.LocationName"></el-input>
                                                </el-form-item>
                                            </el-col>

                                            <!-- Delivery Location Selection -->
                                            <el-col style="display:none" :span="8" >
                                                <el-form-item label="Delivery Longitude" prop="Longitude">
                                                    <el-input type="number"  placeholder="Enter Location Longitude Or Select From Map" v-model="ReplenishModalFormInfo.Longitude"></el-input>
                                                </el-form-item>
                                            </el-col>
                                            <el-col style="display:none" :span="8" >
                                                <el-form-item label="Delivery Latitude" prop="Latitude">
                                                    <el-input type="number" placeholder="Enter Location Longitude Or Select From Map" v-model="ReplenishModalFormInfo.Latitude"></el-input>
                                                </el-form-item>
                                            </el-col>

                                            <el-col :span="8" >
                                                <el-form-item label="Select Delivery Location On The Map">

                                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                                        <span class="tooltip-item2">
                                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                            
                                                        </span>
                                                        <span class="tooltip-content4 clearfix">
                                                            <span class="tooltip-text2">
                                                                You may only select one delivery location adress. In case the material needs to be delivered to more than one location, a new Purchase Enquiry Line, with a different delivery location address, needs to be created.
                                                            </span> <br>
                                                            <span class="tooltip-text2">
                                                                You may only drop one pin. In case the material needs to be delivered to more than one location, a new Purchase Enquiry Line with a different pin drop, needs to be created.
                                                            </span>
                                                        </span>
                                                    </span>

                                                    <button type="button"  data-toggle="modal" id="get_map" data-target="#DeliveryLocation" class="btn btn-primary btn-block waves-effect text-center">Select Delivery Location</button>
                                                </el-form-item>
                                            </el-col>

                                            
                                            <el-col :span="24" >
                                                <div class="grid-content">

                                                    <el-form-item label="Addtional Notes" prop="PELineNote">
                                                        <el-input
                                                            type="textarea"
                                                            :rows="4"
                                                            placeholder="Enter Purchase Enqiury Line Note."
                                                            v-model="ReplenishModalFormInfo.PELineNote">
                                                        </el-input>
                                                    </el-form-item>
                                                </div>
                                            </el-col>

                                        </el-row>

                                    </el-col>
                       
                                    <el-col :span="24">
                                        <button type="button" @click="CreateStockItemPE" class="btn btn-primary btn-block waves-effect">Create Purchase Enquiry</button>
                                    </el-col>
                                </el-row>

                            </el-form>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </div>


        <div id="StockItemModalAdjustQuantity" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemModalAdjustQuantity" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ AdjustQuantityModalInfo.stock_item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="adjustQuantityDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Number (ID):</b></td>
                                        <td>StockID-{{ AdjustQuantityModalInfo.stock_item_group_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ AdjustQuantityModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ AdjustQuantityModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ AdjustQuantityModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>{{ AdjustQuantityModalInfo.start_date }} - {{ AdjustQuantityModalInfo.end_date }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ AdjustQuantityModalInfo.item.id }} <br>Item Description:{{ AdjustQuantityModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ AdjustQuantityModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ AdjustQuantityModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ AdjustQuantityModalInfo.stock_level }} </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- <el-form :model="AdjustQuantityModalFormInfo" class="demo-form-inline" :rules="rules" ref="AdjustQuantityModalFormInfo">
                                <div class="row">
                                    <div class="col-lg-12">
                               
                                        <div class="col-lg-12">
                                            <div class="grid-content">
                                                <el-form-item label="Enter Decision Notes" prop="DecisionNotes">
                                                    <el-input
                                                        type="textarea"
                                                        :rows="5"
                                                        placeholder="Enter Decision Notes"
                                                        v-model="AdjustQuantityModalFormInfo.DecisionNotes">
                                                    </el-input>
                                                </el-form-item>
                                            </div> 
                                        </div>
                           
                                        <div class="col-lg-6 float-right">
                                            <button type="button" @click="DecisionApprove" class="btn btn-block btn-success waves-effect">Approve</button>
                                        </div>
                           
                                        <div class="col-lg-6 float-left">
                                            <button type="button" @click="DecisionReject" class="btn btn-block btn-danger waves-effect">Reject</button>
                                        </div>
                           
                                        <div class="col-lg-12">
                                            <button type="button" @click="PurchaseEnquiryDecision" class="btn btn-primary btn-block waves-effect">Submit Decision</button>
                                        </div>
                                       
                                    </div>
                               </div>
                            </el-form> -->               
                    </div>
                </div>
            </div>
        </div>



        <div id="StockItemReceivingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemReceivingModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Number: {{ StockItemReceivingModalInfo.stock_item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="StockItemReceivingDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Number (ID):</b></td>
                                        <td>StockID-{{ StockItemReceivingModalInfo.stock_item_group_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ StockItemReceivingModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ StockItemReceivingModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ StockItemReceivingModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Period </b></td>
                                        <td>{{ StockItemReceivingModalInfo.start_date }} - {{ StockItemReceivingModalInfo.end_date }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Item Information:</b></td>
                                        <td>Item ID: {{ StockItemReceivingModalInfo.item.id }} <br>Item Description:{{ StockItemReceivingModalInfo.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Level </b></td>
                                        <td>{{ StockItemReceivingModalInfo.replenish_level }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Replenish Quantity </b></td>
                                        <td>{{ StockItemReceivingModalInfo.replenish_quantity }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Stock Level </b></td>
                                        <td>{{ StockItemReceivingModalInfo.stock_level }} </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                                <h4>Receiving Details</h4>
                            </div>
                            <div class="col-lg-12">
                                <table id="StockItemReceivingsTable" class="table table-bordered ">
                                    <thead align="center" style="font-weight: bold;">
                                        <td>Purchase Enquiry ID</td>
                                        <td>Purchase Order ID</td>
                                        <td>Receiving Note ID</td>
                                        <td>Receiving Batch ID</td>
                                        <td>Received Value</td>
                                        <td>Received Quantity</td>
                                        <td>Action</td>
                                    </thead>
                                    <tbody>
                                        <template v-for="PurchaseEnquiry in StockItemReceivingModalInfo.purchase_enquiries">
                                            <template v-for="PurchaseOrder in PurchaseEnquiry.purchase_orders">
                                                <template v-for="ReceiptNote in PurchaseOrder.receipt_notes">
                                                    <template v-for="ReceivingRecord in ReceiptNote.receiving_records">
                                                        <tr>
                                                            <td>PE-{{ PurchaseEnquiry.id }}</td>
                                                            <td>PO-{{ PurchaseOrder.id }}</td>
                                                            <td>RN-{{ ReceiptNote.id }}</td>
                                                            <td>RC-{{ ReceivingRecord.id }}</td>
                                                            <td>{{ ReceivingRecord.value_of_received_quantity }} {{StockItemReceivingModalInfo.project.currency}}</td>
                                                            <td>{{ ReceivingRecord.received_quantity }} {{ PurchaseEnquiry.u_o_m }}</td>
                                                            <td v-if="ReceivingRecord.received_by_store == 'No'" style="min-width: 250px">
                                                                <textarea
                                                                    class="form-control"
                                                                   :id="'Receivingline_'+ReceivingRecord.id+'_Notes'"
                                                                   style="min-width: 100%; font-size:12px"
                                                                   type="textarea"
                                                                   rows="3"
                                                                   placeholder="Store Receiving Notes">
                                                                </textarea>
                                                                <div class="m-t-5">
                                                                    <button type="button" @click="UpdateStockItemLevel(StockItemReceivingModalInfo.id, ReceivingRecord.id, ReceivingRecord.received_quantity)" class="btn btn-primary btn-block waves-effect">Receive Batch</button>
                                                                </div>
                                                               
                                                            </td>
                                                            <td style="min-width: 250px" v-else>
                                                                <span><b>Received By:</b><br> {{ ReceivingRecord.store_receiver.name }}</span><br>
                                                                <span><b>Received At:</b><br> {{ ReceivingRecord.received_by_store_at }}</span><br>
                                                                <hr>
                                                                <p><b>Receiving Notes:</b><br> {{ ReceivingRecord.received_by_store_notes }}</p>
                                                            </td>
                                                        </tr>
                                                    </template>
                                                </template>
                                            </template>
                                        </template>
                                    </tbody>
                                </table>
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
                        <p class="text-muted">Select The Delivery Location by Dragging and Dropping the Pin on The Map</p>
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
                hostName: window.location.protocol+'//'+window.location.hostname,
                DataTable: "",
                CompanySetup: {},
                viewDataLoaded: false,
                editDataLoaded: false,
                replenishDataLoaded: false,
                RateContractDataLoaded: false,
                adjustQuantityDataLoaded: false,
                StockItemReceivingDataLoaded: false,
                ViewModalInfo: {},
                EditModalInfo: {},
                ReplenishModalInfo: {},
                AdjustQuantityModalInfo: {},
                ItemRateContractDetails: "",
                PurchaseEnquiryAll: [],
                EditModalFormInfo: {
                    StockItemId: "",
                    StockingStartDate: "",
                    StockingEndDate: "",
                    PEGenerationType: "",
                    ReplenishmentQuantity: "",
                    ReplenishmentLevel: "",
                    StockItemNote: "",
                },
                ReplenishModalFormInfo: {
                    StockItemDetails: "",
                    JobNumber: "",
                    StockItemRequestId: "",
                    UnderlyingTransaction: "",
                    EnquiryType: "",
                    EnquiryFromItemMaster: "",
                    ItemNumber: "",
                    ItemDescription: "",
                    Quantity: "",
                    StoreItemrequest: "Yes",
                    StockItemID: "",
                    UnitOfMeasurement: "",
                    ServiceDescription: "",
                    AdvancedPayment: "No",
                    RequiredDocuments: "",
                    PELineNote: "",
                    Longitude: '',
                    Latitude: '',
                    LocationName: ''
                },
                AdjustQuantityModalFormInfo: {
                    StockItemRequestId: "",
                    Decision: "",
                    DecisionNotes: "",
                },
                StockItemReceivingModalInfo: {},
                editRules: {
                    pe_generation_type: [{
                        required: true,
                        message: "Purchase Enquiry Generation Type Required",
                        trigger: ["blur", "change"]
                    }],
                    start_date: [{
                        required: true,
                        message: "Start Date Required",
                        trigger: ["blur", "change"]
                    }],
                    end_date: [{
                        required: true,
                        message: "End Date Requried",
                        trigger: ["blur", "change"]
                    }],
                    replenish_quantity: [{
                        required: true,
                        message: "Replenish Quantity Required",
                        trigger: ["blur", "change"]
                    }],
                    replenish_level: [{
                        required: true,
                        message: "Replenish Level Required",
                        trigger: ["blur", "change"]
                    }],
                },
                replenishRules: {
                    UnderlyingTransaction: [{
                        required: false,
                        message: "Please Underlying Transaction",
                        trigger: "blur"
                    }],
                    Quantity: [{
                        required: true,
                        message: "Please Enter Quantity",
                        trigger: "blur"
                    }],
                    AdvancedPayment: [{
                        required: true,
                        message: "Please Select Advanced Payment Requirements.",
                        trigger: "blur"
                    }],
                    RequiredDocuments: [{
                        required: false,
                        message: "Please Select A Document.",
                        trigger: "blur"
                    }],
                    Longitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    Latitude: [{
                        required: true,
                        message: "Please Delivery Location.",
                        trigger: "blur"
                    }],
                    LocationName: [{
                        required: true,
                        message: "Please Enter Location Name.",
                        trigger: "blur"
                    }]
                },
                adjustQuantityRules: {
                    Decision: [{
                        required: true,
                        message: "Please select a approve or reject",
                        trigger: "blur"
                    }],
                    DecisionNotes: [{
                        required: false,
                        message: "Decision notes are required in case of rejection.",
                        trigger: ["blur", "change"]
                    }],
                },
            }
        },
        methods: {
            UpdateStockItemLevel(StockItemID, ReceivingBatchId, ReceivedQuantity){

                let self = this;
                let StoreReceivingNote = $('#Receivingline_'+ReceivingBatchId+'_Notes').val();

                axios.post('/api/stores/update_stock_item_level', {StockItemID: StockItemID, ReceivingBatchId: ReceivingBatchId, ReceivedQuantity: ReceivedQuantity, StoreReceivingNote: StoreReceivingNote})
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
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Updating Stock Level)', 'error');
                    });

                $('#StockItemReceivingModal').modal('toggle');
            },
            showRateContract(ItemId){

                event.preventDefault();

                axios.post('/api/data/get_item_rate_contract_details', {ItemId: ItemId})
                    .then((response) => {
                        this.ItemRateContractDetails = response.data;
                        this.RateContractDataLoaded = true;
                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Getting Item Rate Contract Details)', 'error');
                    });

            },
            EditStockItemDetails(){

                let self = this;

                this.$refs.EditModalFormInfoID.validate((validation) => {
                    if(validation){
                        
                        axios.post('/api/stores/update_stock_item_details', {EditModalInfo: self.EditModalInfo}) //EditModalInfo
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
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Stock Item Edit)', 'error');
                            });

                            $('#StockItemModalEdit').modal('toggle');
                            
                                           
                    }
                })

            },

            CreateStockItemPE(){

                let self = this;

                if(self.ReplenishModalFormInfo.Latitude == ""){
                    Swal('Missing Map Location', 'Please Select a Location on Map to create PE Line', 'warning');
                    return false;
                }

                this.$refs.ReplenishFormModal.validate((validation) => {
                    if(validation){

                        this.ReplenishModalFormInfo.JobNumber = this.ReplenishModalFormInfo.StockItemDetails.project_id;
                        this.ReplenishModalFormInfo.UnderlyingTransaction = this.ReplenishModalFormInfo.StockItemDetails.project_id;
                        this.ReplenishModalFormInfo.EnquiryType = "Materials";
                        this.ReplenishModalFormInfo.EnquiryFromItemMaster = "Yes";
                        this.ReplenishModalFormInfo.ItemNumber = this.ReplenishModalFormInfo.StockItemDetails.item_id;
                        this.ReplenishModalFormInfo.ItemDescription = this.ReplenishModalFormInfo.StockItemDetails.item.description;
                        this.ReplenishModalFormInfo.UnitOfMeasurement = "Liter";
                        this.ReplenishModalFormInfo.StockItemID = this.ReplenishModalFormInfo.StockItemDetails.id;

                        this.PurchaseEnquiryAll.push(Object.assign({}, this.ReplenishModalFormInfo));
                        console.log(this.PurchaseEnquiryAll);

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

                            this.PurchaseEnquiryAll = [];
                            this.ReplenishModalFormInfo.JobNumber = "";
                            this.ReplenishModalFormInfo.UnderlyingTransaction = "";
                            this.ReplenishModalFormInfo.ItemNumber = "";
                            this.ReplenishModalFormInfo.Longitude = "";
                            this.ReplenishModalFormInfo.ItemNumber = "";
                            this.ReplenishModalFormInfo.StockItemID = "";
                            this.ReplenishModalFormInfo.ItemDescription = "";
                            this.ReplenishModalFormInfo.Latitude = "";
                            this.ReplenishModalFormInfo.StockItemDetails = "";

                            $('#StockItemModalReplenish').modal('toggle');

                    }
                })

            },
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true;
                        $('#StockItemModalView').modal('toggle');
                    });
                this.viewDataLoaded = false;
            },
            showEditModal(elquentClass, recordId){
                this.EditModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.EditModalInfo = response.data;
                        this.EditModalFormInfo.StockItemId = this.EditModalInfo.id;
                        this.editDataLoaded = true;
                        $('#StockItemModalEdit').modal('toggle');
                    })
                this.editDataLoaded = false;
            },
            showReplenishModal(elquentClass, recordId){
                this.ReplenishModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ReplenishModalInfo = response.data;
                        this.ReplenishModalFormInfo.StockItemDetails = response.data;
                        this.ReplenishModalFormInfo.Quantity = response.data.replenish_quantity;
                        this.ReplenishModalFormInfo.LocationName = response.data.project.title;
                        this.ReplenishModalFormInfo.StockItemRequestId = this.ReplenishModalInfo.id;
                        console.log(this.ReplenishModalFormInfo);
                        this.replenishDataLoaded = true;
                        $('#StockItemModalReplenish').modal('toggle');
                    })
                this.replenishDataLoaded = false;
            },
            showAdjustQuantityModal(elquentClass, recordId){
                this.AdjustQuantityModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.AdjustQuantityModalInfo = response.data;
                        this.AdjustQuantityModalFormInfo.StockItemRequestId = this.AdjustQuantityModalInfo.id;
                        this.adjustQuantityDataLoaded = true;
                        $('#StockItemModalAdjustQuantity').modal('toggle');
                    })
                this.adjustQuantityDataLoaded = false;
            },
            StockItemReceivingModal(elquentClass, recordId){
                this.StockItemReceivingModalInfo = {};
                axios.post('/api/data/get_stock_item_record_details_with_receiving_details', [elquentClass, recordId])
                    .then((response) => {
                        this.StockItemReceivingModalInfo = response.data;
                        console.log(this.StockItemReceivingModalInfo);
                        this.StockItemReceivingDataLoaded = true;
                        $('#StockItemReceivingModal').modal('toggle');

                        //$("#StockItemReceivingsTable").dataTable();
                    })
                this.StockItemReceivingDataLoaded = false;
            },
            
            
        },
        mounted(){


            axios.get('/api/data/get_company_details')
                .then((SecondResponse) => {

                    this.CompanySetup = SecondResponse.data;

                    if(this.CompanySetup.additional_required_1 == "Yes"){
                       this.replenishRules.UnderlyingTransaction[0].required = true; 
                    }

                });


            const table = $('#StockItemList').DataTable({
                fixedHeader: {
                    header: true,
                    headerOffset: 117
                },
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_stock_item_list',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'project.title', name: 'project.title' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'item.description', name: 'item.description' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'replenish_level', name: 'replenish_level' },
                    { data: 'replenish_quantity', name: 'replenish_quantity' },
                    { data: 'stock_level', name: 'stock_level' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 9 },
                    { responsivePriority: 2, targets: 0 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, 'ASC' ]],
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
                },
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
                // "rowCallback": function( row, data, index ) {
                //     console.log(data.status);
                //     if(data.status.indexOf('Created and Assigned to') !== -1){
                //         $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                //     } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                //         $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                //     } else if (data.status.indexOf('sent for sourcing') !== -1) {
                //         $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                //     } else if (data.status.indexOf('Rejected by ') !== -1) {
                //         $(row).css('background-color', 'rgb(249, 69, 72, 0.08)')
                //     } else {
                //         $(row).css('background-color', 'rgb(249, 69, 237, 0.1)')
                //     }
                // } 
            });

            const self = this;

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

            $('tbody', this.$refs.table).on('click', '.replenish-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showReplenishModal(elquentClass, RecordID);
            });
            
            $('tbody', this.$refs.table).on('click', '.adjustquantity-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.showAdjustQuantityModal(elquentClass, RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.stockreceiving-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                self.StockItemReceivingModal(elquentClass, RecordID);
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
                    self.ReplenishModalFormInfo.Longitude = marker.getPosition().lat();
                    self.ReplenishModalFormInfo.Latitude = marker.getPosition().lng();
                });


                // When modal window is open, this script resizes the map and resets the map center
                $("#DeliveryLocation").on("shown.bs.modal", function(e) {
                  google.maps.event.trigger(map, "resize");
                  return map.setCenter(myLatLng);
                });

            };

            google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));

            self.DataTable = table;

        },
    }
    //D9BF96
</script>


<style scoped>

    .font-500{
        font-weight: 500; 
    }

    #map-canvas {
        width: 100%;
        height: 450px;
        margin: 0 auto;
    }

    #DeliveryLocation .modal-dialog {
        width:80%;
    }

    #StockItemModalView .modal-dialog {
        min-width:80%;
    }

    #StockItemModalEdit .modal-dialog {
        min-width:80%;
    }

    #StockItemModalReplenish .modal-dialog {
        min-width:80%;
    }

    #StockItemModalAdjustQuantity .modal-dialog {
        min-width:80%;
    }

    #StockItemReceivingModal .modal-dialog {
        min-width:80%;
    }

</style>