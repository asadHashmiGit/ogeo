<template>
    <div class="page-wrapper">
        <h3>samad</h3>
    </div>
</template>
<script>
export default {
    data(){
        return {
            user: '',
            company: '',
        }
    },
    mounted(){
        this.getUserData()
        
    },
    methods:{
        getUserData(){
            axios.get('/api/users/get_user_oncomplete_details')
            .then(res => {
                console.log(res.data.user)
                console.log(res.user)

                this.user = res.data.user
                this.company = res.data.company
            })
        }
    },
    beforeRouteEnter (to, from, next) {
        let currentUser = JSON.parse(localStorage.getItem("user"));
            axios.get('/api/users/get_user_details')
                .then(response => {
                    next();
                })
    },
}
</script>