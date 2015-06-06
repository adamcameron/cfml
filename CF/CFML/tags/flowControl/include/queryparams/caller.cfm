<cfquery name="q" datasource="intranet">
	select		*
	from		tbl_objtree
	<cfinclude template="./filters.cfm">
	order by	obt_left
</cfquery>

<cfdump var="#q#">