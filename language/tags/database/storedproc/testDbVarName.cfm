<cfstoredproc datasource="scratch" procedure="usp_get_person">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" type="in" value="Frances" dbvarname="prsname">
	<cfprocresult name="q" resultset="1">
</cfstoredproc>

<cfdump var="#q#">

<cfscript>
	oQ = new StoredProc(procedure="usp_get_person", datasource="scratch");
	oQ.addParam(cfsqltype="CF_SQL_VARCHAR", type="in", value="Donna", dbvarname="prsname");
	oQ.addProcResult(name="q", resultset="1");
	r = oQ.execute();
	writeDump(r.getProcResultSets("q"));
</cfscript>

