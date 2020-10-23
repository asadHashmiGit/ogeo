<template>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Table and Column Finder</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                    	<div class="col-lg-6">
                            <div class="grid-content">
                                
                                <el-select filterable style="width: 100%; padding: 0px;" @change="getTableColumns($event)" v-model="FilterTable" placeholder="Select Filter Table">
                                    
                                    <el-option v-for="(TableName, index) in SystemTablesList" :key="TableName" :label="TableName" :value="TableName"></el-option>
                                    
                                </el-select>
                                
                            </div>
                        </div>

                    

                        <div class="col-lg-6">
                            <div class="grid-content">

                                <el-select filterable style="width: 100%; padding: 0px;" v-model="FilterColumn" placeholder="Select Filter Column">
                                    
                                    <el-option v-for="(columnName, index) in TableColumnsList" :key="columnName" :label="columnName" :value="columnName"></el-option>
                                    
                                </el-select>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <h4>Step 1: Select Data (Write SQL Query)</h4>
                </div>
                <div class="card-body">
                    <el-form :model="SQLQueryDetails" class="demo-form-inline" :rules="FormRulesSQL" ref="SQLQueryForm">
                        
                        <div class="row">
							
							<div class="col-lg-12">
                                <div class="grid-content">
		                            <el-form-item label="temp" prop="SQLQuery">
                                        <span slot="label">Enter SQL Query:</span>
		                                
		                                <el-input
                                            id="SQLQueryTextAreaID"
                                            style="font-family: Arial; font-size: 1em; font-weight: bold;"
		                                    type="textarea"
		                                    :rows="12"
                                            value=""
		                                    placeholder="Enter SQL Query"
		                                    v-model="SQLQueryDetails.SQLQuery">
		                                </el-input>

                                        <span>Allowed variables are: <i style="color: blue">$GetLoggedInUserId, $Filter#, $now(#), $dateRange#FromNow(#), $dateRange#ToNow(#),</i> </span>
		                                
		                            </el-form-item>
		                        </div>
		                    </div>

		                    <div class="col-lg-12">
                                <hr>
                                <button type="button" @click="GetSQLResponse" class="btn btn-success btn-block waves-effect text-center">Get SQL Response</button>
                            </div>

		                </div>
                        <hr>
		            </el-form>

                    <div class="row">
                        <div class="col-lg-12">
                            <div style="overflow-x:auto;" v-if="QueryResults.length >= 0" class="search-table-outter wrapper">
                                <table class="display responsive table table-bordered table-hover search-table inne">
                                    <thead>
                                        <th v-for="(header, index) in Headers">{{ header }}</th>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(row, key) in QueryResults">
                                            <td v-for="(column, index) in row">{{ column }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div align="center" v-if="NoDataResult">
                                <h4 class="text-success">No Data Results for the Query</h4>
                            </div>
                            <div align="center" v-if="ErrorMessage != ''">
                                <h4 class="text-danger">{{ ErrorMessage }}</h4>
                            </div>
                            <div align="center" v-if="RequestingData">
                                <h2>Gathering Data...</h2>
                                <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <h4>Step 2: Create Filters</h4>
                </div>
                <div class="card-body">
                    <el-form :model="ChartFilteration" class="demo-form-inline" :rules="FormRulesChartFilteration" ref="ChartFiltersForm">
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="grid-content">

                                    <el-form-item label="Select Filter Number (Referenced in SQL Query)" prop="FilterNumber">

                                        <el-select style="width: 100%; padding: 0px;" v-model="ChartFilteration.FilterNumber" placeholder="Select Filter Number">
                                            <el-option label="$Filter1" value="$Filter1"></el-option>
                                            <el-option label="$Filter2" value="$Filter2"></el-option>
                                            <el-option label="$Filter3" value="$Filter3"></el-option>
                                            <el-option label="$Filter4" value="$Filter4"></el-option>
                                            <el-option label="$Filter5" value="$Filter5"></el-option>
                                            <el-option label="$Filter6" value="$Filter6"></el-option>
                                            <el-option label="$Filter7" value="$Filter7"></el-option>
                                            <el-option label="$Filter8" value="$Filter8"></el-option>

                                            <el-option label="$dateRange1" value="$dateRange1"></el-option>
                                            <el-option label="$dateRange2" value="$dateRange2"></el-option>
                                            <el-option label="$dateRange3" value="$dateRange3"></el-option>
                                            <el-option label="$dateRange4" value="$dateRange4"></el-option>
                                            <el-option label="$dateRange5" value="$dateRange5"></el-option>
                                            <el-option label="$dateRange6" value="$dateRange6"></el-option>
                                            <el-option label="$dateRange7" value="$dateRange7"></el-option>
                                            <el-option label="$dateRange8" value="$dateRange8"></el-option>
                                        </el-select>
                                    </el-form-item>

                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Enter Filter Label" prop="FilterLabel">
                                        <el-input placeholder="Enter Filter Label" v-model="ChartFilteration.FilterLabel">
                                        </el-input>
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="grid-content">

                                    <el-form-item label="Select Filter Type" prop="FilterSource">

                                        <el-select style="width: 100%; padding: 0px;" @change="FilterSourceSelection($event)" v-model="ChartFilteration.FilterSource" placeholder="Select Filter Type">
                                            <el-option label="From Database" value="From Database"></el-option>
                                            <el-option label="Hard Coded" value="Hard Coded"></el-option>
                                        </el-select>
                                    </el-form-item>

                                </div>
                            </div>


                 

                            <div class="col-lg-12" v-if="ChartFilteration.FilterSource == 'From Database'">
                                <div class="grid-content">
                                    <el-form-item label="Select Filter Type" prop="FilterType">
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="ChartFilteration.FilterType" placeholder="Select Filter Type">
                                            <el-option-group label="Drop Down Select">
                                                <el-option label="Drop Down List Single Select" value="Drop Down List Single Select"></el-option>
                                                <el-option label="Drop Down List Multi Select" value="Drop Down List Multi Select"></el-option>
                                            </el-option-group>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12" v-if="ChartFilteration.FilterSource == 'From Database'">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="FilterData">
                                        <span slot="label">Enter Data SQL Query Select: (Must Return Two Column Only "id, label"):</span>
                                        

                                        <el-input
                                            id="DataDropdownSQLQueryTextAreaID"
                                            style="font-family: Arial; font-size: 1em; font-weight: bold;"
                                            type="textarea"
                                            :rows="12"
                                            value=""
                                            placeholder="Enter SQL Query"
                                            v-model="ChartFilteration.FilterData">
                                        </el-input>
                                        

                                        <span>Allowed variables are: <i style="color: blue">$GetLoggedInUserId</i> </span>
                                        
                                    </el-form-item>
                                </div>

                                <div class="row">

                                    <div class="col-lg-12">
                                        <span @click="getFilterDataSQLResults" class="btn btn-block btn-success">Get DATA</span>
                                    </div>

                                    <div class="col-lg-12">
                                        <div v-if="FilterDataQueryResults.length >= 0" class="search-table-outter wrapper">
                                            <table class="display responsive table table-bordered table-hover search-table inne">
                                                <thead>
                                                    <th v-for="(header, index) in FilterDataHeaders">{{ header }}</th>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(row, key) in FilterDataQueryResults">
                                                        <td v-for="(column, index) in row">{{ column }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div align="center" v-if="FilterDataNoDataResult">
                                            <h4 class="text-success">No Data Results for the Query</h4>
                                        </div>
                                        <div align="center" v-if="FilterDataErrorMessage != ''">
                                            <h4 class="text-danger">{{ FilterDataErrorMessage }}</h4>
                                        </div>
                                        <div align="center" v-if="FilterDataRequestingData">
                                            <h2>Gathering Data...</h2>
                                            <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
                                        </div>
                                    </div>
                                </div>

                                
                            </div>
                           

                         
                            
                            <div v-if="ChartFilteration.FilterSource == 'Hard Coded'" class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Select Filter Type" prop="FilterType">
                                        <el-select filterable style="width: 100%; padding: 0px;" v-model="ChartFilteration.FilterType" placeholder="Select Filter Type">
                                            <el-option-group label="Drop Down Select">
                                                <el-option label="Drop Down List Single Select" value="Drop Down List Single Select"></el-option>
                                                <el-option label="Drop Down List Multi Select" value="Drop Down List Multi Select"></el-option>
                                            </el-option-group>
                                            <el-option-group label="Date and Time Range Picket">
                                                <el-option label="Date Time Range" value="Date Time Range"></el-option>
                                            </el-option-group>
                                        </el-select>
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12" v-if="ChartFilteration.FilterSource == 'Hard Coded' && (ChartFilteration.FilterType == 'Drop Down List Single Select' || ChartFilteration.FilterType == 'Drop Down List Multi Select')">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Option id">
                                                <el-input placeholder="Enter Option id" v-model="FilterOption.id">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="grid-content">
                                            <el-form-item label="Enter Option label">
                                                <el-input placeholder="Enter Option label" v-model="FilterOption.label">
                                                </el-input>
                                            </el-form-item>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <span class="btn btn-block btn-success" @click="addFilterOption">Add An Option</span>
                                    </div>


                                    <div class="col-lg-12">
                                        <hr>
                                        <table class="display responsive table table-bordered table-hover search-table inne">
                                            <thead>
                                                <th>id</th>
                                                <th>label</th>
                                                <th>Actions</th>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(FilterOption, key, index) in FilterOptionsList">
                                                    <td>{{ FilterOption.id }}</td>
                                                    <td>{{ FilterOption.label }} </td>
                                                    <td><a class="btn btn-block btn-danger" href="#" @click="removeFilterOption(key, $event)"> Delete</a> </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>


                            <div class="col-lg-12">
                                <hr>
                                <button type="button" @click="AddFilter" class="btn btn-success btn-block waves-effect text-center">Add Filter</button>
                            </div>


                            <div class="col-lg-12">
                                <hr>
                                <table class="display responsive table table-bordered table-hover search-table inne">
                                    <thead>
                                        <th>Filter Number</th>
                                        <th>Filter Source</th>
                                        <th>Filter Type</th>
                                        <th>Filter Label</th>
                                        <th>Filter Data</th>
                                        <th>Actions</th>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(Filters, key, index) in ChartFiltersList">
                                            <td>{{ Filters.FilterNumber }}</td>
                                            <td>{{ Filters.FilterSource }} </td>
                                            <td>{{ Filters.FilterType }}</td>
                                            <td>{{ Filters.FilterLabel }}</td>
                                            <td>{{ Filters.FilterData }}</td>
                                            <td><a class="btn btn-block btn-danger" href="#" @click="removeFilter(key, $event)"> Delete</a> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                    
                            
                        </div>
                    </el-form>

                    

                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <h4>Step 3: Set Charts Options</h4>
                </div>
                <div class="card-body">
                    <el-form :model="ChartDetails" class="demo-form-inline" :rules="FormRulesChartOptions" ref="ChartOptionsForm">
                        <div class="row">


                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="CompanyId">
                                        <span slot="label">Assign Chart to Specific Company </span>                                         
                                        <el-select style="width: 100%; padding: 0px;" v-model="ChartDetails.CompanyId" placeholder="Assign Chart to Specific Company">   
                                            <el-option label="Assign To ALL" value="ALL"></el-option> 
                                            <!-- <el-option v-for="(Company, index) in CompaniesList" :key="Company.id" :label="Company.name" :value="Company.id"></el-option>  -->  
                                        </el-select>
                                        
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="ChartType">
                                        <span slot="label">Chart Width </span>                                         
                                        <el-select style="width: 100%; padding: 0px;" v-model="ChartDetails.ChartWidth" placeholder="Select Chart Type">
                                                    
                                            <el-option label="col-lg-3" value="col-lg-3"></el-option>
                                            <el-option label="col-lg-4" value="col-lg-4"></el-option>
                                            <el-option label="col-lg-6" value="col-lg-6"></el-option>
                                            <el-option label="col-lg-7" value="col-lg-7"></el-option>
                                            <el-option label="col-lg-9" value="col-lg-9"></el-option>
                                            <el-option label="col-lg-12" value="col-lg-12"></el-option>
                                                
                                        </el-select>
                                        
                                    </el-form-item>
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="temp" prop="ChartType">
                                        <span slot="label">Please Select Chart Type </span> 
                                        <a href="https://echarts.apache.org/en/option.html#title" target="_blank">(See All Chart Options)</a>
                                        <span> OR </span>
                                        <a href="https://echarts.apache.org/examples/en/" target="_blank">(Get Inspired By Existing Examples)</a>
                                        
                                        <el-select style="width: 100%; padding: 0px;" v-model="ChartDetails.ChartType" placeholder="Select Chart Type">
                                                    
                                            <el-option label="Line Chart" value="Line Chart"></el-option>
                                            <el-option label="Bar Chart" value="Bar Chart"></el-option>
                                            <el-option label="Stack Bar Chart" value="Stack Bar Chart"></el-option>
                                            <el-option label="Pie Chart" value="Pie Chart"></el-option>
                                            <el-option label="Scatter Chart" value="Scatter Chart"></el-option>
                                            <el-option label="Radar Chart" value="Radar Chart"></el-option>
                                            <el-option label="Doughnut Chart" value="Doughnut Chart"></el-option>
                                            <el-option label="Gauge 1 Chart" value="Gauge 1 Chart"></el-option>
                                            <el-option label="Gauge 2 Chart" value="Gauge 2 Chart"></el-option>
                                            <el-option label="Funnel Chart" value="Funnel Chart"></el-option>
                                            <el-option label="Sunburst Chart" value="Sunburst Chart"></el-option>
                                            <el-option label="BoxPlot Chart" value="BoxPlot Chart"></el-option>
                                            <el-option label="EffectScatter Chart" value="EffectScatter Chart"></el-option>
                                            <el-option label="Heatmap Chart" value="Heatmap Chart"></el-option>
                                            <el-option label="ThemeRiver Chart" value="ThemeRiver Chart"></el-option>
                                            <el-option label="PictorialBar Chart" value="PictorialBar Chart"></el-option>
                                            <el-option label="ThemeRiver Chart" value="ThemeRiver Chart"></el-option>
                                            <el-option label="Start Fresh" value="Start Fresh"></el-option>
                                                
                                        </el-select>
                                        
                                    </el-form-item>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="grid-content">
                                    <el-form-item label="Enter Charts Options" prop="ChartOptions">
                                        
                                        <el-input
                                            id="ChartOptionsTextAreaID"
                                            type="textarea"
                                            :rows="25"
                                            placeholder="Enter Charts Options"
                                            :value="ChartOptions"
                                            v-model="ChartDetails.ChartOptions">
                                        </el-input>
                                        
                                    </el-form-item>
                                </div>
                            </div>

                            
                            <div class="col-lg-12">
                                <hr>
                                <button type="button" @click="GenerateChart" class="btn btn-success btn-block waves-effect text-center">Generate Chart</button>
                            </div>

                        </div>
                    </el-form>


                    <div class="row">
                        <div class="col-lg-12">
                            <hr>
                            <div id="test-chart" style="width:100%; min-height:400px;"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h4>Step 4: Save and Publish Chart</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <button type="button" @click="SaveNPublishChart" class="btn btn-success btn-block waves-effect text-center">Save and Publish Chart</button>
                    </div>
                </div>
            </div>


        </div>
    </div>

</template>

<script>

	import validateJs from 'validate.js';

    // Import the main module of echarts.
    var echarts = require('echarts/lib/echarts');
    // include bar chart
    require('echarts/lib/chart/line');
    require('echarts/lib/chart/bar');
    require('echarts/lib/chart/pie');
    require('echarts/lib/chart/scatter');
    require('echarts/lib/chart/radar');
    require('echarts/lib/chart/gauge');
    require('echarts/lib/chart/pictorialBar');
    require('echarts/lib/chart/heatmap');
    require('echarts/lib/chart/funnel');
    require('echarts/lib/chart/themeRiver');
    require('echarts/lib/chart/sunburst');
    
    // include tooltip and title component
    require('echarts/lib/component/title');
    require('echarts/lib/component/tooltip');
    require('echarts/lib/component/toolbox');
    require('echarts/lib/component/dataZoom');
    require('echarts/lib/component/markPoint');
    require('echarts/lib/component/markLine');
    require('echarts/lib/component/markArea');
    require('echarts/lib/component/timeline');
    require('echarts/lib/component/axisPointer');
    require('echarts/lib/component/legendScroll');
    require('echarts/lib/component/grid');

    require('echarts/lib/chart/boxplot');
    import { prepareBoxplotData } from 'echarts/extension/dataTool';

	export default {
		name: "charts-creation",
		data() {
			return {
				DataTable: "",
                CompaniesList: [],
                SystemTablesList: [],
                TableColumnsList: [],
                FilterTable: "",
                FilterColumn: "",
                NoDataResult: false,
                RequestingData: false,
                FilterDataNoDataResult: false,
                FilterDataRequestingData: false,
                hostName: window.location.protocol+'//'+window.location.hostname,
				SQLQueryDetails: {
                    SQLQuery:   "SELECT\n"+
                                "   TableB.name AS 'Created BY',\n"+
                                "   count(case when TableA.created_by = $GetLoggedInUserId then 1 else 0 end) AS 'Total Users PEs',\n"+
                                "   count(TableA.id) AS 'Total PEs'\n"+
                                "FROM purchase_enquiries AS TableA\n"+
                                "INNER JOIN users TableB ON TableA.created_by = TableB.id\n"+
                                "WHERE TableA.project_id IN (SELECT DISTINCT project_id\n"+
                                "                            FROM roles\n"+
                                "                            WHERE user_id = $GetLoggedInUserId\n"+
                                "                            AND role_name = 'PRO')\n"+
                                "AND TableA.enquiry_type = 'Materials'\n"+
                                "AND TableA.created_at BETWEEN '2019-07-06' AND '2019-07-09'\n"+
                                "GROUP BY TableA.created_by",
                },
                ChartDetails: {
                    CompanyId: "ALL",
                    ChartWidth: "col-lg-12",
                    ChartType: "Line Chart",
                    ChartOptions: "",
                },
                SQLQueryTextArea: "",
                ChartOptionsTextArea: "",
                DataDropdownSQLQueryTextArea: "",
                QueryResults: [],
                ErrorMessage: '',
                Headers: [],
                FilterDataQueryResults: [],
                FilterDataHeaders: [],
                FilterDataErrorMessage: '',
                ChartFilteration: {
                    FilterSource: "",
                    FilterType: "",
                    FilterNumber: "",
                    FilterLabel: "",
                    FilterData: ""
                },
                ChartFiltersList: [],
                FilterOption: {
                    id: "",
                    label: ""
                },
                FilterOptionsList: [],
                CompleteChartDetails: {
                    SQLQueryDetails: "",
                    ChartFilteration: "",
                    ChartOptions: ""
                },
                FormRulesSQL: {
                    SQLQuery: [{
                        required: true,
                        message: 'Please Enter SQL Query First',
                        trigger: 'blur'
                    }],
                },
                FormRulesChartOptions: {
                    ChartOptions: [{
                        required: true,
                        message: "Please Enter Chart's Options",
                        trigger: 'blur'
                    }],
                    ChartWidth: [{
                        required: true,
                        message: "Please Select Chart's Width",
                        trigger: 'blur'
                    }],
                    CompanyId: [{
                        required: true,
                        message: "Please Select CompanyId",
                        trigger: 'blur'
                    }],
                    ChartType: [{
                        required: true,
                        message: "Please Select Chart's Type",
                        trigger: 'blur'
                    }],
                },
                FormRulesChartFilteration: {
                    FilterNumber: [{
                        required: true,
                        message: "Please Select Filter Number",
                        trigger: 'blur'
                    }],
                    FilterSource: [{
                        required: true,
                        message: "Please Select Filter Source",
                        trigger: 'blur'
                    }],
                    FilterType: [{
                        required: true,
                        message: "Please Select Filter Type",
                        trigger: 'blur'
                    }],
                    FilterLabel: [{
                        required: true,
                        message: "Please Enter Filter Label",
                        trigger: 'blur'
                    }],
                }
			}
		},
		methods: {
            SaveNPublishChart(){
                let self = this;

                this.CompleteChartDetails.SQLQueryDetails = this.SQLQueryDetails;
                this.CompleteChartDetails.ChartFilteration = this.ChartFiltersList;
                this.CompleteChartDetails.ChartOptions = this.ChartDetails;

                //this.CompleteChartDetails.SQLQueryDetails = this.SQLQueryTextArea.getValue();
                //this.CompleteChartDetails.ChartFilteration = this.ChartFiltersList;
                //this.CompleteChartDetails.ChartOptions = this.ChartOptionsTextArea.getValue();

                console.log(this.CompleteChartDetails);

                axios.post('/api/system_management/save_and_publish_chart', this.CompleteChartDetails)
                        .then((response) => {

                            Swal({ 
                                type: response.data.messageType, 
                                title: response.data.messageTitle, 
                                text: response.data.message,
                                showConfirmButton: true,
                                timer: 10000
                            });

                            self.CompleteChartDetails = {};

                        });
            },
            GetSQLResponse() {
                let self = this;

                this.SQLQueryDetails.SQLQuery  = this.SQLQueryTextArea.getValue();
                console.log(this.SQLQueryDetails);

                this.$refs.SQLQueryForm.validate((validation) => {
                    if(validation){

                        self.RequestingData = true;
                        self.NoDataResult = false;
                        self.ErrorMessage = '';
                        self.QueryResults = [];
                        self.Headers = [];

                        axios.post('/api/system_management/get_sql_response', this.SQLQueryDetails)
                        .then((response) => {
                            self.QueryResults = response.data;
                            if(response.data.length != 0){
                                self.Headers = Object.keys(response.data[0]);
                            } else {
                                self.NoDataResult = true;
                            }

                            self.RequestingData = false;
                            //console.log(self.QueryResults);
                            //console.log(self.Headers);

                        })
                        .catch(function (error) {
                            //console.log(error.response);
                            self.ErrorMessage = error.response.data.message;
                            self.RequestingData = false;
                            console.log(error.response.data.message);
                        })
                    }
                });
  
            },
            AddFilter(){
                let self = this;
                if(this.ChartFilteration.FilterSource == 'Hard Coded'){
                    if(this.ChartFilteration.FilterType == 'Drop Down List Single Select' || this.ChartFilteration.FilterType == 'Drop Down List Multi Select'){
                        this.ChartFilteration.FilterData = this.FilterOptionsList;
                    } else if (this.ChartFilteration.FilterType == 'Date Time Range'){
                        this.ChartFilteration.FilterData = 'FilterDataDateRangePicker';
                    }
                }
                this.$refs.ChartFiltersForm.validate((validation) => {
                    if(validation){
                        self.ChartFiltersList.push(Object.assign({}, self.ChartFilteration));
                    }
                });
            },
            removeFilter: function(key, event) {
                if (event) event.preventDefault();
                this.ChartFiltersList.splice(key, 1);
            },
            addFilterOption(){
                this.FilterOptionsList.push(Object.assign({}, this.FilterOption));
            },
            removeFilterOption: function(key, event) {
                if (event) event.preventDefault();
                this.FilterOptionsList.splice(key, 1);
            },
            isJSON(data) {
                var isJson = false
                try {
                    // this works with JSON string and JSON object, not sure about others
                   var json = $.parseJSON(data);
                   isJson = typeof json === 'object' ;
                } catch (ex) {
                    console.error('Data is not JSON');
                }
                return isJson;
            },
            GenerateChart() {

                let self = this;
                this.ChartDetails.ChartOptions = "";
                this.ChartDetails.ChartOptions = this.ChartOptionsTextArea.getValue();
                if(this.isJSON(this.ChartOptionsTextArea.getValue())){
                    this.ChartDetails.ChartOptions = JSON.parse(this.ChartDetails.ChartOptions, true);
                } else {

                    this.ChartDetails.ChartOptions = this.ChartDetails.ChartOptions.replace(/'/g, '"');
                    this.ChartDetails.ChartOptions = this.ChartDetails.ChartOptions.replace(/ :/g, ':');
                    this.ChartDetails.ChartOptions = this.ChartDetails.ChartOptions.replace(/  :/g, ':');
                    var objKeysRegex = /({|,)(?:\s*)(?:')?([A-Za-z_$\.][A-Za-z0-9_ \-\.$]*)(?:')?(?:\s*):/g; // look for object names
                    var newQuotedKeysString = this.ChartDetails.ChartOptions.replace(objKeysRegex, "$1\"$2\":"); // all object names should be double quoted
                    self.ChartDetails.ChartOptions = JSON.parse(newQuotedKeysString);
                    
                }
                
                self.$refs.ChartOptionsForm.validate((validation) => {
                    if(validation){


                        console.log(self.Headers);
                        console.log(self.QueryResults);
                        console.log(self.ChartDetails.ChartOptions);


                        var testChart = echarts.init(document.getElementById("test-chart"));
                        testChart.clear();
                        testChart.setOption(self.ChartDetails.ChartOptions);

                    }
                });

            },
            FilterSourceSelection(FilterSource){
                let self = this;
                if(FilterSource == 'From Database'){

                    this.ChartFilteration.FilterData = "SELECT DISTINCT title as 'label', id FROM projects;"

                    setTimeout(function() {
                        self.enableTab('DataDropdownSQLQueryTextAreaID');
                        self.DataDropdownSQLQueryTextArea = CodeMirror.fromTextArea(document.getElementById('DataDropdownSQLQueryTextAreaID'), {
                            mode: "sql",
                            theme: "dracula",
                            indentUnit: 4,
                        });
                    }, 100);
                    
                } else {
                    this.ChartFilteration.FilterData = "";
                }

            },
            getFilterDataSQLResults(){
                let self = this;

                this.ChartFilteration.FilterData  = this.DataDropdownSQLQueryTextArea.getValue();
                console.log(this.ChartFilteration.FilterData);

                self.FilterDataRequestingData = true;
                self.FilterDataNoDataResult = false;
                self.FilterDataErrorMessage = '';
                self.FilterDataQueryResults = [];
                self.FilterDataHeaders = [];

                axios.post('/api/system_management/get_sql_response', {SQLQuery: this.ChartFilteration.FilterData})
                .then((response) => {
                    self.FilterDataQueryResults = response.data;
                    if(response.data.length != 0){
                        self.FilterDataHeaders = Object.keys(response.data[0]);
                    } else {
                        self.FilterDataNoDataResult = true;
                    }

                    self.FilterDataRequestingData = false;
                    //console.log(self.QueryResults);
                    //console.log(self.Headers);

                })
                .catch(function (error) {
                    //console.log(error.response);
                    self.FilterDataErrorMessage = error.response.data.message;
                    self.FilterDataRequestingData = false;
                    console.log(error.response.data.message);
                })

            },
            getTableColumns(TableName){
                let self = this;
                this.TableColumnsList = [];
                this.FilterColumn = "";

                axios.post('/api/system_management/get_table_columns_list', { TableName: TableName })
                    .then((response) => {
                        self.TableColumnsList = response.data;
                    });

            },
            enableTab(id) {
                var el = document.getElementById(id);
                el.onkeydown = function(e) {
                    if (e.keyCode === 9) { // tab was pressed

                        console.log(this);
                        // get caret position/selection
                        var val = this.value,
                            start = this.selectionStart,
                            end = this.selectionEnd;

                        // set textarea value to: text before caret + tab + text after caret
                        this.value = val.substring(0, start) + '\t' + val.substring(end);

                        // put caret at right position again
                        this.selectionStart = this.selectionEnd = start + 1;

                        // prevent the focus lose
                        return false;

                    }
                };
            }
		},
        computed: {
            // a computed getter
            ChartOptions: function () {

                let Options = {
                    title: {
                        text: "Temperature Chart",
                        subtext: "subtext",
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['max temp','min temp']
                    },
                    color: ["#55ce63", "#009efb"],
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',

                            boundaryGap : false,
                            data : ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                                formatter: '{value} °C'
                            }
                        }
                    ],
                    series : [
                        {
                            name:'max temp',
                            type:'line',
                            color:['#000'],
                            data:[11, 11, 15, 13, 12, 13, 10],
                            markPoint : {
                                data : [
                                    {type : 'max', name: 'Max'},
                                    {type : 'min', name: 'Min'}
                                ]
                            },
                            itemStyle: {
                                normal: {
                                    lineStyle: {
                                        shadowColor : 'rgba(0,0,0,0.3)',
                                        shadowBlur: 10,
                                        shadowOffsetX: 8,
                                        shadowOffsetY: 8 
                                    }
                                }
                            },        
                            markLine : {
                                data : [
                                    {type : 'average', name: 'Average'}
                                ]
                            }
                        },
                        {
                            name:'min temp',
                            type:'line',
                            data:[1, -2, 2, 5, 3, 2, 0],
                            markPoint : {
                                data : [
                                    {name : 'Week minimum', value : -2, xAxis: 1, yAxis: -1.5}
                                ]
                            },
                            itemStyle: {
                                normal: {
                                    lineStyle: {
                                        shadowColor : 'rgba(0,0,0,0.3)',
                                        shadowBlur: 10,
                                        shadowOffsetX: 8,
                                        shadowOffsetY: 8 
                                    }
                                }
                            }, 
                            markLine : {
                                data : [
                                    {type : 'average', name : 'Average'}
                                ]
                            }
                        }
                    ]
                };

                return this.ChartDetails.ChartOptions = JSON.stringify(Options,undefined, 2);

            }
        },
		mounted(){

            axios.get('/api/system_management/get_database_tables_list')
                .then((response) => {
                    this.SystemTablesList = response.data;
                });
            
            axios.get('/api/data/get_companies_list')
                .then((response) => {
                    this.CompaniesList = response.data;
                });

            this.enableTab('SQLQueryTextAreaID');
            this.enableTab('ChartOptionsTextAreaID');


            this.SQLQueryTextArea = CodeMirror.fromTextArea(document.getElementById('SQLQueryTextAreaID'), {
                mode: "sql",
                theme: "dracula",
                indentUnit: 4,
            });

            

            this.ChartOptionsTextArea = CodeMirror.fromTextArea(document.getElementById('ChartOptionsTextAreaID'), {
                mode: {
                    name: "javascript", 
                    json: true
                },
                indentUnit: 4,
                theme: "dracula",
                lint: true,
            });


			
		}
	}
</script>


<style>
	
	/*.search-table-outter {
        border:2px solid red;
    }
    .search-table{
        margin:0px auto 0px auto; 
    }
    .search-table, td, th{
        border-collapse:collapse;
        border:1px solid #777;
    }
    th{
        padding:20px 7px;
        font-size:15px; color:#444;
        background:#66C2E0;
    }
    td{
        padding:5px 10px;
        height:35px;
    }

    .search-table-outter { overflow-x: scroll; }
    th, td { min-width: 100px; }*/

    #SQLQueryTextArea{
        font-size: 20px;
    }

    .CodeMirror {
      border: 1px solid #eee;
      font-size: 18px;
      line-height: 18px;
      height: 100%;
    }

</style>