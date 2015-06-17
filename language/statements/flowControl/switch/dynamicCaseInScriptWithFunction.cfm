<cfscript>
// dynamicCaseInScriptWithFunction.cfm
switch (URL.option){
	case "1":
		writeOutput("one");
	break;
	case "2":
		writeOutput("two");
	break;
	case getThirdCase():
		writeOutput("the favourite one: #URL.favourite#");
	break;
	default:
		writeOutput("the default");
	break;
}

function getThirdCase(){
	return randRange(3,10);
}
</cfscript>