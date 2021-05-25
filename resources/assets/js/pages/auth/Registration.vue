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
                    <p>Thank you for registering with Ogéo. We are thrilled to be able to serve you!!</p>
                    <p>It’s important to note that the information you are about to capture during the registration process can be revisited and incremented at will, and anytime.</p>
                    <p><b>The registration process shouldn’t take you more than <u>15 minutes</u></b> if you readily have at your disposal the following information:</p>
                </div>

                <div style="font-size: 18px; color: #636b6f; font-family: 'Raleway', sans-serif; font-weight: 500;" class="title m-b-md">
                    <ol type="A">
                        <li>The contact details (name, designation & email) of at least one person from a group of users holding one of the roles<b>&lowast;</b>.</li>
                        <li>The delegations of authorities (DoA) and applicable financial limits, which apply to the created entities.</li>
                        <li>Budgets of the created Set-ups.</li>
                    </ol>
                    <p><b>It’s important to note that the information captured during the registration process can be revisited and updated at will. That include adding new Set-ups.</b></p>
                    <br>
                    <center><p style="text-align: center !important; color: #FF2F2F; font-weight: bolder">No Credit Card Needed</p></center>
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
                        <b>&lowast;</b>
                        <li>Creating Set-ups (entities, including, Storerooms) for which the roles below are created</li>
                        <li>Purchase Enquiry</li>
                        <ol type="a">
                            <li>Originating Purchase Enquiries</li>
                            <li>Approving/rejecting a Purchase Enquiries</li>
                        </ol>
                        <li>Request for Proposals</li>
                        <ol type="a">
                            <li>Creating Request for Proposals</li>
                        </ol>
                        <li>Purchase Order</li>
                        <ol type="a">
                            <li>Originating Purchase Orders</li>
                            <li>Approving/rejecting Purchase Orders</li>
                        </ol>
                        <li>Receipt Note</li>
                        <ol type="a">
                            <li>Originating Receipt Notes</li>
                            <li>Approving/rejecting  Receipt Notes</li>
                        </ol>
                        <li>Checking Vendor Invoices</li>
                        <li>Approving/rejecting the enrolment of Vendors</li>
                        <li>Uploading Proposals (Vendor side)</li>
                        <li>Uploading Invoices (Vendor side)</li>
                        <li>Libraries of Materials</li>
                        <ol type="a">
                            <li>Originating requests to add new items to the Libraries of Materials</li>
                            <li>Reviewing and, if applicable, updating the requests to add new materials to the Customer’s Library of Materials</li>
                            <li>Approving/rejecting the requests to add new materials to the Customer’s Library of Materials</li>
                        </ol>
                        <li>Rate Contracts (Volume Discount Supply Agreement)</li>
                        <ol type="a">
                            <li>Originating requests to establish Rate Contracts (RC) for materials</li>
                            <li>Approving/rejecting the requests to establish Rate Contracts</li>
                            <li>Originating the establishment of Rate Contracts</li>
                            <li>Approving the establishment of Rate Contracts</li>
                        </ol>
                        <li>Storerooms </li>
                        <ol type="a">
                            <li>Creating Storerooms & Adding Storerooms’ Items to the Storerooms</li>
                            <li>Originating Requests to create Storerooms’ Items</li>
                            <li>Approving Requests to create Storerooms’ Items</li>
                            <li>Creating Storerooms’ Items Issue Notes</li>
                            <li>Approving Storerooms’ Items Issue Notes</li>
                            <li>Creating Storerooms’ Items Return Notes</li>
                            <li>Approving Storerooms’ Items Return Notes</li>
                        </ol>
                        <li>Accessing dashboards, reports & analytics</li>
                        
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