<cfscript>
	varNames = ["test", "test ", " test", " test "];
	
	for (varToSet in varNames) {
		writeOutput("Processing [#varToSet#]<br>");
		try {
		setVariable("tests.#varToSet#", true);
		for (varToCheck in varNames) {
			exists = structKeyExists(tests, varToCheck);
			writeOutput("[#varToCheck#]: #exists#<br>");
		}
		}
		catch (any e){
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
		structClear(tests);
	}

</cfscript>