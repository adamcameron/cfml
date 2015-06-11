<cfquery name="q1" datasource="intranet">
	select	*
	from	tbl_junk
</cfquery>

<cfquery name="q2" dbtype="query">
	select	*
	from	q1
	where	fcol = icol
</cfquery>
<cfdump var="#q1#">