<!--- medalsChart.cfm --->

<cfchart chartheight="400" chartwidth="400" title="Medals at the Olympics @ 2/8/2012" format="html" seriesplacement="stacked">
	<cfchartseries label="Bronze" type="bar" seriescolor="8C7853">
		<cfchartdata item="NZ" value="2">
		<cfchartdata item="GB" value="4">
		<cfchartdata item="USA" value="10">
	</cfchartseries>
	<cfchartseries label="Silver" type="bar" seriescolor="E6E8FA">
		<cfchartdata item="NZ" value="0">
		<cfchartdata item="GB" value="6">
		<cfchartdata item="USA" value="9">
	</cfchartseries>
	<cfchartseries label="Gold" type="bar" seriescolor="CD7F32">
		<cfchartdata item="NZ" value="1">
		<cfchartdata item="GB" value="5">
		<cfchartdata item="USA" value="18">
	</cfchartseries>
</cfchart>