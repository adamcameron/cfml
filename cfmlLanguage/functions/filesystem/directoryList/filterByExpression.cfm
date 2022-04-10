<cfscript>
// filterByExpression.cfm

dir = expandPath("./testFiles");
result = directoryList(
	dir,
	true,
	"query",
	"*.txt"
);
writeDump(result);
</cfscript>