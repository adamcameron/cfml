<!--- Chart.cfc --->
<cfcomponent>
	
	<cffunction name="generateChart" access="public" returntype="binary">
		<cfchart name="cfChartData" format="png" chartWidth="650" chartHeight="200" rotated="yes" show3d="false">
			<cfchartseries type="bar">
				<cfchartdata item="item 1" value="#randRange(1,10)*5#">   
				<cfchartdata item="item 2" value="#randRange(1,10)*5#">   
				<cfchartdata item="item 3" value="#randRange(1,10)*5#">   
				<cfchartdata item="item 4" value="#randRange(1,10)*5#">                           
			</cfchartseries>
		</cfchart>
		<cfreturn cfChartData>  		
	</cffunction>
	
	<cffunction name="generateChartProxy" access="remote" returntype="binary">
		<cfset var chart = generateChart()>
		<cfcontent variable="#toBinary(toBase64(chart))#" type="image/png" reset="true">
	</cffunction>
	
	<cffunction name="writeChartToFile" access="public" returntype="void">
		<cfargument name="fileName" type="string" required="true">
		<cffile action="write" output="#generateChart()#" file="C:\temp\#arguments.fileName#.png">
	</cffunction>
	
</cfcomponent>