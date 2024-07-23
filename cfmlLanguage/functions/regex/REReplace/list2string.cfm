<cfset s = "modify">
<cfset result = reReplace(s, "([^\b,])[^\b,]*(,|\b)", "\1", "ALL")>

<cfdump var="#result#">