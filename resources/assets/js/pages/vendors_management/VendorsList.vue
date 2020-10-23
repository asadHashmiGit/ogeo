<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Vendors List</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="VendorsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Vendor ID</th>
                                <th>Vendor Name</th>
                                <th>Vendors’ User</th>
                                <th>Rep. Name</th>
                                <th>Landline</th>
                                <th>Mobile</th>
                                <th>License #</th>
                                <th>License Expiry Date</th>
                                <th>City</th>
                                <th>Country</th>
                                <th>Highest Office Name</th>
                                <th>Highest Office Phone</th>
                                <th>Bank Name</th>
                                <th>Vendor IBAN</th>
                                <th>Last 3 Years Turnover</th>
                                <th>Establishment Year</th>
                                <th>Represented Brand</th>
                                <th>Exclusive Brand</th>
                                <th>Vendor Type</th>
                                <th>Vendor Score</th>
                                <th>Status</th>
                                <th>Active</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="VendorInfoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="VendorInfoModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <div class="col-lg-6">
                            <h3 class="modal-title text-ogeo">Vendor ID: {{ ViewModalInfo.id }} </h3>
                        </div>
                        <div class="col-lg-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span style="float: right; text-align: right; font-size: 24px"><b>Score:</b> <b class="text-ogeo">{{ ViewModalInfo.vendor_score }} 10</b></span>
                        </div>
                        
                        
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <h4 class="modal-title text-ogeo">Vendor Detail:</h4>
                                <table class="table">
                                    <tr>
                                        <td width="40%"><b>Vendor Legal Name: </b></td>
                                        <td>{{ ViewModalInfo.name }} </td>
                                    </tr>

                                    <tr>
                                        <td width="40%"><b>Vendor Standing: </b></td>
                                        <td>
                                            <span><b>Status:</b> {{ ViewModalInfo.status }}</span><br>
                                            <span><b>Active:</b> {{ ViewModalInfo.active }}, <i>Since {{ ViewModalInfo.updated_at }}</i></span><br>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td width="40%"><b>Establishment Year: </b></td>
                                        <td>{{ ViewModalInfo.open_since }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created At: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Representative Details: </b></td>
                                        <td>
                                            <span><b>Name:</b> {{ ViewModalInfo.rep_name }}</span><br>
                                            <span><b>Title:</b> {{ ViewModalInfo.rep_title }}</span><br>
                                            <span><b>Phone Number:</b> {{ ViewModalInfo.mobile }}</span><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Highest Ranking Office Details: </b></td>
                                        <td>
                                            <span><b>Name:</b> {{ ViewModalInfo.officer_name }}</span><br>
                                            <span><b>Phone:</b> {{ ViewModalInfo.officer_phone }}</span><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Land Line: </b></td>
                                        <td>{{ ViewModalInfo.phone }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Vendor Address: </b></td>
                                        <td>
                                            <span><b>Address:</b> {{ ViewModalInfo.address }}</span><br>
                                            <span><b>PO.BOX:</b> {{ ViewModalInfo.po_box }}</span><br>
                                            <span><b>City:</b> {{ ViewModalInfo.city }}</span><br>
                                            <span><b>Country:</b> {{ ViewModalInfo.country }}</span><br>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    
                                    <tr>
                                        <td width="40%"><b>Financials: </b></td>
                                        <td>
                                            <span><b>Bank Name:</b> {{ ViewModalInfo.bank_name }}</span><br>
                                            <span><b>Vendor IBAN:</b> {{ ViewModalInfo.bank_iban }}</span><br>
                                            <span><b>Last 3 Years Turnover:</b> {{ ViewModalInfo.turnover }}</span><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Qualification Expiry Date: </b></td>
                                        <td>{{ ViewModalInfo.lic_expiry_date | formatDateNoTime }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>License Number: </b></td>
                                        <td>{{ ViewModalInfo.lic_num }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Vendor Website: </b></td>
                                        <td>{{ ViewModalInfo.url }}</td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Brands: </b></td>
                                        <td>
                                            <span><b>Represented Brand:</b> {{ ViewModalInfo.sold_brands }}</span><br>
                                            <span><b>Exculsive Brands:</b> {{ ViewModalInfo.exculsive_brands }}</span><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%"><b>Vendor Type: </b></td>
                                        <td>{{ ViewModalInfo.vendor_type }}</td>
                                    </tr>

                                    <tr>
                                        <td><b>Associated Library of Materials Templates: </b></td>
                                        <td v-if="ViewModalInfo.item_templates.length > 0">
                                            <ul style="display: block;" v-for="(template, index) in ViewModalInfo.item_templates">
                                                <li>{{template.template_name}}</li>
                                            </ul>
                                        </td>
                                        <td v-else>
                                            No Associated Library of Materials Templates
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><b>Field Of Business: </b></td>
                                        <td v-if="ViewModalInfo.provided_service.length > 0">
                                            <ul style="display: block;" v-for="(service, index) in ViewModalInfo.provided_service.split(',')">
                                                <li>{{service}}</li>
                                            </ul>
                                        </td>
                                    </tr>
                                   
                                </table>

                            </div>

                            <div class="col-lg-12">
                                <hr>
                                <h4 class="modal-title text-ogeo">Vendor Qualification Documents:</h4>
                                <div class="col-lg-12">
                                    
                                    <table class="table table-bordered">
                                        <thead>
                                            <th>File Name</th>
                                            <th>Uploaded At</th>
                                            <th>Action</th>
                                        </thead>
                                        <tbody v-if="ViewModalInfo.qualification_documents.length > 0">
                                            <tr v-for="document in ViewModalInfo.qualification_documents">
                                                <td>{{ document.document_name }}</td>
                                                <td>{{ document.created_at }}</td>
                                                <td>
                                                    <a class="btn btn-success" :href="'/uploads/vendorsQualificationDocs/'+document.auto_generated_name" download> Download</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tbody v-else>
                                            <tr>
                                                <td colspan="3" align="center">No Qualification Documents Available</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                   

                                </div>
                            </div>

                            <div class="col-lg-12">
                                <hr>
                                <h4 class="modal-title text-ogeo">Vendor Users List:</h4>
                                <div class="col-lg-12">
                                    <table class="table table-bordered">
                                        <thead>
                                            <th>ID</th>
                                            <th>User Name</th>
                                            <th>User Email</th>
                                            <th>Vendor’s Bid Manager Role</th>
                                            <th>Vendor’s Invoicing Manager Role</th>
                                            <th>Assigned At</th>
                                            <th>Active</th>
                                        </thead>
                                        <tbody>
                                            <tr v-for="user in ViewModalInfo.users">
                                                <td>{{ user.id }}</td>
                                                <td>{{ user.name }}</td>
                                                <td>{{ user.email }}</td>
                                                <td>{{ user.pivot.sbm_role }}</td>
                                                <td>{{ user.pivot.sim_role }}</td>
                                                <td>{{ user.created_at }}</td>
                                                <td>{{ user.active }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>


                            </div>

                            <div class="col-lg-12">
                                <hr>
                                <span><b>Date:</b> {{ new Date() }}</span><br>
                                <span><b>By:</b> {{ currentUser.name }}</span><br><br>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="EditViewModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="EditViewModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div  class="modal-header">
                        <div class="col-lg-6">
                            <h3 class="modal-title text-ogeo">Vendor Edit </h3>
                        </div>
                        <div class="col-lg-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span style="float: right; text-align: right; font-size: 24px"><b>Score:</b> <b class="text-ogeo">10</b></span>
                        </div>
                        
                        
                    </div>
                    <div class="modal-body" v-if="editDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <el-form :model="EditModalInfo" class="demo-form-inline" :rules="rules" ref="VendorEditRequestForm">

                                    <el-row :gutter="24">

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="name">
                                                    <span slot="label"><b>Enter Vendor Legal Name</b></span>
                                                    <el-input v-model="EditModalInfo.name" placeholder="Enter Vendor Legal Name"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="rep_name">
                                                    <span slot="label"><b>Enter Vendor Representative Name</b></span>
                                                    <el-input v-model="EditModalInfo.rep_name" placeholder="Enter Vendor Representative Name"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="rep_title">
                                                    <span slot="label"><b>Enter Vendor Representative Title</b></span>
                                                    <el-input v-model="EditModalInfo.rep_title" placeholder="Enter Vendor Representative Title"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="mobile">
                                                    <span slot="label"><b>Enter Vendor Representative Phone Number</b></span>
                                                    <el-input v-model="EditModalInfo.mobile" placeholder="Enter Vendor Representative  Phone Number"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="phone">
                                                    <span slot="label"><b>Enter Vendor Landline</b></span>
                                                    <el-input v-model="EditModalInfo.phone" placeholder="Enter Vendor Landline"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="officer_name">
                                                    <span slot="label"><b>Enter Vendor Highest Ranking Officer Name</b></span>
                                                    <el-input v-model="EditModalInfo.officer_name" placeholder="Enter Vendor Highest Ranking Officer Name"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="officer_phone">
                                                    <span slot="label"><b>Enter Vendor Highest Ranking Phone Number</b></span>
                                                    <el-input v-model="EditModalInfo.officer_phone" placeholder="Enter Vendor Highest Ranking Phone Number"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="address">
                                                    <span slot="label"><b>Enter Vendor Address</b></span>
                                                    <el-input v-model="EditModalInfo.address" placeholder="Enter Vendor Address"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="city">
                                                    <span slot="label"><b>Enter City Name</b></span>
                                                    <el-input v-model="EditModalInfo.city" placeholder="Enter City"></el-input>


                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="country">
                                                    <span slot="label"><b>Select A Country</b></span>

                                                    <el-select filterable allow-create style="width: 100%; padding: 0px;" v-model="EditModalInfo.country" placeholder="Select a City">
                                            
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
                                                <el-form-item label="temp" prop="po_box">
                                                    <span slot="label"><b>Enter Vendor PO.Box</b></span>
                                                    <el-input v-model="EditModalInfo.po_box" placeholder="Enter Vendor PO.Box"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="bank_name">
                                                    <span slot="label"><b>Enter Vendor Bank Name</b></span>
                                                    <el-input v-model="EditModalInfo.bank_name" placeholder="Enter Vendor Bank Name"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="bank_iban">
                                                    <span slot="label"><b>Enter Vendor International Bank Account Number (IBAN)</b></span>
                                                    <el-input v-model="EditModalInfo.bank_iban" placeholder="Enter Vendor International Bank Account Number (IBAN)"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="turnover">
                                                    <span slot="label"><b>Enter Average of The Last 3 Years Turnover</b></span>
                                                    <el-input v-model="EditModalInfo.turnover" placeholder="Enter Average of The Last 3 Years Turnover"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="open_since">
                                                    <span slot="label"><b>Select Vendor Esablishment Year</b></span>
                                                    <el-select filterable allow-create style="width: 100%; padding: 0px; min-height: 40px" v-model="EditModalInfo.open_since"  placeholder="Select Vendor Esablishment Year"> 
                                                        <el-option v-for="year in years" :key="year" :label="year" :value="year"></el-option> 
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="sold_brands">
                                                    <span slot="label"><b>Enter Brands Sold By The Vendors</b></span>
                                                    <el-input v-model="EditModalInfo.sold_brands" placeholder="Brands Sold By The Vendors"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="exculsive_brands">
                                                    <span slot="label"><b>Enter Brands Exclusively Represented By The Vendor</b></span>
                                                    <el-input v-model="EditModalInfo.exculsive_brands" placeholder="Brands Exclusively Represented By The Vendor"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <transition>
                                            <el-col :span="12">
                                                <div class="grid-content">
                                                    <el-form-item label="temp" prop="item_templates">
                                                        <span slot="label"><b>Select Library of Materials Template</b></span>
                                        
                                                        <el-select id="item_templates" filterable multiple style="width: 100%; padding: 0px;" v-model="EditModalInfo.item_templates" placeholder="Select Library of Materials Template">
                                                            
                                                            <el-option v-for="Template in ItemTemplates" :key="Template.id" :label="Template.template_name" :value="Template.id"></el-option>
                                                            
                                                        </el-select>
                                                    </el-form-item>
                                                </div>
                                            </el-col>
                                        </transition>





                                        <el-col :span="24"> 
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="vendor_type">
                                                    <span slot="label"><b>Select Vendor Type</b></span>
                                                    <el-select filterable allow-create style="width: 100%; padding: 0px; min-height: 40px" v-model="EditModalInfo.vendor_type"  placeholder="Select Vendor Type"> 

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
                                                <el-form-item label="temp" prop="lic_num">
                                                    <span slot="label"><b>Enter Vendor License Number</b></span>
                                                    <el-input v-model="EditModalInfo.lic_num" placeholder="Enter Vendor  License Number"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="lic_expiry_date">
                                                    <span slot="label"><b>Select The Vendor’s Qualification Expiry Date</b></span>
                                                    
                                                    <el-date-picker
                                                      :picker-options = "pickerOptions"
                                                      style="width: 100%"
                                                      v-model="EditModalInfo.lic_expiry_date"
                                                      type="date"
                                                      value-format="yyyy-MM-dd">
                                                    </el-date-picker>
                                                    
                                                </el-form-item>
                                            </div>
                                        </el-col>
                                        
                                        <el-col :span="12">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="url">
                                                    <span slot="label"><b>Enter Vendor Website</b></span>
                                                    <el-input v-model="EditModalInfo.url" placeholder="http://www.vendorwebsite.com/otherurl/232/wsd"></el-input>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="provided_service">
                                                    <span slot="label"><b>Select Vendor Field Of Business</b></span>
                                                    <el-select filterable allow-create multiple style="width: 100%; padding: 0px; min-height: 40px" v-model="EditModalInfo.provided_service"  placeholder="Select Vendor Field Of Business">

                                                        <el-option v-for="field in FieldOfBusiness" :key="field.name" :label="field.name" :value="field.name"></el-option>
                                                       
                                                        
                                                        <!-- Add Additional Options From Existing Vendors -->
                                        
                                                    </el-select>
                                                </el-form-item>
                                            </div>
                                        </el-col>

                                        
                                        
                                        <el-col :span="24">
                                            <hr>
                                            <h4 class="modal-title text-ogeo">Vendor Qualification Documents:</h4>
                                            <div class="col-lg-12">
                                                
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <th>File Name</th>
                                                        <th>Uploaded At</th>
                                                        <th>Action</th>
                                                    </thead>
                                                    <tbody v-if="EditModalInfo.qualification_documents.length > 0">
                                                        <tr v-for="(document, index) in EditModalInfo.qualification_documents">
                                                            <td>{{ document.document_name }}</td>
                                                            <td>{{ document.created_at }}</td>
                                                            <td>
                                                                <button class="btn btn-danger" @click="RemoveFile(document.id, index)"> Delete </button>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                    <tbody v-else>
                                                        <tr>
                                                            <td colspan="3" align="center">No Qualification Documents Available</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                               

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
                                                    :file-list="EditModalInfo.VendorDocuments"
                                                    >

                                                    <button type="button" slot="trigger" class="btn btn-success">Select File</button>
                                                  
                                                    <div class="el-upload__tip" slot="tip">Any file type is accepted with a size less than 3Mb (Max 10 Files)</div>
                                                </el-upload>

                                            </div>
                                            <br>
                                        </el-col>

                                        <el-col :span="24">
                                            <div class="grid-content">
                                                <el-form-item label="temp" prop="notes">
                                                    <span slot="label"><b>Enter Vendor Additional Notes</b></span>

                                                    <el-input
                                                        type="textarea"
                                                        :rows="4"
                                                        placeholder="Enter Any Additional Vendor Notes."
                                                        v-model="EditModalInfo.notes">
                                                    </el-input>
                                                    
                                                </el-form-item>
                                            </div>
                                        </el-col>


                                        
                                        <el-col :span="24">
                                            <hr>
                                            <el-checkbox v-model="VerifyInformation"><b>I have read all the attached documents and found them to be in order and in line with the organization’s internal procedure for vendor qualification</b></el-checkbox>
                                        </el-col>

                                        <el-col :span="24">
                                            
                                            <button type="button" @click="EditVendorDetailsForm" :class="[{ 'disabled': !VerifyInformation },'btn btn-success btn-block waves-effect text-center']">Edit Vendor Detials</button>
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
        name: 'vendors-list',
        data(){
            var CheckURL = (rule, value, callback) => {
                if (this.isUrlValid(value)) {
                    callback();
                } else {

                    if(value === '' || value === null){
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
                DataTable: "",
                OriginalName: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                ViewModalInfo: {},
                VerifyInformation: false,
                ItemTemplates: [],
                Countries: {},
                FieldOfBusiness: [
                    {name: "Information Technology Services"},
                    {name: "Professional Services - Legal"},
                    {name: "Professional Services - Marketing"},
                    {name: "Professional Services - Consultancy"},
                    {name: "Professional Services - Design"},
                    {name: "Professional Services - Project Management"},
                    {name: "Professional Services - Security"},
                    {name: "Professional Services - Gardening"},
                    {name: "Professional Services - Cleaning"},
                    {name: "Transportation Services"},
                    {name: "Medicine And Wellness Services"},
                    {name: "Convenience Services"},
                    {name: "Financial Services"},
                    {name: "Contracting Services"},
                    {name: "Construction & Fit-out Services"},
                    {name: "Supply of Mechanical Spare Parts"},
                    {name: "Supply of Electrical Spare Parts"},
                    {name: "Supply of Construction Materials"},
                    {name: "Supply of Foodstuff & Edible Products"},
                    {name: "Supply of Tools"},
                    {name: "Supply of OEM Equipment"},
                    {name: "Supply of Furniture"},
                    {name: "Supply of Vehicles"},
                    {name: "Supply of Textile Products"},
                    {name: "Supply of IT Products"},
                    {name: "Supply of Fossil Fuels"},
                    {name: "Supply of Stationary Products"},
                    {name: "Supply of Packaging Products"},
                    {name: "Supply of Fragrance Products"},
                    {name: "Supply of Cosmetic Products"},
                    {name: "Supply of Cleaning Products"},
                    {name: "Supply of Personal Hygienic Products"},
                    {name: "Supply of Consumer Electronics Products"},
                    {name: "Supply of Whitegoods Products"},
                    {name: "Supply of Garment Products"},
                ],
                EditModalInfo: {
                    VendorProvidedServices: "",
                    VendorDocuments: [],
                },
                rules: {                    
                    name: [{
                        required: true,
                        message: "Please Enter Vendor Name",
                        trigger: "blur"
                    }],
                    rep_name: [{
                        required: true,
                        message: "Please Enter Vendor Representative Name",
                        trigger: "blur"
                    }],
                    rep_title: [{
                        required: false,
                        message: "Please Enter Vendor Representative Title",
                        trigger: "blur"
                    }],
                    address: [{
                        required: true,
                        message: "Please Enter Vendor Address",
                        trigger: "blur"
                    }],
                    po_box: [{
                        required: true,
                        message: "Please Enter Vendor PO.Box",
                        trigger: "blur"
                    }],
                    phone: [{
                        required: true,
                        message: "Please Enter Vendor Phone",
                        trigger: "blur"
                    }],
                    mobile: [{
                        required: true,
                        message: "Please Enter Vendor Mobile",
                        trigger: "blur"
                    }],
                    lic_expiry_date: [{
                        required: true,
                        message: "Please Enter License Expiry Date",
                        trigger: "blur"
                    }],
                    url: [{
                        required: false,
                        validator: CheckURL,
                        trigger: "blur"
                    }],
                    notes: [{
                        required: false,
                        message: "Please Enter Vendor Notes",
                        trigger: "blur"
                    }],
                    VendorDocuments: [{
                        required: false,
                        message: "Please Upload At least one documenet",
                        trigger: "blur"
                    }],
                    city: [{
                        required: true,
                        message: "Please Enter City",
                        trigger: "blur"
                    }],
                    country: [{
                        required: true,
                        message: "Please Select A Country",
                        trigger: "blur"
                    }],
                    provided_service: [{
                        required: true,
                        message: "Please Select A Field of Business",
                        trigger: "blur"
                    }],
                    officer_name: [{
                        required: false,
                        message: "Please Enter Highest Ranking Officer Name",
                        trigger: "blur"
                    }],
                    officer_phone: [{
                        required: false,
                        message: "Please Enter Vendor Highest Ranking Officer Phone Number",
                        trigger: "blur"
                    }],
                    bank_name: [{
                        required: false,
                        message: "Please Enter Vendor Bank",
                        trigger: "blur"
                    }],
                    bank_iban: [{
                        required: false,
                        message: "Please Enter Vendor IBAN",
                        trigger: "blur"
                    }],
                    turnover: [{
                        required: false,
                        message: "Please Enter Average of The Last 03 years Turnover",
                        trigger: "blur"
                    }],
                    open_since: [{
                        required: false,
                        message: "Please Enter Vendor’s Operations Start Year",
                        trigger: "blur"
                    }],
                    sold_brands: [{
                        required: false,
                        message: "Please Enter Brands Sold By The Vendors",
                        trigger: "blur"
                    }],
                    exculsive_brands: [{
                        required: false,
                        message: "Please Enter Brands Exclusively Represented By The Vendor",
                        trigger: "blur"
                    }],
                    item_templates: [{
                        required: false,
                        message: "Please Select Item Template",
                        trigger: "blur"
                    }],
                    vendor_type: [{
                        required: true,
                        message: "Please Select Vendor Type",
                        trigger: "blur"
                    }],
                }
            }
        },
        methods: {
            RemoveFile(DocumentId, Index){
                if (event) event.preventDefault();
                let self = this;

                Swal({
                    title: 'Delete This Document?',
                    text: "Are you sure you what to permanently delete this document.",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Delete it!',
                    cancelButtonText: 'No'
                }).then((result) => {
                    if (result.value) {

                        axios.post('/api/vendors_management/remove_qualification_doc', {DocumentId: DocumentId})
                            .then((response) => {

                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 5000
                                });
                            
                                self.EditModalInfo.qualification_documents.splice(Index, 1);                 
                            })
                    }
                        
                })
            },
            isUrlValid(url) {
                return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
            },
            EditVendorDetailsForm: function(){

                let self = this;

                if(this.VerifyInformation){

                    if (event) event.preventDefault();

                    this.$refs.VendorEditRequestForm.validate((validation) => {

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


                            axios.post('/api/vendors_management/check_vendor_name_duplicates', {name: this.EditModalInfo.name})
                                .then((response) => {

                                    if(response.data == 'Yes' && this.OriginalName != this.EditModalInfo.name){

                                        Swal({
                                            title: 'Vendor Name Duplicate!',
                                            text: "There is Another Vendor with the Same Name, Do You Want to Proceed?",
                                            type: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#3085d6',
                                            cancelButtonColor: '#d33',
                                            confirmButtonText: 'Yes',
                                            cancelButtonText: 'No'
                                        }).then((result) => {

                                            if (result.value) {

                                                let formData = new FormData();

                                                for( var i = 0; i < this.$refs.UploadDocuments.uploadFiles.length; i++ ){
                                                    let file = this.$refs.UploadDocuments.uploadFiles[i].raw;
                                                    formData.append('FileUploads['+i+']', file);
                                                }
                                                

                                                formData.append('EditModalInfo', JSON.stringify(this.EditModalInfo));

                                                axios.post( '/api/vendors_management/edit_vendor_details',
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

                                                    self.VerifyInformation = false;

                                                    self.DataTable.ajax.reload( null, false );

                                                    $('#EditViewModal').modal('toggle');
                                                })
                                                .catch(function(){
                                                    Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                                                });

                                            }
                                                
                                        })



                                    } else {

                                        let formData = new FormData();

                                        for( var i = 0; i < this.$refs.UploadDocuments.uploadFiles.length; i++ ){
                                            let file = this.$refs.UploadDocuments.uploadFiles[i].raw;
                                            formData.append('FileUploads['+i+']', file);
                                        }
                                        

                                        formData.append('EditModalInfo', JSON.stringify(this.EditModalInfo));

                                        axios.post( '/api/vendors_management/edit_vendor_details',
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

                                            self.VerifyInformation = false;

                                            self.DataTable.ajax.reload( null, false );

                                            $('#EditViewModal').modal('toggle');
                                        })
                                        .catch(function(){
                                            Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                                        });


                                    }
                                    
                                })
                            



                            

                        }

                    });
                }
                
            },
            handleExceed(files, fileList) {
                Swal('The Limit is 10 Files', 'The limit is 10 files per request, you selected ' + files.length + ' file(s) this time, adding up to '+ parseInt(files.length + fileList.length) + ' totally', 'warning')
                
            },
            showViewModal(recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_vendor_details', {VendorID: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        console.log(this.ViewModalInfo);
                        $('#VendorInfoModal').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },
            editViewModal(recordId){
                let self = this;
                this.ViewModalInfo = {};
                axios.post('/api/data/get_vendor_details', {VendorID: recordId})
                    .then((response) => {
                        self.EditModalInfo = response.data;
                        console.log(this.EditModalInfo.provided_service);
                        self.OriginalName = self.EditModalInfo.name;

                        self.EditModalInfo.provided_service = self.EditModalInfo.provided_service.split(',');
                        console.log(self.EditModalInfo.provided_service);

                        self.editDataLoaded = true;
                        $('#EditViewModal').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },
            getCity() {

                axios.get('/data/countries_mini.json').
                    then((response) => {
                        this.Countries = response.data;
                    })
                    .catch(error => { 
                        console.log(error); 
                    });
            },
            ToggleActivation(recordId){
                let self = this;
                axios.post('/api/vendors_management/toggle_vendor_activation', {VendorID: recordId})
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
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            },
            years () {
                const year = new Date().getFullYear()
                return Array.from({length: year - 1900}, (value, index) => 1901 + index)
            }
        },
        mounted(){

            let self = this;
            axios.get('/api/data/get_item_template_list')
                .then((response) => {
                    self.ItemTemplates = response.data;
                })


            const table = $('#VendorsList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/data/get_vendors_datatable',
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'vendor_users', name: 'vendor_users' },
                    { data: 'rep_name', name: 'rep_name' },
                    { data: 'phone', name: 'phone' },
                    { data: 'mobile', name: 'mobile' },
                    { data: 'lic_num', name: 'lic_num' },
                    { data: 'lic_expiry_date', name: 'lic_expiry_date' },
                    { data: 'city', name: 'city' },
                    { data: 'country', name: 'country' },
                    { data: 'officer_name', name: 'officer_name' },
                    { data: 'officer_phone', name: 'officer_phone' },
                    { data: 'bank_name', name: 'bank_name' },
                    { data: 'bank_iban', name: 'bank_iban' },
                    { data: 'turnover', name: 'turnover' },
                    { data: 'open_since', name: 'open_since' },
                    { data: 'sold_brands', name: 'sold_brands' },
                    { data: 'exculsive_brands', name: 'exculsive_brands' },
                    { data: 'vendor_type', name: 'vendor_type' },
                    { data: 'vendor_score', name: 'vendor_score' },
                    { data: 'status', name: 'status' },
                    { data: 'active', name: 'active' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    {  targets: 22, responsivePriority: 1 },
                    {  targets: 0, responsivePriority: 2 },
                    {  targets: 21, responsivePriority: 4 },
                    {  targets: 20, responsivePriority: 3 },
                    {  targets: 2, width: '30%' },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, "ASC" ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'VendorsList' },
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
            });

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $this.parent().parent().find(">:first-child").text();
                //Check if Id has prefix and resolve
                if (RecordID.includes("-")){
                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                }
                self.showViewModal(RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.edit-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.editViewModal(RecordID);
            });

            $('tbody', this.$refs.table).on('click', '.activations-placeholder', function(){
                var $this = $(this);
                var RecordID = $(this).data('recordid');
                self.ToggleActivation(RecordID);
            });

            self.DataTable = table;

            this.getCity();


            
        },
    }

</script>

<style scoped>
    
    .font-500{
        font-weight: 500;
    }

    #VendorInfoModal .modal-dialog {
        min-width:80%;
    }

    #EditViewModal .modal-dialog {
        min-width:80%;
    }

</style>