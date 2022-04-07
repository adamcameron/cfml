<cfstoredproc procedure="mysp" datasource="dsn" result="myResult">
	<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="myparam1" value="myVal1">
	<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="myparam1" value="2">
	<cfprocparam type="out" cfsqltype="CF_SQL_VARCHAR" variable="s">
	<cfprocparam type="out" cfsqltype="CF_SQL_INTEGER" variable="i">
</cfstoredproc>