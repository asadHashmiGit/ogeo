<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Broadcast Center</h4>
                </div>
                <div class="card-body">
                	<el-form :model="BroadCastDetails" class="demo-form-inline" :rules="FormRules" ref="MessageBroadCastingForm">
                        
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Select Broadcast Medium" prop="message_medium">
                                        <el-select style="width: 100%; padding: 0px;" v-model="BroadCastDetails.message_medium" placeholder="Select Broadcast Medium">
                                            <el-option label="In System Live Notification (Non-Presistance)" value="InSystemLiveMessage"></el-option> 
                                            <el-option disabled label="In System Live Notification (Presistance)" value="InSystemNotification"></el-option> 
                                            <el-option disabled label="Email" value="Email"></el-option> 
                                            <el-option disabled label="Text Message" value="TextMessage"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Select Broadcast Target Audience" prop="message_type">
                                        <el-select style="width: 100%; padding: 0px;" @change="getCompaniesList($event)" v-model="BroadCastDetails.message_type" placeholder="Select Broadcast Target Audience">
                                            <el-option label="Public Message To All System Users" value="PublicMessage"></el-option> 
                                            <el-option label="Private Message To All Company Users" value="PrivateCompanyMessage"></el-option> 
                                            <el-option label="Private Message To Particular User" value="PrivateUserMessage"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12" v-if="BroadCastDetails.message_type != 'PublicMessage' && companiesList != ''">
                                <div class="grid-content">
                                    <el-form-item label="Select A Company" prop="company_id">
                                        <el-select style="width: 100%; padding: 0px;" @change="getCompanyUsers($event)" v-model="BroadCastDetails.company_id" placeholder="Select A Company">
                                            <el-option v-for="(company, index) in companiesList" :label="company.name" :value="company.id" :key="index"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12" v-if="BroadCastDetails.message_type == 'PrivateUserMessage' && BroadCastDetails.company_id != '' && usersList != ''">
                                <div class="grid-content">
                                    <el-form-item label="Select A User" prop="user_id">
                                        <el-select filterable multiple style="width: 100%; padding: 0px;" v-model="BroadCastDetails.user_id" placeholder="Select A User">
                                            <el-option v-for="(user, index) in usersList" :label="user.name" :value="user.id" :key="index"></el-option> 
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Question Title" prop="message_title">
                                        <el-input v-model="BroadCastDetails.message_title" placeholder="Enter Message Header"></el-input>
                                    </el-form-item>
                                </div>
                            </div>
							
							<div class="col-lg-12">
                                <div class="grid-content">
		                            <el-form-item label="Enter Message Body" prop="message_body">
		                                
		                                <el-input
		                                    type="textarea"
		                                    :rows="5"
		                                    placeholder="Enter Descriptive Explanation."
		                                    v-model="BroadCastDetails.message_body">
		                                </el-input>
		                                
		                            </el-form-item>
		                        </div>
		                    </div>

		                    <div class="col-lg-12">
								<hr>
                                <button type="button" @click="BoardCastMessage" class="btn btn-success btn-block waves-effect text-center">Broadcast Message</button>
		                    </div>
		                </div>
		            </el-form>
                </div>
            </div>
        </div>

        <!-- <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Previous Broadcast History</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="RecentBroadCastedMessagesTable" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Visible</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div> -->


        

    </div>

</template>

<script>

	import validateJs from 'validate.js';

	export default {
		name: "frequently-asked-questions",
		data() {
			return {
				DataTable: "",
				BroadCastDetails:{
                    message_medium: "InSystemLiveMessage",
                    message_type: "PublicMessage",
                    company_id: "",
                    user_id: "",
                    message_title: "What is Lorem Ipsum?",
                    message_body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                },
                companiesList: "",
                usersList: "",
				FormRules: {
                    message_medium: [{
                        required: true,
                        message: "Broadcast Medium is required",
                        trigger: ["blur", "change"]
                    }],
                    message_type: [{
                        required: true,
                        message: "Broadcast Type is required",
                        trigger: ["blur", "change"]
                    }],
                    message_title: [{
                        required: true,
                        message: "Broadcast Title is required",
                        trigger: ["blur", "change"]
                    }],
                    message_body: [{
                        required: true,
                        message: "Broadcast Body is required",
                        trigger: ["blur", "change"]
                    }],
				}
			}
		},
        computed: {
            
        },
		methods: {

            send() {
                axios.post('/api/system_management/create_broadcast_message', {message: this.message})
                    .then((response) => {
                        this.message = '';
                    });
            },

			BoardCastMessage(){

                let self = this;

                this.$refs.MessageBroadCastingForm.validate((validation) => {

                    if(validation){

                        this.BroadCastDetails.message_body = this.BroadCastDetails.message_body.replace(/\r\n|\r|\n/g,'<br>');

                        axios.post('/api/system_management/create_broadcast_message', {BroadCastDetails: self.BroadCastDetails})
                            .then((response) => {

                                this.$bvToast.toast(response.data.message, {
                                  title: response.data.messageTitle,
                                  autoHideDelay: 5000,
                                  solid: true,
                                  variant: response.data.messageType
                                })

                                this.BroadCastDetails.message_medium = "InSystemLiveMessage";
                                this.BroadCastDetails.message_type = "PublicMessage";
                                this.BroadCastDetails.company_id = "";
                                this.BroadCastDetails.user_id = "";
                                // this.BroadCastDetails.message_title = "";
                                // this.BroadCastDetails.message_body = "";

                            })
                            .catch(function(){
                                Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem', 'error');
                            });
                        
                    }

                })
            },
            getCompaniesList(event) {

                let self = this;
                //self.BroadCastDetails.message_medium = "InSystemLiveMessage";

                if(event != 'PublicMessage'){
                    axios.get('/api/data/get_companies_list')
                        .then(response => {
                            // console.log(response.data);
                            self.companiesList = response.data;
                            
                        })
                }
            },
            getCompanyUsers(event) {

                let self = this;

                console.log(event);

                if(self.BroadCastDetails.message_type == 'PrivateUserMessage'){
                    axios.post('/api/data/get_company_users_list', { CompanyId: event })
                        .then(response => {
                            // console.log(response.data);
                            self.usersList = response.data;
                            
                        })
                }
            }

            
		},
		mounted(){

            
            // /* This is Private Channel */
            // Echo.channel('messages')
            //     .listen('.newMessage', (message) => {
            //         console.log(message);
            //         this.messages.push(message);
            //     });

            // /* This is Presence Channel */
            // Echo.channel('messages')
            //     .listen('.newMessage', (message) => {
            //         console.log(message);
            //         this.messages.push(message);
            //     });



			// const table = $('#RecentBroadCastedMessagesTable').DataTable({
   //              stateSave:  true,
   //              responsive: true,
   //              colReorder: true,
   //              processing: true,
   //              serverSide: true,
   //              ajax: 'http://' + window.location.host + '/api/system_management/get_faqs_list',
   //              columns: [
   //                  { data: 'id', name: 'id' },
   //                  { data: 'message_type', name: 'message_type' },
   //                  { data: 'message_title', name: 'message_title' },
   //                  { 
   //                  	data: 'message_body', 
   //                  	name: 'message_body', 
	  //             //       render: function(data, type, row){
			//             // 	return data.split("<br/>").join("<br>");
			//             // }
		 //        	},
   //                  { data: 'active', name: 'active' },
   //                  { data: 'action', name: 'action', orderable: false, searchable: false }
   //              ],
   //              dom: '<"html5buttons">Brfgtip',
   //              pageLength: 10,
   //              lengthMenu: [
   //                  [ 10, 25, 50, 100, 500, 1000, -1 ],
   //                  [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
   //              ],
   //              order: [[ 1, 'ASC' ]],
   //              buttons: [
   //                  { extend: 'pageLength', className: 'btn btn-success' },
   //                  { extend: 'copy', className: 'btn btn-success' },
   //                  { extend: 'excel', className: 'btn btn-success', title: 'FAQsList' },
   //                  { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
   //                  {
   //                      text: '<i class="fa fa-refresh"></i>',
   //                      className: 'btn btn-success',
   //                      action: function ( e, dt, node, config ) {
   //                          dt.ajax.reload();
   //                      }
   //                  },
   //              ],
   //              "language": {
   //                  processing: 'Loading Data... <i class="fa fa-spinner fa-spin fa-fw"></i>'
   //              } 
   //          });
			
		}
	}
</script>


<style>
	
	.el-select-dropdown__wrap {
        max-height: 1000px !important;
    }

    .font-500{
        font-weight: 500;
    }

    #FAQModalEdit .modal-dialog {
        min-width:80%;
    }

</style>