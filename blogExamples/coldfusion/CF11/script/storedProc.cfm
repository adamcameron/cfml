<cfparam name="URL.low" default="0">
<cfparam name="URL.high" default="0">

<cfstoredproc procedure="uspGetColours" datasource="scratch_mssql" result="tags.result" clientinfo="true" returncode="true">
	<cfprocparam value="#URL.low#" cfsqltype="CF_SQL_INTEGER">
	<cfprocparam value="#URL.high#" cfsqltype="CF_SQL_INTEGER">
	<cfprocparam type="out" variable="tags.inclusiveCount" cfsqltype="CF_SQL_INTEGER">
	<cfprocparam type="out" variable="tags.exclusiveCount" cfsqltype="CF_SQL_INTEGER">
	<cfprocresult resultset="1" name="tags.inclusive">
	<cfprocresult resultset="2" name="tags.exclusive">
</cfstoredproc>
<cfdump var="#tags#">
<br><br><br>

<cfscript>
cfstoredproc( procedure="uspGetColours", datasource="scratch_mssql",result="script.result", fetchclientinfo=true, returncode=true) {
	cfprocparam(value="#URL.low#", cfsqltype="CF_SQL_INTEGER");
	cfprocparam(value="#URL.high#", cfsqltype="CF_SQL_INTEGER");
	cfprocparam(type="out", variable="script.inclusiveCount", cfsqltype="CF_SQL_INTEGER");
	cfprocparam(type="out", variable="script.exclusiveCount", cfsqltype="CF_SQL_INTEGER");

	cfprocresult(resultset=1, name="script.inclusive");
	cfprocresult(resultset=2, name="script.exclusive");
}
writeDump(var=script);	
exit;

options = {
	datasource		= "scratch_mssql",
	fetchclientinfo	= true,
	returncode		= true
};
params = [
	{value=URL.low, type="INTEGER"},
	{value=URL.high, type="INTEGER"},
	{type="out", variable="inclusiveCount", type="INTEGER"},
	{type="out", variable="exclusiveCount", type="INTEGER"}
];

result = executeProcedure("uspGetColours", params, options);


</cfscript>