<cfscript>
	// cfchartSeries.cfm
	chartData = queryNew("");

	queryAddColumn(chartData, "id", "Integer", [1,2,3,4,5]);
	queryAddColumn(chartData, "series1", "Integer", [100,90,80,90,100]);
	queryAddColumn(chartData, "series2", "Integer", [90,80,70,60,50]);
	queryAddColumn(chartData, "series3", "Integer", [80,70,70,70,80]);
	queryAddColumn(chartData, "series4", "Integer", [70,60,80,80,70]);
</cfscript>

<cfchart chartwidth="640" chartheight="480" format="png">
	<cfchartseries query="chartData" type="Bar" itemcolumn="id" valuecolumn="series3">
	<cfchartseries query="chartData" type="Bar" itemcolumn="id" valuecolumn="series4">
	<cfchartseries query="chartData" type="Line" itemcolumn="id" valuecolumn="series1">
	<cfchartseries query="chartData" type="Line" itemcolumn="id" valuecolumn="series2">
</cfchart>