<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>New Request To Update The Library of Materials</h4>
                </div>
                <div class="card-body">
                    <el-form :model="ItemCreationInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationRequestForm">

                        <el-row :gutter="24">
                            
                            <transition v-if="CompanyDetails.setup_mode == 'Project Wise'">
                                <el-col :span="24">
                                    <div class="grid-content">
                                        <el-form-item label="temp" prop="ProjectId">
                                            <span slot="label"><b>Select A Set-up</b></span>

                                            <el-select filterable style="width: 100%; padding: 0px;" v-model="ItemCreationInfo.ProjectId" placeholder="Select A Set-up">
                                                
                                                <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Project Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                </el-col>
                            </transition>

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="ItemDescription">
                                        <span slot="label"><b>Enter The Description Of The Item That You Would Like To Add To The Library Of Materials</b></span>

                                        <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                            <span class="tooltip-item2">
                                                <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                                
                                            </span>
                                            <span class="tooltip-content4 clearfix">
                                                <span class="tooltip-text2">
                                                    <b>The description shall be clear enough</b> so that it is easy to properly describe the new material at the time of its addition to the Library of Materials
                                                </span>
                                            </span>
                                        </span>
                                        
                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter The Description Of The Item That You Would Like To Add To The Library Of Materials"
                                            v-model="ItemCreationInfo.ItemDescription">
                                        </el-input>
                                        
                                    </el-form-item>
                                </div>

                                <div class="grid-content">
                                    <el-form-item label="temp" prop="ItemLink">
                                        <span slot="label"><b>Enter Link To Document(s) Which Describe The Item That You Would Like To Add To The Library Of Materials</b></span>
                                        <el-input v-model="ItemCreationInfo.ItemLink" placeholder="http://www.itemsinfo.com/itemlink/232/wsd"></el-input>
                                    </el-form-item>
                                </div>

                                
                                <div style="width: 100%" class="grid-content">
                                    <el-form-item style="margin-bottom: 0px;" label="temp" prop="ItemDocuments">
                                        <span slot="label"><b>Upload Any Documents Which Describe The Item That You Would Like To Add To The Library Of Materials</b></span>
                                    </el-form-item>

                                    <el-upload
                                        class="upload-demo"
                                        id='UploadDocuments'
                                        :auto-upload="false"
                                        ref="UploadDocuments"
                                        multiple
                                        action="#"
                                        :limit="3"
                                        :on-exceed="handleExceed"
                                        :file-list="ItemCreationInfo.ItemDocuments"
                                        >

                                        <button type="button" slot="trigger" class="btn btn-success">Select File</button>
                                      
                                        <div class="el-upload__tip" slot="tip">Any file type is accepted with a size less than 3Mb (Max 3 Files)</div>
                                    </el-upload>
                                    

                                </div>

                            </el-col>


                            
                            <el-col :span="24">
                                <hr>
                                <button type="button" @click="SubmitItemCreationRequest" class="btn btn-success btn-block waves-effect text-center">Create A Request To Add The New Item To The Library of Materials</button>
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
                CompanyDetails: {},
                JobNumbers: {},
                ItemCreationInfo: {
                    ProjectId: "",
                    ItemDescription: "",
                    ItemLink: "",
                    ItemDocuments: []
                },
                rules: {
                    ProjectId: [{
                        required: true,
                        message: "Please Select A Set-up",
                        trigger: ["blur"]
                    }],
                    ItemDescription: [{
                        required: true,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    ItemDocuments: [{
                        required: false,
                        message: "Please Upload At least one documenet",
                        trigger: "blur"
                    }],
                    ItemLink: [{
                        validator: CheckURL,
                        trigger: "blur"
                    }],
                }
            }
        },
        methods: {

            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },

            SubmitItemCreationRequest: function(){

                let self = this;

                if (event) event.preventDefault();

                this.$refs.ItemCreationRequestForm.validate((validation) => {

                    if(validation){


                        //Validate File Size
                        /*const isJPG = file.type === 'image/jpeg';
                        const isLt2M = file.size / 1024 / 1024 < 2;

                        if (!isJPG) {
                          this.$message.error('Avatar picture must be JPG format!');
                        }
                        if (!isLt2M) {
                          this.$message.error('Avatar picture size can not exceed 2MB!');
                        }
                        return isJPG && isLt2M;*/


                        let formData = new FormData();

                        for( var i = 0; i < this.$refs.UploadDocuments.uploadFiles.length; i++ ){
                            let file = this.$refs.UploadDocuments.uploadFiles[i].raw;
                            formData.append('FileUploads['+i+']', file);
                        }
                        
                        formData.append('ProjectId', this.ItemCreationInfo.ProjectId);
                        formData.append('ItemDescription', this.ItemCreationInfo.ItemDescription);
                        formData.append('ItemLink', this.ItemCreationInfo.ItemLink);

                        axios.post( '/api/users/new_item_creation_request',
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

                        this.ItemCreationInfo.ProjectId = "";
                        this.ItemCreationInfo.ItemDescription = "";
                        this.ItemCreationInfo.ItemLink = "";

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

            axios.get('/api/data/get_user_projects_list_almr')
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
            
            if(currentUser.hasOwnProperty('ALMR')){
                next();
            } else if (currentUser.hasOwnProperty('LMA') || currentUser.hasOwnProperty('ALMV')) {
                next('/app/items_master/requests_list');
            } else {
                next('/app/dashboard');
            }
            
        }
    }

</script>