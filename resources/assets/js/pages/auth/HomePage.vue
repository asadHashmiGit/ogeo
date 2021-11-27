<template>
    <div class="row">
        <div class="col-lg-12" align="center" >
            <img style="position: relative; top: 50%;" width="20%" :src="ogeoLogo" alt="Ogeo Logo">
        </div>        
    </div>
</template>


<script>
  export default {
    name: 'home-page',
    data(){
      return {
        ogeoLogo: 'assets/images/logo_transparent.png',
      }
    },
    mounted() {
        console.log('Welcome To Ogeo Home Page'); 
    }
  } 
</script>