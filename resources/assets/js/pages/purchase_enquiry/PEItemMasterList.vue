<template>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Library of Materials</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="ItemsList" class="display responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Created Under Set-up</th>
                                <th>Requester Name</th>
                                <th>Description</th>
                                <th>Unit of Measure</th>
                                <th>Created At</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        <div id="ItemDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ItemDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div  class="modal-header" v-if="viewDataLoaded">
                        <h4 class="modal-title">Item Number: <i v-if="ViewModalInfo.company.lom_prefix == ''">LoM</i><i v-else>{{ ViewModalInfo.company.lom_prefix }}</i>-{{ ViewModalInfo.item_group_id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr v-if="ViewModalInfo.item_template.field_1 !== 'Ogeo-None'">
                                        <td style="width: 30%"><b>{{ ViewModalInfo.item_template.field_1 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_1 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_2 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_2 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_2 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_3 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_3 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_3 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_4 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_4 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_4 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_5 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_5 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_5 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_6 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_6 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_6 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_7 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_7 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_7 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_8 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_8 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_8 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_9 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_9 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_9 }}</td>
                                    </tr>
                                    <tr v-if="ViewModalInfo.item_template.field_10 !== 'Ogeo-None'">
                                        <td><b>{{ ViewModalInfo.item_template.field_10 }}: </b></td>
                                        <td>{{ ViewModalInfo.field_10 }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Complete Description: </b></td>
                                        <td>{{ ViewModalInfo.description }}</td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td><b>Created Under Set-up Name: </b></td>
                                        <td>{{ ViewModalInfo.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requester Name: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td><span v-if="ViewModalInfo.active == 'Yes'"><b>Active</b></span><span v-else><b>Inactive</b></span> <i>Since:  {{ ViewModalInfo.updated_at }}</i></td>
                                    </tr>
                                    
                                </table>
                            </div>

                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <img style="width: 100%" :src="'/uploads/ItemMasterPictures/'+ViewModalInfo.picture">
                            </div>
                            <div class="col-lg-3"></div>


                            <div class="col-lg-12">
                                <hr>
                                <h3>History:</h3>   
                                <table class="display table table-bordered">
                                    <thead>
                                        <tr>
                                            <th><b>#</b></th>
                                            <th><b>Action Description</b></th>
                                            <th><b>Action By</b></th>
                                            <th><b>Action Level</b></th>
                                            <th><b>Decision - Notes</b></th>
                                            <th><b>Action Date</b></th>
                                            <th><b>Time Span Between Action</b></th>
                                            <th style="background-color: rgb(83,99,127, 0.1);"><b>Next Action Description</b></th>
                                            <th style="background-color: rgb(83,99,127, 0.1);"><b>Next Action Action By</b></th>
                                            <th style="background-color: rgb(83,99,127, 0.1);"><b>Next Action Approval Level</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(item, key) in ViewModalInfo.item_creation_request.history" :key="item.id">
                                            <td>{{ key + 1 }}</td>
                                            <td>{{ item.current_action_description }}</td>
                                            <td>{{ item.current_action_by.name }}</td>
                                            <td>{{ item.current_approval_level }}</td>
                                            <td>{{ item.decision }} - {{ item.decision_notes }}</td>
                                            <td>{{ item.created_at }}</td>
                                            <td v-if="key == 0">Not Applicable</td>
                                            <td v-else>{{ item.created_at | getDifference(ViewModalInfo.history[key-1].created_at) }}</td>
                                            <td style="background-color: rgb(83,99,127, 0.1);">{{ item.next_action_description }}</td>
                                            <td style="background-color: rgb(83,99,127, 0.1);">{{ item.next_action_owners }}</td>
                                            <td style="background-color: rgb(83,99,127, 0.1);">{{ item.next_approval_level }}</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>   


                        </div>


                        
                    </div>
                    <div class="col-lg-12">
                        <hr>
                        <span><b>Date:</b> {{ new Date() }}</span><br>
                        <span><b>By:</b> {{ currentUser.name }}</span><br><br>
                    </div>
                </div>
            </div>
        </div>

    </div>
            
</template>

<script>

    import validate from 'validate.js';

    export default {
        name: 'items-master-list',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                ViewModalInfo: {},
            }
        },
        methods: {
            showViewModal(elquentClass, recordId){
                this.ViewModalInfo = {};
                axios.post('/api/data/get_item_master_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true
                        $('#ItemDetailsModal').modal('toggle');
                    })

                this.viewDataLoaded = false;
                
            },
            ActivateDeactivate(itemId, CurrentStatus){

                let self = this;
                    
                if(CurrentStatus == 'Yes'){
                    Swal({
                    title: 'Are You Sure You Want to Deactivate This Item?',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Deactivate It!'
                    }).then((result) => {
                        if (result.value) {
                            axios.post('/api/users/item_activations', {ItemId : itemId})
                            .then((response) => {
                                
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 5000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                        }
                    })
                } else {
                    Swal({
                    title: 'Are You Sure You Want to Activate This Item?',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Activate It!'
                    }).then((result) => {
                        if (result.value) {
                            axios.post('/api/users/item_activations', {ItemId : itemId})
                            .then((response) => {
                                
                                Swal({ 
                                    type: response.data.messageType, 
                                    title: response.data.messageTitle, 
                                    text: response.data.message,
                                    showConfirmButton: true,
                                    timer: 5000
                                });

                                self.DataTable.ajax.reload( null, false );

                            })
                        }
                    })
                }
                


                
                
            },
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted(){

            setTimeout(() => {
                
                const table = $('#ItemsList').DataTable({
                    stateSave:  true,
                    responsive: true,
                    colReorder: true,
                    processing: true,
                    serverSide: true,
                    ajax: 'http://' + window.location.host + '/api/data/get_item_master_list',
                    columns: [
                        { data: 'show_id', name: 'show_id' },
                        { data: 'project.title', name: 'project.title' },
                        { data: 'creator.name', name: 'creator.name' },
                        { data: 'complete_description_with_headers', name: 'complete_description_with_headers' },
                        { data: 'u_o_m', name: 'u_o_m' },
                        { data: 'created_at', name: 'created_at' },
                        { data: 'active', name: 'active' },
                        { data: 'action', name: 'action', orderable: false, searchable: false }
                    ],
                    columnDefs: [
                        { responsivePriority: 1, targets: 3 },
                        { responsivePriority: 2, targets: 1 },
                    ],
                    dom: '<"html5buttons">Brfgtip',
                    pageLength: 10,
                    lengthMenu: [
                        [ 10, 25, 50, 100, 500, 1000, -1 ],
                        [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                    ],
                    order: [[ 0, "ASC" ]],
                    buttons: [
                        { extend: 'pageLength', className: 'btn btn-success' },
                        { extend: 'copy', className: 'btn btn-success' },
                        { extend: 'excel', className: 'btn btn-success', title: 'ItemMasterList' },
                        { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
                        {
                            text: '<i class="fa fa-refresh"></i>',
                            className: 'btn btn-success',
                            action: function ( e, dt, node, config ) {
                                dt.ajax.reload();
                            }
                        },
                    ],
                    "language": {
                        processing: 'Loading Data... <i class="fa fa-spinner fa-spin fa-fw"></i>'
                    },    
                });

                const self = this

                $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                    var $this = $(this);
                    var elquentClass = $(this).data('elquentclass');
                    var RecordID = $(this).data('recordid');
                    self.showViewModal(elquentClass, RecordID);
                });

                $('tbody', this.$refs.table).on('click', '.activations-placeholder', function(){
                    var $this = $(this);
                    var RecordID = $(this).data('recordid');
                    var CurrentStatus = $(this).data('currentstatus');
                    self.ActivateDeactivate(RecordID, CurrentStatus);
                });

                self.DataTable = table;

            }, 500);
            
        },
    }

</script>

<style scoped>
    
    .font-500{
        font-weight: 500;
    }

    #ItemDetailsModal .modal-dialog {
        min-width:80%;
    }

</style>