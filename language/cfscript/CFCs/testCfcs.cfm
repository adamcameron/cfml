<cfscript>
	// testCfcs.cfm
	
	o = new InTags();
	writeDump(var=getMetadata(o).functions[1], label="Tag-based");
	writeOutput("<hr>");

	o = new InScript();
	writeDump(var=getMetadata(o).functions[1], label="Tag-based");
</cfscript>