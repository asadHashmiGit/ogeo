<template>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Stock Item Issuance Requests</h4>
                </div>
                <div class="card-body">
                    <table ref="table" id="StockItemIssuanceRequestList" class="responsive table table-bordered table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Request #</th>
                                <th>Created By</th>
                                <th>From Store</th>
                                <th>Stock Item ID</th>
                                <th>Item Description</th>
                                <th>Requested Quantity</th>
                                <th>Delivery Location</th>
                                <th>Requested At</th>
                                <th>Current Approval Level</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>


        <div id="StockItemRequestModalView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="StockItemRequestModalView" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Stock Item Request Number: {{ ViewModalInfo.id }} (View)</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="viewDataLoaded">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td style="width: 40%"><b>Stock Item Issue Request#:</b></td>
                                        <td>{{ ViewModalInfo.stock_item_issuance_request_group_id }}-{{ ViewModalInfo.stock_item_issuance_request_ingroup_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created By: </b></td>
                                        <td>{{ ViewModalInfo.creator.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Created Date: </b></td>
                                        <td>{{ ViewModalInfo.created_at }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: </b></td>
                                        <td>{{ ViewModalInfo.status }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Current Approval Level: </b></td>
                                        <td>{{ ViewModalInfo.approval_level }}</td>
                                    </tr>
                                    
                                </table>
                            </div>

                            <div class="col-lg-6">
                                <table class="table">
                                    <tr>
                                        <td><b>From Store: </b></td>
                                        <td>{{ ViewModalInfo.project.title }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Stock Item ID: </b></td>
                                        <td>{{ ViewModalInfo.stock_item_id }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Item Description: </b></td>
                                        <td>{{ ViewModalInfo.stock_item.item.description }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Requested Quantity: </b></td>
                                        <td>{{ ViewModalInfo.quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Issued Quantity: </b></td>
                                        <td>{{ IssuedQuantity }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Pending Quantity: </b></td>
                                        <td>{{ ViewModalInfo.quantity - IssuedQuantity }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                                <h4>Previous Issuance Records</h4>
                                <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Issuance ID</th>
                                        <th>Action By</th>
                                        <th>Issued Quantity</th>
                                        <th>Issued Date</th>
                                        <th>Notes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.issuances" :key="item.id">
                                        <td>{{ item.stock_issuance_record_group_id }}</td>
                                        <td>{{ item.creator.name }}</td>
                                        <td>{{ item.issued_quantity }}</td>
                                        <td>{{ item.issue_date }}</td>
                                        <td>{{ item.notes }}</td>
                                    </tr>
                                    </template>
                                </tbody>
                            </table>

                            </div>
                        </div>
                        
                        <div class="col-lg-12">
                            <hr> 
                        </div>



                        <div class="col-lg-12">
                            <h3>Approvals History:</h3>   
                            <table class="display table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Action Description</th>
                                        <th>Action By</th>
                                        <th>Next Action By</th>
                                        <th>Current Approval Level</th>
                                        <th>Next Approval Level</th>
                                        <th>Approval Decision</th>
                                        <th>Approval Notes</th>
                                        <th>Action Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template>
                                    <tr v-for="(item, key) in ViewModalInfo.history" :key="item.id">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ item.description }}</td>
                                        <td>{{ item.current_action_by.name }}</td>
                                        <td>{{ item.next_action_owners }}</td>
                                        <td>{{ item.current_approval_level }}</td>
                                        <td>{{ item.next_approval_level }}</td>
                                        <td>{{ item.decision }}</td>
                                        <td>{{ item.decision_notes }}</td>
                                        <td>{{ item.created_at }}</td>
                                    </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                                         
                    </div>
                </div>
            </div>
        </div>

  
    </div>

</template>


<script>

    import validate from 'validate.js';

    export default {
        name: 'stock-item-issue-requests',
        data(){
            return{
                DataTable: "",
                viewDataLoaded: false,
                editDataLoaded: false,
                IssuedQuantity: 0,
                ViewModalInfo: {},
                hostName: window.location.protocol+'//'+window.location.hostname,
                stikyKit: {
                    options: {
                        offset_top: 140
                    },
                },
                toolTipImage: "/assets/images/tooltip/Euclid.png",
                toolTipProjectIcon: "/assets/images/project-icon.jpg",
            }
        },
        methods: {
            showViewModal(elquentClass, recordId){
                let self = this;
                this.ViewModalInfo = {};
                axios.post('/api/users/get_user_stock_item_issue_request_record_details', [elquentClass, recordId])
                    .then((response) => {
                        this.ViewModalInfo = response.data;

                        $.each(this.ViewModalInfo.issuances, function(index, issuance) {
                            self.IssuedQuantity = parseFloat(issuance.issued_quantity) + parseFloat(self.IssuedQuantity);
                        });

                        this.viewDataLoaded = true
                        $('#StockItemRequestModalView').modal('toggle');
                    })

                this.viewDataLoaded = false;  
            },
            
        },
        mounted(){

            const self = this

            const table = $('#StockItemIssuanceRequestList').DataTable({
                stateSave:  true,
                responsive: true,
                colReorder: true,
                processing: true,
                serverSide: true,
                ajax: 'http://' + window.location.host + '/api/users/get_users_stock_issuance_requests',
                columns: [
                    { data: 'show_id', name: 'show_id' },
                    { data: 'creator.name', name: 'creator.name' },
                    { data: 'project.title', name: 'project.title' },
                    { data: 'stock_item_id', name: 'stock_item_id' },
                    { data: 'stock_item.item.description', name: 'stock_item.item.description' },
                    { data: 'quantity', name: 'quantity' },
                    { data: 'location_name', name: 'location_name' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'approval_level', name: 'approval_level' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                columnDefs: [
                    { responsivePriority: 1, targets: 6 },
                    { responsivePriority: 2, targets: 0 },
                ],
                dom: '<"html5buttons">Brfgtip',
                pageLength: 10,
                lengthMenu: [
                    [ 10, 25, 50, 100, 500, 1000, -1 ],
                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
                ],
                order: [[ 0, 'ASC' ]],
                buttons: [
                    { extend: 'pageLength', className: 'btn btn-success' },
                    { extend: 'copy', className: 'btn btn-success' },
                    { extend: 'excel', className: 'btn btn-success', title: 'RateContractRequests' },
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
                "drawCallback": function ( settings ) {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;
                },
                "rowCallback": function( row, data, index ) {
                    //console.log(data.status);
                    if(data.status.indexOf('Requested Pending ') !== -1){
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Resubmitted and Assigned to') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('') !== -1) {
                        $(row).css('background-color', 'rgb(249, 177, 69, 0.1)')
                    } else if (data.status.indexOf('Approved') !== -1) {
                        $(row).css('background-color', 'rgb(69, 249, 132, 0.1)')
                    } else if (data.status.indexOf('Rejected by ') !== -1) {
                        $(row).css('background-color', 'rgb(249, 69, 72, 0.08)')
                    } else {
                        $(row).css('background-color', 'rgb(249, 69, 237, 0.1)')
                    }
                } 
            });

            

            $('tbody', this.$refs.table).on('click', '.view-placeholder', function(){
                var $this = $(this);
                var elquentClass = $(this).data('elquentclass');
                var RecordID = $(this).data('recordid');
                
                self.showViewModal(elquentClass, RecordID);
            });

            self.DataTable = table;

        },
    }
    
</script>

<style scoped>

    .font-500{
        font-weight: 500;
    }

    .itemTable >tr>td{
      height:20px;
      padding:0px;
      border-top: 0px;
    }

    .el-select-dropdown__item{
        height: 100% !important;
    }

    .el-select-dropdown__wrap{
        max-height: 800px !important
    }

    .el-select-dropdown .el-popper {
        max-width: 700px !important
    }

    #StockItemRequestModalView .modal-dialog {
        min-width:80%;
    }



</style>