<template>

    <section id="login-wrapper">
        <div class="login-register" > <!-- :style="'background-image: url('+LoginBackGroundImage+')'" -->
            <div class="login-box card">
                <div class="card-body">
                    
                    <form autocomplete="off" @submit.prevent="forgotPassword" method="post">

                        <div class="form-group ">
                            <div class="col-xs-12">
                                <h3>Recover Password</h3>
                                <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                            </div>
                        </div>
                    

                        <div class="form-group">
                            <div class="col-xs-12">
                                <input id="email" type="email" class="form-control" v-model="email" required>
                            </div>
                        </div>

                        <div v-if="requestError" class="col-xs-12 text-danger animated rubberBand text-center">
                            <strong>{{ message }}</strong>
                        </div>
                        <div v-if="requestInProgress" class="col-xs-12 text-primary animated fadeIn text-center">
                            <strong>Requesting Reset Link...</strong>
                        </div>
                        <div v-if="requestSuccess" class="col-xs-12 text-success animated fadeIn text-center">
                            <strong>{{ message }}</strong>
                        </div>

                        <div class="form-group text-center m-t-20">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-block btn-ogeo">
                                    Send Password Reset Link
                                </button>
                            </div>
                            <a style="color: #FF2F2F" class="btn btn-link" href="#">
                                <router-link class="p-2 text-ogeo" :to="{ name: 'Vendor Login' }"><b>Back to Login Page</b></router-link>
                            </a>
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
        email: null,
        message: "",
        requestError: false,
        requestSuccess: false,
        requestInProgress: false
      }
    },
    methods: {

        forgotPassword: function () {
            let self = this;
            const { email } = this

            self.requestInProgress = true;
            self.requestError = false;
            self.requestSuccess = false;
            
            axios.post('/api/password/email/vendor', {email: email})
                .then((response) => {
                    self.requestInProgress = false;
                    self.requestSuccess = true
                    self.message = response.data.message
                    // console.log(response.data.message);
                })
                .catch((error) => {
                    self.requestInProgress = false;
                    self.requestError = true;
                    self.message = error.response.data.error;
                    // console.log(error.response.data.error);
                });
        }

    }
  } 
</script>