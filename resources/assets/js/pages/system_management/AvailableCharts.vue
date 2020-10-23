<template>
    
    <div class="row">

        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Charts List</h4>
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Line chart</h4>
                                    <div id="line-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Bar Chart</h4>
                                    <div id="bar-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Stack Bar Chart</h4>
                                    <div id="stackbar-chart" style="width:100%; height:600px;"></div>
                                </div>
                            </div>
                        </div>

                        
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Pie Chart</h4>
                                    <div id="pie-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Scatter Chart</h4>
                                    <div id="scatter-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Radar Chart</h4>
                                    <div id="radar-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Doughnut Chart</h4>
                                    <div id="doughnut-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Gauge 1 Chart</h4>
                                    <div id="gauge-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Gauge 2 Chart</h4>
                                    <div id="gauge2-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Funnel Chart</h4>
                                    <div id="funnel-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Sunburst Chart</h4>
                                    <div id="sunburst-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">BoxPlot Chart</h4>
                                    <div id="boxplot-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">EffectScatter Chart</h4>
                                    <div id="effectscatter-chart" style="width:100%; height:550px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Heatmap Chart</h4>
                                    <div id="heatmap-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">ThemeRiver Chart</h4>
                                    <div id="themeriver-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">PictorialBar Chart</h4>
                                    <div id="pictorialBar-chart" style="width:100%; height:400px;"></div>
                                </div>
                            </div>
                        </div>

                        
                        
                        
                    </div>
                </div>
            </div>
        </div>



       


        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>Sparkline Charts (Coming Soon)</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Total Visit</h4>
                                            <ul class="list-inline two-part">
                                                <li>
                                                    <div id="sparklinedash"></div>
                                                </li>
                                                <li class="text-right"><i class="ti-arrow-up text-success"></i> <span class="counter text-success">8659</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Total Page Views</h4>
                                            <ul class="list-inline two-part">
                                                <li>
                                                    <div id="sparklinedash2"></div>
                                                </li>
                                                <li class="text-right"><i class="ti-arrow-up text-purple"></i> <span class="counter text-purple">7469</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Unique Visitor</h4>
                                            <ul class="list-inline two-part">
                                                <li>
                                                    <div id="sparklinedash3"></div>
                                                </li>
                                                <li class="text-right"><i class="ti-arrow-up text-info"></i> <span class="counter text-info">6011</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Bounce Rate</h4>
                                            <ul class="list-inline two-part">
                                                <li>
                                                    <div id="sparklinedash4"></div>
                                                </li>
                                                <li class="text-right"><i class="ti-arrow-down text-danger"></i> <span class="text-danger">18%</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Total Visit <small class="pull-right text-success"><i class="fa fa-sort-asc"></i> 18% High then last month</small></h4>
                                            <div class="stats-row">
                                                <div class="stat-item">
                                                    <h6>Overall Growth</h6>
                                                    <b>80.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Montly</h6>
                                                    <b>15.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Day</h6>
                                                    <b>5.50%</b></div>
                                            </div>
                                            <div id="sparkline8"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Site Traffic</h4>
                                            <div class="stats-row">
                                                <div class="stat-item">
                                                    <h6>Overall Growth</h6>
                                                    <b>80.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Montly</h6>
                                                    <b>15.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Day</h6>
                                                    <b>5.50%</b></div>
                                            </div>
                                            <div id="sparkline9"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Site Visit</h4>
                                            <div class="stats-row">
                                                <div class="stat-item">
                                                    <h6>Overall Growth</h6>
                                                    <b>80.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Montly</h6>
                                                    <b>15.40%</b></div>
                                                <div class="stat-item">
                                                    <h6>Day</h6>
                                                    <b>5.50%</b></div>
                                            </div>
                                            <div id="sparkline10"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Bar Chart</h4>
                                            <div id="sparkline12" class="text-center"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Pie Chart</h4>
                                            <div id="sparkline11" class="text-center"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Composite Bar Chart</h4>
                                            <div id="sparkline13" class="text-center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card"> <!-- card-inverse card-primary -->
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Line Chart</h4>
                                            <div id="sparkline14"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Bar with different color Chart</h4>
                                            <div id="sparkline15" class="text-center"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body analytics-info">
                                            <h4 class="card-title">Line Chart</h4>
                                            <div id="sparkline16" class="text-center"></div>
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
    
    // var echarts = require('echarts');

    export default {
        name: 'available-charts',
        data(){
            return{
                logo_icon: "/assets/images/logo-icon.png",
                logo_light_icon: "/assets/images/logo-light-icon.png",
                logo_text: "/assets/images/logo-text.png",
                logo_light_text: "/assets/images/logo-light-text.png",
                img1: "/assets/images/big/img1.jpg",
                img2: "/assets/images/big/img2.jpg",
                img3: "/assets/images/big/img3.jpg",
                img4: "/assets/images/big/img4.jpg",
                user1: "/assets/images/users/1.jpg",
                user2: "/assets/images/users/2.jpg",
                user3: "/assets/images/users/3.jpg",
                user4: "/assets/images/users/4.jpg",
                user5: "/assets/images/users/5.jpg",
                user6: "/assets/images/users/6.jpg",
                user7: "/assets/images/users/7.jpg",
                user8: "/assets/images/users/8.jpg",
                weatherbg: "/assets/images/background/weatherbg.jpg",
                profile_bg: "/assets/images/background/profile-bg.jpg"
            }
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted() {

            $(function() {

        
                // ============================================================== 
                // Line chart
                // ============================================================== 
                var dom = document.getElementById("line-chart");
                var lineChart = echarts.init(dom);
                var app = {};
                var option = null;
                option = {
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

                
                lineChart.setOption(option, true), $(function() {
                        function resize() {
                            setTimeout(function() {
                                lineChart.resize()
                            }, 100)
                        }
                        $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                    });
                


                // eChart Charts 
                // ============================================================== 
                // Bar chart option
                // ============================================================== 
                
                var barChart = echarts.init(document.getElementById('bar-chart'));

                // specify chart configuration item and data
                var option = {
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['Site A','Site B']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    color: ["#55ce63", "#009efb"],
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            data : ['Jan','Feb','Mar','Apr','May','Jun','July','Aug','Sept','Oct','Nov','Dec']
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'Site A',
                            type:'bar',
                            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                            markPoint : {
                                data : [
                                    {type : 'max', name: 'Max'},
                                    {type : 'min', name: 'Min'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: 'Average'}
                                ]
                            }
                        },
                        {
                            name:'Site B',
                            type:'bar',
                            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                            markPoint : {
                                data : [
                                    {name : 'The highest year', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
                                    {name : 'Year minimum', value : 2.3, xAxis: 11, yAxis: 3}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name : 'Average'}
                                ]
                            }
                        }
                    ]
                };
                                    

                // use configuration item and data specified to show chart
                barChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    barChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // eChart Charts 
                // ============================================================== 
                // Stack Bar chart option
                // ============================================================== 
                
                var stackBarChart = echarts.init(document.getElementById('stackbar-chart'));

                var xAxisData = [];
                var data1 = [];
                var data2 = [];
                var data3 = [];
                var data4 = [];

                for (var i = 0; i < 10; i++) {
                    xAxisData.push('Class' + i);
                    data1.push((Math.random() * 2).toFixed(2));
                    data2.push(-Math.random().toFixed(2));
                    data3.push((Math.random() * 5).toFixed(2));
                    data4.push((Math.random() + 0.3).toFixed(2));
                }

                var itemStyle = {
                    normal: {
                    },
                    emphasis: {
                        barBorderWidth: 1,
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowOffsetY: 0,
                        shadowColor: 'rgba(0,0,0,0.5)'
                    }
                };

                var option = {
                    backgroundColor: '#eee',
                    legend: {
                        data: ['bar', 'bar2', 'bar3', 'bar4'],
                        align: 'left',
                        left: 10
                    },
                    toolbox: {
                        feature: {
                            magicType: {
                                type: ['stack', 'tiled']
                            },
                            dataView: {}
                        }
                    },
                    tooltip: {},
                    xAxis: {
                        data: xAxisData,
                        name: 'X Axis',
                        silent: false,
                        axisLine: {onZero: true},
                        splitLine: {show: false},
                        splitArea: {show: false}
                    },
                    yAxis: {
                        inverse: true,
                        splitArea: {show: false}
                    },
                    grid: {
                        left: 100
                    },
                    visualMap: {
                        type: 'continuous',
                        dimension: 1,
                        text: ['High', 'Low'],
                        inverse: true,
                        itemHeight: 200,
                        calculable: true,
                        min: -2,
                        max: 6,
                        top: 60,
                        left: 10,
                        inRange: {
                            colorLightness: [0.4, 0.8]
                        },
                        outOfRange: {
                            color: '#bbb'
                        },
                        controller: {
                            inRange: {
                                color: '#2f4554'
                            }
                        }
                    },
                    series: [
                        {
                            name: 'bar',
                            type: 'bar',
                            stack: 'one',
                            itemStyle: itemStyle,
                            data: data1
                        },
                        {
                            name: 'bar2',
                            type: 'bar',
                            stack: 'one',
                            itemStyle: itemStyle,
                            data: data2
                        },
                        {
                            name: 'bar3',
                            type: 'bar',
                            stack: 'two',
                            itemStyle: itemStyle,
                            data: data3
                        },
                        {
                            name: 'bar4',
                            type: 'bar',
                            stack: 'two',
                            itemStyle: itemStyle,
                            data: data4
                        }
                    ]
                };                    

                // use configuration item and data specified to show chart
                stackBarChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    stackBarChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });





                // ============================================================== 
                // Pie chart option
                // ============================================================== 
                var pieChart = echarts.init(document.getElementById('pie-chart'));

                // specify chart configuration item and data
                option = {
                   
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true, 
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    color: ["#f62d51", "#dddddd","#ffbc34", "#7460ee","#009efb", "#2f3d4a","#90a4ae", "#55ce63"],
                    calculable : true,
                    series : [
                        {
                            name:'Radius mode',
                            type:'pie',
                            radius : [20, 110],
                            center : ['25%', 200],
                            roseType : 'radius',
                            width: '40%',       // for funnel
                            max: 40,            // for funnel
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true
                                    },
                                    labelLine : {
                                        show : true
                                    }
                                }
                            },
                            data:[
                                {value:10, name:'rose1'},
                                {value:5, name:'rose2'},
                                {value:15, name:'rose3'},
                                {value:25, name:'rose4'},
                                {value:20, name:'rose5'},
                                {value:35, name:'rose6'},
                                {value:30, name:'rose7'},
                                {value:40, name:'rose8'}
                            ]
                        },
                        {
                            name:'Area mode',
                            type:'pie',
                            radius : [30, 110],
                            center : ['75%', 200],
                            roseType : 'area',
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[
                                {value:10, name:'rose1'},
                                {value:5, name:'rose2'},
                                {value:15, name:'rose3'},
                                {value:25, name:'rose4'},
                                {value:20, name:'rose5'},
                                {value:35, name:'rose6'},
                                {value:30, name:'rose7'},
                                {value:40, name:'rose8'}
                            ]
                        }
                    ]
                };
                                    
                                    

                // use configuration item and data specified to show chart
                pieChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    pieChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });





                // ============================================================== 
                // Scatter chart option
                // ============================================================== 
                var scatterChart = echarts.init(document.getElementById('scatter-chart'));

                // specify chart configuration item and data
                var option = {
                    xAxis: {},
                    yAxis: {},
                    series: [{
                        type: 'scatter',
                        symbolSize: 20,
                        data: [
                            [10.0, 8.04],
                            [8.0, 6.95],
                            [13.0, 7.58],
                            [9.0, 8.81],
                            [11.0, 8.33],
                            [14.0, 9.96],
                            [6.0, 7.24],
                            [4.0, 4.26],
                            [12.0, 10.84],
                            [7.0, 4.82],
                            [5.0, 5.68]
                        ],
                    }]
                };

                                    
                                    

                // use configuration item and data specified to show chart
                scatterChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    scatterChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // ============================================================== 
                // Radar chart option
                // ============================================================== 
                var radarChart = echarts.init(document.getElementById('radar-chart'));

                // specify chart configuration item and data

                option = {
                    
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'right',
                        y : 'bottom',
                        data:['Allocated Budget','Actual Spending']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            dataView : {show: true, readOnly: false},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    polar : [
                       {
                           indicator : [
                               { text: 'sales', max: 6000},
                               { text: 'Administration', max: 16000},
                               { text: 'Information Techology', max: 30000},
                               { text: 'Customer Support', max: 38000},
                               { text: 'Development', max: 52000},
                               { text: 'Marketing', max: 25000}
                            ]
                        }
                    ],
                    color: ["#55ce63", "#009efb"],
                    calculable : true,
                    series : [
                        {
                            name: 'Budget vs spending',
                            type: 'radar',
                            data : [
                                {
                                    value : [4300, 10000, 28000, 35000, 50000, 19000],
                                    name : 'Allocated Budget'
                                },
                                 {
                                    value : [5000, 14000, 28000, 31000, 42000, 21000],
                                    name : 'Actual Spending'
                                }
                            ]
                        }
                    ]
                };
                                    
                                    
                                    

                // use configuration item and data specified to show chart
                radarChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    radarChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // ============================================================== 
                // doughnut chart option
                // ============================================================== 
                var doughnutChart = echarts.init(document.getElementById('doughnut-chart'));

                // specify chart configuration item and data

                option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'left',
                        data:['Item A','Item B','Item C','Item D','Item E']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true, 
                                type: ['pie', 'funnel'],
                                option: {
                                    funnel: {
                                        x: '25%',
                                        width: '50%',
                                        funnelAlign: 'center',
                                        max: 1548
                                    }
                                }
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    color: ["#f62d51", "#009efb", "#55ce63", "#ffbc34", "#2f3d4a"],
                    calculable : true,
                    series : [
                        {
                            name:'Source',
                            type:'pie',
                            radius : ['80%', '90%'],
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true,
                                        position : 'center',
                                        textStyle : {
                                            fontSize : '20',
                                            fontWeight : 'bold'
                                        }
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'Item A'},
                                {value:310, name:'Item B'},
                                {value:234, name:'Item C'},
                                {value:135, name:'Item D'},
                                {value:1548, name:'Item E'}
                            ]
                        }
                    ]
                };
                                                    
                                    

                // use configuration item and data specified to show chart
                doughnutChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    doughnutChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // ============================================================== 
                // Gauge chart option
                // ============================================================== 
                var gaugeChart = echarts.init(document.getElementById('gauge-chart'));

                // specify chart configuration item and data
                var option = {
                    tooltip : {
                        formatter: "{a} <br/>{b} : {c}%"
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },

                    series : [
                        {
                            name:'Speed',
                            type:'gauge',
                            detail : {formatter:'{value}%'},
                            data:[{value: 50, name: 'Speed'}],
                            axisLine: {            // 坐标轴线
                                lineStyle: {       // 属性lineStyle控制线条样式
                                    color: [[0.2, '#55ce63'],[0.8, '#009efb'],[1, '#f62d51']], 
                                    
                                }
                            },
                            
                        }
                    ]
                };
                                                   

                // use configuration item and data specified to show chart
                gaugeChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    gaugeChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // ============================================================== 
                // Radar chart option
                // ============================================================== 
                var gauge2Chart = echarts.init(document.getElementById('gauge2-chart'));

                // specify chart configuration item and data
                option = {
                    tooltip : {
                        formatter: "{a} <br/>{b} : {c}%"
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    series : [
                        {
                            name:'Market',
                            type:'gauge',
                            splitNumber: 10,       // 分割段数，默认为5
                            axisLine: {            // 坐标轴线
                                lineStyle: {       // 属性lineStyle控制线条样式
                                    color: [[0.2, '#55ce63'],[0.8, '#009efb'],[1, '#f62d51']], 
                                    width: 8
                                }
                            },
                            axisTick: {            // 坐标轴小标记
                                splitNumber: 10,   // 每份split细分多少段
                                length :12,        // 属性length控制线长
                                lineStyle: {       // 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    color: 'auto'
                                }
                            },
                            splitLine: {           // 分隔线
                                show: true,        // 默认显示，属性show控制显示与否
                                length :30,         // 属性length控制线长
                                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            pointer : {
                                width : 5
                            },
                            title : {
                                show : true,
                                offsetCenter: [0, '-40%'],       // x, y，单位px
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder'
                                }
                            },
                            detail : {
                                formatter:'{value}%',
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    color: 'auto',
                                    fontWeight: 'bolder'
                                }
                            },
                            data:[{value: 50, name: 'Rate'}]
                        }
                    ]
                };
                                         

                // use configuration item and data specified to show chart
                gauge2Chart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    gauge2Chart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });



                // ============================================================== 
                // Funnel chart option
                // ============================================================== 
                var funnelChart = echarts.init(document.getElementById('funnel-chart'));

                // specify chart configuration item and data
                option = {
                    title: {
                        text: 'Sales Chart',
                        subtext: 'Sales Chart Subtext'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c}%"
                    },
                    toolbox: {
                        feature: {
                            dataView: {readOnly: false},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    legend: {
                        data: ['Data 1','Data 2','Data 3','Data 4','Data 5']
                    },
                    calculable: true,
                    series: [
                        {
                            name:'漏斗图',
                            type:'funnel',
                            left: '10%',
                            top: 60,
                            //x2: 80,
                            bottom: 60,
                            width: '80%',
                            // height: {totalHeight} - y - y2,
                            min: 0,
                            max: 100,
                            minSize: '0%',
                            maxSize: '100%',
                            sort: 'descending',
                            gap: 2,
                            label: {
                                show: true,
                                position: 'inside'
                            },
                            labelLine: {
                                length: 10,
                                lineStyle: {
                                    width: 1,
                                    type: 'solid'
                                }
                            },
                            itemStyle: {
                                borderColor: '#fff',
                                borderWidth: 1
                            },
                            emphasis: {
                                label: {
                                    fontSize: 20
                                }
                            },
                            data: [
                                {value: 60, name: 'Data 3'},
                                {value: 40, name: 'Data 4'},
                                {value: 20, name: 'Data 5'},
                                {value: 80, name: 'Data 2'},
                                {value: 100, name: 'Data 1'}
                            ]
                        }
                    ]
                };
                                         

                // use configuration item and data specified to show chart
                funnelChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    funnelChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });





                // ============================================================== 
                // boxplot chart option
                // ============================================================== 
                var boxPlotChart = echarts.init(document.getElementById('boxplot-chart'));

                var data = echarts.dataTool.prepareBoxplotData([
                    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
                    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
                    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
                    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
                    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
                ]);

                option = {
                    title: [
                        {
                            text: 'Michelson-Morley Experiment',
                            left: 'center',
                        },
                        {
                            text: 'upper: Q3 + 1.5 * IQR \nlower: Q1 - 1.5 * IQR',
                            borderColor: '#999',
                            borderWidth: 1,
                            textStyle: {
                                fontSize: 14
                            },
                            left: '10%',
                            top: '90%'
                        }
                    ],
                    tooltip: {
                        trigger: 'item',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    grid: {
                        left: '10%',
                        right: '10%',
                        bottom: '15%'
                    },
                    xAxis: {
                        type: 'category',
                        data: data.axisData,
                        boundaryGap: true,
                        nameGap: 30,
                        splitArea: {
                            show: false
                        },
                        axisLabel: {
                            formatter: 'expr {value}'
                        },
                        splitLine: {
                            show: false
                        }
                    },
                    yAxis: {
                        type: 'value',
                        name: 'km/s minus 299,000',
                        splitArea: {
                            show: true
                        }
                    },
                    series: [
                        {
                            name: 'boxplot',
                            type: 'boxplot',
                            data: data.boxData,
                            tooltip: {
                                formatter: function (param) {
                                    return [
                                        'Experiment ' + param.name + ': ',
                                        'upper: ' + param.data[5],
                                        'Q3: ' + param.data[4],
                                        'median: ' + param.data[3],
                                        'Q1: ' + param.data[2],
                                        'lower: ' + param.data[1]
                                    ].join('<br/>');
                                }
                            }
                        },
                        {
                            name: 'outlier',
                            type: 'scatter',
                            data: data.outliers
                        }
                    ]
                };
                                         

                // use configuration item and data specified to show chart
                boxPlotChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    boxPlotChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });





                // ============================================================== 
                // EffectScatter chart option
                // ============================================================== 
                var effectScatterChart = echarts.init(document.getElementById('effectscatter-chart'));

                function getVirtulData(year) {
                    year = year || '2017';
                    var date = +echarts.number.parseDate(year + '-01-01');
                    var end = +echarts.number.parseDate((+year + 1) + '-01-01');
                    var dayTime = 3600 * 24 * 1000;
                    var data = [];
                    for (var time = date; time < end; time += dayTime) {
                        data.push([
                            echarts.format.formatTime('yyyy-MM-dd', time),
                            Math.floor(Math.random() * 10000)
                        ]);
                    }
                    return data;
                }

                var data = getVirtulData(2016);

                option = {
                    backgroundColor: '#404a59',
                    title: {
                        top: 30,
                        text: '2016 Data',
                        subtext: 'Sub Title',
                        left: 'center',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip : {
                        trigger: 'item'
                    },
                    legend: {
                        top: '30',
                        left: '100',
                        data:['步数', 'Top 12'],
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    calendar: [{
                        top: 100,
                        left: 'center',
                        range: ['2016-01-01', '2016-06-30'],
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#000',
                                width: 4,
                                type: 'solid'
                            }
                        },
                        yearLabel: {
                            formatter: '{start}  1st',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#323c48',
                                borderWidth: 1,
                                borderColor: '#111'
                            }
                        }
                    }, {
                        top: 340,
                        left: 'center',
                        range: ['2016-07-01', '2016-12-31'],
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#000',
                                width: 4,
                                type: 'solid'
                            }
                        },
                        yearLabel: {
                            formatter: '{start}  2nd',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#323c48',
                                borderWidth: 1,
                                borderColor: '#111'
                            }
                        }
                    }],
                    series : [
                        {
                            name: '步数',
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            data: data,
                            symbolSize: function (val) {
                                return val[1] / 500;
                            },
                            itemStyle: {
                                normal: {
                                    color: '#ddb926'
                                }
                            }
                        },
                        {
                            name: '步数',
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            calendarIndex: 1,
                            data: data,
                            symbolSize: function (val) {
                                return val[1] / 500;
                            },
                            itemStyle: {
                                normal: {
                                    color: '#ddb926'
                                }
                            }
                        },
                        {
                            name: 'Top 12',
                            type: 'effectScatter',
                            coordinateSystem: 'calendar',
                            calendarIndex: 1,
                            data: data.sort(function (a, b) {
                                return b[1] - a[1];
                            }).slice(0, 12),
                            symbolSize: function (val) {
                                return val[1] / 500;
                            },
                            showEffectOn: 'render',
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            hoverAnimation: true,
                            itemStyle: {
                                normal: {
                                    color: '#f4e925',
                                    shadowBlur: 10,
                                    shadowColor: '#333'
                                }
                            },
                            zlevel: 1
                        },
                        {
                            name: 'Top 12',
                            type: 'effectScatter',
                            coordinateSystem: 'calendar',
                            data: data.sort(function (a, b) {
                                return b[1] - a[1];
                            }).slice(0, 12),
                            symbolSize: function (val) {
                                return val[1] / 500;
                            },
                            showEffectOn: 'render',
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            hoverAnimation: true,
                            itemStyle: {
                                normal: {
                                    color: '#f4e925',
                                    shadowBlur: 10,
                                    shadowColor: '#333'
                                }
                            },
                            zlevel: 1
                        }
                    ]
                };

                                         

                // use configuration item and data specified to show chart
                effectScatterChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    effectScatterChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });




                // ============================================================== 
                // Heatmap chart option
                // ============================================================== 
                var heatmapChart = echarts.init(document.getElementById('heatmap-chart'));

                function getVirtulData(year) {
                    year = year || '2017';
                    var date = +echarts.number.parseDate(year + '-01-01');
                    var end = +echarts.number.parseDate((+year + 1) + '-01-01');
                    var dayTime = 3600 * 24 * 1000;
                    var data = [];
                    for (var time = date; time < end; time += dayTime) {
                        data.push([
                            echarts.format.formatTime('yyyy-MM-dd', time),
                            Math.floor(Math.random() * 10000)
                        ]);
                    }
                    return data;
                }

                option = {
                    title: {
                        top: 30,
                        left: 'center',
                        text: '2016年某人每天的步数'
                    },
                    tooltip : {},
                    visualMap: {
                        min: 0,
                        max: 10000,
                        type: 'piecewise',
                        orient: 'horizontal',
                        left: 'center',
                        top: 65,
                        textStyle: {
                            color: '#000'
                        }
                    },
                    calendar: {
                        top: 120,
                        left: 30,
                        right: 30,
                        cellSize: ['auto', 13],
                        range: '2016',
                        itemStyle: {
                            normal: {borderWidth: 0.5}
                        },
                        yearLabel: {show: false}
                    },
                    series: {
                        type: 'heatmap',
                        coordinateSystem: 'calendar',
                        data: getVirtulData(2016)
                    }
                };

                                         

                // use configuration item and data specified to show chart
                heatmapChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    heatmapChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });






                // ============================================================== 
                // ThemeRiver chart option
                // ============================================================== 
                var themeRiverChart = echarts.init(document.getElementById('themeriver-chart'));

                option = {

                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'line',
                            lineStyle: {
                                color: 'rgba(0,0,0,0.2)',
                                width: 1,
                                type: 'solid'
                            }
                        }
                    },

                    legend: {
                        data: ['DQ', 'TY', 'SS', 'QG', 'SY', 'DD']
                    },

                    singleAxis: {
                        top: 50,
                        bottom: 50,
                        axisTick: {},
                        axisLabel: {},
                        type: 'time',
                        axisPointer: {
                            animation: true,
                            label: {
                                show: true
                            }
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                type: 'dashed',
                                opacity: 0.2
                            }
                        }
                    },

                    series: [
                        {
                            type: 'themeRiver',
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 20,
                                    shadowColor: 'rgba(0, 0, 0, 0.8)'
                                }
                            },
                            data: [['2015/11/08',10,'DQ'],['2015/11/09',15,'DQ'],['2015/11/10',35,'DQ'],
                            ['2015/11/11',38,'DQ'],['2015/11/12',22,'DQ'],['2015/11/13',16,'DQ'],
                            ['2015/11/14',7,'DQ'],['2015/11/15',2,'DQ'],['2015/11/16',17,'DQ'],
                            ['2015/11/17',33,'DQ'],['2015/11/18',40,'DQ'],['2015/11/19',32,'DQ'],
                            ['2015/11/20',26,'DQ'],['2015/11/21',35,'DQ'],['2015/11/22',40,'DQ'],
                            ['2015/11/23',32,'DQ'],['2015/11/24',26,'DQ'],['2015/11/25',22,'DQ'],
                            ['2015/11/26',16,'DQ'],['2015/11/27',22,'DQ'],['2015/11/28',10,'DQ'],
                            ['2015/11/08',35,'TY'],['2015/11/09',36,'TY'],['2015/11/10',37,'TY'],
                            ['2015/11/11',22,'TY'],['2015/11/12',24,'TY'],['2015/11/13',26,'TY'],
                            ['2015/11/14',34,'TY'],['2015/11/15',21,'TY'],['2015/11/16',18,'TY'],
                            ['2015/11/17',45,'TY'],['2015/11/18',32,'TY'],['2015/11/19',35,'TY'],
                            ['2015/11/20',30,'TY'],['2015/11/21',28,'TY'],['2015/11/22',27,'TY'],
                            ['2015/11/23',26,'TY'],['2015/11/24',15,'TY'],['2015/11/25',30,'TY'],
                            ['2015/11/26',35,'TY'],['2015/11/27',42,'TY'],['2015/11/28',42,'TY'],
                            ['2015/11/08',21,'SS'],['2015/11/09',25,'SS'],['2015/11/10',27,'SS'],
                            ['2015/11/11',23,'SS'],['2015/11/12',24,'SS'],['2015/11/13',21,'SS'],
                            ['2015/11/14',35,'SS'],['2015/11/15',39,'SS'],['2015/11/16',40,'SS'],
                            ['2015/11/17',36,'SS'],['2015/11/18',33,'SS'],['2015/11/19',43,'SS'],
                            ['2015/11/20',40,'SS'],['2015/11/21',34,'SS'],['2015/11/22',28,'SS'],
                            ['2015/11/23',26,'SS'],['2015/11/24',37,'SS'],['2015/11/25',41,'SS'],
                            ['2015/11/26',46,'SS'],['2015/11/27',47,'SS'],['2015/11/28',41,'SS'],
                            ['2015/11/08',10,'QG'],['2015/11/09',15,'QG'],['2015/11/10',35,'QG'],
                            ['2015/11/11',38,'QG'],['2015/11/12',22,'QG'],['2015/11/13',16,'QG'],
                            ['2015/11/14',7,'QG'],['2015/11/15',2,'QG'],['2015/11/16',17,'QG'],
                            ['2015/11/17',33,'QG'],['2015/11/18',40,'QG'],['2015/11/19',32,'QG'],
                            ['2015/11/20',26,'QG'],['2015/11/21',35,'QG'],['2015/11/22',40,'QG'],
                            ['2015/11/23',32,'QG'],['2015/11/24',26,'QG'],['2015/11/25',22,'QG'],
                            ['2015/11/26',16,'QG'],['2015/11/27',22,'QG'],['2015/11/28',10,'QG'],
                            ['2015/11/08',10,'SY'],['2015/11/09',15,'SY'],['2015/11/10',35,'SY'],
                            ['2015/11/11',38,'SY'],['2015/11/12',22,'SY'],['2015/11/13',16,'SY'],
                            ['2015/11/14',7,'SY'],['2015/11/15',2,'SY'],['2015/11/16',17,'SY'],
                            ['2015/11/17',33,'SY'],['2015/11/18',40,'SY'],['2015/11/19',32,'SY'],
                            ['2015/11/20',26,'SY'],['2015/11/21',35,'SY'],['2015/11/22',4,'SY'],
                            ['2015/11/23',32,'SY'],['2015/11/24',26,'SY'],['2015/11/25',22,'SY'],
                            ['2015/11/26',16,'SY'],['2015/11/27',22,'SY'],['2015/11/28',10,'SY'],
                            ['2015/11/08',10,'DD'],['2015/11/09',15,'DD'],['2015/11/10',35,'DD'],
                            ['2015/11/11',38,'DD'],['2015/11/12',22,'DD'],['2015/11/13',16,'DD'],
                            ['2015/11/14',7,'DD'],['2015/11/15',2,'DD'],['2015/11/16',17,'DD'],
                            ['2015/11/17',33,'DD'],['2015/11/18',4,'DD'],['2015/11/19',32,'DD'],
                            ['2015/11/20',26,'DD'],['2015/11/21',35,'DD'],['2015/11/22',40,'DD'],
                            ['2015/11/23',32,'DD'],['2015/11/24',26,'DD'],['2015/11/25',22,'DD'],
                            ['2015/11/26',16,'DD'],['2015/11/27',22,'DD'],['2015/11/28',10,'DD']]
                        }
                    ]
                };

                                         

                // use configuration item and data specified to show chart
                themeRiverChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    themeRiverChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });




                // ============================================================== 
                // sunburst chart option
                // ============================================================== 
                var sunburstChart = echarts.init(document.getElementById('sunburst-chart'));

                option = {
                    silent: true,
                    series: {
                        radius: ['15%', '80%'],
                        type: 'sunburst',
                        sort: null,
                        highlightPolicy: 'ancestor',
                        data: [{
                            value: 8,
                            children: [{
                                value: 4,
                                children: [{
                                    value: 2
                                }, {
                                    value: 1
                                }, {
                                    value: 1
                                }, {
                                    value: 0.5
                                }]
                            }, {
                                value: 2
                            }]
                        }, {
                            value: 4,
                            children: [{
                                children: [{
                                    value: 2
                                }]
                            }]
                        }, {
                            value: 4,
                            children: [{
                                children: [{
                                    value: 2
                                }]
                            }]
                        }, {
                            value: 3,
                            children: [{
                                children: [{
                                    value: 1
                                }]
                            }]
                        }],
                        label: {
                            color: '#fff',
                            textBorderColor: '#666',
                            textBorderWidth: 2,
                            borderColor: '#999',
                            borderWidth: 1,
                            formatter: function (param) {
                                var depth = param.treePathInfo.length;
                                if (depth === 2) {
                                    return 'radial';
                                }
                                else if (depth === 3) {
                                    return 'tangential';
                                }
                                else if (depth === 4) {
                                    return '0';
                                }
                            }
                        },
                        levels: [{}, {
                            itemStyle: {
                                color: 'red'
                            },
                            label: {
                                rotate: 'radial'
                            }
                        }, {
                            itemStyle: {
                                color: 'orange'
                            },
                            label: {
                                rotate: 'tangential'
                            }
                        }, {
                            itemStyle: {
                                color: 'yellow'
                            },
                            label: {
                                rotate: 0
                            }
                        }]
                    }
                };


                                         

                // use configuration item and data specified to show chart
                sunburstChart.setOption(option, true), $(function() {
                            function resize() {
                                setTimeout(function() {
                                    sunburstChart.resize()
                                }, 100)
                            }
                            $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                        });





                // ============================================================== 
                // pictorialBar chart option
                // ============================================================== 

                var colors = ['#5793f3', '#d14a61', '#675bba'];

                var TestingChart = echarts.init(document.getElementById('pictorialBar-chart'));

                // Generate data
                var category = [];
                var dottedBase = +new Date();
                var lineData = [];
                var barData = [];

                for (var i = 0; i < 20; i++) {
                    var date = new Date(dottedBase += 3600 * 24 * 1000);
                    category.push([
                        date.getFullYear(),
                        date.getMonth() + 1,
                        date.getDate()
                    ].join('-'));
                    var b = Math.random() * 200;
                    var d = Math.random() * 200;
                    barData.push(b)
                    lineData.push(d + b);
                }


                // option
                var option = {
                    backgroundColor: '#0f375f',
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['line', 'bar'],
                        textStyle: {
                            color: '#ccc'
                        }
                    },
                    xAxis: {
                        data: category,
                        axisLine: {
                            lineStyle: {
                                color: '#ccc'
                            }
                        }
                    },
                    yAxis: {
                        splitLine: {show: false},
                        axisLine: {
                            lineStyle: {
                                color: '#ccc'
                            }
                        }
                    },
                    series: [{
                        name: 'line',
                        type: 'line',
                        smooth: true,
                        showAllSymbol: true,
                        symbol: 'emptyCircle',
                        symbolSize: 15,
                        data: lineData
                    }, {
                        name: 'bar',
                        type: 'bar',
                        barWidth: 10,
                        itemStyle: {
                            normal: {
                                barBorderRadius: 5,
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: '#14c8d4'},
                                        {offset: 1, color: '#43eec6'}
                                    ]
                                )
                            }
                        },
                        data: barData
                    }, {
                        name: 'line',
                        type: 'bar',
                        barGap: '-100%',
                        barWidth: 10,
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: 'rgba(20,200,212,0.5)'},
                                        {offset: 0.2, color: 'rgba(20,200,212,0.2)'},
                                        {offset: 1, color: 'rgba(20,200,212,0)'}
                                    ]
                                )
                            }
                        },
                        z: -12,
                        data: lineData
                    }, {
                        name: 'dotted',
                        type: 'pictorialBar',
                        symbol: 'rect',
                        itemStyle: {
                            normal: {
                                color: '#0f375f'
                            }
                        },
                        symbolRepeat: true,
                        symbolSize: [12, 4],
                        symbolMargin: 1,
                        z: -10,
                        data: lineData
                    }]
                };


                // use configuration item and data specified to show chart
                TestingChart.setOption(option, true), $(function() {
                    function resize() {
                        setTimeout(function() {
                            TestingChart.resize()
                        }, 100)
                    }
                    $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
                });

                    
            });
















            // Sparkline Charts          
            $(function () {
                var sparklineLogin = function() { 
                    $("#sparkline1").sparkline([5,6,2,8,9,4,7,10,11,12,10], {
                        type: 'bar',
                        height: '45',
                        barWidth: 7,
                        barSpacing: 4,
                        barColor: '#99d683'
                        
                    });

                    $('#sparkline2').sparkline([20, 40, 30], {
                        type: 'pie',
                        width: '50',
                        height: '45',
                        resize: true,
                        sliceColors: ['#13dafe', '#6164c1', '#f1f2f7']
                    });

                
                    $('#sparkline3').sparkline([5, 6, 2, 9, 4, 7, 10, 12], {
                        type: 'bar',
                        height: '164',
                        barWidth: '7',
                        resize: true,
                        barSpacing: '5',
                        barColor: '#f96262'
                    });

                    
                    $("#sparkline4").sparkline([0, 23, 43, 35, 44, 45, 56, 37, 40, 45, 56, 7, 10], {
                        type: 'line',
                        width: '120',
                        height: '45',
                        lineColor: '#fb6d9d',
                        fillColor: 'transparent',
                        spotColor: '#fb6d9d',
                        minSpotColor: undefined,
                        maxSpotColor: undefined,
                        highlightSpotColor: undefined,
                        highlightLineColor: undefined
                    });  
                    
                    $('#sparkline5').sparkline([15, 23, 55, 35, 54, 45, 66, 47, 30], {
                        type: 'line',
                        width: '100%',
                        height: '160',
                        chartRangeMax: 50,
                        resize: true,
                        lineColor: '#13dafe',
                        fillColor: 'rgba(19, 218, 254, 0.3)',
                        highlightLineColor: 'rgba(0,0,0,.1)',
                        highlightSpotColor: 'rgba(0,0,0,.2)',
                    });
                
                    $('#sparkline5').sparkline([0, 13, 10, 14, 15, 10, 18, 20, 0], {
                        type: 'line',
                        width: '100%',
                        height: '160',
                        chartRangeMax: 40,
                        lineColor: '#6164c1',
                        fillColor: 'rgba(97, 100, 193, 0.3)',
                        composite: true,
                        resize: true,
                        highlightLineColor: 'rgba(0,0,0,.1)',
                        highlightSpotColor: 'rgba(0,0,0,.2)',
                    });
                    $('#sparkline6').sparkline([5, 6, 2, 8, 9, 4, 7, 10, 11, 12, 10], {
                        type: 'bar',
                        height: '45',
                        barWidth: '7',
                        barSpacing: '4',
                        barColor: '#13dafe'
                    });
                    $("#sparkline7").sparkline([0,2,8,6,8,5,6,4,8,6,4,2 ], {
                        type: 'line',
                        width: '100%',
                        height: '50',
                        lineColor: '#ffca4a',
                        fillColor: '#ffca4a',
                        highlightLineColor: 'rgba(0, 0, 0, 0.2)',
                        highlightSpotColor: '#4f4f4f'
                    });
                    $("#sparkline8").sparkline([2,4,4,6,8,5,6,4,8,6,6,2 ], {
                        type: 'line',
                        width: '100%',
                        height: '50',
                        lineColor: '#99d683',
                        fillColor: '#99d683',
                        maxSpotColor: '#99d683',
                        highlightLineColor: 'rgba(0, 0, 0, 0.2)',
                        highlightSpotColor: '#99d683'
                    });
                    $("#sparkline9").sparkline([0,2,8,6,8,5,6,4,8,6,6,2 ], {
                        type: 'line',
                        width: '100%',
                        height: '50',
                        lineColor: '#13dafe',
                        fillColor: '#13dafe',
                        minSpotColor:'#13dafe',
                        maxSpotColor: '#13dafe',
                        highlightLineColor: 'rgba(0, 0, 0, 0.2)',
                        highlightSpotColor: '#13dafe'
                    });
                    $("#sparkline10").sparkline([2,4,4,6,8,5,6,4,8,6,6,2], {
                        type: 'line',
                        width: '100%',
                        height: '50',
                        lineColor: '#6164c1',
                        fillColor: '#6164c1',
                        maxSpotColor: '#6164c1',
                        highlightLineColor: 'rgba(0, 0, 0, 0.2)',
                        highlightSpotColor: '#6164c1'
                    });
                    $('#sparkline11').sparkline([20, 40, 30], {
                        type: 'pie',
                        height: '200',
                        resize: true,
                        sliceColors: ['#13dafe', '#6164c1', '#f1f2f7']
                    });
                    
                    $("#sparkline12").sparkline([5,6,2,8,9,4,7,10,11,12,10,4,7,10], {
                    type: 'bar',
                    height: '200',
                    barWidth: 10,
                    barSpacing: 7,
                    barColor: '#99d683'
                    });

                     $('#sparkline13').sparkline([5, 6, 2, 9, 4, 7, 10, 12,4,7,10], {
                        type: 'bar',
                        height: '200',
                        barWidth: '10',
                        resize: true,
                        barSpacing: '7',
                        barColor: '#f96262'
                    });
                     $('#sparkline13').sparkline([5, 6, 2, 9, 4, 7, 10, 12,4,7,10], {
                        type: 'line',
                        height: '200',
                        lineColor: '#f96262',
                        fillColor: 'transparent',
                        composite: true,
                        highlightLineColor: 'rgba(0,0,0,.1)',
                        highlightSpotColor: 'rgba(0,0,0,.2)'
                    });
                     $("#sparkline14").sparkline([0, 23, 43, 35, 44, 45, 56, 37, 40, 45, 56, 7, 10], {
                        type: 'line',
                        width: '100%',
                        height: '200',
                        lineColor: '#42f5a7',
                        fillColor: 'transparent',
                        spotColor: '#fff',
                        minSpotColor: undefined,
                        maxSpotColor: undefined,
                        highlightSpotColor: undefined,
                        highlightLineColor: undefined
                    }); 
                     $('#sparkline15').sparkline([5, 6, 2, 8, 9, 4, 7, 10, 11, 12, 10, 9, 4, 7], {
                        type: 'bar',
                        height: '200',
                        barWidth: '10',
                        barSpacing: '10',
                        barColor: '#13dafe'
                    });
                    $('#sparkline16').sparkline([15, 23, 55, 35, 54, 45, 66, 47, 30], {
                        type: 'line',
                        width: '100%',
                        height: '200',
                        chartRangeMax: 50,
                        resize: true,
                        lineColor: '#a41dab',
                        //lineColor: '#13dafe',
                        //fillColor: 'rgba(19, 218, 254, 0.3)',
                        highlightLineColor: 'rgba(0,0,0,.1)',
                        highlightSpotColor: 'rgba(0,0,0,.2)',
                    });
                
                    $('#sparkline16').sparkline([0, 13, 10, 14, 15, 10, 18, 20, 0], {
                        type: 'line',
                        width: '100%',
                        height: '200',
                        chartRangeMax: 40,
                        lineColor: '#63209e',
                        // fillColor: 'rgba(97, 100, 193, 0.3)',
                        composite: true,
                        resize: true,
                        highlightLineColor: 'rgba(0,0,0,.1)',
                        highlightSpotColor: 'rgba(0,0,0,.2)',
                    });
                   
                    $('#sparklinedash').sparkline([ 0, 5, 6, 10, 9, 12, 4, 9], {
                        type: 'bar',
                        height: '30',
                        barWidth: '4',
                        resize: true,
                        barSpacing: '5',
                        barColor: '#00c292'
                    });
                     $('#sparklinedash2').sparkline([ 0, 5, 6, 10, 9, 12, 4, 9], {
                        type: 'bar',
                        height: '30',
                        barWidth: '4',
                        resize: true,
                        barSpacing: '5',
                        barColor: '#ab8ce4'
                    });
                      $('#sparklinedash3').sparkline([ 0, 5, 6, 10, 9, 12, 4, 9], {
                        type: 'bar',
                        height: '30',
                        barWidth: '4',
                        resize: true,
                        barSpacing: '5',
                        barColor: '#03a9f3'
                    });
                       $('#sparklinedash4').sparkline([ 0, 5, 6, 10, 9, 12, 4, 9], {
                        type: 'bar',
                        height: '30',
                        barWidth: '4',
                        resize: true,
                        barSpacing: '5',
                        barColor: '#fb9678'
                    });
                    
                }

                var sparkResize;
             
                $(window).resize(function(e) {
                    clearTimeout(sparkResize);
                    sparkResize = setTimeout(sparklineLogin, 500);
                });
                sparklineLogin();

            });
        

        }
    }

</script>



<style scoped>
    #flotcontainer {
        width: 600px;
        height: 200px;
        text-align: left;
    }
</style>