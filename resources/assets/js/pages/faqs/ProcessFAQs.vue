<template>
    
	<div class="page-wrapper">
        <div class="container-fluid">
            <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Process FAQs</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">FAQs</a></li>
                        <li class="breadcrumb-item active">Process FAQs</li>
                    </ol>
                </div>
            </div>


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Process Frequently Asked Questions</h4>
                            <h6 class="card-subtitle">Process Frequently Asked Questions</h6>
                            <div id="accordion2" role="tablist" class="minimal-faq" aria-multiselectable="true">
                                <div v-for="(FAQ, index) in FAQs" class="card m-b-0">
                                    <div class="card-header" role="tab" id="headingOne11">
                                        <h5 class="mb-0">
                                            <a data-toggle="collapse" data-parent="#accordion2" :href="'#collapseOne1'+index" aria-expanded="true" aria-controls="collapseOne11">
                                              Q{{index+1}}. {{FAQ.question_title}}
                                            </a>
                                        </h5>
                                        <div :id="'collapseOne1'+index" :class="index == 0 ? 'show' : ''" class="collapse" role="tabpanel" aria-labelledby="headingOne11">
                                            <div class="card-body">
                                                <p v-html="FAQ.question_description"></p>
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
    </div>

</template>


<script>

	export default{
		name: 'process-faqs',
        data(){
            return{
                FAQs: {},
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted(){
            
            axios.post('/api/system_management/get_faqs', ['Process FAQs'])
                .then((response) => {
                    this.FAQs = response.data;
                })
                .catch(function(){
                    Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                });
        },
	}
</script>

<style>
	
</style>