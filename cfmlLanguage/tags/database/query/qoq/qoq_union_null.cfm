<cfquery name="q1" datasource="hnzc">
	select	dct_title
	from	dms_category
	where	dct_uuid is null
</cfquery>

<cfquery name="q2" datasource="hnzc">
	select	dfg_title
	from	dms_group
</cfquery>

<cfquery name="q3" dbtype="query">
	select	dct_title as obj_title
	from	q1
	
	union all
	select	dfg_title as obj_title
	from	q2
</cfquery>
<cfdump var="#q3#">