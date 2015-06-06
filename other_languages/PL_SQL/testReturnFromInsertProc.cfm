<cfset dsn = "intranet">

<cfset uData = createUuid()>
<cfstoredproc procedure="PKG_TEST.PROC_INSERT2" result="stResult" datasource="#dsn#">
	<cfprocparam type="IN"	value="#uData#" cfsqltype="CF_SQL_VARCHAR">
	<cfprocparam type="OUT" variable="iId" cfsqltype="CF_SQL_INTEGER">
	<cfprocparam type="OUT" variable="sCode" cfsqltype="CF_SQL_VARCHAR">
</cfstoredproc>

<cfdump var="#variables#">