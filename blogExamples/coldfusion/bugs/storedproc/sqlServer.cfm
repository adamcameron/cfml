<!--- sqlServer.cfm --->
<cfset data = {}>
<cfstoredproc procedure="sp_test" datasource="scratch_mssql">
	<cfprocresult resultset="1" name="data.numbers">
	<cfprocresult resultset="2" name="data.colours">
</cfstoredproc>

<cfset copy = duplicate(data.numbers)>
<cfdump var="#variables#">