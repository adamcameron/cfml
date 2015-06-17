<cfset strValue = "">
<cfset strRegEx = "">

<cfset stMatch = REFind(strRegEx, strValue, 0, true)>

<cfdump var="#stMatch#" label="#getTickCount()#">
<cfabort>
<!---
<cfif >
 Found!

<cfelse>

Not Found!

</cfif> --->