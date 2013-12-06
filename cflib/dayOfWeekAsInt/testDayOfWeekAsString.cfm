<!--- testDayOfWeekAsString.cfm --->
<cftry>
	<cfoutput>#dayOfWeekAsString(0)#</cfoutput>
	<cfcatch>
		<cfdump var="#[cfcatch.type,cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>