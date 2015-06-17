<cfset s="12345">
<cfset l=REreplace(s, "(.)", "\1,", "ALL")>
<cfdump var="#l#">