<cfset l = "">
<cfquery name="q" datasource="intranet" result="st">
	select	*
	from	circuits
	where	uuid in (<cfqueryparam value="#l#" cfsqltype="CF_SQL_VARCHAR" list="true">)
	and circuit_title =
</cfquery>
<cfdump var="#variables#">