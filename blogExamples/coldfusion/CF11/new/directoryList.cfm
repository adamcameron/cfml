<cfscript>
	files = directoryList(expandPath(".."), true, "array", function(path,type,extn){
		return !listFindNoCase("cfm,cfc", extn) && type == "file";
	}, "name");
	writeDump(files);
</cfscript>