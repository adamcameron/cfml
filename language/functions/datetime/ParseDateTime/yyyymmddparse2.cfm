<cfset sDate = "20090223">
<cftry>
	<cfset d = parseDateTime(reReplace(sDate, "(\d{4})(\d{2})(\d{2})", "\1-\2-\3", "ONE"))>
	<cfoutput>#dateFormat(d, "dddd, d, mmm yyyy")#</cfoutput>
	<cfcatch>
		Invalid formart <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>