<cfapplication name="shado">

<cfset q1 = application.hnzc.dms.get.value>


<cfquery name="q2" dbtype="query">
	select obj_uuid, obj_parent_uuid, obj_left, obj_right, obj_tree_uuid, obj_parent_uuid, obj_type, obj_title, obj_name, obj_metadata, obj_active
	from q1
</cfquery>

<cfquery name="q3" dbtype="query">
	select obj_uuid, obj_parent_uuid, obj_left, obj_right, obj_tree_uuid, obj_parent_uuid, obj_type, obj_title, obj_name, obj_metadata, obj_active
	from q1
	where	not (obj_left > 8672
	and		obj_right > 8673)
	
	union all

	select obj_uuid, obj_parent_uuid, obj_left+2 as obj_left, obj_right+2 as obj_right, obj_tree_uuid, obj_parent_uuid, obj_type, obj_title, obj_name, obj_metadata, obj_active
	from q1
	where	obj_left > 8672
	and		obj_right > 8673
	
	order by	obj_left

</cfquery>

<!--- <cfdump var="#q2#" label="q2">
<cfdump var="#q3#" label="q3"> --->
<cfdump var="#q2.recordCount#" label="q2.recordCount">
<cfdump var="#q3.recordCount#" label="q3.recordCount">

