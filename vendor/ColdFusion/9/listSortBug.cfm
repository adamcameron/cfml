<cfset l1 = "3.6.1,3.6.5,3.6.100,3.6.3,3.6.10">
<cfset l2 = listSort(l1, "numeric", "desc")>

<cfset n = val("3.6.1")>
<cfset b1 = isNumeric("3.6.1")>
<cfset b2 = isNumeric("3")>
<cfdump var="#variables#">