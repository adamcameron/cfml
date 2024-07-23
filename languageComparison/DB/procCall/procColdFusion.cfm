<cfscript>
	cfstoredproc(procedure="getSampleData", result="procResult") {
		cfprocparam(type="in", value=URL.low, cfsqltype="CF_SQL_INTEGER");
		cfprocparam(type="in", value=URL.high, cfsqltype="CF_SQL_INTEGER");
		cfprocparam(type="out", variable="tally", cfsqltype="CF_SQL_INTEGER");
		cfprocresult(resultset="1", name="numbers");
		cfprocresult(resultset="2", name="colours");
		cfprocresult(resultset="3", name="days");
	}

	writeDump(variables);
</cfscript>