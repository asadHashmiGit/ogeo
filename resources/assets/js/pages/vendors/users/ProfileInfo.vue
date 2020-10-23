<template>

    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="row page-titles">

                <div id="breadcrumb-title" class="col-md-12 col-lg-5 col-xlg-5 animated">
                    <h3 class="text-themecolor m-b-0 m-t-0">User Profile</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Profile</a></li>
                        <li class="breadcrumb-item active">User Profile</li>
                    </ol>
                </div>
            </div>

	
        	<div class="row">
                <!-- <div class="col-lg-4 col-xlg-3 col-md-5">
                    <div class="card"> <img class="card-img" :src="socialbg" alt="Card image">
                        <div class="card-img-overlay card-inverse social-profile d-flex ">
                            <div class="align-self-center"> <img :src="user1" class="img-circle" width="100">
                                <h4 class="card-title">James Anderson</h4>
                                <h6 class="card-subtitle">jamesandre</h6>
                                <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt </p>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body"> <small class="text-muted">Email address </small>
                            <h6>{{ currentVendor.Email }}</h6> <small class="text-muted p-t-30 db">Phone</small>
                            <h6>71 Pilgrim Avenue Chevy Chase, MD 20815</h6>
                            
                        </div>
                    </div>
                </div>

                <div class="col-lg-8 col-xlg-9 col-md-7"> -->
                <div class="col-lg-12">
                    <div class="card">

                        <ul class="nav nav-tabs profile-tab" role="tablist">
                            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Welcome</a> </li>
                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">Profile</a> </li>
                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#change_passwrod" role="tab">Chanage Password</a> </li>
                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#edit_details" role="tab">Personal Details</a> </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="home" role="tabpanel">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-12">

                                            <div class="m-t-20 row">
                                                <div class="col-md-3 col-xs-12"><img :src="URL+currentVendor.Picture" alt="user" class="img-responsive radius" /></div>
                                                <div class="col-md-9 col-xs-12">
                                                    <h5> Hello {{ currentVendor.Name }}, and Welcome To Ogéo.</h5>
                                                    <p class="m-t-20">Please use the menu under “Offers Management” to access the actions that fall under the remit of your role(s).</p>
                                                    <!-- <p class="m-t-10">Please utilize the menu on top to take action against various system functionality. There you will find any pending transaction requiring your action. Also, you may find any transaction details you have proviously engaged with.</p> -->
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
                                            <p class="text-muted">{{ currentVendor.Name }}</p>
                                        </div>
                                        <div class="col-md-3 col-xs-6 b-r"> <strong>Phone </strong>
                                            <br>
                                            <p class="text-muted">{{ currentVendor.Phone }}</p>
                                        </div>
                                        <div class="col-md-3 col-xs-6 b-r"> <strong>Email</strong>
                                            <br>
                                            <p class="text-muted">{{ currentVendor.Email }}</p>
                                        </div>
                                        <div class="col-md-3 col-xs-6"> <strong>Location</strong>
                                            <br>
                                            <p class="text-muted">{{ currentVendor.Address }}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    
                                    
                                    <h4 class="font-medium m-t-30">My Assigned Roles:</h4>
                                    <div>
                                        <table ref="VendorRolesTables" id="VendorRolesTables" class="display responsive table table-bordered table-hover" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>Company Name</th>
                                                    <th>Assigned By</th>
                                                    <th>Bidding Role</th>
                                                    <th>Invoicing Role</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    
                                    <hr>
                                </div>
                            </div>

                            <div class="tab-pane" id="change_passwrod" role="tabpanel">
                                <div class="card-body">
                                    <form autocomplete="off" @submit.prevent="changePassword">
                                        <div class="form-group">
                                            <label class="col-md-12">Old Password</label>
                                            <div class="col-md-12">
                                                <input autocomplete="false" type="password" v-model="PasswordChange.old" class="form-control form-control-line" placeholder="Enter Your Old Password">
                                                <span class="text-danger" v-if="errors && errors.old">{{ errors.old }}</span>
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">New Password</label>
                                            <div class="col-md-12">
                                                <input autocomplete="false" type="password" v-model="PasswordChange.password" class="form-control form-control-line" placeholder="Enter New Password">
                                                <span class="text-danger" v-if="errors && errors.password">{{ errors.password }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Confirm Password</label>
                                            <div class="col-md-12">
                                                <input autocomplete="false" type="password" v-model="PasswordChange.password_confirmation " class="form-control form-control-line" placeholder="Confirm New Password">
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

                                            <label style="color: #455a64">Phone Number: </label>
                                            <div class="grid-content">
                                                <el-input v-model="PersonalDetails.phone" :placeholder="currentVendor.Phone"/></el-input><br><br>
                                            </div>
                                           

                                            <label style="color: #455a64">Address: </label>
                                            <div class="grid-content">
                                                <el-input v-model="PersonalDetails.address" :placeholder="currentVendor.Address"></el-input><br><br>
                                            </div>
                                           

                                            <label style="color: #455a64">Profile Image: </label>
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
		name: 'profile-info',
		data(){
			return{
                RolesTable: "",
                URL: '/uploads/ProfileImages/',
                PasswordChange: {
                    old: "",
                    password: "",
                    password_confirmation: ""
                },
                PersonalDetails: {
                    phone: "",
                    address: "",
                },
                errors: null,
                imageUrl: "",
                  LoginimageUrl:""
			}
		},
		methods: {

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

            UpdateProfile(){

                let formData = new FormData();
                if(this.$refs.ProfileImage.uploadFiles.length){
                    formData.append('ProfileImage',this.$refs.ProfileImage.uploadFiles[0].raw);
                } 
                if(this.$refs.LoginImage.uploadFiles.length){
                    formData.append('LoginImage',this.$refs.LoginImage.uploadFiles[0].raw);
                }
                
                formData.append('PersonalDetails', JSON.stringify(this.$data.PersonalDetails));

                axios.post('/api/vendors/update_profile_details',
                        formData,
                        {
                            headers: {
                                'Content-Type': 'multipart/form-data'
                            }
                        }
                    ).then((response) => {
                       
                         document.cookie = "VendorLoginImage=/uploads/ProfileImages/"+response.data.loginImageName+"; expires=Fri, 31 Dec 9999 23:59:59 GMT";
                        this.$store.commit('updateVendorImage', response.data.imageSafeName)
                        this.$store.commit('updateVendorLoginImage', response.data.loginImageName)
                        this.$store.commit('updateVendorPhone', response.data.Phone)
                        this.$store.commit('updateVendorAddress', response.data.Address)

                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                            timer: 20000
                        });

                    })
                    .catch(function(error){
                        console.log(error.message);
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (Profile Update)', 'error');
                    });
            },

			changePassword(){

                this.errors = null;
                const constraints = this.getConstraints();
                const errors = validate(this.$data.PasswordChange, constraints);
                if(errors) {
                    this.errors = errors;
                    return;
                }

                axios.post('/api/vendors/change_password', this.$data.PasswordChange)
                    .then((response) => {
                        this.$data.PasswordChange.old = "";
                        this.$data.PasswordChange.password = "";
                        this.$data.PasswordChange.password_confirmation = "";
                        Swal('Success', response.data.message, 'success');

                    })
                    .catch(error=>{
                        this.$data.PasswordChange.old = "";
                        this.$data.PasswordChange.password = "";
                        this.$data.PasswordChange.password_confirmation = "";
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
			currentVendor(){
                  this.imageUrl = '/uploads/ProfileImages/'+this.$store.getters.currentVendor.Picture;
                this.LoginimageUrl = '/uploads/ProfileImages/'+this.$store.getters.currentVendor.LoginImage;
                console.log(this.$store.getters.currentVendor.LoginImage);
                return this.$store.getters.currentVendor;
            }
		},
		mounted(){

            let self = this;

            $('.nav-tabs a[href="#profile"]').on('click', function(event) {
                event.preventDefault();

                if(self.RolesTable != ''){
                    self.RolesTable.ajax.reload( null, false );
                } else {
                    self.RolesTable = $('#VendorRolesTables').DataTable({
                        stateSave:  true,
                        responsive: true,
                        colReorder: true,
                        processing: true,
                        serverSide: true,
                        ajax: 'http://' + window.location.host + '/api/vendors/get_vendor_user_roles',
                        columns: [
                            { data: 'company.name', name: 'company.name' },
                            { data: 'creator.name', name: 'creator.name' },
                            { data: 'pivot.sbm_role', name: 'pivot.sbm_role' },
                            { data: 'pivot.sim_role', name: 'pivot.sim_role' },
                        ],
                        columnDefs: [
                            { responsivePriority: 2, targets: 0 },
                            { 
                                targets: 2, 
                                "render": function ( data, type, row, meta ) {
                                    if(data == "SBM"){
                                        return 'Yes';
                                    } else {
                                        return 'No';
                                    }
                                }
                            },
                            { 
                                targets: 3, 
                                "render": function ( data, type, row, meta ) {
                                    if(data == "SIM"){
                                        return 'Yes';
                                    } else {
                                        return 'No';
                                    }
                                }
                            }
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