<cfscript>
files = directoryList(expandPath("when"), false, "query");
writeDump(files);	
</cfscript>