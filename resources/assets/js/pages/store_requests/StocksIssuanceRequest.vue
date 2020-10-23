<template>
        
    <div class="row">
        <div id='Issuance_Request_Form' class="col-lg-7">
            <div class="card" v-if="CompanyDetailsLoaded">
                <div class="card-header">
                    <h4>Stock Item Issuance Request</h4>
                </div>
                <div class="card-body">
                    <el-form :model="IssueRequestItemLine" class="demo-form-inline" :rules="rules" ref="StockItemIssueRequestForm">

                        <el-row :gutter="20">  


                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Store Number" prop="StoreNumber">

                                        <el-select filterable style="width: 100%; padding: 0px;" @change="StoreChanged($event)" v-model="IssueRequestItemLine.StoreNumber" placeholder="Select Store Number">
                                            
                                            <el-option v-for="(StoreNumber, StoreNumberId, index) in StoreNumbers" :key="StoreNumberId" :label="'Number: '+ StoreNumberId + '   -   Name: '+StoreNumber" :value="StoreNumberId"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>                      
        
                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select an Item from the list" prop="StockItemID">
                                        <el-select style="width: 100%"
                                            v-model="IssueRequestItemLine.StockItemID"
                                            filterable
                                            remote
                                            :remote-method="searchItems"
                                            :loading="searchItemsLoading"
                                            placeholder="Search and Select an Item">
                                            <el-option
                                                v-for="stockItem in StockFoundItems"
                                                :key="stockItem.id"
                                                :label="'Stock#: '+ stockItem.id+ ' Description: '+stockItem.item.description"
                                                :value="stockItem.id">
                                                <div @click="UpdateQuantity(stockItem.stock_level, $event)" class="row">
                                                    <div class="col-lg-2" style="padding-left: 0px; padding-top: 5px; padding-buttom: 0px; padding-right: 0px;" >
                                                       <img  class="img-thumbnail vertical-middle" :src="hostName+'/uploads/ItemMasterPictures/'+stockItem.item.picture">
                                                        
                                                    </div>
                                                    <div class="col-lg-3" style="padding-left: 10px; padding-top: 10px; padding-buttom: 0px; padding-right: 0px; line-height: 10px;" >
                                                        <table class="table itemTable">
                                                            <tr>
                                                                <td width="25%"><b>Stock Item Number:</b></td>
                                                                <td> SI-{{ stockItem.id }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%"><b>Item Number:</b></td>
                                                                <td> IM-{{ stockItem.item.id }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ stockItem.item.item_template.field_1 }}:</b></td>
                                                                <td> {{ stockItem.item.field_1 }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ stockItem.item.item_template.field_2 }}:</b></td>
                                                                <td>{{ stockItem.item.field_2 }}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>{{ stockItem.item.item_template.field_3 }}:</b></td>
                                                                <td>{{ stockItem.item.field_3 }}</td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-lg-6" style="padding-left: 10px; padding-top: 10px; padding-buttom: 0px; padding-right: 0px;">
                                                        <div>
                                                            <p><b>Description:</b> {{ stockItem.item.description }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </el-option>
                                        </el-select>

                                    </el-form-item>
                                </div>
                            </el-col>



                            <el-col :span="24" >
                                <div class="grid-content">

                                    <el-form-item label="temp" prop="Quantity">
                                        <span slot="label">Enter Transfer Quantity. Current Max Quantity in Store is: <b>{{ this.MaxQantity }}</b></span>
                                        <el-input @change="CheckQuantity($event)" min='0.0000001' type="number" placeholder="Enter Requested Quantity" v-model="IssueRequestItemLine.Quantity">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>
                            


                            <el-col :span="24" >
                                <el-form-item label="Delivery Location Name" prop="LocationName">
                                    <el-input type="text" placeholder="Enter Delivery Location Name" v-model="IssueRequestItemLine.LocationName"></el-input>
                                </el-form-item>
                            </el-col>

                            <!-- Delivery Location Selection -->
                            <el-col style="display:none" :span="8" >
                                <el-form-item label="Delivery Longitude" prop="Longitude">
                                    <el-input type="number"  placeholder="Enter Location Longitude Or Select From Map" v-model="IssueRequestItemLine.Longitude"></el-input>
                                </el-form-item>
                            </el-col>
                            <el-col style="display:none" :span="8" >
                                <el-form-item label="Delivery Latitude" prop="Latitude">
                                    <el-input type="number" placeholder="Enter Location Longitude Or Select From Map" v-model="IssueRequestItemLine.Latitude"></el-input>
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
                            </el-col>
                            
                            

                            <el-col :span="24" >
                                <div class="grid-content">

                                    <el-form-item label="Addtional Notes" prop="ItemLineNote">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Additional Item Line Note."
                                            v-model="IssueRequestItemLine.ItemLineNote">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            
                            <button type="button" @click="AddItem" class="btn btn-success btn-block waves-effect text-center">Add The Item To Stock Item Issuance Request List</button>

                        </el-row>
                    </el-form>

                </div>
                
            </div>
            <div class="card" v-else>
                <div class="card-header">
                    <h4>Stock Item Issuance Request</h4>
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
        <div id="Issuance_Request_List" class="col-lg-5">
            <div v-stick-in-parent="stikyKit">
                <el-row v-if="IssueRequestsAllItems.length > 0" :gutter="20">
                    <el-col :span="24">
                        <div class="card">
                            <div class="card-header">
                                <h4>The Stock Item Issuance Request Lines</h4>
                            </div>
                            <div id="Issuance_Request_List_Table" class="card-body">
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
                                        <tr v-for="(IssanceRequest, key, index) in IssueRequestsAllItems" :key="index">
                                            <td>{{ key + 1 }}</td>
                                            <td v-if="IssanceRequest.StockItemID != ''">Item#: IM-{{ IssanceRequest.StockItemID }}</td>
                                            <td v-else>{{ IssanceRequest.ItemDescription.substring(0, 20) + '...' }}</td>
                                            <td>{{ IssanceRequest.Quantity }}</td>
                                            <td width="25%">
                                                <!-- <a class="btn btn-warning float-left" href="#" @click="showItemDetails(key, $event)"><i class="fa fa-edit"></i></a> -->
                                                <a class="btn btn-danger float-left m-l-5" href="#" @click="RemoveItem(key, $event)"><i class="fa fa-remove"></i></a> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <button type="button" @click="SubmitIssanceRequestList" class="btn btn-primary btn-block waves-effect text-center">Submit Stock Item Issuance Request List</button>
                            </div>
                        </div>
                    </el-col>
                </el-row>
                 <el-row v-else :gutter="20">
                    <div class="card">
                        <div class="card-header">
                            <h4>Stock Item Issuance Request List</h4>
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
                                        <td class="text-center" colspan="4">Stock Item Issuance List is Empty</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-primary btn-block waves-effect text-center disabled">Submit Stock Item Issuance Request </button>
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


        <div class="modal fade" id="IssueRequestModalId" tabindex="-1" aria-labelledby="IssueRequestModalId" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Item Serial Number ({{ IssueRequestItemModalInfoKey + 1 }})</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>

                    <div class="modal-body">
                        <p class="text-muted">{{ IssueRequestItemModalInfo.ItemDescription }}</p>
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
        name: 'new-stock-item-issue-request',
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
                StockFoundItems: {},
                searchItemsLoading: false,
                ItemSelectionMandatory: false,
                IssueRequestItemLine: {
                    StoreNumber: "",
                    StockItemID: "",
                    Quantity: "",
                    ItemLineNote: "",
                    Longitude: '',
                    Latitude: '',
                    LocationName: ''
                },
                IssueRequestsAllItems: [],
                IssueRequestItemModalInfoKey: "",
                IssueRequestItemModalInfo: "",
                MaxQantity: "",
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                rules: {
                    StoreNumber: [{
                        required: true,
                        message: "Please Select Store Number",
                        trigger: ["blur", "change"]
                    }],
                    StockItemID: [{
                        required: false,
                        message: "Please Select an Item",
                        trigger: "blur"
                    }],
                    Quantity: [{
                        required: true,
                        message: "Please Enter Quantity",
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
            UpdateQuantity(StockLevel, e){
                this.MaxQantity = StockLevel;
            },
            CheckQuantity(){

                if(this.IssueRequestItemLine.StockItemID == ""){
                    Swal('Please Select An Item First', 'An Item has to be selected in order to contiune', 'warning');
                    this.IssueRequestItemLine.Quantity = "";
                    return false;
                }

                if(parseFloat(this.IssueRequestItemLine.Quantity) <= 0){
                    Swal('Zero and Negative Values Not Allowed', '', 'warning');
                    this.IssueRequestItemLine.Quantity = "";
                    return false;
                }

            },
            StoreChanged(e){
                this.StockFoundItems = "";
                this.IssueRequestItemLine.StockItemID = "";
            },
            searchItems(value) {

                /* check if the selected item exists in the store */
                if(this.IssueRequestItemLine.StoreNumber == ""){
                    Swal('Please Select Store First', 'Please Select Store before contiune.', 'warning');
                    this.IssueRequestItemLine.StockItemID = "";
                    return false
                }

                this.IssueRequestItemLine.StockItemID = "";
                this.searchItemsLoading = true;
                axios.post('/api/data/get_search_stock_items_by_store', { searchQuery: value, StoreID: this.IssueRequestItemLine.StoreNumber})
                    .then((response) => {
                        this.StockFoundItems = response.data;
                        this.searchItemsLoading = false;
                        console.log(this.StockFoundItems);
                    })
            },
            AddItem: function() {

                if(this.IssueRequestItemLine.Latitude == ""){
                    Swal('Missing Map Location', 'Please Select a Location on Map to create Item Line', 'warning');
                    return false;
                }

                this.$refs.StockItemIssueRequestForm.validate((validation) => {


                    if(validation){
                        this.IssueRequestsAllItems.push(Object.assign({}, this.IssueRequestItemLine));

                        this.IssueRequestItemLine.StoreNumber = "";
                        this.IssueRequestItemLine.StockItemID = "";
                        this.IssueRequestItemLine.ItemDescription = "";
                        this.IssueRequestItemLine.Quantity = "";
                        this.IssueRequestItemLine.ItemLineNote = "";
                        this.IssueRequestItemLine.Longitude = "";
                        this.IssueRequestItemLine.Latitude = "";
                        this.IssueRequestItemLine.LocationName = "";

                        // this.scrollTo(0, 1000);
                    }
                })
            },
            showItemDetails: function(key, event) {
                if (event) event.preventDefault();

                this.IssueRequestItemModalInfoKey = key;
                this.IssueRequestItemModalInfo = Object.assign({}, this.IssueRequestsAllItems[key]);
                this.$forceUpdate();

                $('#IssueRequestModalId').modal('toggle');

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
                        this.IssueRequestsAllItems.splice(key, 1);
                    }
                })

            },
            SubmitIssanceRequestList() {
                if (event) event.preventDefault();
                console.log(this.IssueRequestsAllItems);
                axios.post('/api/stores/post_stock_item_issue_request', this.IssueRequestsAllItems)
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
                this.IssueRequestItemLine.StoreNumber = "";
                this.IssueRequestItemLine.StockItemID = "";
                this.IssueRequestItemLine.Quantity = "";
                this.IssueRequestItemLine.ItemLineNote = "";
                this.IssueRequestItemLine.Longitude = "";
                this.IssueRequestItemLine.Latitude = "";
                this.IssueRequestItemLine.LocationName = "";
                this.IssueRequestsAllItems = [];

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

                            self.CompanyDetailsLoaded = true;

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
                    self.IssueRequestItemLine.Longitude = marker.getPosition().lat();
                    self.IssueRequestItemLine.Latitude = marker.getPosition().lng();
                });


                // When modal window is open, this script resizes the map and resets the map center
                $("#DeliveryLocation").on("shown.bs.modal", function(e) {
                  google.maps.event.trigger(map, "resize");
                  return map.setCenter(myLatLng);
                });

            };

            google.maps.event.addDomListener(window, "load", initializeMap("#map-canvas"));
            
        },
        beforeRouteLeave (to, from, next) {

            if(this.IssueRequestsAllItems.length > 0){
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

    #Issuance_Request_List_Table{
        max-height: 570px;
        overflow-y: scroll;
    }

    #Issuance_Request_Form{
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

    #IssueRequestModalId .modal-dialog {
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