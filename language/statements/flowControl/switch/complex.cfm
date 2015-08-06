<cfscript>
	
cond = [];

switch (cond) {
	case "a":
		writeOutput("it was an a");
	break;
	case []:
		writeOutput("it was an array");
	break;
}
</cfscript>