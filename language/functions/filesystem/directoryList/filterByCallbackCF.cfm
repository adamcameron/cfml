<cfscript>
// filterByCallbackCF.cfm

dir = expandPath("./testFiles");
result = directoryList(
	dir,
	true,
	"query",
	function(filePath, fileName, fileExtension){
		return reFind("\\(five|ten).txt$", arguments.filePath);
	}
);
writeDump(result);
</cfscript>