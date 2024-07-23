<cfscript>
	q1 = queryNew("iCol,fCol", "integer,double");
	queryAddRow(q1);
	q1.icol[1] = 42;
	q1.fcol[1] = 3.141592;
</cfscript>
<cfquery name="q2" dbtype="query">
	select	*
	from	q1
	where	icol > fcol
</cfquery>
<cfdump var="#q2#">