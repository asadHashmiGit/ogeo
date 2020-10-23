<template>
    
    <div class="page-wrapper">
        <div class="container-fluid">
        
            <div class="row page-titles">
                <div class="col-md-12 col-lg-5 col-xlg-5 align-self-center">
                    <h3 class="text-themecolor">Dashboard</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>


            <div class="row">
            
                <div v-for="(Chart, index) in ChartsResults" :class="Chart.ColumnWidth"  >
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div v-for="(FilterVariable, key) in Chart.FilterationVariables" :class="FilterVariable.FilterData != 'FilterDataDateRangePicker' ? 'col-lg-3': 'col-lg-6'">

                                    <select v-if="FilterVariable.FilterData != 'FilterDataDateRangePicker'" :class="'form-control filters_of_'+Chart.ChartID" :data-filternumber="FilterVariable.FilterNumber" :id="'select-'+Chart.ChartID+'-'+FilterVariable.FilterNumber" style="width: 100%; padding: 0px;" @change="UpdateChartByFilter(Chart.ChartID, FilterVariable.FilterNumber, $event)" placeholder="Select Option">
                                        <option v-for="(option, index) in FilterVariable.FilterData" :label="option.label" :value="option.id"></option>
                                    </select>


                                    <el-date-picker
                                      v-else
                                      :class="'filters_of_'+Chart.ChartID"
                                      :data-filternumber="FilterVariable.FilterNumber"
                                      :id="'select-'+Chart.ChartID+'-'+FilterVariable.FilterNumber"
                                      style="width: 100%"
                                      v-model="DatePickers"
                                      type="datetimerange"
                                      @change="UpdateChartByFilter(Chart.ChartID, FilterVariable.FilterNumber, $event)"
                                      range-separator="-"
                                      start-placeholder="Start date"
                                      end-placeholder="End date"
                                      :default-time="['00:00:00', '23:59:59']"
                                      value-format="yyyy-MM-dd HH:mm:ss">
                                    </el-date-picker>

                                </div>
                                <div class="col-lg-12">
                                    <br>
                                    <div :id="'chart-'+Chart.ChartID" style="width:100%; min-height:400px;"></div>
                                </div>
                                <div align="center" v-if="RequestingData">
                                    <h2>Gathering Data...</h2>
                                    <img align="center" :src="hostName+'/assets/images/ajax-loader.gif'">
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
    
    //import {CustomJs} from '../../helpers/custom.js';
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
        name: 'dashboard',
        data(){
            return{
                ChartSelectFilters: {},
                DatePickers: ['2019-01-01', '2019-12-31'],
                RequestingData: false,
                ChartsResults: [],
                ErrorMessage: '',
                hostName: window.location.protocol+'//'+window.location.hostname,
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        methods: {
            UpdateChartByFilter(ChartID, FilterNumber, FilterValue){
                let self = this;
                let FiltersValues = {};

                //get all other filters data
                $('.filters_of_'+ChartID).each(function(index, selectfilter) {
                    console.log($(this).data("filternumber"))
                    console.log($(this).val())
                    FiltersValues[$(this).data("filternumber")] = $(this).val();
                });

                $.each(FiltersValues, function(index, val) {
                    if(index == '$dateRange1'){
                        FiltersValues[index] = self.DatePickers;
                    }
                });

                console.log(FiltersValues);

                
                axios.post('/api/data/update_chart_data', {
                        ChartID: ChartID,
                        FiltersValues: FiltersValues,
                        FilterValue: FilterValue })
                    .then((response) => {
                        var testChart = echarts.init(document.getElementById("chart-"+ChartID));
                        testChart.clear();
                        testChart.setOption(response.data.ChartOptions);
                    });
            }
        },
        mounted() {

            let self = this;
            self.RequestingData = true;
            self.ErrorMessage = '';

            axios.get('/api/data/get_user_dashboard_reports')
                .then((response) => {

                    $.each(response.data, function(index, Chart) {
                        $.each(Chart.FilterationVariables, function(key, FilterationVariable) {
                            self.ChartSelectFilters[Chart.ChartID] = FilterationVariable.FilterNumber;
                        });
                    });

                    console.log(response.data);
                    console.log(self.ChartSelectFilters);
                    self.ChartsResults = response.data;

                    self.$nextTick(() => {

                        $.each(self.ChartsResults, function(index, Chart) {
                            var testChart = echarts.init(document.getElementById("chart-"+Chart.ChartID));
                            testChart.clear();
                            testChart.setOption(Chart.ChartOptions);
                        });
                    })

                    self.RequestingData = false;

                })
                .catch(function (error) {
                    //console.log(error.response);
                    self.ErrorMessage = error.response;
                    self.RequestingData = false;
                    console.log(error);
                })
            
        }
    }
</script>


<style scoped>
    
    .el-date-picker.has-sidebar.has-time {
        width: 700px;
    }

</style>