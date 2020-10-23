<template>

    <section id="login-wrapper">
        <div class="login-register" > <!-- :style="'background-image: url('+LoginBackGroundImage+')'" -->
            <div class="login-box card">
                <div class="card-body">
                    
                    <form autocomplete="off" @submit.prevent="resetPassword" method="post">
                        
                        <input type="hidden" name="token" value="">

                        <div class="form-group ">
                            <div class="col-xs-12">
                                <h3>Recover Password</h3>
                                <p class="text-muted">Fill The Information Below To Reset Your Password! </p>
                            </div>
                        </div>
                    

                        <div class="form-group">
                            <div class="col-xs-12">
                                <input id="email" type="email" class="form-control" v-model="email" required autofocus placeholder="Enter Your Email">
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input id="password" type="password" class="form-control" v-model="password" required placeholder="Enter New Password">

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <input id="password-confirm" type="password" class="form-control" v-model="password_confirmation" required placeholder="Confirm New Password">
                            </div>
                        </div>


                        <div v-if="resetError" class="col-xs-12 text-danger animated rubberBand text-center">
                            <strong>{{ message }}</strong>
                        </div>
                        <div v-if="resetInProgress" class="col-xs-12 text-primary animated fadeIn text-center">
                            <strong>Reseting Password...</strong>
                        </div>
                        <div v-if="resetSuccess" class="col-xs-12 text-success animated fadeIn text-center">
                            <strong>{{ message }}</strong>
                        </div>


                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-ogeo btn-block waves-effect waves-light">Reset Password</button>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
        </div>
    </section>
</template>

<script>
  export default {
    name: 'client-login',
    data(){
      return {
        OgeoLogo: '/assets/images/logo_transparent.png',
        LoginBackGroundImage: '/assets/images/background/login-register-5.jpg',
        token: null,
        email: null,
        password: null,
        password_confirmation: null,
        resetError: false,
        resetInProgress: false,
        resetSuccess: false,
        message: ""
      }
    },
    methods: {

        resetPassword: function () {
            let self = this;
            const { email, password, password_confirmation, token } = this;

            self.resetInProgress = true;
            self.resetError = false;
            self.resetSuccess = false;
            self.message = "";

            axios.post('/api/password/reset/vendor', {email: email, password: password, password_confirmation: password_confirmation, token: token})
                .then((response) => {
                    self.resetInProgress = false;
                    self.resetSuccess = true;
                    self.message = response.data.message
                    console.log(response.data.message);
                })
                .catch((error) => {
                    self.resetInProgress = false;
                    self.resetError = true;
                    if(error.response.data.errors){   
                        self.message = error.response.data.errors[Object.keys(error.response.data.errors)[0]][0];
                    }
                    if(error.response.data.error){   
                        self.message = error.response.data.error;
                    }
                    // console.log(error.response.data.errors);
                    // console.log(error.response.data.error);
                    // console.log(error.response.data.errors[Object.keys(error.response.data.errors)[0]][0]);
                });
        }

    },
    mounted() {
        this.token = this.$route.query.token;
    }
  } 
</script>