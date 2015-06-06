<cfquery name="q" datasource="intranet">
	with u as (
		select *
		from user_tables
	), a as (
		select *
		from all_tables
	)
	select a.owner, a.table_name, a.tablespace_name
	from a inner join u
	on a.table_name = u.table_name
</cfquery>

<cfdump var="#q#">