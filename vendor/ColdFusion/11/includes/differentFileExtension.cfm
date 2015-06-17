<cfset message = "before include">
<cfoutput>#message#</cfoutput><br>
<cfinclude template="cfmlCode.inc">
<cfset message = "after include">
<cfoutput>#message#</cfoutput><br>