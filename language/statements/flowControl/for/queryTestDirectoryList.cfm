<cf>
<cfscript>
	qFiles = directoryList(expandPath('..'), true, "query");

	for (stRow in qFiles){
		writeDump(stRow);
	}
	writeDump(qFiles)
</cfscript>