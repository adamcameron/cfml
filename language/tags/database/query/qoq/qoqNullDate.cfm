<cfscript>
	q1 = queryNew("pkCol,dateCol");
	
	for (i=1; i le 10; i=i+1){
		queryAddRow(q1);
		querySetCell(q1, "pkCol", i);
		if (i mod 2){
			querySetCell(q1, "dateCol", dateAdd("d", i, now()));
		}
	}
</cfscript>
<cfdump var="#q1#">

<cfquery name="q2" dbtype="query">
	select		*
	from		q1
	where		dateCol = '{ts \'2004-04-17 17:01:18\'}'
	order by	dateCol
</cfquery>
<cfdump var="#q2#">
