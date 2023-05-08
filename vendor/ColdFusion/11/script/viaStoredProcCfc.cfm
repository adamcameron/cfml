<cfscript>
param integer URL.low=0;
param integer URL.high=0;

result =  new StoredProc(
	procedure		= "uspGetColours",
	datasource		= "scratch_mssql",
	result			= "anyOldShitYouLike",
	fetchclientinfo	= true,
	returncode		= true,
	parameters		= [
		{value=URL.low, cfsqltype="CF_SQL_INTEGER"},
		{value=URL.high, cfsqltype="CF_SQL_INTEGER"},
		{type="out", variable="inclusiveCount", cfsqltype="CF_SQL_INTEGER"},
		{type="out", variable="exclusiveCount", cfsqltype="CF_SQL_INTEGER"}
	],
	procResults		= [
		{resultset=1, name="inclusive"},
		{resultset=2, name="exclusive"}
	]
).execute();

writeDump(var={
	metadata = result.getPrefix(),
	recordsets = [
		result.getProcResultSets().inclusive,
		result.getProcResultSets().exclusive
	],
	outparameters = result.getProcOutVariables()
});
</cfscript>