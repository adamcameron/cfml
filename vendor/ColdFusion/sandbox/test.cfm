<cfscript>
// test.cfm
files = directoryList(expandPath(".."), true, "query");
writeDump(var=files);
</cfscript>