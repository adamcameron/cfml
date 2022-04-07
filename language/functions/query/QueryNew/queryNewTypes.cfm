<cfset q = queryNew("iCol,sCol", "CF_SQL_INTEGER,CF_SQL_VARCHAR")>

<cfdump var="#getMetaData(q)#">

<cfset queryAddRow(q)>
<cfset querySetCell(q, "iCol", 1.5)>
<cfset querySetCell(q, "sCol", "3.0")>

<cfdump var="#q#">
