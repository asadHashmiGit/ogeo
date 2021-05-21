<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>New Request To Update The Set-up Budget</h4>
                </div>
                <div class="card-body">
                    <el-form :model="ItemCreationInfo" class="demo-form-inline" :rules="rules" ref="SetUpBudgetCreationRequestForm">

                        <el-row :gutter="24">
                            
                            <transition v-if="CompanyDetails.setup_mode == 'Project Wise'">
                                <el-col :span="24">
                                    <div class="grid-content">
                                        <el-form-item label="temp" prop="ProjectId">
                                            <span slot="label"><b>Select A Set-up</b></span>

                                            <el-select filterable style="width: 100%; padding: 0px;" @change="getSetUpData(ItemCreationInfo.ProjectId)" v-model="ItemCreationInfo.ProjectId" placeholder="Select A Set-up">
                                                
                                                <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Project Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                    <div class="card-body" v-if="this.CompanyDetailsSUB.id">
                                        <table class="display responsive table table-bordered table-hover" style="width:100%">
                                            <tr>
                                                <th>Set-up Period <br><br>
                                                    <span>Start Date: {{CompanyDetailsSUB.start_date | formatDateNoTime}}</span><br>
                                                    <span>Initial End Date: {{CompanyDetailsSUB.initial_end_date | formatDateNoTime}}</span>
                                                </th>
                                                <th>Set-up Initial Budget</th>
                                                <th>Consumed Budget</th>
                                                <th>Current Available Budget</th>
                                            </tr>
                                            <tr>
                                                <td><b>Current End Date:</b> {{CompanyDetailsSUB.end_date | formatDateNoTime}} <br> <b v-if="this.enter_end_date && this.showEnterData">Requested New End Date: {{this.enter_end_date | formatDateNoTime}}</b> </td>
                                                <td>{{CompanyDetailsSUB.f_initial_value}}</td>
                                                <td>{{CompanyDetailsSUB.f_consumed_budget}}</td>
                                                <td>{{CompanyDetailsSUB.f_available_budget}}<br> <b v-if="this.enter_available_budget && this.showEnterData">Requested New Available Budget: {{this.enter_available_budget}} {{CompanyDetailsSUB.currency}}</b></td>
                                            </tr>
                                        </table>
                                    
                                    <div class="form-row">
                                    <div class="col">
                                    <el-form-item v-if="this.CompanyDetailsSUB.id">
                                        <span slot="label"><b>Enter Requested New End Date</b></span>

                                        <el-date-picker  style="width:100%"
                                            :picker-options="pickerOptions"
                                            v-model="enter_end_date"
                                            type="date"
                                            format="dd-MMM-yyyy"
                                            value-format="yyyy-MM-dd"
                                            >
                                        </el-date-picker>
                                    </el-form-item>
                                    </div>
                                    <div class="col">
                                    <el-form-item v-if="this.CompanyDetailsSUB.id">
                                        <span slot="label"><b>Enter Requested New Available Budget</b></span>

                                        <el-input
                                            type="number"
                                            v-model="enter_available_budget">
                                        </el-input>
                                    </el-form-item>
                                    </div>
                                
                                    </div>
                                    <!-- <div class="form-group">
                                        <label>Enter Requested New End Date</label>
                                        <el-date-picker style="width:280px"  
                                            :picker-options="pickerOptions"
                                            v-model="enter_end_date"
                                            type="date"
                                            format="dd-MMM-yyyy"
                                            value-format="yyyy-MM-dd"
                                            >
                                        </el-date-picker>
                                    </div>
                                    <div class="form-group">
                                        <label>Enter Requested New Available</label>
                                        <input type="number" class="form-control"  v-model="enter_available_budget">
                                    </div> -->
                                    <el-form-item v-if="this.CompanyDetailsSUB.id">
                                        <span slot="label"><b>Reason for the Request</b></span>
                                        <el-input
                                            type="textarea"
                                            :rows="2"
                                            placeholder="Please mention your reason for request."
                                            v-model="enter_comments">
                                        </el-input>
                                    </el-form-item>
                                    </div>
                                </el-col>
                            </transition>
                            <el-col :span="24" v-if="this.CompanyDetailsSUB.id">
                                <!-- <hr v-if="this.enter_comments && (this.enter_end_date || this.enter_available_budget)">
                                <button type="button" v-if="this.enter_comments && (this.enter_end_date || this.enter_available_budget)" @click="SubmitSetUpBudgetCreationRequest" class="btn btn-success btn-block waves-effect text-center">Create A Request To Update The Set-up Budget</button> -->
                                 <hr>
                                <button type="button" @click="SubmitSetUpBudgetCreationRequest" class="btn btn-success btn-block waves-effect text-center">Create A Request To Update The Set-up Budget</button>
                            </el-col>

                        </el-row>
                    </el-form>

                </div>
            </div>
            
        </div>
    </div>
            
</template>

<script>

    import validate from 'validate.js';
    import moment from 'moment';

    export default {
        name: 'new-item-creation-request',
        data(){

            var CheckURL = (rule, value, callback) => {
                if (this.isUrlValid(value)) {
                    callback();
                } else {

                    if(value === ''){
                        callback();
                    } else {
                        callback(new Error('Please Enter Valide URL. (e.g. http://ogeo.me/example Or http://www.ogeo.me/example)'));
                    }
                    
                }
            };

            return{
                pickerOptions: {
                    disabledDate: this.disabledDate
                },
                CompanyDetails: {},
                JobNumbers: {},
                showEnterData:0,
                
                CompanyDetailsSUB: {},
                ItemCreationInfo: {
                    ProjectId: "",
                    ItemDescription: "",
                    ItemLink: "",
                    ItemDocuments: []
                },
                enter_end_date: "",
                enter_available_budget: '',
                enter_comments: '',
                rules: {
                    ProjectId: [{
                        required: true,
                        message: "Please Select A Set-up",
                        trigger: ["blur"]
                    }],
                    enter_available_budget: [{
                        required: true,
                        message: "Please Enter Avaialbe Budget",
                        trigger: "blur"
                    }],
                    enter_end_date: [{
                        required: true,
                        message: "Please Enter End Date",
                        trigger: "blur"
                    }],
                    enter_comments: [{
                        required: true,
                        message: "Please Type Description",
                        trigger: ["blur"]
                    }],
                }
            }
        },
        methods: {
            disabledDate(time) {
                return time.getTime() < Date.now() - 8.64e7  
            },
            getSetUpData(id){
                axios.get('/api/data/save_company_details_sub/' + id)
                    .then((res) => {
                        this.CompanyDetailsSUB = res.data;
                        this.CompanyDetailsSUB.available_budget = this.CompanyDetailsSUB.value - this.CompanyDetailsSUB.consumed_budget
                        this.CompanyDetailsSUB.f_initial_value = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.CompanyDetailsSUB.currency, maximumFractionDigits: 2, }).format(this.CompanyDetailsSUB.initial_value);
                        this.CompanyDetailsSUB.f_consumed_budget = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.CompanyDetailsSUB.currency, maximumFractionDigits: 2, }).format(this.CompanyDetailsSUB.consumed_budget);
                        this.CompanyDetailsSUB.f_available_budget = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 3, style: 'currency', currency: this.CompanyDetailsSUB.currency, maximumFractionDigits: 2, }).format(this.CompanyDetailsSUB.available_budget);
                    });
            },
            CheckEnterData(item){
                var currentDate = new Date();
                var currentDateWithFormat = new Date().toJSON().slice(0,10).replace(/-/g,'-');
                
                if(this.enter_available_budget != null ){
                    this.showEnterData = 1
                    $('#exampleModal1').modal('hide');    
                }
                else if(this.enter_end_date != null){
                    this.showEnterData = 1
                    $('#exampleModal1').modal('hide');    
                }
                else{
                    Swal('Error Occured', 'Fileds are Empty', 'error');
                }
            },
            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },
            SubmitItemCreationRequestSUB(){
                axios.post('/api/users/new_item_creation_request_SUB', this.CompanyDetailsSUB)
                    .then((res) => {
                        // this.CompanyDetailsSUB = res.data;
                    });
            },
            SubmitSetUpBudgetCreationRequest: function(){

                let self = this;

                if (event) event.preventDefault();

                if(this.enter_end_date == '' && this.enter_available_budget == ''){
                    Swal('Error Occured', 'Fileds are Empty', 'error');
                    return false;
                }
                else if(this.enter_end_date != '' && this.enter_available_budget != ''){
                    if(this.enter_comments == ''){
                        Swal('Error Occured', 'Mention your reason for the request', 'error');
                        return false;
                    }
                }
                else if(this.enter_end_date == '' && this.enter_available_budget != ''){
                    if(this.enter_comments == ''){
                        Swal('Error Occured', 'Mention your reason for the request', 'error');
                        return false;
                    }
                }
                else if(this.enter_end_date != '' && this.enter_available_budget == ''){
                    if(this.enter_end_date == null){
                        Swal('Error Occured', 'Fileds are Empty', 'error');
                        return false;
                    }
                    if(this.enter_comments == ''){
                        Swal('Error Occured', 'Mention your reason for the request', 'error');
                        return false;
                    } 
                }

                this.$refs.SetUpBudgetCreationRequestForm.validate((validation) => {

                    if(validation){
                        let formData = new FormData();
                        
                        formData.append('ProjectId', this.ItemCreationInfo.ProjectId);
                        formData.append('ItemDescription', this.ItemCreationInfo.ItemDescription);
                        formData.append('ItemLink', this.ItemCreationInfo.ItemLink);
                        formData.append('EnterAmount', this.enter_available_budget);
                        formData.append('EnterEndDate', this.enter_end_date);
                        formData.append('EnterComments', this.enter_comments);
                        formData.append('ArrayData', this.CompanyDetailsSUB);
                


                        axios.post( '/api/users/new_set_up_budget_creation_request',
                            formData,
                            {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            }
                        ).then(function(response){
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
                        this.enter_available_budget = ''
                        this.enter_end_date = ''
                        this.enter_comments = ''
                        this.showEnterData = 0
                        this.ItemCreationInfo.ProjectId = "";
                        this.ItemCreationInfo.ItemDescription = "";
                        this.ItemCreationInfo.ItemLink = "";
                        this.CompanyDetailsSUB = []

                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.ItemCreationInfo.ProjectId = Object.keys(this.JobNumbers)[0];
                        }

                    } else {

                    }

                });
                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is 3 Files', 'The limit is 3 files per request, you selected ' + files.length + ' file(s) this time, adding up to '+ parseInt(files.length + fileList.length) + ' totally', 'warning')
                
            }
        },
        mounted(){
            axios.get('/api/data/get_user_projects_list_bus')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {
                        this.CompanyDetails = SecondResponse.data;
                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.ItemCreationInfo.ProjectId = Object.keys(this.JobNumbers)[0];
                        }
                    });
                });

        },
        beforeRouteEnter (to, from, next) {
            let currentUser = JSON.parse(localStorage.getItem("user"));
            
            if(currentUser.hasOwnProperty('SUBO')){
                next();
            } else if (currentUser.hasOwnProperty('SUBV')) {
                next('/app/set_up_budget/budget_requests_list');
            } else {
                next('/app/dashboard');
            }
            
        },
        beforeRouteLeave (to, from , next) {
            if(this.CompanyDetailsSUB.id){
                Swal({
                    title: 'Navigate Away?',
                text: "Are you sure you want to navigate away, all unsubmitted data will be lost?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes!'
                }).then((result) => {
                    if (result.value) {
                        next()
                    } else {
                        next(false)
                    }
                })
            }
            else{
                next()
            }
        }
    }

</script>