<cfscript>
	results = {
		expandPath				= expandPath("./"),
		getCurrentDirectoryPath = getDirectoryFromPath(getCurrentTemplatePath())
	};
	
	writeDump(results);
	
</cfscript>