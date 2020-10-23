<template>
 
    <section id="vendor-login-wrapper">
       

        <div class="login-register"  v-bind:style="[LoginBackGroundImage?{backgroundImage: 'url(' + LoginBackGroundImage + ')'}: {'background-size': 'cover','animation-name':'slider', 'animation-duration': '18s','animation-iteration-count': 'infinite','animation-timing-function': 'ease-in-out'}]">
             <!-- :style="'background-image: url('+LoginBackGroundImage+')'" -->
            <div class="login-box card">
                <div class="card-body">
                  
                  <form autocomplete="off" @submit.prevent="login" method="post">
                    <br>
                    <div align="center" class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <img width="80%" :src="OgeoLogo" alt="Ogeo Logo">
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                    <div class="row m-t-20">
                        <span style="width: 100%; color: #FF2F2F; font-size: 25px; text-align: center">Vendors Access.</span>
                    </div>
                    <br>
                    
                    <div class="form-group loginGroup">
                        <div class="col-xs-12">
                            <input id="email" type="email" class="LoginInputGroup form-control" v-model="email" value="" required autofocus placeholder="Enter Your Email">
                        </div>
                    </div>
                    
                    <div class="form-group loginGroup">
                        <div class="col-xs-12">
                            <input id="password" type="password" class="form-control" v-model="password" required placeholder="Enter Your Password">
                        </div>
                    </div>

                    <div v-if="error" class="col-xs-12 text-danger animated rubberBand text-center">
                        <strong>{{ message }}</strong>
                    </div>
                    <div v-if="loggingInProgress" class="col-xs-12 text-primary animated fadeIn text-center">
                        <strong>Logging In...</strong>
                    </div>
                    <div v-if="loggingInSuccess" class="col-xs-12 text-success animated fadeIn text-center">
                        <strong>Success...</strong>
                    </div>
                    
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-ogeo btn-block text-uppercase waves-effect waves-light" type="submit">Login</button>
                        </div>
                        <a class="btn btn-link" style="color: #FF2F2F" href="#">
                            <router-link class="p-2 text-ogeo" :to="{ name: 'Vendor Forget Password Request' }"><b>Forgot Your Password?</b></router-link>
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
    name: 'vendor-login',
    data(){
      return {
        OgeoLogo: '/assets/images/logo_transparent.png',
      LoginBackGroundImage:$cookies.isKey('VendorLoginImage')?$cookies.get('VendorLoginImage') :'',
        email: null,
        password: null,
        error: false,
        loggingInProgress: false,
        loggingInSuccess: false,
        message: false
      }
    },
    methods: {
      login: function () {
            this.error = false
            this.loggingInProgress = true
            this.loggingInSuccess = false
            this.error = false
            const self = this;
            const { email, password } = this;
            this.$store.dispatch('POST_AUTH_REQUEST_VENDOR', { email, password }).then(() => {
                self.loggingInProgress = false;
                self.loggingInSuccess = true
                this.$router.push('/vendors/users/profile')
            }).catch((err) => {
                self.loggingInProgress = false;
                self.error = true;
                self.message = err.response.data.message;
                //console.log(err.response.data.message);
            })
        },
    }
  } 
</script>
<style>

@keyframes slider {
    0%,100%
    {
        background-image: url("http://127.0.0.1:8000/images/josh-rose-9YQGFzg0RiM-unsplash.jpg");
    }
    25%{
        background-image: url("http://127.0.0.1:8000/images/laura-vinck-Hyu76loQLdk-unsplash.jpg");
    }
    50%
    {
        background-image: url("http://127.0.0.1:8000/images/nitish-meena-RbbdzZBKRDY-unsplash.jpg");
    }
    75%
    {
        background-image: url("http://127.0.0.1:8000/images/preston-pownell-SwIQu6xODrI-unsplash.jpg");
    }
    
}

</style>