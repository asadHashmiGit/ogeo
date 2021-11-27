<template>
    
    <div class="container">
        <div class="row justify-content-center">
            

            <div class="col-md-8">
                
                <div align="center" class="row m-b-20 m-t-20">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <img width="80%" :src="OgeoLogo" alt="Ogeo Logo">
                    </div>
                    <div class="col-lg-4"></div>
                </div>

                <div style="font-size: 18px; color: #636b6f; font-family: 'Raleway', sans-serif; font-weight: 500;" class="title m-b-md">
                    <h2 style="color:rgb(252, 51, 23);text-align:center">Thank you for registering with Ogéo Asad.</h2><h2 style="color:rgb(252, 51, 23);text-align:center">We are thrilled to be able to serve you!!</h2>
                    <p>It’s important to note that the information you are about to enter during the registration process can be revisited at will, and anytime. This includes adding an unlimited number of <b style="color:rgb(252, 51, 23)">Set-ups*</b> to your organization.</p>
                    <p><b style="color:rgb(252, 51, 23)">The registration process shouldn’t take you more than <u>15 minutes</u></b> if you readily have at your disposal the following information:</p>
                </div>

                <div style="font-size: 18px; color: #636b6f; font-family: 'Raleway', sans-serif; font-weight: 500;" class="title m-b-md">
                    <ol type="A">
                        <li>The users details (names, designations & emails) of at least one person from a group of users holding one of the <b style="color:rgb(252, 51, 23)">Roles**</b> on Ogéo.</li>
                        <li>The delegations of authorities (DoA) and applicable financial limits, which apply to at least one Set-up.</li>
                        <li>The budget of at least one Set-up.</li>
                    </ol>
                    <!-- <p><b>It’s important to note that the information captured during the registration process can be revisited and updated at will. That include adding new Set-ups.</b></p> -->
                    <br>
                    <center><h1 style="text-align: center !important; color: #FF2F2F; font-weight: bolder">No Credit Card Needed</h1></center>
                    <br>
                </div>
                  
                
                <div style="" class="card">
                    <div style="text-align: center !important; color: #FF2F2F; font-weight: bolder" class="card-header"><b>Registration Form</b></div>

                    <div class="card-body">
                        <form autocomplete="off" @submit.prevent="register" method="post">

                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">Full Name</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control" v-model="name" required autofocus>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="designation" class="col-md-4 col-form-label text-md-right">Designation</label>

                                <div class="col-md-6">
                                    <input id="designation" type="text" class="form-control" v-model="designation" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control" v-model="email" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" v-model="password" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>

                                <div class="col-md-6">
                                    <input id="password-confirm" type="password" class="form-control" v-model="password_confirmation" required>
                                </div>
                            </div>
                          
                            <div class="form-group row">
                                <div v-if="registerationError" class="col-md-6 offset-md-4 text-danger animated rubberBand text-center">
                                    <strong>{{ message }}</strong>
                                </div>
                                <div v-if="registerationInProgress" class="col-md-6 offset-md-4 text-primary animated fadeIn text-center">
                                    <strong>Registering...</strong>
                                </div>
                                <div v-if="registerationSuccess" class="col-md-6 offset-md-4 text-success animated fadeIn text-center">
                                    <strong>{{ message }}</strong>
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-block btn-ogeo waves-effect waves-light">
                                        Register
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div style="font-size: 18px; color: #636b6f; font-family: 'Raleway', sans-serif; font-weight: 500;" class="title m-b-md">
                    
                    <ol>
                        <p><b style="color:rgb(252, 51, 23)">*</b>A Set-up can be a branch, an affiliate, a project, a warehouse/soteroom, a department, a subsidiary, a store … or any part of your organization.</p>
                        <p><b style="color:rgb(252, 51, 23)">**</b>Below is a description of the roles:</p>
                        <li style="color:rgb(252, 51, 23)">Purchase Enquiry</li>
                            <ol type="a">
                                <li><b>Originating Purchase Enquiries</b></li>
                                <li><b>Approving/rejecting a Purchase Enquiries</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Request for Proposals</li>
                            <ol type="a">
                                <li><b>Creating Request for Proposals (Sealed Bids, or Live Auctions)</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Purchase Order</li>
                            <ol type="a">
                                <li><b>Originating Purchase Orders</b></li>
                                <li><b>Approving/rejecting Purchase Orders</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Receipt Note</li>
                            <ol type="a">
                                <li><b>Originating Receipt Notes</b></li>
                                <li><b>Approving/rejecting  Receipt Notes</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Vendors Enrolment</li>
                            <ol type="a">
                                <li><b>Originating Purchase Enquiries</b></li>
                                <li><b>Approving/rejecting a Purchase Enquiries</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Invoice</li>
                            <ol type="a">
                                <li><b>Checking Vendors’ Invoices (uploaded by the vendor on Ogéo)</b></li>
                            </ol>
                        <li style="color:rgb(252, 51, 23)">Libraries of Materials</li>
                        <ol type="a">
                            <li><b>Originating Requests to Update the Library of Materials</b></li>
                            <li><b>Reviewing/Correcting the Requests to Update the Library of Materials </b></li>
                            <li><b>Approving/Rejecting the Requests to Update the Library of Materials </b></li>
                        </ol>
                        <li style="color:rgb(252, 51, 23)">Rate Contracts (Volume Discount Supply Agreement)</b></li>
                        <ol type="a">
                            <li><b>Originating Requests to Establish Rate Contracts for materials</b></li>
                            <li><b>Approving/Rejecting the Requests to Establish Rate Contracts</b></li>
                            <li><b>Originating the actual Establishment of Rate Contracts</b></li>
                            <li><b>Approving Rate Contracts</b></li>
                        </ol>
                        <li style="color:rgb(252, 51, 23)">Budget</li>
                        <ol type="a">
                            <li><b>Originating Requests to Update Set-up Budget</b></li>
                            <li><b>Approving/Rejecting Requests to Update Set-up Budget</b></li>
                        </ol>
                        <li style="color:rgb(252, 51, 23)">Storerooms</li>
                        <ol type="a">
                            <li><b>Creating Storerooms & Adding Storerooms’ Items to the Storerooms</b></li>
                            <li><b>Originating Requests to create Storerooms’ Items</b></li>
                            <li><b>Approving Requests to create Storerooms’ Items</b></li>
                            <li><b>Creating Storerooms’ Items Issue Notes</b></li>
                            <li><b>Approving Storerooms’ Items Issue Notes</b></li>
                            <li><b>Creating Storerooms’ Items Return Notes</b></li>
                            <li><b>Approving Storerooms’ Items Return Notes</b></li>
                        </ol>
                        
                    </ol>
                </div>

                

            </div>
        </div>
    </div>
</template>

<script>
  export default {
    name: 'registeration',
    data(){
      return {
        OgeoLogo: '/assets/images/logo_transparent.png',
        name: null,
        designation: null,
        email: null,
        password: null,
        ref_id:this.$route.query.ref_id?this.$route.query.ref_id:0,
        password_confirmation: null,
        registerationInProgress: false,
        registerationSuccess: false,
        registerationError: false,
        message: "",
      }
    },
    methods: {
      register: function () {
            this.registerationInProgress = true
            this.registerationSuccess = false;
            this.registerationError = false;
            const self = this;
            const { name, designation, email, password, password_confirmation  } = this;
            let ref_id=this.$data.ref_id;
            console.log(ref_id);
            this.$store.dispatch('POST_AUTH_REQUEST_REGISTER', { name, designation, email, password, password_confirmation,ref_id }).then((res) => {
                self.registerationInProgress = false;
                self.registerationSuccess = true;
                if(res.data.status == "incomplete"){
                    Swal({
						title: 'Already Registered!',
						text: "Do you want to complete your incomplete registration?",
						type: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Yes',
                        cancelButtonText : 'No'
					  }).then((result) => {
						  if (result.value) {
                            this.$store.dispatch('POST_AUTH_REQUEST_EMAIL', { email, password }).then(() => {
                                self.registerationInProgress = false;
                                self.registerationSuccess = true;
                                    document.cookie = "LoginImage=/uploads/ProfileImages/"+this.$store.state.currentUser.LoginImage+"; expires=Fri, 31 Dec 9999 23:59:59 GMT";
                                    
                                if(this.$store.state.currentUser.onboarding == 1){
                                    this.$router.push('/app/account_settings')
                                } else {
                                    this.$router.push('/app/profile')
                                }
                            }).catch((err) => {
                                self.message = "Invalid Credentials. Account Already Exist";   
                                self.registerationInProgress = false;
                                self.error = true;
                            })
						  }else{
							axios({url: '/api/delete_user', data: { email, password }, method: 'POST' })
							.then(resp => {
								localStorage.removeItem('user');
                                delete axios.defaults.headers.common['Authorization'];
                                delete $.ajaxSettings.headers["Authorization"];
                                window.location.href = '/registration';

                            });
						  }
					  });
                }else{
                    this.$router.push('/app/account_settings');
                }
            }).catch((error) => {
                self.registerationInProgress = false;
                self.registerationError = true;
                if(error.response.data.error){   
                    self.message = error.response.data.error;
                }
                if(error.response.data.errors){ 
                    self.message = error.response.data.errors[Object.keys(error.response.data.errors)[0]][0];
                   
                }
               
                //console.log(err.response.data.message);
            })
        },
        geturlparam:function(){
             console.log(this.$data.ref_id);
        },
    }
    ,
    created: function(){
        this.geturlparam();
    }
  } 
</script>