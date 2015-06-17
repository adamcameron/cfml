<cffunction name="workingDays" returntype="numeric">
	<cfargument name="date1" type="date" required="true">
	<cfargument name="date2" type="date" required="true">

	<!--- if start DOW is 1 or 7, then move it to be 2 --->
	<cfset iDate1Dow = dayOfWeek(arguments.date1)>
	<cfif iDate1Dow mod 6 eq 1>
		<cfset arguments.date1 = dateAdd("d", ceiling(iDate1Dow/6), arguments.date1)>
	</cfif>

	<!--- if end DOW is 1 or 7, then move it to be 6 --->
	<cfset iDate2Dow = dayOfWeek(arguments.date2)>
	<cfif iDate2Dow mod 6 eq 1>
		<cfset arguments.date2 = dateAdd("d", -3 + ceiling(iDate2Dow/6), arguments.date2)>
	</cfif>
	
	<cfset iDiff = dateDiff("d", arguments.date1, arguments.date2)>
	<cfif iDiff ge 7>
		<cfreturn int(iDiff * (5/7))>
	<cfelse>
		<cfreturn iDiff>
	</cfif>


</cffunction>

<cfset dStart = createDate(2005, 1, 1)>


<cfloop index="i" from="0" to="365">
	<cfset dEnd = dateAdd("d", i, dStart)>
	<cfoutput>
		Start: [#dateFormat(dStart, "dddd, d/m/yyyy")#]
		End: [#dateFormat(dEnd, "dddd, d/m/yyyy")#]
		Diff: [#workingDays(dStart, dEnd)#]
		<br />
	</cfoutput>
</cfloop>