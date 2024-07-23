<cfset dStart = createDateTime(2009, 3, 28, 12, 0, 00)>
<cfdump var="#variables#">
<cfset dEnd = dateAdd("h", 24, dStart)>
<cfloop index="i" from="#dStart#" to="#dEnd#" step="#createTimeSpan(0, 1, 0, 0)#">
	<cfset dThis = i>
	<cfoutput>#dateFormat(dThis, "yyyy-mm-dd")# #timeFormat(dThis, "HH:MM:SS.LLL")#<br/></cfoutput>
</cfloop>