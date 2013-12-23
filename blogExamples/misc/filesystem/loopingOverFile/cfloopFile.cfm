<!--- cfloopFile.cfm --->
<cfinclude template="./makeStopwatch.cfm">
<cfset stopwatch = makeStopwatch()>
<cfset stopwatch.start()>
<cfloop index="line" file="#expandPath('./data2.txt')#">
	<cfset oneLine = line>
</cfloop>
<cfset stopwatch.stop()>
<cfdump var="#stopwatch.getTimeline()#">