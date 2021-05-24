<template>

    <section id="login-wrapper">
        <div class="login-register"  v-bind:style="{'background-size': 'cover','animation-name':'slider', 'animation-duration': '18s','animation-iteration-count': 'infinite','animation-timing-function': 'ease-in-out','text-align': 'center'}">
            <div style="width:920px" class="d-inline-flex justify-content-center">
                <div class="login-box card" style="width:400px">
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
                                <span style="width: 100%; color: #FF2F2F; font-size: 25px; text-align: center">Client Access.</span>
                            </div>
                            <br>
                            
                            <div class="form-group loginGroup">
                                <div class="col-xs-12">
                                    <input id="email" type="email" v-model="email" class="LoginInputGroup form-control" value="" required autofocus placeholder="Enter Your Email" >
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
                                    <router-link class="p-2 text-ogeo" :to="{ name: 'Client Forget Password Request' }"><b>Forgot Your Password?</b></router-link>
                                </a>
                            </div>
                        </form>


                    </div>
                </div>
                <div class="login-box card" style="width:520px; border: 0; border-radius: 0 5px 5px 0;" v-if="(LoginBackGroundImage!=null) && (LoginBackGroundImage!='/uploads/ProfileImages/null')">
                    <div class="card-body"  v-bind:style=" {backgroundImage: 'url(' + LoginBackGroundImage + ')', 'background-size': 'cover', 'background-repeat': 'no-repeat', 'background-position': 'center', 'border': '0', 'border-radius': '0 5px 5px 0'}" >
                    </div>
                </div>
                <div v-else></div>
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
        LoginBackGroundImage:$cookies.isKey('LoginImage')?$cookies.get('LoginImage') :null,
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
            this.$store.dispatch('POST_AUTH_REQUEST', { email, password }).then(() => {
                self.loggingInProgress = false;
                self.loggingInSuccess = true;
                	document.cookie = "LoginImage=/uploads/ProfileImages/"+this.$store.state.currentUser.LoginImage+"; expires=Fri, 31 Dec 9999 23:59:59 GMT";
                      
                if(this.$store.state.currentUser.onboarding == 1){
                    this.$router.push('/app/account_settings')
                } else {
                    this.$router.push('/app/profile')
                }
            }).catch((err) => {
                self.loggingInProgress = false;
                self.error = true;
                self.message = err.response.data.message;
                //console.log(err.response.data.message);
            })
        },
    },
    	
  } 
</script>
<style>

@keyframes slider {
     0%,100%
    {
        background-image: url("/images/josh-rose-9YQGFzg0RiM-unsplash.jpg");
    }
    25%{
        background-image: url("/images/laura-vinck-Hyu76loQLdk-unsplash.jpg");
    }
    50%
    {
        background-image: url("/images/nitish-meena-RbbdzZBKRDY-unsplash.jpg");
    }
    75%
    {
        background-image: url("/images/preston-pownell-SwIQu6xODrI-unsplash.jpg");
    }
    
}

</style>

<style scoped>
    .fade-enter-active, .fade-leave-active {
      transition: opacity 0.25s ease-out;
    }

    .fade-enter, .fade-leave-to {
      opacity: 0;
    }



</style>