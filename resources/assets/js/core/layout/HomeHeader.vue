<template>
    
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 border-bottom shadow-sm" style="background-color: rgb(252, 51, 23, 1);">
        <h5 class="my-0 mr-md-auto font-weight-normal"></h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <template>
                <router-link class="p-2 text-light" :to="{ name: 'Home Page' }">Home Page</router-link>
            </template>
            <template>
                <router-link class="p-2 text-light" :to="{ name: 'Client Login' }">Client Login</router-link>
            </template>
            <template>
                <router-link class="p-2 text-light" :to="{ name: 'Vendor Login' }">Vendor Login</router-link>
            </template>
            
            <template v-if="currentUser">
                <a href="#" @click.prevent="logout()">Logout</a>
            </template>

            <template>
                <router-link class="p-2 text-light" :to="{ name: 'Registration' }">Registration</router-link>
            </template>

        </nav>
        <!-- <a class="btn btn-primary" href="#">
            SingUp
        </a> -->
    </div>

</template>


<script>
  export default {
    name: 'home-template',
    data(){
      return {
        ogeoLogo: 'assets/images/logo_transparent.png',
      }
    },
    computed:{
        currentUser(){
            return this.$store.getters.currentUser
        }
    },
    methods: {
        logout: function () {
            this.$store.dispatch('logout')
            .then(() => {
              this.$router.push('/client_login')
            })
        }
    },
    mounted() {
        console.log('Ogeo Home Template Loaded');
    }
  } 
</script>