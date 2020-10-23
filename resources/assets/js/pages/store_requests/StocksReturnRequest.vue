<template>
        
    <div class="row">
        <div id='Stock_Return_Request_Form' class="col-lg-12">
            <div class="card" v-if="StocksReqeuestsLoaded">
                <div class="card-header">
                    <h4>Stock Return Request</h4>
                </div>
                <div class="card-body">
                    <el-form :model="StockReturnRequestDetails" class="demo-form-inline" :rules="rules" ref="StockReturnRequestForm">

                        <el-row :gutter="20">  


                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="Select Issuance Request" prop="StockIssuanceRequestID">

                                        <el-select filterable style="width: 100%; padding: 0px;" @change="IssuanceRequestSelect($event)" v-model="StockReturnRequestDetails.StockIssuanceRequestID" placeholder="Select Issuance Request">
                                            
                                            <el-option v-for="(IssuanceRequest, index) in StockRequestsList" :key="IssuanceRequest.id" :label="'Request ID# '+IssuanceRequest.id+', Original Requested Quantity: '+IssuanceRequest.quantity+', Total Received Value: '+IssuanceRequest.totalreceived+', Total Returned: '+IssuanceRequest.totalreturned" :value="IssuanceRequest.id"></el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>                      

                            <el-col :span="24" >
                                <div class="grid-content">

                                    <el-form-item label="Enter Returned Quantity" prop="ReturnedQuantity">
                                        <el-input @change="CheckReturnedQty($event)" min='0.0000001' type="number" placeholder="Enter Returned Quantity" v-model="StockReturnRequestDetails.ReturnedQuantity">
                                        </el-input>
                                    </el-form-item>

                                </div>
                            </el-col>
                        
                            <el-col :span="24" >
                                <div class="grid-content">

                                    <el-form-item label="Addtional Return Notes" prop="ReturnNotes">
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Additional Return Note."
                                            v-model="StockReturnRequestDetails.ReturnNotes">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </el-col>
    
                            <el-col :span="24" >
                            <el-form-item>
                                    <el-button style="width: 100%" type="primary" icon="plus" :disabled=disabledToggle @click.prevent="createNewStockReturnRequest">
                                      Create New Stock Return Request
                                    </el-button>
                                </el-form-item>
                            </el-col>

                        </el-row>
                    </el-form>

                </div>
                
            </div>
            <div class="card" v-else>
                <div class="card-header">
                    <h4>Stock Item Return Request</h4>
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


    </div>


            
</template>

<script>
    
    //import { CustomJs } from '../../helpers/custom.js';
    import validate from 'validate.js';

    export default {
        name: 'new-stock-return-request',
        data(){
            return {
                hostName: window.location.protocol+'//'+window.location.hostname,
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
                StockRequestsList: [],
                disabledToggle: false,
                MaxReturnQty: "",
                StocksReqeuestsLoaded: false,
                StockReturnRequestDetails: {
                    StoreId: "",
                    StockIssuanceRequestID: "",
                    IssuanceRecordID: "",
                    StockItemID: "",
                    ReturnedQuantity: "",
                    ReturnNotes: "",
                },
                rules: {
                    StockIssuanceRequestID: [{
                        required: true,
                        message: "Please Select Issue Request",
                        trigger: ["blur"]
                    }],
                    IssuanceRecordID: [{
                        required: true,
                        message: "Please Select Issuing Batch",
                        trigger: "blur"
                    }],
                    ReturnedQuantity: [{
                        required: true,
                        message: "Please Enter Quantity",
                        trigger: "blur"
                    }],
                    ReturnNotes: [{
                        required: true,
                        message: "Please Return Notes is Required.",
                        trigger: "blur"
                    }]
                },
            }
        },
        methods: {
            IssuanceRequestSelect(TotalReceivedValue){
                let obj = this.StockRequestsList.find(o => o.id === TotalReceivedValue);
                this.StockReturnRequestDetails.ReturnedQuantity = obj.totalreturable;
                this.StockReturnRequestDetails.StockItemID = obj.stock_item_id;
                this.StockReturnRequestDetails.StoreId = obj.project_id;
                this.MaxReturnQty = obj.totalreturable;
            },
            CheckReturnedQty(EnteredQuantity){
                if(this.StockReturnRequestDetails.StockIssuanceRequestID == ""){
                    Swal('Please Select Stock Issuance Request First', '', 'warning');
                    this.StockReturnRequestDetails.ReturnedQuantity = "";
                    return false;
                }
                if(EnteredQuantity < 0){
                    Swal('Zero and Negative values are not allowed', '', 'warning');
                    this.StockReturnRequestDetails.ReturnedQuantity = 1;
                    return false;
                }
                if(EnteredQuantity > this.MaxReturnQty ){
                    Swal('Return Quantity Can Exceed The Received Quantity '+this.MaxReturnQty, '', 'warning');
                    this.StockReturnRequestDetails.ReturnedQuantity = this.MaxReturnQty;
                    return false;
                }
            },
            createNewStockReturnRequest() {
                if (event) event.preventDefault();
                let self = this;
                this.disabledToggle = true;

                this.$refs.StockReturnRequestForm.validate((validation) => {
                    
                    if(validation){

                        axios.post('/api/stores/create_stock_return_request', this.StockReturnRequestDetails)
                            .then(function(response){
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 10000
                                });

                                self.StockReturnRequestDetails.StockIssuanceRequestID = "";
                                self.StockReturnRequestDetails.IssuanceRecordID = "";
                                self.StockReturnRequestDetails.ReturnedQuantity = "";
                                self.StockReturnRequestDetails.ReturnNotes = "";

                                self.disabledToggle = false;

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Stock Return Request Submit)', 'error');
                            });

                        } else {
                            self.disabledToggle = false;
                        }
                    });

                //Clear All Data
                

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

            let self = this;

            axios.get('/api/data/get_user_stock_issuance_request_list')
                .then((FirstResponse) => {
                    this.StockRequestsList = FirstResponse.data;
                    console.log(this.StockRequestsList); 
                    this.StocksReqeuestsLoaded = true;
                });
            
        },
        beforeRouteLeave (to, from, next) {

            next();

            // Swal({
            //     title: 'Navigate Away?',
            //     text: "Are you sure you want to navigate away, all unsubmitted data will be lost?",
            //     type: 'warning',
            //     showCancelButton: true,
            //     confirmButtonColor: '#3085d6',
            //     cancelButtonColor: '#d33',
            //     confirmButtonText: 'Yes, Remove It!'
            // }).then((result) => {
            //     if (result.value) {
            //         next()
            //     } else {
            //         next(false)
            //     }
            // })
            
        }
    }

</script>


<style>

    #Stock_Return_Request_Form{
        -webkit-transition: max-width 0.8s;
        -moz-transition: max-width 0.8s;
        transition: max-width 0.8s;
        overflow:hidden;
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