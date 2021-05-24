<template>
	
	<div class="row">
        <!-- <div class="col-lg-4 col-xlg-3 col-md-5">
            <div class="card"> <img class="card-img" :src="socialbg" alt="Card image">
                <div class="card-img-overlay card-inverse social-profile d-flex ">
                    <div class="align-self-center"> <img style="border: 1px solid gray" :src="URL+currentUser.Picture" class="img-circle" width="100" height="100">
                        <h4 class="card-title"> {{ currentUser.name }}</h4>
                        <h6 class="card-subtitle">{{ currentUser.Designation }}</h6>
                        
                        <div class="card">
                            <div class="card-body"> 
                                <div class="row">
                                    <div class="col-lg-12">
                                        <small class="text-muted">Email address </small>
                                        <h6 v-if="currentUser.Email.length > 23"> {{ currentUser.Email.substr(0,22) + '...' }}</h6>
                                         <h6 v-else> {{ currentUser.Email }}</h6>
                                    </div>
                                    <div class="col-lg-12">
                                        <small class="text-muted db">Phone</small>
                                        <h6>{{ currentUser.Phone }}</h6>
                                    </div>
                                    <div class="col-lg-12">
                                        <small class="text-muted db">Address</small>
                                        <h6>{{ currentUser.Address }}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div> 

        <div class="col-lg-8 col-xlg-9 col-md-7">-->
        <div class="col-lg-12">
            <div class="card">

                <ul class="nav nav-tabs profile-tab" role="tablist">
                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Welcome</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#edit_details" role="tab">Personal Details</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">My Roles</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#change_passwrod" role="tab">Change Password</a> </li>
                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#notificaitons" role="tab">Notifications</a> </li>
                     <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#recommend" role="tab">Referrals</a> </li>
                     <li v-if="role=='SAD'" class="nav-item"> <a class="nav-link" data-toggle="tab" href="#image_setting" role="tab">Customization</a> </li>
                        <!-- <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#recent_activities" role="tab">Recent Activities Log</a> </li> -->
                    <!-- <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#system_testing" role="tab">System Testing</a> </li> -->
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="m-t-20 row">
                                        <div class="col-md-3 col-xs-12"><img :src="URL+currentUser.Picture" alt="user" class="img-responsive radius" /></div>
                                        <div class="col-md-9 col-xs-12">
                                            <h5> Hello {{ currentUser.name }}, and Welcome To Ogéo.</h5>
                                            <p class="m-t-20">Please use the menu under “System Modules” to access the actions that fall under the remit of your role(s).</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>

                    <div class="tab-pane" id="profile" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 col-xs-6 b-r"> <strong>Full Name</strong>
                                    <br>
                                    <p class="text-muted">{{ currentUser.name }}</p>
                                </div>
                                <div class="col-md-3 col-xs-6 b-r"> <strong>Phone </strong>
                                    <br>
                                    <p class="text-muted">{{ currentUser.Phone }}</p>
                                </div>
                                <div class="col-md-3 col-xs-6 b-r"> <strong>Email</strong>
                                    <br>
                                    <p class="text-muted">{{ currentUser.Email }}</p>
                                </div>
                                <div class="col-md-3 col-xs-6"> <strong>Address</strong>
                                    <br>
                                    <p class="text-muted">{{ currentUser.Address }}</p>
                                </div>
                            </div>
                            <hr>
                            
                            
                            <h4 class="font-medium m-t-30">My Assigned Roles:</h4>
                            <div>
                                <table ref="UserRolesTables" id="UserRolesTables" class="display responsive table table-bordered table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Role Name</th>
                                            <th>Approval Level</th>
                                            <th>Assigned By</th>
                                            <th>Set-up Name</th>
                                            <th>Number of employees holding the same role for the same Set-up</th>
                                            <th>Role Assigned On</th>
                                            <th>Role Withheld On</th>
                                            <th>Assignment Duration</th>
                                            <th>Active</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            
                            <hr>
                           
                            
                            <!-- <h4 class="font-medium m-t-30">Skill Set</h4>
                            <hr>
                            <h5 class="m-t-30">Wordpress <span class="pull-right">80%</span></h5>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%; height:6px;"> <span class="sr-only">50% Complete</span> </div>
                            </div>
                            <h5 class="m-t-30">HTML 5 <span class="pull-right">90%</span></h5>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%; height:6px;"> <span class="sr-only">50% Complete</span> </div>
                            </div>
                            <h5 class="m-t-30">jQuery <span class="pull-right">50%</span></h5>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%; height:6px;"> <span class="sr-only">50% Complete</span> </div>
                            </div>
                            <h5 class="m-t-30">Photoshop <span class="pull-right">70%</span></h5>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%; height:6px;"> <span class="sr-only">50% Complete</span> </div>
                            </div> -->
                        </div>
                    </div>

                    <div class="tab-pane" id="change_passwrod" role="tabpanel">
                        <div class="card-body">
                            <form autocomplete="off" @submit.prevent="changePassword">
                                <div class="form-group">
                                    <label class="col-md-12 font-weight-bold">Enter Your Old Password</label>
                                    <div class="col-md-12">
                                        <input autocomplete="false" type="password" v-model="PasswordChange.old" class="form-control form-control-line" placeholder="Enter Your Old Password">
                                        <span class="text-danger" v-if="errors && errors.old">{{ errors.old }}</span>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 font-weight-bold">Enter Your New Password</label>
                                    <div class="col-md-12">
                                        <input autocomplete="false" type="password" v-model="PasswordChange.password" class="form-control form-control-line" placeholder="Enter Your New Password">
                                        <span class="text-danger" v-if="errors && errors.password">{{ errors.password }}</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 font-weight-bold">Confirm Your New Password</label>
                                    <div class="col-md-12">
                                        <input autocomplete="false" type="password" v-model="PasswordChange.password_confirmation " class="form-control form-control-line" placeholder="Confirm Your New Password">
                                        <span class="text-danger" v-if="errors && errors.password_confirmation">{{ errors.password_confirmation }}</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Change Password</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="tab-pane" id="edit_details" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Update Personal Details:</h3><br>


                                    <label style="color: #455a64"><b>Designation:</b> </label>
                                    <div class="grid-content">
                                        <el-input v-model="PersonalDetails.designation" :placeholder="currentUser.Designation"></el-input><br><br>
                                    </div>
                                   

                                    <label style="color: #455a64"><b>Phone Number:</b> </label>
                                    <div class="grid-content">
                                        <el-input v-model="PersonalDetails.phone" :placeholder="currentUser.Phone"/></el-input><br><br>
                                    </div>
                                   

                                    <label style="color: #455a64"><b>Address:</b> </label>
                                    <div class="grid-content">
                                        <el-input v-model="PersonalDetails.address" :placeholder="currentUser.Address"></el-input><br><br>
                                    </div>
                                   

                                    <label style="color: #455a64"><b>Profile Image:</b> </label>
                                    <el-upload
                                        action="#"
                                        id='ProfileImage'
                                        ref="ProfileImage"
                                        class="avatar-uploader"
                                        :show-file-list="true"
                                        :on-change="handleAvatarChange"
                                        :auto-upload="false">
                                      <img v-if="imageUrl" :src="imageUrl" class="avatar">
                                      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                    </el-upload>
                                    <span>You can upload 1 image max size of 2MB.</span><br>

                                    <hr>

                                     <label style="color: #455a64"><b>Login Screen Image:</b> </label>
                                    <el-upload
                                        action="#"
                                        id='LoginImage'
                                        ref="LoginImage"
                                        class="avatar-uploader"
                                        :show-file-list="true"
                                        :on-change="handleLoginImageChange"
                                        :auto-upload="false">
                                      <img v-if="LoginimageUrl" :src="LoginimageUrl" class="avatar">
                                      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                    </el-upload>
                                    <span>You can upload 1 image max size of 2MB.</span><br>

                                    <hr>

                                    <button type="button" @click="UpdateProfile" class="btn btn-block btn-success">Update Edit</button>

                                </div>
                            </div>
                        </div>
                    </div>

                      <div class="tab-pane" id="image_setting" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Update Login IMAGE:</h3><br>

                                      <select class="form-control" v-model="EmpID" id="employee_id">
                                         
                                      </select>
                    
                                   

                               
                                    <el-checkbox v-model="AllUsers" ></el-checkbox>
                                    <label for="jack">Select to Assign all Users</label>
                                    <br>  
                                     
                                     <label style="color: #455a64"><b>Login Screen Image:</b> </label>
                                    <el-upload
                                        action="#"
                                        id='EmpLoginimage'
                                        ref="EmpLoginimage"
                                        class="avatar-uploader"
                                        :show-file-list="true"
                                        :on-change="EmphandleLoginImageChange"
                                        :auto-upload="false">
                                      <img v-if="EmpLoginimageUrl" :src="EmpLoginimageUrl" class="avatar">
                                      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                    </el-upload>
                                    <span>You can upload 1 image max size of 2MB.</span><br>

                                    <hr>

                                    <button type="button" @click="UpdateEmp" class="btn btn-block btn-success">Update Employee</button>

                                </div>
                            </div>
                        </div>
                    </div>


                     <div class="tab-pane" id="recommend" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Recommend to friend:</h3><br>
                                    <p style="color:red">If you enjoy using Ogeo, you can easily refer Ogeo to any of your contacts. If your contact's organization adopts Ogeo, we shall wore you 10% of organization first full month Ogeo invoice</p>
                                    <p style="color:red">Thank You!!!</p>
                                   <form method="post" id="recommend_form" @submit.prevent="AddRecommend">

                                    <label style="color: #455a64"><b>Name:</b> </label>
                                    <div class="grid-content">
                                        <el-input v-model="recommendMod.name" placeholder="Enter Name" required></el-input><br><br>
                                    </div>
                                   

                                    <label style="color: #455a64"><b>Email:</b> </label>
                                    <div class="grid-content">
                                        <el-input type="email" v-model="recommendMod.email" placeholder="Enter Email" required></el-input><br><br>
                                    </div>
                                   

                                    <!-- <label style="color: #455a64"><b>Organization:</b> </label>
                                     <div class="grid-content">
                                    <select id="organization_dropdown" v-model="recommendMod.organization">
                                      <option value="">Please select one</option>
                                    
                                    </select>
                                   </div> -->


                                    <label style="color: #455a64"><b>Description:</b> </label>
                                    <div class="grid-content">
                                        <el-input type="textarea" v-model="recommendMod.description"  placeholder="Enter Description"></el-input><br><br>
                                    </div>
                                   

                               
                                    <button type="submit" class="btn btn-block btn-success">Add</button>
                                   </form>
                                     <hr>
                                     <h3>List of Referred Users</h3>
                                   <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                 <th>Email</th>
                                                  <th>Image</th>
                                            </tr>
                                        </thead>
                                        <tbody id="ref-body">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                
                    

                    <div class="tab-pane" id="recent_activities" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <h4 class="font-medium m-t-30">Last 30 Days Activities:</h4>
                                    <div>
                                        <table ref="UserActivitiesTables" id="UserActivitiesTables" class="display responsive table table-bordered table-hover" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Action Type</th>
                                                    <th>Applied To</th>
                                                    <th>Affected Record</th>
                                                    <th>Changes</th>
                                                    <th>Done At</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>                             

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="system_testing" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <h3>Generate PDF Example:</h3>
                                    <button type="button" @click="GeneratePDF" class="btn btn-block btn-success">Generate PDF</button><hr><br>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="tab-pane" id="notificaitons" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <h3>Notificaitons Details</h3>
                                    <p>What should we diplay here?</p>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</template>


<script>
	

    import validateJs from 'validate.js';
    import {CustomJs} from '../../helpers/custom.js';

	export default {
		name: 'profile-info',
		data(){
			return{
                ActivitesTable: "",
                RolesTable: "",
                URL: '/uploads/ProfileImages/',
				socialbg: "/assets/images/background/socialbg.jpg",
                PasswordChange: {
                    old: "",
                    password: "",
                    password_confirmation: ""
                },
                PersonalDetails: {
                    designation: "",
                    phone: "",
                    address: "",
                },
                recommendMod: {
                    name: "",
                    email: "",
                    organization: "",
                     description: "",
                },
                EmpID:"",
                AllUsers:"",

                errors: null,
                imageUrl: "",
                LoginimageUrl:"",
                EmpLoginimageUrl:"",
                role:"",

			}
		},
		methods: {
            GeneratePDF(){

                axios({
                    url: '/api/users/create_testing_pdf',
                    method: 'POST',
                    responseType: 'blob', // important
                }).then((response) => {
                    const url = window.URL.createObjectURL(new Blob([response.data]));
                    const link = document.createElement('a');
                    link.href = url;
                    link.setAttribute('download', 'file.pdf');
                    document.body.appendChild(link);
                    link.click();
                });
                
            },
            handleAvatarChange(file, fileList) {
            
                const isJPG = file.raw.type === 'image/jpeg';
                const isPNG = file.raw.type === 'image/png';
                const isLt2M = file.raw.size / 1024 / 1024 < 2;

                if ((isJPG || isPNG) && isLt2M) {
                    
                    if(fileList.length == 2){
                        fileList.shift();
                    }

                    this.imageUrl = URL.createObjectURL(fileList[0].raw);
                } else {
                    
                    fileList.shift();
                    fileList.shift();
                    this.imageUrl = "";
                    
                    this.$message.error('Avatar picture must be JPG or PNG format with size not exceeding 2MB!!');
                    return false;
                }
                
            },

            handleLoginImageChange(file, fileList) {
            
                const isJPG = file.raw.type === 'image/jpeg';
                const isPNG = file.raw.type === 'image/png';
                const isLt2M = file.raw.size / 1024 / 1024 < 2;

                if ((isJPG || isPNG) && isLt2M) {
                    
                    if(fileList.length == 2){
                        fileList.shift();
                    }

                    this.LoginimageUrl = URL.createObjectURL(fileList[0].raw);
                    console.log(this.LoginimageUrl);
                } else {
                    
                    fileList.shift();
                    fileList.shift();
                    this.LoginimageUrl = "";
                    
                    this.$message.error(' picture must be JPG or PNG format with size not exceeding 2MB!!');
                    return false;
                }
                
            },

             EmphandleLoginImageChange(file, fileList) {
                 console.log('hi');
            
                const isJPG = file.raw.type === 'image/jpeg';
                const isPNG = file.raw.type === 'image/png';
                const isLt2M = file.raw.size / 1024 / 1024 < 2;

                if ((isJPG || isPNG) && isLt2M) {
                    
                    if(fileList.length == 2){
                        fileList.shift();
                    }

                    this.EmpLoginimageUrl = URL.createObjectURL(fileList[0].raw);
                    console.log(this.EmpLoginimageUrl);
                } else {
                    
                    fileList.shift();
                    fileList.shift();
                    this.EmpLoginimageUrl = "";
                    
                    this.$message.error(' picture must be JPG or PNG format with size not exceeding 2MB!!');
                    return false;
                }
                
            },

            getEmployees(){
                axios.post('/api/get/employees?user_id='+this.currentUser.userId, 
                       
                        { headers: {
                        'Content-type': 'application/x-www-form-urlencoded',
                        }
                        }).then((response) => {
                            if(response.data.status==true){
                               
                                var users=response.data.users;
                               $('#employee_id').append('<option value="">--select--</option>');
                               for(var i=0;i<users.length;i++){
                                     $('#employee_id').append('<option value="'+users[i].id+'">'+users[i].name+'</option>');
                               }
                                
                            }

                      

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
            },

             getRole(){
                axios.post('/api/get/role?user_id='+this.currentUser.userId, 
                       
                        { headers: {
                        'Content-type': 'application/x-www-form-urlencoded',
                        }
                        }).then((response) => {
                            if(response.data.status==true){
                               
                                var role=response.data.role;
                                this.role=role.role_name;
                             
                                
                            }

                      

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
            },


           AddRecommend(){
              
                let name=this.$data.recommendMod.name;
                 let email=this.$data.recommendMod.email;
                  //let organization=this.$data.recommendMod.organization;
                   let description=this.$data.recommendMod.description;
                   let ref_id=this.currentUser.userId
                 
                   
                   axios.post('/api/add/recommend', 
                     {
                            name:name,
                            email:email,
                            description:description,
                            ref_id:ref_id,
                           
                        }
                       
                        ).then((response) => {
                            if(response.data.status==true){
                                 document.getElementById('recommend_form').reset();
                              
                                 Swal({ 
                                        type:'success', 
                                        title:'Succcess', 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 20000
                                    });
                            }else{
                                Swal({ 
                                        type:'error', 
                                        title:'Error Occured', 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 20000
                                    });
                            }

                      

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
           },

           getCompanies(){

              

                 axios.post('/api/get/companies', 
                        
                        { headers: {
                        'Content-type': 'application/x-www-form-urlencoded',
                        }
                        }).then((response) => {
                            if(response.data.status==true){
                               
                                var companies=response.data.companies;
                                for(var i=0;i<response.data.companies.length;i++){
                                   
                                    $('#organization_dropdown').append('<option value='+companies[i].id+'>'+companies[i].name+'</option>');
                                }
                            }

                      

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
           },

           getReferred(){
                 axios.post('/api/get/referred?user_id='+this.currentUser.userId, 
                       
                        { headers: {
                        'Content-type': 'application/x-www-form-urlencoded',
                        }
                        }).then((response) => {
                            if(response.data.status==true){
                               
                                var users=response.data.users;
                                for(var i=0;i<response.data.users.length;i++){
                                   
                                   $('#ref-body').append('<tr><td>'+users[i].name+'</td><td>'+users[i].email+'</td><td><img class="img-fluid" style="height:150px;width:150px" src="'+this.$data.URL+users[i].picture+'"></td></tr>')
                                  
                                }
                            }

                      

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
           },

            UpdateEmp(){

                let formData = new FormData();
                if(this.$refs.EmpLoginimage.uploadFiles.length){
                    formData.append('LoginImage',this.$refs.EmpLoginimage.uploadFiles[0].raw);
                }

                 formData.append('user_id', this.EmpID);
                 formData.append('all_users', this.AllUsers);
                 console.log($('#employee_id').val());

                  axios.post('/api/update/employees',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
                    ).then((response) => {

                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 20000
                        });

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });


            },


            UpdateProfile(){

                let formData = new FormData();
                if(this.$refs.ProfileImage.uploadFiles.length){
                    formData.append('ProfileImage',this.$refs.ProfileImage.uploadFiles[0].raw);
                }
                if(this.$refs.LoginImage.uploadFiles.length){
                    formData.append('LoginImage',this.$refs.LoginImage.uploadFiles[0].raw);
                }
                
                formData.append('PersonalDetails', JSON.stringify(this.$data.PersonalDetails));

                axios.post('/api/users/update_profile_details',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
                    ).then((response) => {

                         document.cookie = "LoginImage=/uploads/ProfileImages/"+response.data.loginImageName+"; expires=Fri, 31 Dec 9999 23:59:59 GMT";
                       //  this.$cookies.set("LoginImage","/uploads/ProfileImages/"+response.data.loginImageName,60 * 60 * 24 * 30);

                        this.$store.commit('updateUserImage', response.data.imageSafeName)
                        this.$store.commit('updateUserDesignation', response.data.Designation)
                        this.$store.commit('updateUserPhone', response.data.Phone)
                        this.$store.commit('updateUserAddress', response.data.Address)
                        this.$store.commit('updateLoginImage', response.data.loginImageName)
                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 20000
                        });

                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
            },
			changePassword(){

                this.errors = null;
                const constraints = this.getConstraints();
                const errors = validateJs(this.PasswordChange, constraints);
                if(errors) {
                    this.errors = errors;
                    return;
                }

                axios.post('/api/users/change_password', this.PasswordChange)
                    .then((response) => {
                        this.PasswordChange.old = "";
                        this.PasswordChange.password = "";
                        this.PasswordChange.password_confirmation = "";
                        Swal('Success', response.data.message, 'success');

                    })
                    .catch(error=>{
                        this.PasswordChange.old = "";
                        this.PasswordChange.password = "";
                        this.PasswordChange.password_confirmation = "";
                        this.errors = error.response.data.errors;
                        Swal('Failed', error.response.data.message, 'warning');
                    });

                
            },
            getConstraints() {
                return {
                    old: {
                        presence: true,
                        length: {
                            minimum: 6,
                            message: 'Must be at least 6 characters long'
                        }
                    },
                    password: {
                        presence: true,
                        length: {
                            minimum: 6,
                            message: 'Must be at least 6 characters long'
                        }
                    },
                    password_confirmation: {
                        presence: true,
                        equality: "password",
                    }
                };
            }
		},
		computed: {
			currentUser(){
                this.imageUrl = '/uploads/ProfileImages/'+this.$store.getters.currentUser.Picture;
                this.LoginimageUrl = '/uploads/ProfileImages/'+this.$store.getters.currentUser.LoginImage;
                return this.$store.getters.currentUser;
            },
		},
		mounted(){




            let self = this;

            CustomJs();

            $('.nav-tabs a[href="#profile"]').on('click', function(event) {
                event.preventDefault();

                if(self.RolesTable != ''){
                    self.RolesTable.ajax.reload( null, false );
                } else {
                    self.RolesTable = $('#UserRolesTables').DataTable({
                        stateSave:  false,
                        responsive: true,
                        colReorder: true,
                        processing: true,
                        serverSide: true,
                        ajax: 'http://' + window.location.host + '/api/data/get_user_roles',
                        columns: [
                            { data: 'role_name', render: function(data, type, full){
                                return full.role_name;
                            }},
                            { data: 'role_level', name: 'role_level' },
                            { data: 'assigned_by.name', name: 'assigned_by.name' },
                            { data: 'project.title', render: function(data, type, full){
                                if(full.project == null){
                                    return '';
                                }else{
                                    return full.project.title;
                                }
                                
                            }},
                            { data: 'role_pool_count', name: 'role_pool_count' },
                            { data: 'created_at', name: 'created_at' },
                            { data: 'ended_at', name: 'ended_at' },
                            { data: 'assigned_period', name: 'assigned_period' },
                            { data: 'active', name: 'role_pool_count' },
                        ],
                        columnDefs: [
                            {"orderable":false, "targets":[2,3]},
                            { responsivePriority: 1, targets: 8 },
                            { responsivePriority: 2, targets: 0 },
                        ],
                        dom: '<"html5buttons">Brgtip', //Brfgtip
                        pageLength: 10,
                        lengthMenu: [
                            [ 10, 25, 50, 100, 500, 1000, -1 ],
                            [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                        ],
                        order: [[ 0, "ASC" ]],
                        buttons: [
                            { extend: 'pageLength', className: 'btn btn-success' },
                            { extend: 'copy', className: 'btn btn-success' },
                            { extend: 'excel', className: 'btn btn-success', title: 'RolesList '+ new Date() },
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
                }
                
                
            });


            $('.nav-tabs a[href="#recent_activities"]').on('click', function(event) {
                event.preventDefault();

                if(self.ActivitesTable != ''){
                    self.ActivitesTable.ajax.reload( null, false );
                } else {
                    self.ActivitesTable = $('#UserActivitiesTables').DataTable({
                        // stateSave:  true,
                        responsive: true,
                        colReorder: true,
                        processing: true,
                        serverSide: true,
                        ajax: 'http://' + window.location.host + '/api/data/get_user_activities',
                        columns: [
                            { data: 'id', name: 'id' },
                            { data: 'description', name: 'description' },
                            { data: 'subject_type', name: 'subject_type' },
                            { data: 'subject_id', name: 'subject_id' },
                            { data: 'properties', name: 'properties' },
                            { data: 'created_at', name: 'created_at' },
                        ],
                        columnDefs: [
                            { targets: 0, visible: false },
                            { targets: 1, responsivePriority: 1 },
                        ],
                        order: [[ 0, "ASC" ]],
                        dom: '<"html5buttons">Brfgtip',
                        pageLength: 100,
                        lengthMenu: [
                            [ 10, 25, 50, 100, 500, 1000, -1 ],
                            [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                        ],
                        buttons: [
                            { extend: 'pageLength', className: 'btn btn-success' },
                            { extend: 'copy', className: 'btn btn-success' },
                            { extend: 'excel', className: 'btn btn-success', title: 'ItemCreationList' },
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
                }
                
                
            });




              this.getCompanies();
              this.getReferred();
              this.getEmployees();
              this.getRole();

		}
	} 
	
	
</script>

<style>
    
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }

    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }

    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }

</style>