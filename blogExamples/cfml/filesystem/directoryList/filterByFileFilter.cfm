<cfscript>
param URL.length = 5;
filterByLength = createObject("java", "me.adamcameron.miscellany.FileFilterOnMinimumLength").init(URL.length);

dir = expandPath("./testFiles");
result = directoryList(
	dir,
	true,
	"query",
	filterByLength
);
writeDump(result);
</cfscript>