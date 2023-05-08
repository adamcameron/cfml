<cfstoredproc procedure="pkg_test.proc_test" datasource="intranet">
	<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" value="1">
	<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" value="one">
	<cfprocresult name="q">
</cfstoredproc>
<cfdump var="#q#" label="both params, ordered">

<cfstoredproc procedure="pkg_test.proc_test" datasource="intranet">
	<cfprocparam type="in" dbvarname="i" cfsqltype="CF_SQL_INTEGER" value="1">
	<cfprocparam type="in" dbvarname="s" cfsqltype="CF_SQL_VARCHAR" value="one">
	<cfprocresult name="q">
</cfstoredproc>
<cfdump var="#q#" label="both params, ordered & named">


<cfstoredproc procedure="pkg_test.proc_test" datasource="intranet">
	<cfprocparam type="in" dbvarname="s" cfsqltype="CF_SQL_VARCHAR" value="one">
	<cfprocresult name="q">
</cfstoredproc>
<cfdump var="#q#" label="second param, named">