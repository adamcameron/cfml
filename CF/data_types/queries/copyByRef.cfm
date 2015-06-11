<cfset q1 = queryNew("col")>
<cfset q2 = q1>

<cfset queryAddRow(q1)>
<cfset querySetCell(q1, "col", createUUID())>

<cfdump var="#variables#">