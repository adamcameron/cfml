<!--- testOutput.cfm --->
<cffunction name="usingCfoutput">
	TEXT WITHIN usingCfoutput():<br>
	<cfoutput>#generateContent()#</cfoutput>
</cffunction>

<cffunction name="usingWriteOutput">
	TEXT WITHIN usingWriteOutput():<br>
	<cfscript>writeOutput(generateContent());</cfscript>
</cffunction>

<cffunction name="usingOutputTrue" output="true">
	TEXT WITHIN usingWriteOutput():<br>
	<cfscript>writeOutput(generateContent());</cfscript>
</cffunction>

<cffunction name="generateContent">
	<cfset var s = "">
		BEFORE CFOUTPUT<br>
		<cfoutput>IN OUTPUT<br></cfoutput>
		AFTER CFOUTPUT<br>
	<cfreturn s>
</cffunction>

<cfsetting enablecfoutputonly="true">

<cfoutput>Calling usingCfoutput():<br></cfoutput>
<cfset usingCfoutput()>

<cfoutput><hr></cfoutput>

<cfoutput>Calling usingWriteOutput():<br></cfoutput>
<cfset usingWriteOutput()>
<cfoutput><hr></cfoutput>

<cfoutput>Calling usingOutputTrue():<br></cfoutput>
<cfset usingOutputTrue()>