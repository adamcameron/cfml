<cfscript>
// filterByFileFilterViaClass.cfm
param URL.length = 5;
filterByLength = createObject("java", "FileFilterOnMinimumLength").init(URL.length);

dir = expandPath("./testFiles");
result = directoryList(
	dir,
	true,
	"query",
	filterByLength
);
writeDump(result);
</cfscript>