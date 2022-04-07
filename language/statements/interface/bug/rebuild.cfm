<cfscript>

	mdO = getComponentMetadata("NotImpl");
	mdI = getComponentMetadata("I");
	mdO.implements = mdI;

	

	// control
	notImpl = new NotImpl();
	writeOutput("Control<br>");
	writeOutput('isInstanceOf(notImpl, "I"): ' & isInstanceOf(notImpl, "I") & "<br>");
	writeOutput('isInstanceOf(notImpl, "notImpl"): ' & isInstanceOf(notImpl, "notImpl") & "<br>");
	writeOutput("<hr>");

	writeOutput("Build<br>");
	notImpl = new NotImpl();


	writeOutput('isInstanceOf(notImpl, "I"): ' & isInstanceOf(notImpl, "I") & "<br>");
	writeOutput('isInstanceOf(notImpl, "notImpl"): ' & isInstanceOf(notImpl, "notImpl") & "<br>");
	writeOutput("<hr>");

	writeOutput("Use Restored<br>");
	try {
		testI(impl);
		writeOutput("testI(impl): true<br>");
	}
	catch (any e){
		writeOutput("testI(impl): false<br>");
	}

	I function testI(required I o){
		return o;
	}
</cfscript>
