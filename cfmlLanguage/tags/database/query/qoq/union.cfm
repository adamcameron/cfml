<cfscript>
	q1 = queryNew("textCol,numCol");
	q2 = queryNew("textCol,numCol");
	
	for (i=1; i le 10; i=i+1){
		queryAddRow(q1);
		querySetCell(q1, "textCol", chr(64+i));
		querySetCell(q1, "numCol", i);

		queryAddRow(q2);
		querySetCell(q2, "textCol", chr(64+i));
		querySetCell(q2, "numCol", i);
	}
</cfscript>
<cfquery name="q3" dbtype="query">
	select 	*
	from	q1
	union
	select	*
	from	q2
</cfquery>
<cfdump var="#q1#">
<cfdump var="#q2#">
<cfdump var="#q3#">