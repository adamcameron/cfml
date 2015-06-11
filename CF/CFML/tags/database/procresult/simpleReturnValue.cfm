<cfstoredproc datasource="scratch" procedure="usp_return_simple" result="stResult1">
	<cfprocresult name="iResult1" resultset="1">
</cfstoredproc>

<cfstoredproc datasource="scratch" procedure="usp_set_out_and_return" result="stResult2">
	<cfprocparam variable="iVar" type="out" cfsqltype="CF_SQL_INTEGER">
	<cfprocresult name="iResult2" resultset="1">
</cfstoredproc>


<cfstoredproc datasource="scratch" procedure="usp_select_return" result="stResult3">
	<cfprocresult name="qResult" resultset="1">
</cfstoredproc>

<cfdump var="#variables#">