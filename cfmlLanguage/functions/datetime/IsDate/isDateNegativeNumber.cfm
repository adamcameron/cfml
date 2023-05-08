<cfset n = -1.234>
<cfoutput>
isDate(#n#): #isDate(n)#<br />
isValid("date", #n#): #isValid("date", n)#<br />
dateAdd("d", 0, #n#): #dateAdd("d", 0, n)#<br />
<cftry>
	parseDateTime(#n#): #parseDateTime(n)#
	<cfcatch>Failed</cfcatch>
</cftry>
<br />
</cfoutput>