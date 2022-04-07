<cfstoredproc datasource="demoshado" procedure="proc_objtree_movenode" result="qNew">
	<cfprocparam variable="iSource" cfsqltype="CF_SQL_INTEGER" value="765" type="in">
	<cfprocparam variable="iDestination" cfsqltype="CF_SQL_INTEGER" value="768" type="in">
	<cfprocparam variable="sPosition" cfsqltype="CF_SQL_VARCHAR" value="WITHIN" type="in">
</cfstoredproc>

<cfdump var="#variables#" label="variables">
