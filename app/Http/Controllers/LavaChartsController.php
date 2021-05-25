<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LavaChartsController extends Controller
{
     /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function Charts()
    {


		$population = \Lava::DataTable();

		$population->addDateColumn('Year')
		           ->addNumberColumn('Number of People')
		           ->addRow(['2006-01-01', 623452])
		           ->addRow(['2007-01-01', 685034])
		           ->addRow(['2008-01-01', 716845])
		           ->addRow(['2009-01-01', 757254])
		           ->addRow(['2010-01-01', 778034])
		           ->addRow(['2011-01-01', 792353])
		           ->addRow(['2012-01-01', 839657])
		           ->addRow(['2013-01-01', 842367])
		           ->addRow(['2014-01-01', 873490]);

		\Lava::AreaChart('Population', $population, [
		    'title' => 'Population Growth',
		    'legend' => [
		        'position' => 'in'
		    ]
		]);


		$votes  = \Lava::DataTable();

		$votes->addStringColumn('Food Poll')
		      ->addNumberColumn('Votes')
		      ->addRow(['Tacos',  rand(1000,5000)])
		      ->addRow(['Salad',  rand(1000,5000)])
		      ->addRow(['Pizza',  rand(1000,5000)])
		      ->addRow(['Apples', rand(1000,5000)])
		      ->addRow(['Fish',   rand(1000,5000)]);

		\Lava::BarChart('Votes', $votes);



		$sales = \Lava::DataTable();

		$sales->addDateColumn('Date')
		      ->addNumberColumn('Orders');

		foreach (range(2, 5) as $month) {
		    for ($a=0; $a < 20; $a++) {
		        $day = rand(1, 30);
		        $sales->addRow(["2014-${month}-${day}", rand(0,100)]);
		    }
		}

		\Lava::CalendarChart('Sales', $sales, [
		    'title' => 'Cars Sold',
		    'unusedMonthOutlineColor' => [
		        'stroke'        => '#ECECEC',
		        'strokeOpacity' => 0.75,
		        'strokeWidth'   => 1
		    ],
		    'dayOfWeekLabel' => [
		        'color'    => '#4f5b0d',
		        'fontSize' => 16,
		        'italic'   => true
		    ],
		    'noDataPattern' => [
		        'color' => '#DDD',
		        'backgroundColor' => '#11FFFF'
		    ],
		    'colorAxis' => [
		        'values' => [0, 100],
		        'colors' => ['black', 'green']
		    ]
		]);



		$finances = \Lava::DataTable();

		$finances->addDateColumn('Year')
		         ->addNumberColumn('Sales')
		         ->addNumberColumn('Expenses')
		         ->setDateTimeFormat('Y')
		         ->addRow(['2004', 1000, 400])
		         ->addRow(['2005', 1170, 460])
		         ->addRow(['2006', 660, 1120])
		         ->addRow(['2007', 1030, 54]);

		\Lava::ColumnChart('Finances', $finances, [
		    'title' => 'Company Performance',
		    'titleTextStyle' => [
		        'color'    => '#eb6b2c',
		        'fontSize' => 14
		    ]
		]);


		$finances = \Lava::DataTable();

		$finances->addDateColumn('Year')
		         ->addNumberColumn('Sales')
		         ->addNumberColumn('Expenses')
		         ->addNumberColumn('Net Worth')
		         ->addRow(['2009-1-1', 1100, 490, 1324])
		         ->addRow(['2010-1-1', 1000, 400, 1524])
		         ->addRow(['2011-1-1', 1400, 450, 1351])
		         ->addRow(['2012-1-1', 1250, 600, 1243])
		         ->addRow(['2013-1-1', 1100, 550, 1462]);

		\Lava::ComboChart('Finances', $finances, [
		    'title' => 'Company Performance',
		    'titleTextStyle' => [
		        'color'    => 'rgb(123, 65, 89)',
		        'fontSize' => 16
		    ],
		    'legend' => [
		        'position' => 'in'
		    ],
		    'seriesType' => 'bars',
		    'series' => [
		        2 => ['type' => 'line']
		    ]
		]);


		$reasons = \Lava::DataTable();

		$reasons->addStringColumn('Reasons')
		        ->addNumberColumn('Percent')
		        ->addRow(['Check Reviews', 5])
		        ->addRow(['Watch Trailers', 2])
		        ->addRow(['See Actors Other Work', 4])
		        ->addRow(['Settle Argument', 89]);

		\Lava::DonutChart('IMDBDount', $reasons, [
		    'title' => 'Reasons I visit IMDB'
		]);


		$temps = \Lava::DataTable();

		$temps->addStringColumn('Type')
		      ->addNumberColumn('Value')
		      ->addRow(['CPU', rand(0,100)])
		      ->addRow(['Case', rand(0,100)])
		      ->addRow(['Graphics', rand(0,100)]);

		\Lava::GaugeChart('TempsGaugeChart', $temps, [
		    'width'      => 400,
		    'greenFrom'  => 0,
		    'greenTo'    => 69,
		    'yellowFrom' => 70,
		    'yellowTo'   => 89,
		    'redFrom'    => 90,
		    'redTo'      => 100,
		    'majorTicks' => [
		        'Safe',
		        'Critical'
		    ]
		]);





		$reasons = \Lava::DataTable();

		$reasons->addStringColumn('Reasons')
		        ->addNumberColumn('Percent')
		        ->addRow(['Check Reviews', 5])
		        ->addRow(['Watch Trailers', 2])
		        ->addRow(['See Actors Other Work', 4])
		        ->addRow(['Settle Argument', 89]);

		\Lava::PieChart('IMDBPieChart', $reasons, [
		    'title'  => 'Reasons I visit IMDB',
		    'is3D'   => true,
		    'slices' => [
		        ['offset' => 0.2],
		        ['offset' => 0.25],
		        ['offset' => 0.3]
		    ]
		]);


		$temperatures = \Lava::DataTable();

		$temperatures->addDateColumn('Date')
		             ->addNumberColumn('Max Temp')
		             ->addNumberColumn('Mean Temp')
		             ->addNumberColumn('Min Temp')
		             ->addRow(['2014-10-1',  67, 65, 62])
		             ->addRow(['2014-10-2',  68, 65, 61])
		             ->addRow(['2014-10-3',  68, 62, 55])
		             ->addRow(['2014-10-4',  72, 62, 52])
		             ->addRow(['2014-10-5',  61, 54, 47])
		             ->addRow(['2014-10-6',  70, 58, 45])
		             ->addRow(['2014-10-7',  74, 70, 65])
		             ->addRow(['2014-10-8',  75, 69, 62])
		             ->addRow(['2014-10-9',  69, 63, 56])
		             ->addRow(['2014-10-10', 64, 58, 52])
		             ->addRow(['2014-10-11', 59, 55, 50])
		             ->addRow(['2014-10-12', 65, 56, 46])
		             ->addRow(['2014-10-13', 66, 56, 46])
		             ->addRow(['2014-10-14', 75, 70, 64])
		             ->addRow(['2014-10-15', 76, 72, 68])
		             ->addRow(['2014-10-16', 71, 66, 60])
		             ->addRow(['2014-10-17', 72, 66, 60])
		             ->addRow(['2014-10-18', 63, 62, 62]);

		\Lava::LineChart('TempsLineChart', $temperatures, [
		    'title' => 'Weather in October'
		]);


		$datatable = \Lava::DataTable();
		$datatable->addNumberColumn('Age');
		$datatable->addNumberColumn('Weight');

		for ($i=0; $i < 30; $i++) {
		    $datatable->addRow([rand(20,30), rand(150,250)]);
		}

		\Lava::ScatterChart('AgeWeight', $datatable, [
		    'width' => 400,
		    'legend' => [
		        'position' => 'none'
		    ],
		    'hAxis' => [
		        'title' => 'Age'
		    ],
		    'vAxis' => [
		        'title' => 'Weight'
		    ]
		]);



		// addStringColumn
		// addDateColumn
		// addDateTimeColumn
		// addNumberColumn
		// addTimeOfDayColumn
		// addBooleanColumn
		// addRoleColumn


		/* Table Charts */

		# Table Types: 
			#FromOneTableNormalList
			#FromOneTableAggregateList
			#FromMultipleTableNormalList
			#FromMultipleTableAggregateList
		$TableType = 'FromOneTableNormalList'; 
		$tableName = 'users';

		$ColumnsTypes = [
			'Name' => 'addStringColumn',
			'Created At' => 'addDateColumn',
		];

		/* This Should be an array */
		$Header1 = "In-Active";
		$tableColumnName1 = 'company_id';
		$Operation1 = '=';
		$Value1 = null;

		$Header2 = "Active";
		$tableColumnName2 = 'company_id';
		$Operation2 = '!=';
		$Value2 = null;
		

		$DataTable = \Lava::DataTable();

		foreach ($ColumnsTypes as $ColumnTitle => $ColumnType) {
			if($ColumnType == 'addStringColumn'){
				$DataTable->addStringColumn($ColumnTitle);
			} elseif ($ColumnType == 'addDateColumn') {
				$DataTable->addDateColumn($ColumnTitle);
			} elseif ($ColumnType == 'addDateTimeColumn') {
				$DataTable->addDateTimeColumn($ColumnTitle);
			} elseif ($ColumnType == 'addNumberColumn') {
				$DataTable->addNumberColumn($ColumnTitle);
			} elseif ($ColumnType == 'addTimeOfDayColumn') {
				$DataTable->addTimeOfDayColumn($ColumnTitle);
			} elseif ($ColumnType == 'addBooleanColumn') {
				$DataTable->addBooleanColumn($ColumnTitle);
			} elseif ($ColumnType == 'addRoleColumn') {
				$DataTable->addRoleColumn($ColumnTitle);
			}
		}

		$DataTable->setDateTimeFormat('Y-m-d');
		$DataTable->addRow(['2006-01-01', 623452]);
		$DataTable->addRow(['2007-01-01', 685034]);
		$DataTable->addRow(['2008-01-01', 716845]);
		$DataTable->addRow(['2009-01-01', 757254]);
		$DataTable->addRow(['2010-01-01', 778034]);
		$DataTable->addRow(['2011-01-01', 792353]);
		$DataTable->addRow(['2012-01-01', 839657]);
		$DataTable->addRow(['2013-01-01', 842367]);
		$DataTable->addRow(['2014-01-01', 873490]);

		$Test = \Lava::TableChart('UsersList', $DataTable, [
		    'title' => 'Users List',
		    'titleTextStyle'	=> [
		    	'fontName' 	=> 'Arial',
		        'fontColor'	=> '#eb6b2c',
		        'fontSize' 	=> 14
		    ],
		    'legend' => [
		        'position' => 'top'
		    ]
		]);


		// $formatter = \Lava::NumberFormat
		//     'fractionDigit' => 2,
		//     'suffix' => '%'
		// ]);

		
		/* PieChart */
		$tableName = 'users';

		/* This Should be an array */
		$Header1 = "In-Active";
		$tableColumnName1 = 'company_id';
		$Operation1 = '=';
		$Value1 = null;

		$Header2 = "Active";
		$tableColumnName2 = 'company_id';
		$Operation2 = '!=';
		$Value2 = null;

		# PieChart Options
		$pieChartTitle = 'Active Vs Inactive Users';
		$Chart3d = true;
		$slicesOffset = [
			['offset' => 0.1],
	        ['offset' => 0.1],
	        ['offset' => 0.1]
	    ];

		$chart = \Lava::DataTable();
		$chart->addStringColumn('Users');
		$chart->addNumberColumn('Count');
		/* we should have a loop for the lenght of array Should be an array */
		$chart->addRow([$Header1, DB::table($tableName)->where($tableColumnName1, $Operation1, $Value1)->count()]);
		$chart->addRow([$Header2, DB::table($tableName)->where($tableColumnName2, $Operation2, $Value2)->count()]);
		\Lava::PieChart('activeusers', $chart, [
		    'title'  => $pieChartTitle,
		    'is3D'   => $Chart3d,
		    'slices' => $slicesOffset,
		    'legend' => [
		        'position' => 'top'
		    ]
		]);















        return view('charts');
    }
}
