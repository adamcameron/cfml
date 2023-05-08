<!--- writeOutput.cfm --->
<cffunction name="usingWriteOutput" output="true">
	TEXT WITHIN usingWriteOutput():<br>
	<cfscript>writeOutput(generateContent());</cfscript>
</cffunction>

<cffunction name="generateContent" output="false">
	<cfset var s = "">
	<cfsavecontent variable="s">
		BEFORE CFOUTPUT<br>
		<cfoutput>IN OUTPUT<br></cfoutput>
		AFTER CFOUTPUT<br>
	</cfsavecontent>
	<cfreturn s>
</cffunction>

<cfsetting enablecfoutputonly="true">

<cfoutput>Calling usingWriteOutput():<br></cfoutput>
<cfset usingWriteOutput()>