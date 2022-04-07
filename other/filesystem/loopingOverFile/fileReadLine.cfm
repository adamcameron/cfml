<!--- fileReadLine.cfm --->
<cfinclude template="./makeStopwatch.cfm">
<cfset stopwatch = makeStopwatch()>
<cfset stopwatch.start()>
<cfset fileHandle = fileOpen(expandPath("./data.txt"), "read")>
<cfloop condition="NOT fileIsEOF(fileHandle)">
	<cfset line = fileReadLine(fileHandle)>
	<cfset oneLine = line>
</cfloop>
<cfset stopwatch.stop()>
<cfdump var="#stopwatch.getTimeline()#">