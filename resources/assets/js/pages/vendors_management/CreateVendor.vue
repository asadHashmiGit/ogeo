<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Qualify A New Vendor</h4>
                </div>
                <div class="card-body">
                    <el-form :model="VendorCreationInfo" class="demo-form-inline" :rules="rules" ref="VendorCreationRequestForm">

                        <el-row :gutter="24">

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorName">
                                        <span slot="label"><b>Enter Vendor Legal Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorName" placeholder="Enter Vendor Legal Name"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorRepName">
                                        <span slot="label"><b>Enter Vendor Representative Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorRepName" placeholder="Enter Vendor Representative Name"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorRepTitle">
                                        <span slot="label"><b>Enter Vendor Representative Title</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorRepTitle" placeholder="Enter Vendor Representative Title"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorMobile">
                                        <span slot="label"><b>Enter Vendor Representative Phone Number</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorMobile" placeholder="Enter Vendor Representative  Phone Number"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorPhone">
                                        <span slot="label"><b>Enter Vendor Landline</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorPhone" placeholder="Enter Vendor Landline"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorHighestRankingOfficerName">
                                        <span slot="label"><b>Enter Vendor Highest Ranking Officer Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorHighestRankingOfficerName" placeholder="Enter Vendor Highest Ranking Officer Name"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorHighestRankingOfficerPhoneNumber">
                                        <span slot="label"><b>Enter Vendor Highest Ranking Phone Number</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorHighestRankingOfficerPhoneNumber" placeholder="Enter Vendor Highest Ranking Phone Number"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorAddress">
                                        <span slot="label"><b>Enter Vendor Address</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorAddress" placeholder="Enter Vendor Address"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorCity">
                                        <span slot="label"><b>Enter City Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorCity" placeholder="Enter City"></el-input>

                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorCountry">
                                        <span slot="label"><b>Select A Country</b></span>

                                        <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="VendorCreationInfo.VendorCountry" placeholder="Select a Country">
                                            
                                            <el-option
                                                v-for="(cities, country) in Countries"
                                                :key="country"
                                                :label="country"
                                                :value="country">
                                            </el-option>
                                            
                                        </el-select>

                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorPOBOX">
                                        <span slot="label"><b>Enter Vendor PO.Box</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorPOBOX" placeholder="Enter Vendor PO.Box"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorBankName">
                                        <span slot="label"><b>Enter Vendor Bank Name</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorBankName" placeholder="Enter Vendor Bank Name"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorBankIBAN">
                                        <span slot="label"><b>Enter Vendor International Bank Account Number (IBAN)</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorBankIBAN" placeholder="Enter Vendor International Bank Account Number (IBAN)"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorTurnover">
                                        <span slot="label"><b>Enter Average of The Last 3 Years Turnover</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorTurnover" placeholder="Enter Average of The Last 3 Years Turnover"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorOpenSince">
                                        <span slot="label"><b>Select Vendor Esablishment Year</b></span>
                                        <el-select filterable allow-create style="width: 100%; padding: 0px; min-height: 40px" v-model="VendorCreationInfo.VendorOpenSince"  placeholder="Select Vendor Esablishment Year"> 
                                            <el-option v-for="year in years" :key="year" :label="year" :value="year"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>


                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorSoldBrands">
                                        <span slot="label"><b>Enter Brands Sold By The Vendors</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorSoldBrands" placeholder="Brands Sold By The Vendors"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorExclusiveBrands">
                                        <span slot="label"><b>Enter Brands Exclusively Represented By The Vendor</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorExclusiveBrands" placeholder="Brands Exclusively Represented By The Vendor"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <transition v-if="companyDetails.lom_manditory != 'FreeText'" >
                                <el-col :span="12">
                                    <div class="grid-content">
                                        <el-form-item label="temp" prop="SelectedItemTemplates">
                                            <span slot="label"><b>Select Library of Materials Template</b></span>

                                            <el-select id="SelectedItemTemplates" filterable multiple style="width: 100%; padding: 0px;" v-model="VendorCreationInfo.SelectedItemTemplates" placeholder="Select Library of Materials Template">
                                                
                                                <el-option v-for="Template in ItemTemplates" :key="Template.id" :label="Template.template_name" :value="Template.id"></el-option>
                                                
                                            </el-select>
                                        </el-form-item>
                                    </div>
                                </el-col>
                            </transition>





                            <el-col :span="24"> 
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorType">
                                        <span slot="label"><b>Select Vendor Type</b></span>
                                        <el-select filterable allow-create style="width: 100%; padding: 0px; min-height: 40px" v-model="VendorCreationInfo.VendorType"  placeholder="Select Vendor Type"> 

                                            <el-option label="Manufacturer" value="Manufacturer"></el-option>
                                            <el-option label="Wholesaler and Distributor" value="o Wholesaler and Distributor"></el-option>
                                            <el-option label="Franchisor" value="Franchisor"></el-option>
                                            <el-option label="Independent craft people" value="Independent craft people"></el-option>

                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>



                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorLicenseNumber">
                                        <span slot="label"><b>Enter Vendor License Number</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorLicenseNumber" placeholder="Enter Vendor  License Number"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorLicenseExpiryDate">
                                        <span slot="label"><b>Select The Vendor’s Qualification Expiry Date</b></span>
                                        
                                        <el-date-picker
                                          :picker-options = "pickerOptions"
                                          style="width: 100%"
                                          v-model="VendorCreationInfo.VendorLicenseExpiryDate"
                                          type="date"
                                          value-format="yyyy-MM-dd">
                                        </el-date-picker>
                                        
                                    </el-form-item>
                                </div>
                            </el-col>
                            
                            <el-col :span="12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorURL">
                                        <span slot="label"><b>Enter Vendor Website</b></span>
                                        <el-input v-model="VendorCreationInfo.VendorURL" placeholder="http://www.vendorwebsite.com/otherurl/232/wsd"></el-input>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorProvidedServices">
                                        <span slot="label"><b>Select Vendor Field Of Business</b></span>
                                        <el-select filterable allow-create multiple style="width: 100%; padding: 0px; min-height: 40px" v-model="VendorCreationInfo.VendorProvidedServices"  placeholder="Select Vendor Field Of Business"> 

                                            <el-option label="Information Technology Services" value="Information Technology Services"></el-option>
                                            <el-option label="Professional (Legal, Marketing, Consultancy, Design, Project Management, Security, Gardening, Cleaning…) Services" value="Professional (Legal, Marketing, Consultancy, Design, Project Management, Security, Gardening, Cleaning…) Services"></el-option>
                                            <el-option label="Transportation Services" value="Transportation Services"></el-option>
                                            <el-option label="Medicine And Wellness Services" value="Medicine And Wellness Services"></el-option>
                                            <el-option label="Convenience Services" value="Convenience Services"></el-option>
                                            <el-option label="Financial Services" value="Financial Services"></el-option>
                                            <el-option label="Contracting Services" value="Contracting Services"></el-option>
                                            <el-option label="Construction & Fit-out Services" value="Construction & Fit-out Services"></el-option>
                                            <el-option label="Supply of Mechanical Spare Parts" value="Supply of Mechanical Spare Parts"></el-option>
                                            <el-option label="Supply of Electrical Spare Parts" value="Supply of Electrical Spare Parts"></el-option>
                                            <el-option label="Supply of Construction Materials" value="Supply of Construction Materials"></el-option>
                                            <el-option label="Supply of Foodstuff & Edible Products" value="Supply of Foodstuff & Edible Products"></el-option>
                                            <el-option label="Supply of Tools" value="Supply of Tools"></el-option>
                                            <el-option label="Supply of OEM Equipment" value="Supply of OEM Equipment"></el-option>
                                            <el-option label="Supply of Furniture" value="Supply of Furniture"></el-option>
                                            <el-option label="Supply of Vehicles" value="Supply of Vehicles"></el-option>
                                            <el-option label="Supply of Textile Products" value="Supply of Textile Products"></el-option>
                                            <el-option label="Supply of IT Products" value="Supply of IT Products"></el-option>
                                            <el-option label="Supply of Fossil Fuels" value="Supply of Fossil Fuels"></el-option>
                                            <el-option label="Supply of Stationary Products" value="Supply of Stationary Products"></el-option>
                                            <el-option label="Supply of Packaging Products" value="Supply of Packaging Products"></el-option>
                                            <el-option label="Supply of Fragrance Products" value="Supply of Fragrance Products"></el-option>
                                            <el-option label="Supply of Cosmetic Products" value="Supply of Cosmetic Products"></el-option>
                                            <el-option label="Supply of Cleaning Products" value="Supply of Cleaning Products"></el-option>
                                            <el-option label="Supply of Personal Hygienic Products" value="Supply of Personal Hygienic Products"></el-option>
                                            <el-option label="Supply of Consumer Electronics Products" value="Supply of Consumer Electronics Products"></el-option>
                                            <el-option label="Supply of Whitegoods Products" value="Supply of Whitegoods Products"></el-option>
                                            <el-option label="Supply of Garment Products" value="Supply of Garment Products"></el-option>

                                            <!-- Add Additional Options From Existing Vendors -->

                                        </el-select>
                                    </el-form-item>
                                </div>
                            </el-col>

                            <el-col :span="24">
                                <div style="width: 100%" class="grid-content">
                                    <el-form-item style="margin-bottom: 0px;" label="" prop="VendorDocuments"></el-form-item>
                                    <span slot="label"><b>Upload Vendor Qualification Documents</b></span>
                                    <span style="z-index: 1" class="mytooltip tooltip-effect-2">
                                        <span class="tooltip-item2">
                                            <span class="text-success"><span class="fa fa-info-circle fa-lg text-success"></span></span>
                                            
                                        </span>
                                        <span class="tooltip-content4 clearfix">
                                            <span class="tooltip-text2">
                                                <strong>The Qualification Documents</strong> are those documents that are mandatorily needed to finalize the qualification of the vendors. They may be updated from time to time by my organization. 
                                            </span>
                                        </span>
                                    </span>
                                    

                                    <br><br>


                                    <el-upload
                                        class="upload-demo"
                                        id='UploadDocuments'
                                        :auto-upload="false"
                                        ref="UploadDocuments"
                                        multiple
                                        action="#"
                                        :limit="10"
                                        :on-exceed="handleExceed"
                                        :file-list="VendorCreationInfo.VendorDocuments"
                                        >

                                        <button type="button" slot="trigger" class="btn btn-success">Select File</button>
                                      
                                        <div class="el-upload__tip" slot="tip">Any file type is accepted with a size less than 3Mb (Max 10 Files)</div>
                                    </el-upload>

                                </div>
                                <br>
                            </el-col>

                            <el-col :span="24">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="VendorNotes">
                                        <span slot="label"><b>Enter Vendor Additional Notes</b></span>

                                        <el-input
                                            type="textarea"
                                            :rows="4"
                                            placeholder="Enter Any Additional Vendor Notes."
                                            v-model="VendorCreationInfo.VendorNotes">
                                        </el-input>
                                        
                                    </el-form-item>
                                </div>
                            </el-col>


                            
                            <el-col :span="24">
                                <hr>
                                <el-checkbox v-model="VerifyInformation"><b>I have read all the attached documents and found them to be in order and in line with the organization’s internal procedure for vendor qualification</b></el-checkbox>
                            </el-col>

                            <el-col :span="24">
                                
                                <button type="button" @click="SubmitVendorCreationForm" :class="[{ 'disabled': !VerifyInformation },'btn btn-success btn-block waves-effect text-center']">Qualify The Vendor</button>
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
                pickerOptions: {
                  disabledDate(time) {
                    return time.getTime() < Date.now();
                  },
                },
                ItemTemplates: [],
                VerifyInformation: false,
                companyDetails: {},
                Countries: {},
                Cities: {},
                VendorCreationInfo: {
                    VendorName: "",
                    VendorRepName: "",
                    VendorRepTitle: "",
                    VendorAddress: "",
                    VendorPOBOX: "",
                    VendorPhone: "",
                    VendorMobile: "",
                    VendorURL: "",
                    VendorLicenseNumber: "",
                    VendorLicenseExpiryDate: "",
                    VendorProvidedServices: [],
                    VendorCity: "",
                    VendorCountry: "",
                    VendorHighestRankingOfficerName: "",
                    VendorHighestRankingOfficerPhoneNumber: "",
                    VendorBankName: "",
                    VendorBankIBAN: "",
                    VendorTurnover: "",
                    VendorOpenSince: "",
                    VendorSoldBrands: "",
                    VendorExclusiveBrands: "",
                    SelectedItemTemplates: "",
                    VendorType: "",
                    VendorNotes: "",
                    VendorDocuments: []
                },
                rules: {                    
                    VendorName: [{
                        required: true,
                        message: "Please Enter Vendor Name",
                        trigger: "blur"
                    }],
                    VendorRepName: [{
                        required: true,
                        message: "Please Enter Vendor Representative Name",
                        trigger: "blur"
                    }],
                    VendorRepTitle: [{
                        required: false,
                        message: "Please Enter Vendor Representative Title",
                        trigger: "blur"
                    }],
                    VendorAddress: [{
                        required: true,
                        message: "Please Enter Vendor Address",
                        trigger: "blur"
                    }],
                    VendorPOBOX: [{
                        required: true,
                        message: "Please Enter Vendor PO.Box",
                        trigger: "blur"
                    }],
                    VendorPhone: [{
                        required: true,
                        message: "Please Enter Vendor Phone",
                        trigger: "blur"
                    }],
                    VendorMobile: [{
                        required: true,
                        message: "Please Enter Vendor Mobile",
                        trigger: "blur"
                    }],
                    VendorLicenseExpiryDate: [{
                        required: true,
                        message: "Please Enter License Expiry Date",
                        trigger: "blur"
                    }],
                    VendorURL: [{
                        validator: CheckURL,
                        trigger: "blur"
                    }],
                    VendorNotes: [{
                        required: false,
                        message: "Please Enter Vendor Notes",
                        trigger: "blur"
                    }],
                    VendorDocuments: [{
                        required: false,
                        message: "Please Upload At least one documenet",
                        trigger: "blur"
                    }],
                    VendorCity: [{
                        required: true,
                        message: "Please Enter City",
                        trigger: "blur"
                    }],
                    VendorCountry: [{
                        required: true,
                        message: "Please Select A Country",
                        trigger: "blur"
                    }],
                    VendorProvidedServices: [{
                        required: true,
                        message: "Please Select A Field of Business",
                        trigger: "blur"
                    }],
                    VendorHighestRankingOfficerName: [{
                        required: false,
                        message: "Please Enter Highest Ranking Officer Name",
                        trigger: "blur"
                    }],
                    VendorHighestRankingOfficerPhoneNumber: [{
                        required: false,
                        message: "Please Enter Vendor Highest Ranking Officer Phone Number",
                        trigger: "blur"
                    }],
                    VendorBankName: [{
                        required: false,
                        message: "Please Enter Vendor Bank",
                        trigger: "blur"
                    }],
                    VendorBankIBAN: [{
                        required: false,
                        message: "Please Enter Vendor IBAN",
                        trigger: "blur"
                    }],
                    VendorTurnover: [{
                        required: false,
                        message: "Please Enter Average of The Last 03 years Turnover",
                        trigger: "blur"
                    }],
                    VendorOpenSince: [{
                        required: false,
                        message: "Please Enter Vendor’s Operations Start Year",
                        trigger: "blur"
                    }],
                    VendorSoldBrands: [{
                        required: false,
                        message: "Please Enter Brands Sold By The Vendors",
                        trigger: "blur"
                    }],
                    VendorExclusiveBrands: [{
                        required: false,
                        message: "Please Enter Brands Exclusively Represented By The Vendor",
                        trigger: "blur"
                    }],
                    SelectedItemTemplates: [{
                        required: false,
                        message: "Please Select Item Template",
                        trigger: "blur"
                    }],
                    VendorType: [{
                        required: true,
                        message: "Please Select Vendor Type",
                        trigger: "blur"
                    }],
                }
            }
        },
        computed : {
            years () {
                const year = new Date().getFullYear()
                return Array.from({length: year - 1900}, (value, index) => 1901 + index)
            }
        },
        methods: {
            getCity() {
                axios.get('/data/countries_mini.json').
                    then((response) => {
                        this.Countries = response.data;
                        console.log();
                    })
                    .catch(error => { 
                        console.log(error); 
                    });
            },
            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },

            SubmitVendorCreationForm: function(){

                if(this.VerifyInformation){


                    if (event) event.preventDefault();

                    this.$refs.VendorCreationRequestForm.validate((validation) => {

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
                            
                            formData.append('VendorName', this.VendorCreationInfo.VendorName);
                            formData.append('VendorRepName', this.VendorCreationInfo.VendorRepName);
                            formData.append('VendorRepTitle', this.VendorCreationInfo.VendorRepTitle);
                            formData.append('VendorAddress', this.VendorCreationInfo.VendorAddress);
                            formData.append('VendorPOBOX', this.VendorCreationInfo.VendorPOBOX);
                            formData.append('VendorPhone', this.VendorCreationInfo.VendorPhone);
                            formData.append('VendorMobile', this.VendorCreationInfo.VendorMobile);
                            formData.append('VendorLicenseNumber', this.VendorCreationInfo.VendorLicenseNumber);
                            formData.append('VendorLicenseExpiryDate', this.VendorCreationInfo.VendorLicenseExpiryDate);
                            formData.append('VendorProvidedServices', this.VendorCreationInfo.VendorProvidedServices);
                            formData.append('VendorURL', this.VendorCreationInfo.VendorURL);

                            formData.append('VendorCity', this.VendorCreationInfo.VendorCity);
                            formData.append('VendorCountry', this.VendorCreationInfo.VendorCountry);
                            formData.append('VendorHighestRankingOfficerName', this.VendorCreationInfo.VendorHighestRankingOfficerName);
                            formData.append('VendorHighestRankingOfficerPhoneNumber', this.VendorCreationInfo.VendorHighestRankingOfficerPhoneNumber);
                            formData.append('VendorBankName', this.VendorCreationInfo.VendorBankName);
                            formData.append('VendorBankIBAN', this.VendorCreationInfo.VendorBankIBAN);
                            formData.append('VendorTurnover', this.VendorCreationInfo.VendorTurnover);
                            formData.append('VendorOpenSince', this.VendorCreationInfo.VendorOpenSince);
                            formData.append('VendorSoldBrands', this.VendorCreationInfo.VendorSoldBrands);
                            formData.append('VendorExclusiveBrands', this.VendorCreationInfo.VendorExclusiveBrands);
                            formData.append('SelectedItemTemplates', this.VendorCreationInfo.SelectedItemTemplates);

                            formData.append('VendorType', this.VendorCreationInfo.VendorType);

                            formData.append('VendorNotes', this.VendorCreationInfo.VendorNotes);

                            axios.post( '/api/vendors_management/created_new_vendor',
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

                            this.VendorName = "";
                            this.VendorRepName = "";
                            this.VendorRepTitle = "";
                            this.VendorAddress = "";
                            this.VendorPOBOX = "";
                            this.VendorPhone = "";
                            this.VendorMobile = "";
                            this.VendorURL = "";
                            this.VendorLicenseNumber = "";
                            this.VendorLicenseExpiryDate = "";
                            this.VendorProvidedServices = [];
                            this.VendorNotes = "";
                            this.VendorDocuments = [];
                            this.VendorCreationInfo.VendorURL = "";

                            this.VendorCity = "";
                            this.VendorCountry = "";
                            this.VendorHighestRankingOfficerName = "";
                            this.VendorHighestRankingOfficerPhoneNumber = "";
                            this.VendorBankName = "";
                            this.VendorBankIBAN = "";
                            this.VendorTurnover = "";
                            this.VendorOpenSince = "";
                            this.VendorSoldBrands = "";
                            this.VendorExclusiveBrands = "";
                            this.VendorType = "";

                            this.VendorCreationInfo.VendorNotes = "";

                        }

                    });
                }
                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is 10 Files', 'The limit is 10 files per request, you selected ' + files.length + ' file(s) this time, adding up to '+ parseInt(files.length + fileList.length) + ' totally', 'warning')
                
            }
        },
        mounted(){

            let self = this;
            axios.get('/api/data/get_item_template_list')
                .then((response) => {
                    self.ItemTemplates = response.data;
                })

            axios.get('/api/data/get_company_details')
                .then((response) => {
                    self.companyDetails = response.data;
                })

            this.getCity();

        },
    }

</script>

<style scoped>
    
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    .el-input__inner {
        height: 40px !important;
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