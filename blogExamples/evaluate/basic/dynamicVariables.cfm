<cfscript>
	numbers = ["tahi", "rua", "toru", "wha"];

	for (i=1; i <=4; i++){
		"myDynamicVar#i#" = numbers[i];
	}

	start = getTickCount();
	for (i=1; i <=4; i++){
		writeOutput(evaluate("myDynamicVar#i#"));
	}
	end = getTickCount();
	writeOutput("evaluate(): #end-start#ms<br>");

	start = getTickCount();
	for (i=1; i <=4; i++){
		writeOutput(variables["myDynamicVar#i#"]);
	}
	end = getTickCount();
	writeOutput("evaluate(): #end-start#ms<br>");

</cfscript>