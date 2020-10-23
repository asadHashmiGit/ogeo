<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Active Auction List</h4>
                </div>
                <div class="card-body">
                	<div class="row">
                		
                		<div align="center" class="col-lg-12" v-if="AuctionsLoading">
                            <h2>Gathering Data...</h2>
                            <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                        </div>

                        <div v-if="Auctions['Active'] && Auctions['Active'].length == 0" align="center" class="col-lg-12">
                            <h2 style="left:40%">No Auctions Available</h2>
                        </div>
						
                		<div v-if="Auctions['Active'].length > 0" v-for="auction in Auctions['Active']" class="col-lg-12">

                			<div class="card">
                				<div class="card-header">
				                    <h4 class="float-left">Auction ID: {{ auction.quotation_group_id }}</h4>
				                    <h4 :id="'AuctionTimer_'+auction.id" class="float-right text-danger text-danger"></h4>
				                </div>
				                <div class="card-body">

				                	

				                    <div class="row">
				                        <div class="col-lg-3 col-md-2">
				                        	<img :src="img1" class="img-fluid">
				                        	<button class="btn btn-primary btn-block waves-effect waves-light m-t-10" type="button"  @click="RefreshAuctions"><span class="btn-label float-left"><i class="fa fa-refresh"></i></span>Refresh Data</button>
				                        </div>
				                        <div class="col-lg-9 col-md-10">

			                            	<div class="slimscroller" style="overflow: hidden; width: auto; max-height: 250px;">
								                
							                	<div class="row">
							                		<div class="col-lg-12">
									                	<div class="table-responsive">
						                                    <table class="table m-b-0">
						                                        <tbody>
						                                        	<tr>
						                                                <td style="min-width: 120px">Client Name:</td>
						                                                <td>{{ auction.company.name }}</td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
								                	<div class="col-lg-6 b-r">
									                	<div class="table-responsive">
						                                    <table class="table">
						                                        <tbody>
						                                        	<tr>
						                                                <td style="min-width: 120px">Created By:</td>
						                                                <td>{{ auction.creator.name }}</td>
						                                            </tr>
						                                            <tr>
						                                            	<td>Request Type:</td>
						                                                <td>{{ auction.quotation_type }}</td>
						                                            </tr>
						                                            <tr>
						                                                <td>Start At:</td>
						                                                <td><span>{{ auction.start_date }}</span> </td>
						                                            </tr>
						                                            <tr>
						                                                <td>End At:</td>
						                                                <td><span>{{ auction.end_date }}</span> </td>
						                                            </tr>
						                                            
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
					                                <div class="col-lg-6">
									                	<div class="table-responsive">
						                                    <table class="table">
						                                        <tbody>
						                                        	<tr>
						                                                <td>Total PO Lines:</td>
						                                                <td><span>{{auction.purchase_enquiries.length}} Lines</span> </td>
						                                            </tr>
						                                            <tr>
						                                                <td>Total Submitted Lines:</td>
						                                                <td><span>{{auction.TotalSubmittedLines}} Lines</span> </td>
						                                            </tr>
						                                            
						                                            <tr>
						                                                <td>Total Bid Value:</td>
						                                                <td v-if='auction.vendor_responses.length'><span>{{ auction.TotalBidValue }} {{ auction.vendor_responses[0].currency }}</span> </td>
						                                                <td v-else><span>Prices Not Submitted</span> </td>
						                                                
						                                            </tr>
						                                            <tr>
						                                                <td>Bidding Status:</td>
						                                                <td><h4><span class="label label-primary"> {{ auction.trackers[0].status }} </span></h4> </td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
				                                </div>
				                                <div class="row">
				                                	<div class="col-lg-12">
					                                	<h4 class="font-medium m-t-30">Auction Terms & Conditions:</h4>
	                                        			<hr>
	                                        			<ol>
	                                        				<li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam rhoncus, felis interdum condimentum consectetur, nisl libero elementum eros, vehicula congue lacus eros non diam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></li>
	                                        				<li><p>Refresh Rate of the Auciton is every 30 seconds but you can refresh the data at any points.</p></li>
	                                        				<li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam rhoncus, felis interdum condimentum consectetur, nisl libero elementum eros, vehicula congue lacus eros non diam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></li>
	                                        			</ol>
					                                </div>

					                                <div align="center" class="col-lg-12">
														<button class="btn btn-success btn-block waves-effect waves-light m-t-10" type="button" @click="showViewModal(auction.id)">Start Bidding</button>
				                            		</div>

				                                </div>
					                            
				                            </div>
				                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 98.8924px;"></div>
				                            <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>


				                            
				                        </div>

				                        

				                    </div>
				                </div>
				            </div>
                		</div>

                		

                		

                		
                	</div>
                </div>
            </div>
            <hr>
        </div>


        <div class="col-lg-12">
        	<br>
            <div class="card">
                <div class="card-header">
                    <h4>Previous Auction Bids History</h4>
                </div>
                <div class="card-body">
                	<div class="row">

						<div align="center" class="col-lg-12" v-if="AuctionsLoading">
                            <h2>Gathering Data...</h2>
                            <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                        </div>

                		<div v-if="Auctions['inActive'] && Auctions['inActive'].length == 0" align="center" class="col-lg-12">
                            <h2 style="left:40%">No Auctions Available</h2>
                        </div>

                		<div v-if="Auctions['inActive'].length > 0" v-for="auction in Auctions['inActive']" class="col-lg-12">
                			<div class="card">
                				<div class="card-header">
				                    <h4 class="float-left">Auction ID: {{ auction.quotation_group_id }}</h4>
				                    <h4 class="float-right text-danger text-danger">Auction Ended</h4>
				                </div>
				                <div class="card-body">

				                	

				                    <div class="row">
				                        <div class="col-lg-3 col-md-2">
				                        	<img :src="img1" class="img-fluid">
				                        </div>
				                        <div class="col-lg-9 col-md-10">

			                            	<div class="slimscroller" style="overflow: hidden; width: auto; max-height: 250px;">
								                
							                	<div class="row">
							                		<div class="col-lg-12">
									                	<div class="table-responsive">
						                                    <table class="table m-b-0">
						                                        <tbody>
						                                        	<tr>
						                                                <td style="min-width: 120px">Client Name:</td>
						                                                <td>{{ auction.company.name }}</td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
								                	<div class="col-lg-6 b-r">
									                	<div class="table-responsive">
						                                    <table class="table">
						                                        <tbody>
						                                        	<tr>
						                                                <td style="min-width: 120px">Created By:</td>
						                                                <td>{{ auction.creator.name }}</td>
						                                            </tr>
						                                            <tr>
						                                            	<td>Request Type:</td>
						                                                <td>{{ auction.quotation_type }}</td>
						                                            </tr>
						                                            <tr>
						                                                <td>Start At:</td>
						                                                <td><span>{{ auction.start_date }}</span> </td>
						                                            </tr>
						                                            <tr>
						                                                <td>End At:</td>
						                                                <td><span>{{ auction.end_date }}</span> </td>
						                                            </tr>
						                                            
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
					                                <div class="col-lg-6">
									                	<div class="table-responsive">
						                                    <table class="table">
						                                        <tbody>
						                                            <tr>
						                                                <td>Total PO Lines:</td>
						                                                <td><span>{{auction.purchase_enquiries.length}} Lines</span> </td>
						                                            </tr>
						                                            <tr>
						                                                <td>Total Submitted Lines:</td>
						                                                <td><span>{{auction.TotalSubmittedLines}} Lines</span> </td>
						                                            </tr>
						                                            
						                                            <tr>
						                                                <td>Total Bid Value:</td>
						                                                <td v-if='auction.vendor_responses.length'><span>{{ auction.TotalBidValue }} {{ auction.vendor_responses[0].currency }}</span> </td>
						                                                <td v-else><span>Prices Not Submitted</span> </td>
						                                                
						                                            </tr>
						                                            <tr>
						                                                <td>Bidding Status:</td>
						                                                <td><h4><span class="label label-primary"> {{ auction.trackers[0].status }} </span></h4> </td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
						                                </div>
					                                </div>
				                                </div>
				                                <div class="row">
				                                
					                                <div align="center" class="col-lg-12">
					                                	<hr>
														<button class="btn btn-success btn-block waves-effect waves-light m-t-10" @click="ViewEndedAuction(auction.id)" type="button">View Bidding</button>
				                            		</div>

				                                </div>
					                            
				                            </div>
				                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 98.8924px;"></div>
				                            <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>


				                            
				                        </div>

				                        

				                    </div>
				                </div>
				            </div>
                		</div>
                	</div>
                </div>
            </div>
        </div>


		<!-- Modals Area -->
        <div id="QuotationDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="QuotationDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Quotation Number: {{ ViewModalInfo[0].id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                        	
                            <div class="col-lg-12">
                            	<span style="font-size: 18px;" class="b-m-10 text-primary">This page has an auto refresh schduled ever 30 seconds to update your on your ranking status. However you can refresh manually at any point using the <button type="button" class="btn waves-effect btn-xs btn-info" @click="updateQuotationLinesTable(AuctionId)">Refresh</button> button.</span>
                                <p>Note: <u>NOT</u> all prices are required to be filled. <u>Zero</u> (0) Prices are considered free of cost while <u>Empty</u> prices are considered as not submitted items. You are allowed to leave a comment or note against each line for submission clarificaiton. </p>
                                <div class="table-wrapper">
                                	<div v-if="refreshLoading" class="col-lg-12 QuotationLinesRefreshing">
		                        		<h1 style="position: absolute; top: 50%; left: 40%">Refreshing Ranking Data</h1>
		                        	</div>
	                                <table ref="PETable" id="QuotationRequestsLines" class="table table-bordered" style="width:100%">
				                        <thead>
				                            <tr>
                                                <th>#</th>
				                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Item #</th>
				                                <th>Item Description</th>
                                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Advanced Payment</th>
                                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Required Documents</th>
				                                <th>Quantity</th>
                                                <th style="min-width: 100px">Unit Rate</th>
                                                <th>Currency</th>
                                                <th>Price</th>
                                                <th style="min-width: 100px">Lead Days</th>
				                                <th style="min-width: 100px">Required Advnaced</th>
                                                <th>Upload Files</th>
                                                <th>Info Request</th>
                                                <th style="min-width: 150px">Notes</th>
                                                <th style="min-width: 100px">Ranking</th>
				                            </tr>
				                        </thead>
				                        <tbody>
                                            <template v-if="ViewModalInfo[0].purchase_enquiries[0].responses.length > 0">
                                                <tr v-bind:class="ViewModalInfo[1][PEline.id] == 'Lowest Bidder' ? 'lowestBidder' : 'notLowestBidder'" v-for="(PEline, index) in ViewModalInfo[0].purchase_enquiries">
                                                	<td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                    
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                    <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>

                                                    <template v-if="PEline.item_id">
                                                        <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                    </template>

                                                    <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                    <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                    <td style="min-width: 100px">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_unit_price'"
                                                           type="number"
                                                           style="min-width: 100%;"
                                                           v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                           :value="PEline.responses[0].unit_rate"
                                                           placeholder="Enter Price">
                                                        </el-input>
                                                    </td>
                                                    <td>
                                                        <select 
                                                            :id="'PEline_'+PEline.id+'_currency'"
                                                            placeholder="Select Currency"
                                                            class="form-control"
                                                            style="max-height: 7px">
                                                            <option :value="PEline.responses[0].currency" selected="selected">{{PEline.responses[0].currency}}</option>
                                                            <option v-for="currency in PEline.project.currency.split(',')" :value="currency">{{ currency }}</option>
                                                        </select>
                                                    </td>
                                                    <td class="PELinePriceField">0.00</td>
                                                    <td>
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_lead_days'"
                                                             type="number"
                                                             step="1"
                                                             :value="PEline.responses[0].lead_days"
                                                             placeholder="Enter Days">        
                                                        </el-input>
                                                    </td>

                                                    <td v-if="PEline.advanced_payment == 'Yes'">
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                             type="number"
                                                             step="1"
                                                             max="100"
                                                             :value="PEline.responses[0].advanced_percentage"
                                                             @blur="CheckAdvPercentage(PEline.id)"
                                                             placeholder="Enter %">        
                                                        </el-input>
                                                    </td>
                                                    <td v-else>N/A <input type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                    
                                                    
                                                    <td align="center" v-if="PEline.required_documents != ''">
                                                        <button class="btn btn-block btn-info required-docs-placeholder" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                        <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                            <span>{{ PEline.uploaded_docs.length }}</span>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                        </div>
                                                        <div v-else>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                        </div>
                                                    </td>
                                                    <td align="center" v-else>
                                                        <span>No Uploads Required</span>
                                                        <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                    </td>
                                                    

                                                    <td align="center">
                                                        <button class="btn btn-block btn-primary rfi-placeholder" :id="'infoRequest-'+PEline.id"><i class="fa fa-comments"></i> </button>
                                                        <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                    </td>
                                                    <td width="15%">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_note'"
                                                           type="textarea"
                                                           rows="2"
                                                           :value="PEline.responses[0].notes"
                                                           placeholder="Additional Notes">
                                                        </el-input>
                                                    </td>
                                                    
                                                    <td>{{ ViewModalInfo[1][PEline.id] }} </td>
                                                </tr>
                                            </template>
                                            <template v-else>
                                                <tr v-for="(PEline, index) in ViewModalInfo[0].purchase_enquiries">
                                                    <td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                    
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                    <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>

                                                    <template v-if="PEline.item_id">
                                                        <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                    </template>

                                                    <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                    <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                    <td style="min-width: 100px">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_unit_price'"
                                                           type="number"
                                                           style="min-width: 100%;"
                                                           v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                           placeholder="Enter Price">
                                                        </el-input>
                                                    </td>
                                                    <td>
                                                        <select 
                                                            :id="'PEline_'+PEline.id+'_currency'"
                                                            placeholder="Select Currency"
                                                            class="form-control"
                                                            style="max-height: 7px">
                                                                    
                                                            <option v-for="currency in PEline.project.currency.split(',')" :value="currency">{{ currency }}</option>
                                                        </select>
                                                    </td>
                                                    <td class="PELinePriceField">0.00</td>
                                                    <td>
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_lead_days'"
                                                             type="number"
                                                             step="1"
                                                             placeholder="Enter Days">        
                                                        </el-input>
                                                    </td>

                                                    <td v-if="PEline.advanced_payment == 'Yes'">
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                             type="number"
                                                             step="1"
                                                             max="100"
                                                             value="0.00"
                                                             @blur="CheckAdvPercentage(PEline.id)"
                                                             placeholder="Enter %">        
                                                        </el-input>
                                                    </td>
                                                    <td v-else>N/A <input type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                    
                                                    
                                                    <td align="center" v-if="PEline.required_documents != ''">
                                                        <button class="btn btn-block btn-info required-docs-placeholder" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                        <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                            <span>{{ PEline.uploaded_docs.length }}</span>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                        </div>
                                                        <div v-else>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                        </div>
                                                    </td>
                                                    <td align="center" v-else>
                                                        <span>No Uploads Required</span>
                                                        <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                    </td>
                                                    

                                                    <td align="center">
                                                        <button class="btn btn-block btn-primary rfi-placeholder" :id="'infoRequest-'+PEline.id"><i class="fa fa-comments"></i> </button>
                                                        <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                    </td>
                                                    <td width="15%">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_note'"
                                                           type="textarea"
                                                           rows="2"
                                                           placeholder="Additional Notes">
                                                        </el-input>
                                                    </td>
                                                    <td> Price Not Submitted </td>
                                                </tr>
                                            </template>
				                        	
				                        </tbody>
				                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-12">
                        	<br>
                                    
                            <el-date-picker
                                v-model="QuotationValidityDate"
                                type="datetime"
                                style="width: 100%"
                                placeholder="Pick a day"
                                :default-time="'23:59:59'"
                                value-format="yyyy-MM-dd HH:mm:ss"
                                :picker-options="pickerOptions1">
                            </el-date-picker>
                            
                            <hr>
                            <button type="button" @click="SubmitPrices" class="btn btn-block btn-success">Submit Prices</button>

                        </div>
             
                    </div>
                </div>
            </div>
        </div>




        <!-- View Previous Auction Data -->
        <div id="EndedAuctionDetailsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="EndedAuctionDetailsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" v-if="viewDataLoaded">
                    <div  class="modal-header">
                        <h4 class="modal-title">Quotation Number: {{ ViewModalInfo[0].id }}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                        	
                            <div class="col-lg-12">
                                <div class="table-wrapper">
	                                <table ref="EnedAuctionViewLines" id="EnedAuctionViewLines" class="table table-bordered" style="width:100%">
				                        <thead>
				                            <tr>
                                                <th>#</th>
				                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Item #</th>
				                                <th>Item Description</th>
                                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Advanced Payment</th>
                                                <th v-if="ViewModalInfo[0].purchase_enquiries[0].item_id">Required Documents</th>
				                                <th>Quantity</th>
                                                <th style="min-width: 100px">Unit Rate</th>
                                                <th>Currency</th>
                                                <th>Price</th>
                                                <th style="min-width: 100px">Lead Days</th>
				                                <th style="min-width: 100px">Required Advnaced</th>
                                                <th>Upload Files</th>
                                                <th>Info Request</th>
                                                <th style="min-width: 150px">Notes</th>
                                                <th style="min-width: 100px">Ranking</th>
				                            </tr>
				                        </thead>
				                        <tbody>
                                            <template v-if="ViewModalInfo[0].purchase_enquiries[0].responses.length > 0">
                                                <tr v-bind:class="ViewModalInfo[1][PEline.id] == 'Lowest Bidder' ? 'lowestBidder' : 'notLowestBidder'" v-for="(PEline, index) in ViewModalInfo[0].purchase_enquiries">
                                                	<td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                    
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                    <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>

                                                    <template v-if="PEline.item_id">
                                                        <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                    </template>

                                                    <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                    <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                    <td style="min-width: 100px">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_unit_price'"
                                                           type="number"
                                                           style="min-width: 100%;"
                                                           v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                           disabled
                                                           readonly
                                                           :value="PEline.responses[0].unit_rate"
                                                           placeholder="Enter Price">
                                                        </el-input>
                                                    </td>
                                                    <td>
                                                        <select 
                                                        	disabled
                                                            readonly
                                                            :id="'PEline_'+PEline.id+'_currency'"
                                                            placeholder="Select Currency"
                                                            class="form-control"
                                                            style="max-height: 7px">
                                                            <option :value="PEline.responses[0].currency" selected="selected">{{PEline.responses[0].currency}}</option>
                                                            <option v-for="currency in PEline.project.currency.split(',')" :value="currency">{{ currency }}</option>
                                                        </select>
                                                    </td>
                                                    <td class="PELinePriceField">0.00</td>
                                                    <td>
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_lead_days'"
                                                             type="number"
                                                             step="1"
                                                             disabled
                                                             readonly
                                                             :value="PEline.responses[0].lead_days"
                                                             placeholder="Enter Days">        
                                                        </el-input>
                                                    </td>

                                                    <td v-if="PEline.advanced_payment == 'Yes'">
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                             type="number"
                                                             step="1"
                                                             max="100"
                                                             disabled
                                                             readonly
                                                             :value="PEline.responses[0].advanced_percentage"
                                                             @blur="CheckAdvPercentage(PEline.id)"
                                                             placeholder="Enter %">        
                                                        </el-input>
                                                    </td>
                                                    <td v-else>N/A <input type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                    
                                                    
                                                    <td align="center" v-if="PEline.required_documents != ''">
                                                        <button class="btn btn-block btn-info required-docs-placeholder" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                        <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                            <span>{{ PEline.uploaded_docs.length }}</span>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                        </div>
                                                        <div v-else>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                        </div>
                                                    </td>
                                                    <td align="center" v-else>
                                                        <span>No Uploads Required</span>
                                                        <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                    </td>
                                                    

                                                    <td align="center">
                                                        <button class="btn btn-block btn-primary rfi-placeholder" :id="'infoRequest-'+PEline.id"><i class="fa fa-comments"></i> </button>
                                                        <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                    </td>
                                                    <td width="15%">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_note'"
                                                           type="textarea"
                                                           rows="2"
                                                           disabled
                                                           readonly
                                                           :value="PEline.responses[0].notes"
                                                           placeholder="Additional Notes">
                                                        </el-input>
                                                    </td>
                                                    
                                                    <td>{{ ViewModalInfo[1][PEline.id] }} </td>
                                                </tr>
                                            </template>
                                            <template v-else>
                                                <tr v-for="(PEline, index) in ViewModalInfo[0].purchase_enquiries">
                                                    <td>{{ PEline.id }}</td>
                                                    <td v-if="PEline.item_id">{{ PEline.item_id }}</td>
                                                    
                                                    <td v-if="PEline.item_id">{{ PEline.item.description }}</td>
                                                    <td v-else style="min-width: 500px">{{ PEline.service_description }}</td>

                                                    <td v-if="PEline.item_id">{{ PEline.advanced_payment }}</td>

                                                    <template v-if="PEline.item_id">
                                                        <td v-if="PEline.required_documents != ''">{{ PEline.required_documents }}</td><td v-else>No Files Required</td>
                                                    </template>

                                                    <td v-if="PEline.item_id" :id="'PEline_'+PEline.id+'_quantity'">{{ PEline.quantity }}</td>
                                                    <td :id="'PEline_'+PEline.id+'_quantity'" v-else>1</td>

                                                    <td style="min-width: 100px">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_unit_price'"
                                                           type="number"
                                                           disabled
                                                           readonly
                                                           style="min-width: 100%;"
                                                           v-on:input="UpdatePELinePrice(PEline.id, index, PEline.item_id)"
                                                           placeholder="Enter Price">
                                                        </el-input>
                                                    </td>
                                                    <td>
                                                        <select 
                                                            :id="'PEline_'+PEline.id+'_currency'"
                                                            placeholder="Select Currency"
                                                            class="form-control"
                                                            disabled
                                                            readonly
                                                            style="max-height: 7px">
                                                                    
                                                            <option v-for="currency in PEline.project.currency.split(',')" :value="currency">{{ currency }}</option>
                                                        </select>
                                                    </td>
                                                    <td class="PELinePriceField">0.00</td>
                                                    <td>
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_lead_days'"
                                                             type="number"
                                                             step="1"
                                                             disabled
                                                             readonly
                                                             placeholder="Enter Days">        
                                                        </el-input>
                                                    </td>

                                                    <td v-if="PEline.advanced_payment == 'Yes'">
                                                        <el-input
                                                            :id="'PEline_'+PEline.id+'_advanced_percentage'"
                                                             type="number"
                                                             step="1"
                                                             max="100"
                                                             value="0.00"
                                                             disabled
                                                             readonly
                                                             @blur="CheckAdvPercentage(PEline.id)"
                                                             placeholder="Enter %">        
                                                        </el-input>
                                                    </td>
                                                    <td v-else>N/A <input type="number" value="0" :id="'PEline_'+PEline.id+'_advanced_percentage'" hidden="hidden"></td>
                                                    
                                                    
                                                    <td align="center" v-if="PEline.required_documents != ''">
                                                        <button class="btn btn-block btn-info required-docs-placeholder" :id="'fileUploadt-'+PEline.id"><i class="fa fa-upload"></i> </button>
                                                        <div v-if="PEline.uploaded_docs.length > 0" class="numberCircle pull-right">
                                                            <span>{{ PEline.uploaded_docs.length }}</span>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired" hidden="hidden">
                                                        </div>
                                                        <div v-else>
                                                            <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'"  value="DocsUploadRequired" hidden="hidden">
                                                        </div>
                                                    </td>
                                                    <td align="center" v-else>
                                                        <span>No Uploads Required</span>
                                                        <input type="text" :id="'PEline_'+PEline.id+'_filesUpload'" value="NoUploadsRequired"  hidden="hidden">
                                                    </td>
                                                    

                                                    <td align="center">
                                                        <button class="btn btn-block btn-primary rfi-placeholder" :id="'infoRequest-'+PEline.id"><i class="fa fa-comments"></i> </button>
                                                        <div v-if="PEline.rfis.length > 0" class="numberCircle pull-right"><span>{{ PEline.rfis.length }}</span></div>
                                                    </td>
                                                    <td width="15%">
                                                        <el-input
                                                           :id="'PEline_'+PEline.id+'_note'"
                                                           type="textarea"
                                                           rows="2"
                                                           disabled
                                                           readonly
                                                           placeholder="Additional Notes">
                                                        </el-input>
                                                    </td>
                                                    <td> Price Not Submitted </td>
                                                </tr>
                                            </template>
				                        	
				                        </tbody>
				                    </table>
                                </div>
                            </div>

                            <div class="col-lg-12">
	                        	<br>
	                            
	                            <h4>Quoation Validation Date: {{ QuotationValidityDate }}</h4>
	                            

	                        </div>

                        </div>
                        
                    </div>
                </div>
            </div>
        </div>


        <div id="RequiredDocsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RequiredDocsModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Required Documents Upload</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="RequiredDocsDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <p>Upload The Following Files:</p>
                                <table class="table table-bordered">
                                    <tr v-if="RequiredDocsDetails" v-for="(Document, index) in RequiredDocsDetails">
                                        <td valign="middle" align="center">{{ index+1 }}</td>
                                        <td valign="middle" align="center"><span style="font-size: 15px">{{ Document }}</span></td>
                                        <td v-if="QuotationSubmitStatus != 'Quotation Submitted' && PEVendorUploadedFiles && !ViewingEndedAuction">
                                            <el-upload
                                                class="upload-demo"
                                                action="#"
                                                multiple
                                                :id="'RequiredFiles_'+Document"
                                                :ref="'RequiredFiles_'+Document"
                                                :auto-upload="false">
                                                <el-button slot="trigger" size="small" type="primary">Select file(s)</el-button>
                                                <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload(Document)">Upload</el-button>
                                                <div class="el-upload__tip" slot="tip">Any File Type Allow Max Size 3MB</div>
                                            </el-upload>
                                        </td>

                                        <td valign="middle" align="center" v-if="PEVendorUploadedFiles">
                                            <div v-for="uploadedFile in PEVendorUploadedFiles">
                                                <a v-if="uploadedFile.required_doc_name == Document" :href="URL+uploadedFile.document_name" class="btn btn-block btn-success" download> <i class="fa fa-download"></i> File {{ index+1 }} Download </a><br>
                                            </div>
                                        </td>
                                        <td valign="middle" align="center" v-else>
                                            <span>No Files Uploaded Yet</span>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="RFIModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="RFIModal" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div  class="modal-header">
                        <h4 class="modal-title">Request For Information</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body" v-if="RFIDataLoaded">
                        <div class="row">
                            <div class="col-lg-12">
                                <p>Note: this communication will be available for Quotation Manager and the original requester for their comment and reply.  </p>
                                <table ref="RFITable" id="RFIMessagesTable" class="display responsive table table-bordered table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>By</th>
                                            <th>User Name</th>
                                            <th>Message</th>
                                            <th>Created At</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="message in RFIDetails">
                                            <th>{{ message.id }}</th>
                                            <th>{{ message.user_type }}</th>
                                            <template v-if="message.user_type == 'Vendor'">
                                                <th>{{ message.vendor_user.name }}</th>
                                            </template>
                                            <template v-else>
                                                <th>{{ message.user.name }}</th>
                                            </template>
                                            <th>{{ message.message }}</th>
                                            <th>{{ message.created_at }}</th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <template v-if="QuotationSubmitStatus != 'Quotation Submitted' && !ViewingEndedAuction">
                            <div class="row">
                                <div class="col-lg-12">
                                    <hr>
                                    <h4>Submit New RFI</h4>
                                    <el-input
                                        type="textarea"
                                        rows="6"
                                        placeholder="Enter Your Request For Information..."
                                        v-model="RFIData.RFImessage">
                                    </el-input>
                                </div>
                                <div class="col-lg-12">
                                    <br>
                                </div>
                                <div class="col-lg-12">
                                    <button type="button" class="btn btn-block btn-success" @click="SubmitRFI">Submit RFI</button>
                                </div>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
        </div>

    </div>

</template>

<script>

	import validateJs from 'validate.js';

	export default {
		name: "auctioned-quotations",
		data() {
			return {
				Auctions: {},
				AuctionId: "",
				countInterval: [],
				AuctionsLoading: true,
				refreshLoading: false,
				hostName: window.location.protocol+'//'+window.location.hostname,
				img1: "/assets/images/big/img1.jpg",
				URL: '/uploads/PEVendorUploadsRequiredDocs/',
				DataTable: "",
				PEDataTable: "",
                QuotationLinesTable: "",
                viewDataLoaded: false,
                viewEndedAuctionDataLoaded: false,
                ViewingEndedAuction: false,
                RequiredDocsDataLoaded: false,
                RFIDataLoaded: false,
                ViewModalInfo: {},
                QuotationResponse: [],
                RFIDetails: [],
                QuotationSubmitStatus: "",
                RequiredDocsDetails: [],
                RequiredFilesId: "",
                RequiredRFIId: "",
                PEVendorUploadedId: "",
                myAuctionIntervals: [],
                RFIData: {
                    RFImessage: "",
                    CompanyId: "",
                    QuotationId: "",
                    PEId: "",
                },
                pickerOptions1: {
                  disabledDate(time) {
                    return time.getTime() < Date.now();
                  },
                  shortcuts: [{
                    text: 'Tomorrow',
                    onClick(picker) {
                      picker.$emit('pick', new Date());
                    }
                  }, {
                    text: '7 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '30 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 30);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '45 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 45);
                      picker.$emit('pick', date);
                    }
                  }, {
                    text: '60 Days',
                    onClick(picker) {
                      const date = new Date();
                      date.setTime(date.getTime() + 3600 * 1000 * 24 * 60);
                      picker.$emit('pick', date);
                    }
                  }]
                },
                QuotationResponseRules: {
                    PECompany: { 
                        presence: true,
                    },
                    QuotationID: { 
                        presence: true,
                    },
                    PELineID: { 
                        presence: true,
                    },
                    PELineUnitPrice: { 
                        presence: true,
                        // presence: {  
                        //     allowEmpty: false 
                        // },
                    },
                    PELineCurrency: { 
                        presence: true,
                        length: {
                            minimum: 3,
                            message: "Select Currency From the List Only!"
                        }
                    },
                    PELineLeadDays: { 
                        presence: true,
                    },
                    PELineNote: { 
                        presence: true, 
                    },
                    QuotationValidityDate: {
                        presence: {  
                            allowEmpty: false 
                        },
                    }
                },
                QuotationResponseErrors: null,
                PEVendorUploadedFiles: null,
                QuotationValidityDate: "",
			}
		},
		methods: {
			ViewEndedAuction(recordId){
				this.ViewingEndedAuction = true;
				this.AuctionId = recordId;
                this.ViewModalInfo = {};
                this.QuotationValidityDate = "";
                this.QuotationSubmitStatus = "";
                axios.post('/api/vendors/data/get_quotation_details_record_details_auction', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true;
                        console.log(this.ViewModalInfo);

                        this.QuotationSubmitStatus = this.ViewModalInfo[0].trackers[0].status;

                        if(this.ViewModalInfo[0].purchase_enquiries[0].responses.length){
                        	this.QuotationValidityDate = this.ViewModalInfo[0].purchase_enquiries[0].responses[0].validity_date;
                        }
                        console.log(this.QuotationSubmitStatus);
                        $('#EndedAuctionDetailsModal').modal('toggle');

                        this.$nextTick(() => {
	                        var table = $('#EnedAuctionViewLines').DataTable({
				                destroy: true,
				                colReorder: true,
				                dom: '<"html5buttons">Brfgtip',
				                pageLength: 10,
                                columnDefs: [
                                    { "width": "100px", "targets": "_all" }
                                ],
				                lengthMenu: [
				                    [ 10, 25, 50, 100, 500, 1000, -1 ],
				                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
				                ],
				                order: [[ 1, "ASC" ]],
				                buttons: [
				                    { extend: 'pageLength', className: 'btn btn-success' },
				                    { extend: 'copy', className: 'btn btn-success' },
				                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
				                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
				                ],
				            }); 

                            const self = this;

                            $('tbody', this.$refs.EnedAuctionViewLines).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRequiredDocsModal(RecordID);
                            });


                            $('tbody', this.$refs.EnedAuctionViewLines).on('click', '.rfi-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRFIModal(RecordID);
                            });

                            self.QuotationLinesTable = table;

	                    });

                    })


                this.viewDataLoaded = false;

			},
			CheckAdvPercentage(PEline){
                let PercentageAmount = $('#PEline_'+PEline+'_advanced_percentage').val();
                if(PercentageAmount > 100 || PercentageAmount < 0 ){
                    $('#PEline_'+PEline+'_advanced_percentage').val('');
                    Swal('Percentage Entry Error', 'Percentage Can not exceed 100 or be negative value', 'warning');
                }
            },
            UpdatePELinePrice(PEId, rowIndex, ItemId){

                //check if the update amount is a service or materials
                if(ItemId == null){
                    var table = this.QuotationLinesTable;
                    var unitRate = $('#PEline_'+PEId+'_unit_price').val();
                    var quantity = table.cell({row: rowIndex, column: 2}).data();
                    var NewPrice = quantity * unitRate;
                    table.cell({row: rowIndex, column: 5}).data(NewPrice);
                } else {
                    var table = this.QuotationLinesTable;
                    var unitRate = $('#PEline_'+PEId+'_unit_price').val();
                    var quantity = table.cell({row: rowIndex, column: 5}).data();
                    var NewPrice = quantity * unitRate;
                    table.cell({row: rowIndex, column: 8}).data(NewPrice);
                }
                
            },
            SubmitPrices(){

                let Check1 = true;
                let Check2 = true;
                let Check3 = true;
                let Check4 = true;
                let Check5 = true;
                let OKToContinue = false;
                let EmptyEntries = false;
                let LeadDayMissing = false;
                let LeadDayMissingID = "";
                let AdvancedPaymentMissing = false;
                let AdvancedPaymentMissingID = "";
                let AllPricesNotAvailable = false;

                //Reset Previous Responses
                this.QuotationResponse = [];

                const self = this;

                $.each(this.ViewModalInfo[0].purchase_enquiries, function(index, val) {

                    self.QuotationResponse.push({
                        PECompany: parseInt(val.company_id),
                        QuotationID: parseInt(val.pivot.quotation_id),
                        PELineID: parseInt(val.id),
                        PELineUnitPrice: $('#PEline_'+val.id+'_unit_price').val(),
                        PELinePrice: (parseFloat($('#PEline_'+val.id+'_quantity').text()) * parseFloat($('#PEline_'+val.id+'_unit_price').val())),
                        PELineCurrency: $('#PEline_'+val.id+'_currency').val(),
                        PELineLeadDays: parseInt($('#PEline_'+val.id+'_lead_days').val()),
                        AdvancedPayment: $('#PEline_'+val.id+'_advanced_percentage').val(),
                        PELineNote: $('#PEline_'+val.id+'_note').val(),
                        PEUploadedFiles: $('#PEline_'+val.id+'_filesUpload').val(),
                        PEUploadedFiles: $('#PEline_'+val.id+'_filesUpload').val(),
                        QuotationValidityDate: self.QuotationValidityDate,
                    });
                   
                });

                console.log(self.QuotationResponse);

                //Check Completeness of the Prices and PE notes
                $.each(self.QuotationResponse, function(index, val) {
                    if(val.PELineUnitPrice == "" && val.PELineNote == ""){
                        EmptyEntries = true;
                    }

                    //check leaddays for price entered
                    if((val.PELineUnitPrice != "" && val.PELineLeadDays == "") || (val.PELineUnitPrice != "" && isNaN(val.PELineLeadDays))){
                        LeadDayMissing = true;
                        LeadDayMissingID = val.PELineID;
                    }

                    //check AdvancedPayment for price entered
                    if(val.PELineUnitPrice != "" && val.AdvancedPayment == ""){
                        AdvancedPaymentMissing = true;
                        AdvancedPaymentMissingID = val.PELineID;
                    }


                });

                function hasAtleastOnePrice(x) {
                    return x.PELineUnitPrice == '';
                }
    
                //check if atleast one line submitted
                if(self.QuotationResponse.every(hasAtleastOnePrice)){
                    AllPricesNotAvailable = true;
                }


                //check the completness of the data
                const constraints = self.QuotationResponseRules;
                self.QuotationResponseErrors = null;
                $.each(self.QuotationResponse, function(index, QuotationResponseSingle) {
                    //this.QuotationResponseErrors = validateJs(QuotationResponseSingle, constraints);
                    console.log(EmptyEntries);
                    console.log(LeadDayMissing);
                    console.log(AdvancedPaymentMissing);
                    console.log(AllPricesNotAvailable);


                    //check if atleast one line submitted
                    if(AllPricesNotAvailable){
                        Swal({ 
                            text: 'To Submit a quotation a price for at least one line must be provided.',
                            title: 'Price Required',
                            type: 'warning'
                        });
                        Check5 = false;
                        return false;
                    }

                    if(LeadDayMissing){
                        Swal({ 
                            html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Lead Days For Submitted PE#: '+ LeadDayMissingID +'</b></div>',
                            title: 'Required Data Missing',
                            type: 'warning'
                        });
                        Check1 = false;
                        return false;
                    }


                    if(AdvancedPaymentMissing){
                        Swal({ 
                            html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Missing Advance Payment For Submitted PE#: '+ AdvancedPaymentMissingID +'</b></div>',
                            title: 'Required Data Missing',
                            type: 'warning'
                        });
                        Check4 = false;
                        return false;
                    }

                    if (QuotationResponseSingle.PELineUnitPrice != '' && QuotationResponseSingle.PEUploadedFiles == "DocsUploadRequired"){
                        Swal({ 
                            html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>1. File Upload for Purchase Enquiry ID # '+QuotationResponseSingle.PELineID+'</b></div>',
                            title: 'Required Data Missing',
                            type: 'warning'
                        });
                        Check2 = false;
                        return false;
                    }
 
                });

                //Check if user enter validaty date
                if (self.QuotationValidityDate == ""){
                    Swal({ 
                        html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that the below required data is completed:  <br><b>Select A Quotation Validity Date</b></div>',
                        title: 'Required Data Missing',
                        type: 'warning'
                    });
                    Check3 = false;
                    return false;
                }



                if(Check1 && Check2 && Check3 && Check4 && Check5){
                    OKToContinue = true;
                }


                if(OKToContinue){
                    if(EmptyEntries) {

                        Swal({
                          title: 'Some Prices Are Not Submitted',
                          text: "You have some prices left empty, would you like to proceed? these line items will not be submitted. If those lines are to be submitted as free item you should enter Zeros for those lines. This submission is final and cannot be changed or edited in the future.",
                          type: 'warning',
                          showCancelButton: true,
                          confirmButtonColor: '#3085d6',
                          cancelButtonColor: '#d33',
                          confirmButtonText: 'Yes, Submit',
                          cancelButtonText: 'No'
                        }).then((result) => {
                            
                            if (result.value) {
                                // We are here after agreeing to submit some empty prices
                                axios.post('/api/vendors/bidding_management/auction_reponse_submission', self.QuotationResponse)
                                    .then((response) => {

                                    	if(response.data.messageType == 'error'){
	                                        Swal({ 
	                                            type: response.data.messageType, 
	                                            title: response.data.messageTitle, 
	                                            text: response.data.message,
	                                            showConfirmButton: true,
	                                            timer: 15000
	                                        });
	                                    } else {
	                                    	this.QuotationSubmitStatus = "Prices Submitted";
	                                        this.Auctions['Active'].find(self.getAuction).trackers[0].status = "Prices Submitted";
	                                        self.RefreshAuctions();
	                                        self.updateQuotationLinesTable(this.AuctionId);

	                                        Swal({ 
	                                            type: response.data.messageType, 
	                                            title: response.data.messageTitle, 
	                                            text: response.data.message,
	                                            showConfirmButton: true,
	                                            timer: 15000
	                                        });
	                                    }


                                    })

                            }
                            
                           
                        });
                    } else {

                        Swal({
                            title: 'Confirm Submission!' ,
                            text: "This submission is considered as your Final and Best Offer (FABO). This submission is final and cannot be changed or edited in the future.",
                            type: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, Submit',
                            cancelButtonText: 'No'
                            }).then((result) => {
                                
                                if (result.value) {
                                    // We are after filling all the prices from the first time.
                                    axios.post('/api/vendors/bidding_management/auction_reponse_submission', self.QuotationResponse)
                                        .then((response) => {

                                        	if(response.data.messageType == 'error'){
                                        		Swal({ 
	                                                type: response.data.messageType, 
	                                                title: response.data.messageTitle, 
	                                                text: response.data.message,
	                                                showConfirmButton: true,
	                                                timer: 15000
	                                            });
                                        	} else {
                                        		this.QuotationSubmitStatus = "Quoation Submitted";
	                                            this.Auctions['Active'].find(self.getAuction).trackers[0].status = 'Prices Submitted';
	                                            self.RefreshAuctions();
	                                            self.updateQuotationLinesTable(this.AuctionId);
	                                            
	                                            Swal({ 
	                                                type: response.data.messageType, 
	                                                title: response.data.messageTitle, 
	                                                text: response.data.message,
	                                                showConfirmButton: true,
	                                                timer: 15000
	                                            });
                                        	}
                                            
                                        });
                                }

                                

                        });

                    }
                }
                

            },
            getAuction(auction) { 
			    return auction.id === this.AuctionId;
			},
            ShowSubmissionErrors() {

                Swal({ 
                    html: '<div style="text-align: left; margin-left: 20px" class="float-left">Please make sure that all the required data are completed:  <br><b>1. Prices </b><br><b>2. Currencies </b><br><b>3. Required Documents</b></div>',
                    title: 'Required Data Missing',
                    type: 'warning'
                });

            },
            submitUpload(RequiredFile) {
                let self = this;
                console.log(self.PEVendorUploadedId);
                function isRequiredPE(PE){
                    return PE.id == self.PEVendorUploadedId;
                }
                let PE = this.ViewModalInfo[0].purchase_enquiries.find(isRequiredPE);

                let formData = new FormData();

                if(!this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[0]){
                    Swal('Document Required', 'You must select at least one document to upload', 'warning')
                    return false;
                }

                for(var i = 0; i < this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles.length; i++ ){
                    let file = this.$refs['RequiredFiles_'+RequiredFile][0].uploadFiles[i].raw;
                    formData.append('RequiredFiles['+i+']', file);
                    PE.uploaded_docs.push('FileName');
                }

                formData.append('PEId', JSON.stringify(this.RequiredFilesId));
                formData.append('QuotationId', JSON.stringify(this.ViewModalInfo[0].id));
                formData.append('CompanyId', JSON.stringify(this.ViewModalInfo[0].company_id));
                formData.append('RequiredDocsDetails', JSON.stringify(this.RequiredDocsDetails));
                
                axios.post( '/api/vendors/bidding_management/upload_required_files', formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then((response) => {

                        //mark docuement uploadfield as "NoUploadsRequired"
                        $('#PEline_'+this.PEVendorUploadedId+'_filesUpload').val('NoUploadsRequired');
                        //add the 
                        
                        

                        Swal({ 
                            type: response.data.messageType, 
                            title: response.data.messageTitle, 
                            text: response.data.message,
                            showConfirmButton: true,
                        });



                    })
                    .catch(function(){
                        Swal('Error Occured', 'A technical error has occured, please contact system administrator to solve the problem (RequiredFilesUpload)', 'error');
                    });



                $('#RequiredDocsModal').modal('toggle');



                
            },
            showRequiredDocsModal(recordId, DocName) {
                function isRequiredPE(PE){
                    return PE.id == recordId;
                }

                //reset previous values and uploaded files
                this.RequiredFilesId = "";
                this.RequiredDocsDetails = [];

                //store the selected PE Id
                this.RequiredFilesId = recordId;
                
                //get the list of document required for the selected PE
                let PE = this.ViewModalInfo[0].purchase_enquiries.find(isRequiredPE);
                this.RequiredDocsDetails = PE.required_documents.split(",");
                this.PEVendorUploadedFiles = PE.uploaded_docs;
                this.PEVendorUploadedId = PE.id;

                //Show the modal
                this.RequiredDocsDataLoaded = true;
                $('#RequiredDocsModal').modal('toggle');

                this.RequiredDocsDataLoaded = true;

            },
            SubmitRFI(){
                //check if empty
                if(this.RFIData.RFImessage == ""){
                    Swal('Message Required', 'Message field can not be empty, please type your message', 'warning')
                    return false;
                    
                } else {
                    axios.post( '/api/vendors/bidding_management/create_rfi_message', this.RFIData)
                        .then((response) => {
                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                            });
                            this.RFIData.PEMessage == "";
                        })

                    $('#RFIModal').modal('toggle');
                    this.QuotationSubmitStatus = "RFI Submitted";
                }
                
            },
            showRFIModal(recordId) {

            	
                this.RFIDetails = [];
                this.RFIData.PEId = recordId;
                this.RFIData.CompanyId = this.ViewModalInfo[0].company_id;
                this.RFIData.QuotationId = this.ViewModalInfo[0].id;
                axios.post('/api/vendors/data/get_pe_rfi_details', {PEId: recordId, CompanyId: this.RFIData.CompanyId})
                    .then((response) => {
                        this.RFIDetails = response.data;
                        this.RFIDataLoaded = true;

                        $('#RFIModal').modal('toggle');

                        this.$nextTick(() => {
                            $('#RFIMessagesTable').DataTable({
                                responsive: true,
                                colReorder: true,
                                dom: '<"html5buttons">Brfgtip',
                                pageLength: 100,
                                lengthMenu: [
                                    [ 100, 500, 1000, -1 ],
                                    [ '100 Records', '500 Records', '1000 Records', 'All Records' ]
                                ],
                                order: [[ 3, "DESC" ]],
                                buttons: [
                                    { extend: 'pageLength', className: 'btn btn-success' },
                                    { extend: 'copy', className: 'btn btn-success' },
                                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
                                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] }
                                ],
                            }); 
                        });
                    });


                this.RFIDataLoaded = false;
            },
            updateQuotationLinesTable(recordId){
            	this.refreshLoading = true;
            	axios.post('/api/vendors/data/get_quotation_details_record_details_auction', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.refreshLoading = false;
                        this.$nextTick(() => {
	                        var table = $('#QuotationRequestsLines').DataTable({
				                destroy: true,
				                colReorder: true,
				                dom: '<"html5buttons">Brfgtip',
				                pageLength: 10,
                                columnDefs: [
                                    { "width": "100px", "targets": "_all" }
                                ],
				                lengthMenu: [
				                    [ 10, 25, 50, 100, 500, 1000, -1 ],
				                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
				                ],
				                order: [[ 1, "ASC" ]],
				                buttons: [
				                    { extend: 'pageLength', className: 'btn btn-success' },
				                    { extend: 'copy', className: 'btn btn-success' },
				                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
				                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
				                    {
				                        text: '<i class="fa fa-refresh"></i>',
				                        className: 'btn btn-success',
				                        action: function ( e, dt, node, config ) {
				                            self.updateQuotationLinesTable(recordId);
				                        }
				                    },
				                ],
				            }); 

                            const self = this;

                            $('tbody', this.$refs.PETable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRequiredDocsModal(RecordID);
                            });


                            $('tbody', this.$refs.PETable).on('click', '.rfi-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRFIModal(RecordID);
                            });

                            this.QuotationLinesTable = table;

	                    });

                    })
            },
			showViewModal(recordId){
				this.ViewingEndedAuction = false; //used not to edit RFI and Document upload since same modal is used for live auction and viewing.
				this.AuctionId = recordId;
                this.ViewModalInfo = {};
                this.QuotationValidityDate = "";
                this.QuotationSubmitStatus = "";
                axios.post('/api/vendors/data/get_quotation_details_record_details_auction', {QuotationId: recordId})
                    .then((response) => {
                        this.ViewModalInfo = response.data;
                        this.viewDataLoaded = true;
                        console.log(this.ViewModalInfo);

                        this.QuotationSubmitStatus = this.ViewModalInfo[0].trackers[0].status;

                        if(this.ViewModalInfo[0].purchase_enquiries[0].responses.length){
                        	this.QuotationValidityDate = this.ViewModalInfo[0].purchase_enquiries[0].responses[0].validity_date;
                        }
                        console.log(this.QuotationSubmitStatus);
                        $('#QuotationDetailsModal').modal('toggle');

                        this.$nextTick(() => {
	                        var table = $('#QuotationRequestsLines').DataTable({
				                destroy: true,
				                colReorder: true,
				                dom: '<"html5buttons">Brfgtip',
				                pageLength: 10,
                                columnDefs: [
                                    { "width": "100px", "targets": "_all" }
                                ],
				                lengthMenu: [
				                    [ 10, 25, 50, 100, 500, 1000, -1 ],
				                    [ '10 Records', '25 Records', '50 Records', '100 Records', '500 Records', '1000 Records', 'All Records' ]
				                ],
				                order: [[ 1, "ASC" ]],
				                buttons: [
				                    { extend: 'pageLength', className: 'btn btn-success' },
				                    { extend: 'copy', className: 'btn btn-success' },
				                    { extend: 'excel', className: 'btn btn-success', title: 'QuotationsLinesList' },
				                    { extend: 'colvis', className: 'btn btn-success', postfixButtons: [ 'colvisRestore' ] },
				                    {
				                        text: '<i class="fa fa-refresh"></i>',
				                        className: 'btn btn-success',
				                        action: function ( e, dt, node, config ) {
				                            self.updateQuotationLinesTable(recordId);
				                        }
				                    },
				                ],
				            }); 

                            const self = this;

                            $('tbody', this.$refs.PETable).on('click', '.required-docs-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRequiredDocsModal(RecordID);
                            });


                            $('tbody', this.$refs.PETable).on('click', '.rfi-placeholder', function(){
                                var $this = $(this);
                                var RecordID = $this.parent().parent().find(">:first-child").text();
                                //Check if Id has prefix and resolve
                                if (RecordID.includes("-")){
                                    RecordID = RecordID.substring(RecordID.indexOf("-") + 1);
                                }
                                self.showRFIModal(RecordID);
                            });

                            self.QuotationLinesTable = table;

	                    });

                    })


                this.viewDataLoaded = false;
                
            },
			RefreshAuctions(){
				let self = this;
				this.Auctions = {};
				this.AuctionsLoading = true;

				axios.get( '/api/vendors/data/get_vendor_auction_list')
	                .then((response) => {
	                    this.Auctions = response.data;
	                    this.AuctionsLoading = false;
	                    console.log(this.Auctions);
	                   
	                    $.each(this.Auctions['Active'], function(index, auction) {
	            			
			            	// Set the date we're counting down to
							var countDownDate = new Date(auction.end_date).getTime();


							// Update the count down every 1 second
							self.myAuctionIntervals[self.myAuctionIntervals.length] = setInterval(function() {

							    // Get todays date and time
							    var now = new Date().getTime();

							   							    
							    // Find the distance between now and the count down date
							    var distance = countDownDate - now;
							    
							    // Time calculations for days, hours, minutes and seconds
							    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
							    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
							    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
							    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
							    
							    // Output the result in an elements with class="demo"
							    
							    $("#AuctionTimer_"+auction.id).text('Time Left: '+ days + "d " + hours + "h "
							    + minutes + "m " + seconds + "s ");
							    
							    // If the count down is over, write some text 
							    if (distance < 0) {
							        self.clearAllIntervals();
							        $("#AuctionTimer_"+auction.id).text('EXPIRED');

							        //Disable Go to auction button by remove the item from the table
							        self.RefreshAuctions();
							    }
							}, 1000);

							

			            });

			            this.$nextTick(() => {
			            	$('.slimscroller').slimScroll({
						        height: '250px'
						    });
			            })

			            

	                })
			},
			clearAllIntervals() {
				let x = 0;
			    for (x; x < this.myAuctionIntervals.length; x++) {
			        clearTimeout( this.myAuctionIntervals[x] );
			    }
			}
		},
		mounted(){
			
			let self = this;
			self.AuctionsLoading = true;

			self.RefreshAuctions();

			/*axios.get( '/api/vendors/data/get_vendor_auction_list')
                .then((response) => {
                    this.Auctions = response.data;
                    this.AuctionsLoading = false;					
                   
                    $.each(this.Auctions['Active'], function(index, auction) {
            			
		            	// Set the date we're counting down to
						var countDownDate = new Date(auction.end_date).getTime();

						// Update the count down every 1 second
						console.log(self.myAuctionIntervals);
						self.myAuctionIntervals[self.myAuctionIntervals.length] = setInterval(function() {

						    // Get todays date and time
						    var now = new Date().getTime();
						    
						    // Find the distance between now and the count down date
						    var distance = countDownDate - now;
						    
						    // Time calculations for days, hours, minutes and seconds
						    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
						    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
						    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
						    
						    // Output the result in an elements with class="demo"
						    
						    $("#AuctionTimer_"+auction.id).text('Time Left: '+ days + "d " + hours + "h "
						    + minutes + "m " + seconds + "s ");
						    
						    // If the count down is over, write some text 
						    if (distance < 0) {
						        clearAllIntervals();
						        $("#AuctionTimer_"+auction.id).text('EXPIRED');

						        //Disable Go to auction button by remove the item from the table
							    self.RefreshAuctions();
						    }
						}, 1000);

						

		            });

		            this.$nextTick(() => {
		            	$('.slimscroller').slimScroll({
					        height: '250px'
					    });
		            })

		            

                })*/

        	//on RequiredDocsModal close clear the files for each required docuement
            $('#RequiredDocsModal').on('hidden.bs.modal', function () {
            	// do not reset input filed in document view modal since no input field is available while viewing
            	if(!self.ViewingEndedAuction){
            		$.each(self.RequiredDocsDetails, function(index, Document) {
	                    self.$refs['RequiredFiles_'+Document][0].clearFiles();
	                });   
	                self.PEVendorUploadedFiles = null;
            	}
            });


            //update view status of the qoutation
            $('#QuotationDetailsModal').on('shown.bs.modal', function() {
                if(self.QuotationSubmitStatus == "Request for Proposals Not Yet Viewed"){
                    axios.post('/api/vendors/bidding_management/mark_qoutation_as_viewed', {QuotationId: self.ViewModalInfo[0].id , CompanyId: self.ViewModalInfo[0].company_id })
                        .then((response) => {
                            //update status
                            self.Auctions['Active'].find(self.getAuction).trackers[0].status = 'Request for Proposals Viewed';
                            self.RefreshAuctions();
                        })
                }
            });

            //prompt vendor whether he will submit of not.
            $('#QuotationDetailsModal').on('hidden.bs.modal', function () {
               
                //check if the user is seeing this for the first time and not submitting the prices
                if(self.QuotationSubmitStatus == "Request for Proposals Not Yet Viewed" || self.QuotationSubmitStatus == "Request for Proposals Viewed"){
                    Swal({
                      title: 'Will You Submit Prices For This Quotation?',
                      text: "This will notifiy the Quotation Manager if you are interested in submitting prices for this quotation.",
                      type: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Yes',
                      cancelButtonText: 'No'
                    }).then((result) => {

                        if (result.value) {
                            // We are here after agreeing to submit some empty prices
                            axios.post('/api/vendors/bidding_management/confirm_quotation_submission', {QuotationId: self.ViewModalInfo[0].id , CompanyId: self.ViewModalInfo[0].company_id, WillSubmit: true })
                                .then((response) => {

                                	//update record
                                    self.Auctions['Active'].find(self.getAuction).trackers[0].status = 'Quotation Will Be Sent';
                                    self.RefreshAuctions();

                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 15000
                                    });
                                    
                                })
                        }

                        if(result.dismiss == "cancel"){
                            axios.post('/api/vendors/bidding_management/confirm_quotation_submission', {QuotationId: self.ViewModalInfo[0].id , CompanyId: self.ViewModalInfo[0].company_id, WillSubmit: false })
                                .then((response) => {
                                    self.Auctions['Active'].find(self.getAuction).trackers[0].status = 'Quotation Will NOT Be Sent';
                                    self.RefreshAuctions();
                                    Swal({ 
                                        type: response.data.messageType, 
                                        title: response.data.messageTitle, 
                                        text: response.data.message,
                                        showConfirmButton: true,
                                        timer: 15000
                                    });
                                })
                        }

                        if(result.dismiss == "overlay"){
                            //do something when user clicks outside of the Swal
                        }
                        
                    });
                }
                
                
            });
			
		}
	}
</script>

<style scoped>
	
	.numberCircle {
        position: relative;
        top: -45px;
        left: 10px;

        line-height:0px;
        display:inline-block;
        
        border-radius:50%;
        border:2px solid;
        
        font-size:10px;
        color: white;
        background-color: #26c6da;
    }

    .numberCircle span {
        display:inline-block;
        
        padding-top:50%;
        padding-bottom:50%;
        
        margin-left:8px;
        margin-right:8px;
    }
    
    .font-500{
        font-weight: 500;
    }

    #QuotationDetailsModal .modal-dialog {
        min-width:95%;
    }

    #EndedAuctionDetailsModal .modal-dialog {
        min-width:95%;
    }

    #RequiredDocsModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }
    
    #RFIModal .modal-dialog {
        top: 3%;
        min-width:85%;
    }

    input[type='number'] {
        -moz-appearance:textfield;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    .table-wrapper {
        overflow-x: auto;
        overflow-y: hidden;
    }


    .QuotationLinesRefreshing {
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  background-color: #cfd1d0;
	  opacity: 0.7;
	  z-index: 1000;
	}

	.lowestBidder {
        background-color: rgb(69, 249, 132, 0.1);
    }

    .notLowestBidder {
        background-color: rgb(249, 69, 237, 0.1);
    }

	
</style>