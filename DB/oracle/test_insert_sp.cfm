<cfquery datasource="demoshado">
	delete from tbl_objtree
</cfquery>

<cfstoredproc datasource="demoshado" procedure="proc_objtree_insert" result="qNew">
	<cfprocparam variable="iObtLeft" cfsqltype="CF_SQL_INTEGER" value="6666" type="in">
	<cfprocparam variable="iObtRight" cfsqltype="CF_SQL_INTEGER" value="7777" type="in">
	<cfprocparam variable="iObtParentId" cfsqltype="CF_SQL_INTEGER" value="8888" type="in">
	<cfprocparam variable="uObtUuid" cfsqltype="CF_SQL_VARCHAR" value="aaaa" type="in">
	<cfprocparam variable="sObtType" cfsqltype="CF_SQL_VARCHAR" value="SECTION" type="in">
	<cfprocparam variable="iNew" cfsqltype="CF_SQL_INTEGER" type="out">
</cfstoredproc>

<cfdump var="#variables#" label="variables">
