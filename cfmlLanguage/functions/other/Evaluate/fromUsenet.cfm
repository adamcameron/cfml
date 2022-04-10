<cfset check = "&##10004;">
<cfset cross = "&##10008;">

<cfset variables[check] = "foo">
<cfset variables[cross] = "bar">

<cfset is_public = 1>

<cfoutput>#IIF(is_public IS NOT 0, "check", "cross")#</cfoutput>
