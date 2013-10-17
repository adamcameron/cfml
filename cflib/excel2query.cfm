<cfscript>
	function excel2query(required any xl){
		writeDump(spreadsheetInfo(xl));
	}

	xl = spreadsheetRead(expandPath("./rainbow.xlsx"));

	writeOutput('<pre>#createObject("java", "ClassViewer").viewObject(xl)#</pre>');

	writeDump(xl.getMetadata());
	writeDump(xl.getSummaryInfo());

</cfscript>