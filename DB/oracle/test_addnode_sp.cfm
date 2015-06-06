<cfquery datasource="demoshado">
	delete from tbl_objtree
</cfquery>
<cfquery datasource="demoshado">
	insert into tbl_objtree(
		obt_id, obt_left, obt_right, obt_uuid, obt_type
	) values (
		seq_obt_id.nextVal, 1, 2, '00000000-0000-0000-0000-000000000000', 'ROOT'
	)
</cfquery>
<cfquery name="qGetId" datasource="demoshado">
	select obt_id
	from	tbl_objtree
</cfquery>

<cfstoredproc datasource="demoshado" procedure="proc_objtree_addnode" result="qNew">
	<cfprocparam variable="iDestination" cfsqltype="CF_SQL_INTEGER" value="#qGetId.obt_id#" type="in">
	<cfprocparam variable="uObtUuid" cfsqltype="CF_SQL_VARCHAR" value="11111111-1111-1111-1111-111111111111" type="in">
	<cfprocparam variable="sObtType" cfsqltype="CF_SQL_VARCHAR" value="SECTION" type="in">
	<cfprocparam variable="sPosition" cfsqltype="CF_SQL_VARCHAR" value="WITHIN" type="in">
	<cfprocparam variable="iNew" cfsqltype="CF_SQL_INTEGER" type="out">
</cfstoredproc>

<cfdump var="#variables#" label="variables">