<cf_timeit>
<cfdbinfo datasource="intranet" type="tables" name="t">
</cf_timeit>
<cfdump var="#t#" expand="false">
<!---
<cf_timeit>
<cfquery name="q" dbtype="query">
	select 		*
	from		t
	where		table_type = 'TABLE'
	order by	table_name
</cfquery>
</cf_timeit>
<cfdump var="#q#" expand="false">
 --->
<!---

<cf_timeit>
<cfquery name="q2"datasource="intranet">
	select 		owner, table_name
	from		all_tables
	order by	table_name
</cfquery>
</cf_timeit>
<cfdump var="#q2#"> --->