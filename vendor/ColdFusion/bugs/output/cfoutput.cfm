<!--- cfoutput.cfm --->
<cffunction name="usingCfoutput" output="true">
	TEXT WITHIN usingCfoutput():<br>
	<cfoutput>#generateContent()#</cfoutput>
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

<cfoutput>Calling usingCfoutput():<br></cfoutput>
<cfset usingCfoutput()>