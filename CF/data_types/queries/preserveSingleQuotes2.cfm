<cfset q = queryNew("inList")>
<cfset queryAddRow(q)>
<cfset querySetCell(q, "inList", "'1','2','3','4'")>
<cfset sList = q["inList"][1]>
<cfdump var='#q["inList"][1]#'>
<cfquery name="q2" datasource="hnzc">
	select *
	from	circuits
	where circuit_name not in (#preserveSingleQuotes(sList)#)
</cfquery>
<cfdump var="#q2#">