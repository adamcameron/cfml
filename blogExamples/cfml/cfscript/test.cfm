<cfscript>
cfstoredproc(procedure="uspGetNumbers") {
	cfprocparam(type="in", cfsqltype="cf_sql_integer", value="2");
	cfprocparam(type="in", cfsqltype="cf_sql_integer", value="3");
	cfprocresult(name="numbers");
}
writeDump(numbers);
</cfscript>
