<cfthread name="t1" action="run">
	<cfset raw = new Chart().generateChart()>
	<cffile action="write" output="#raw#" file="#expandPath('./chart.png')#">
</cfthread>
<cfthread action="join" name="t1" />
<image src="chart.png">