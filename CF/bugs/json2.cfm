<cfscript>
	struct = {
		"trueMatch1": {
			"setting": true
		},
		"falseMatch": {
			"setting": false
		},
		"trueMatch2": {
			"setting": true
		}
	};
	writeDump(var=struct, label="Whole thing");
	writeDump(var=structFindValue(struct, true, "all"), label="Matched values for 'true'");
	
	writeOutput("Value of struct.trueMatch1.setting: [#struct.trueMatch1.setting#]<br>");
	writeOutput("Value of struct.trueMatch2.setting: [#struct.trueMatch2.setting#]<br>");

	shouldBeYes = struct.trueMatch1.setting;
	writeOutput("shouldBeYes: [#shouldBeYes#]<br>");
	
	writeDump(var=structFindValue(struct, shouldBeYes, "all"), label="Matches for value pulled out of the struct we're actually looking in");
</cfscript>
