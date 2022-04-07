<!--- basic.cfm --->
<cfparam name="attributes.exitMethod" default="">
executionMode: <cfoutput>#thisTag.executionMode#</cfoutput><br>
<cfif thisTag.executionMode EQ "start">
	<cfif len(attributes.exitMethod)>
		exitMethod: <cfoutput>#attributes.exitMethod#</cfoutput><br>
		<cfexit method="#attributes.exitMethod#">
	<cfelse>
		exitMethod: not specified<br>
		<cfexit>
	</cfif>
</cfif>