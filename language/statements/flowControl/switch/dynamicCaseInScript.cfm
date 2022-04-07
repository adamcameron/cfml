<cfscript>
	// dynamicCaseInScript.cfm
	switch (URL.option){
		case "1":
			writeOutput("one");
		break;
		case "2":
			writeOutput("two");
		break;
		case URL.favourite:
			writeOutput("the favourite one: #URL.favourite#");
		break;
		default:
			writeOutput("the default");
		break;
	}
</cfscript>