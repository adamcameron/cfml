<cfquery name="q" datasource="hnzc">
	select 	*
	from	dms_category
</cfquery>

<cfquery name="qoq" dbtype="query">
	select	*
	from	q
	where	dct_title like '%z%'
</cfquery>

<cfdump var="#qoq#">