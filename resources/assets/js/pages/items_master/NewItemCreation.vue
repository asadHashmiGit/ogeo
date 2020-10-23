<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>New Item Creation</h4>
                </div>
                <div class="card-body">

                    <el-form :model="NewItemInfo" class="demo-form-inline" :rules="rules" ref="ItemCreationForm">
                        
                        <div class="row">
                            <transition v-if="CompanyDetails.setup_mode == 'Project Wise'">
                                <div class="col-lg-12">
                                    <div class="grid-content">
                                        <el-form-item label="Select Job Number" prop="ItemProjectId">

                                            <el-select filterable style="width: 100%; padding: 0px;" v-model="NewItemInfo.ItemProjectId" placeholder="Select Job Number">
                                                
                                                <el-option v-for="(JobNumber, JobNumberId, index) in JobNumbers" :key="JobNumberId" :label="'Number: '+ JobNumberId + '   -   Name: '+JobNumber" :value="JobNumberId"></el-option>
                                                
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                </div>
                            </transition>

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Select A Template">
                                        <el-select style="width: 100%; padding: 0px;"
                                            v-model="NewItemInfo.TemplateID" 
                                            filterable
                                            @change="GetTemplateStructure"
                                            placeholder="Select A Template">

                                            <el-option v-for="(option, key) in TemplatesList" 
                                                :key="key" 
                                                :label="option" 
                                                :value="key">
                                            </el-option>
                                            
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>
                        </div>

                        <div class="row" v-if="TemplateDetailsLoaded">

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_1 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_1" prop="ItemField_1">
                                        <el-input ref="Template_Name" v-model="NewItemInfo.ItemField_1" :placeholder="'Enter '+ItemMasterSetupInfo.field_1"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_2 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_2" prop="ItemField_2">
                                        <el-input  v-model="NewItemInfo.ItemField_2" :placeholder="'Enter '+ItemMasterSetupInfo.field_2"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_3 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_3" prop="ItemField_3">
                                        <el-input  v-model="NewItemInfo.ItemField_3" :placeholder="'Enter '+ItemMasterSetupInfo.field_3"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_4 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_4" prop="ItemField_4">
                                        <el-input  v-model="NewItemInfo.ItemField_4" :placeholder="'Enter '+ItemMasterSetupInfo.field_4"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_5 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_5" prop="ItemField_5">
                                        <el-input  v-model="NewItemInfo.ItemField_5" :placeholder="'Enter '+ItemMasterSetupInfo.field_5"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_6 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_6" prop="ItemField_6">
                                        <el-input  v-model="NewItemInfo.ItemField_6" :placeholder="'Enter '+ItemMasterSetupInfo.field_6"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_7 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_7" prop="ItemField_7">
                                        <el-input  v-model="NewItemInfo.ItemField_7" :placeholder="'Enter '+ItemMasterSetupInfo.field_7"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_8 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_8" prop="ItemField_8">
                                        <el-input  v-model="NewItemInfo.ItemField_8" :placeholder="'Enter '+ItemMasterSetupInfo.field_8"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_9 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_9" prop="ItemField_9">
                                        <el-input  v-model="NewItemInfo.ItemField_9" :placeholder="'Enter '+ItemMasterSetupInfo.field_9"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_10 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_10" prop="ItemField_10">
                                        <el-input  v-model="NewItemInfo.ItemField_10" :placeholder="'Enter '+ItemMasterSetupInfo.field_10"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_11 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_11" prop="ItemField_11">
                                        <el-input  v-model="NewItemInfo.ItemField_11" :placeholder="'Enter '+ItemMasterSetupInfo.field_11"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_12 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_12" prop="ItemField_12">
                                        <el-input  v-model="NewItemInfo.ItemField_12" :placeholder="'Enter '+ItemMasterSetupInfo.field_12"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_13 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_13" prop="ItemField_13">
                                        <el-input  v-model="NewItemInfo.ItemField_13" :placeholder="'Enter '+ItemMasterSetupInfo.field_13"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_14 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_14" prop="ItemField_14">
                                        <el-input  v-model="NewItemInfo.ItemField_14" :placeholder="'Enter '+ItemMasterSetupInfo.field_14"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_15 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_15" prop="ItemField_15">
                                        <el-input  v-model="NewItemInfo.ItemField_15" :placeholder="'Enter '+ItemMasterSetupInfo.field_15"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_16 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_16" prop="ItemField_16">
                                        <el-input  v-model="NewItemInfo.ItemField_16" :placeholder="'Enter '+ItemMasterSetupInfo.field_16"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_17 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_17" prop="ItemField_17">
                                        <el-input  v-model="NewItemInfo.ItemField_17" :placeholder="'Enter '+ItemMasterSetupInfo.field_17"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_18 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_18" prop="ItemField_18">
                                        <el-input  v-model="NewItemInfo.ItemField_18" :placeholder="'Enter '+ItemMasterSetupInfo.field_18"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_19 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_19" prop="ItemField_19">
                                        <el-input  v-model="NewItemInfo.ItemField_19" :placeholder="'Enter '+ItemMasterSetupInfo.field_19"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-4" v-if="ItemMasterSetupInfo.field_20 != 'Ogeo-None'">
                                <div class="grid-content">
                                    <el-form-item :label="'Enter '+ItemMasterSetupInfo.field_20" prop="ItemField_20">
                                        <el-input  v-model="NewItemInfo.ItemField_20" :placeholder="'Enter '+ItemMasterSetupInfo.field_20"></el-input>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <el-upload
                                    action="#"
                                    list-type="picture-card"
                                    :limit="3"
                                    id='UploadDocuments'
                                    :auto-upload="false"
                                    ref="UploadDocuments"
                                    :on-exceed="handleExceed"
                                    :on-remove="handleRemove">
                                    <i class="el-icon-plus"></i>
                                </el-upload>
                                <span>You can upload maximum of 3 images per item.</span>
                            </div>

                            <div class="col-lg-12">
                                <hr>
                                <button type="button" @click="SubmitNewItemCreation" class="btn btn-success btn-block waves-effect text-center">Create New Item</button>
                            </div>


                            <div class="col-lg-12">
                                <hr>
                                <div class="grid-content">
                                    <el-form-item label="Item Description (Readonly / Not Editable)" prop="ItemDescription">

                                        <el-input
                                            style=""
                                            readonly
                                            type="textarea"
                                            :rows="4"
                                            v-model="NewItemInfo.ItemDescription">
                                        </el-input>
                                        
                                    </el-form-item>
                                </div>
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
        name: 'new-item-creation',
        data(){

            return{
                CompanyDetails: {},
                JobNumbers: {},
                ItemMasterSetupInfo: {},
                TemplatesList: {},
                TemplateDetailsLoaded: false,
                NewItemInfo: {
                    ItemProjectId: "",
                    TemplateID: "",
                    ItemField_1: "",
                    ItemField_2: "",
                    ItemField_3: "",
                    ItemField_4: "",
                    ItemField_5: "",
                    ItemField_6: "",
                    ItemField_7: "",
                    ItemField_8: "",
                    ItemField_9: "",
                    ItemField_10: "",
                    ItemField_11: "",
                    ItemField_12: "",
                    ItemField_13: "",
                    ItemField_14: "",
                    ItemField_15: "",
                    ItemField_16: "",
                    ItemField_17: "",
                    ItemField_18: "",
                    ItemField_19: "",
                    ItemField_20: "",
                    ItemDescription: "",
                },
                rules: {
                    ItemProjectId: [{
                        required: true,
                        message: "Please Select Project",
                        trigger: ["blur", "change"]
                    }],
                    TemplateID: [{
                        required: true,
                        message: "Please Select Template",
                        trigger: ["blur", "change"]
                    }],
                    ItemDescription: [{
                        required: false,
                        message: "Please Enter Item Description",
                        trigger: "blur"
                    }],
                    ItemField_1: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_2: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_3: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_4: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_5: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_6: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_7: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_8: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_9: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_10: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_11: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_12: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_13: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_14: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_15: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_16: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_17: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_18: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_19: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                    ItemField_20: [{
                        required: false,
                        message: "Required Field",
                        trigger: ["blur", "change"]
                    }],
                }
            }
        },
        methods: {

            GetTemplateStructure(templateId){

                console.log('Geting Template Strucutre');

                axios.post('/api/data/get_item_master_template_details', {TemplateID: templateId})
                .then((response) => {

                    this.ItemMasterSetupInfo = response.data;
                    this.TemplateDetailsLoaded = true;

                    console.log(this.ItemMasterSetupInfo);
                    
                    if(this.ItemMasterSetupInfo.field_1_required == 'Yes'){
                        this.rules.ItemField_1[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_2_required == 'Yes'){
                        this.rules.ItemField_2[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_3_required == 'Yes'){
                        this.rules.ItemField_3[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_4_required == 'Yes'){
                        this.rules.ItemField_4[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_5_required == 'Yes'){
                        this.rules.ItemField_5[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_6_required == 'Yes'){
                        this.rules.ItemField_6[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_7_required == 'Yes'){
                        this.rules.ItemField_7[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_8_required == 'Yes'){
                        this.rules.ItemField_8[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_9_required == 'Yes'){
                        this.rules.ItemField_9[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_10_required == 'Yes'){
                        this.rules.ItemField_10[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_11_required == 'Yes'){
                        this.rules.ItemField_11[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_12_required == 'Yes'){
                        this.rules.ItemField_12[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_13_required == 'Yes'){
                        this.rules.ItemField_13[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_14_required == 'Yes'){
                        this.rules.ItemField_14[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_15_required == 'Yes'){
                        this.rules.ItemField_15[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_16_required == 'Yes'){
                        this.rules.ItemField_16[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_17_required == 'Yes'){
                        this.rules.ItemField_17[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_18_required == 'Yes'){
                        this.rules.ItemField_18[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_19_required == 'Yes'){
                        this.rules.ItemField_19[0].required = true;
                    }
                    if(this.ItemMasterSetupInfo.field_20_required == 'Yes'){
                        this.rules.ItemField_20[0].required = true;
                    }

                })
                
            },
            
            SubmitNewItemCreation() {

                this.$refs.ItemCreationForm.validate((validation) => {

                    if(validation){

                        let formData = new FormData();

                        if(!this.$refs.UploadDocuments.uploadFiles[0]){
                            Swal('Item Picture Required', 'You must upload atleast one picutre for the item', 'warning')
                            return false;
                        }

                        for( var i = 0; i < this.$refs.UploadDocuments.uploadFiles.length; i++ ){
                            let file = this.$refs.UploadDocuments.uploadFiles[i].raw;
                            formData.append('ItemPictures['+i+']', file);
                        }

                        formData.append('NewItemInfo', JSON.stringify(this.NewItemInfo));

                        axios.post( '/api/users/item_master_creation',
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
                                timer: 10000
                            });

                        })
                        .catch(function(){
                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (ItemCreationForm)', 'error');
                        });

                        this.NewItemInfo.ItemProjectId = "";
                        this.NewItemInfo.TemplateID = "";
                        this.NewItemInfo.ItemField_1 = "";
                        this.NewItemInfo.ItemField_2 = "";
                        this.NewItemInfo.ItemField_3 = "";
                        this.NewItemInfo.ItemField_4 = "";
                        this.NewItemInfo.ItemField_5 = "";
                        this.NewItemInfo.ItemField_6 = "";
                        this.NewItemInfo.ItemField_7 = "";
                        this.NewItemInfo.ItemField_8 = "";
                        this.NewItemInfo.ItemField_9 = "";
                        this.NewItemInfo.ItemField_10 = "";
                        this.NewItemInfo.ItemField_11 = "";
                        this.NewItemInfo.ItemField_12 = "";
                        this.NewItemInfo.ItemField_13 = "";
                        this.NewItemInfo.ItemField_14 = "";
                        this.NewItemInfo.ItemField_15 = "";
                        this.NewItemInfo.ItemField_16 = "";
                        this.NewItemInfo.ItemField_17 = "";
                        this.NewItemInfo.ItemField_18 = "";
                        this.NewItemInfo.ItemField_19 = "";
                        this.NewItemInfo.ItemField_20 = "";
                        this.NewItemInfo.ItemDescription = "";

                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.NewItemInfo.ItemProjectId = Object.keys(this.JobNumbers)[0];
                        }

                    }

                })

                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is ' + fileList.length + ' Picture', 'The limit is ' + fileList.length + ' picture per item, if you would like to upload more than one image please Ogéo support team', 'warning')
                
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },

        },
        mounted(){

            axios.get('/api/data/get_item_templates_list')
                .then((response) => {
                    this.TemplatesList = response.data;
                });

            axios.get('/api/data/get_user_projects_list')
                .then((FirstResponse) => {
                    this.JobNumbers = FirstResponse.data;
                    axios.get('/api/data/get_company_details')
                    .then((SecondResponse) => {
                        this.CompanyDetails = SecondResponse.data;
                        if(this.CompanyDetails.setup_mode == 'Company Wide'){
                            this.NewItemInfo.ItemProjectId = Object.keys(this.JobNumbers)[0];
                        }
                    });
                });


        },
    }

</script>