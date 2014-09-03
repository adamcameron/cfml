<cfscript>
	switch (URL.test){
		case 1:
			writeOutput("It was one<br>");
		break;
		case 2:
			writeOutput("It was two<br>");
		case 3:
			writeOutput("It was three<br>");
		break;
		case 4:
			writeOutput("It was four<br>");
		break;
		default:
			writeOutput("It was #URL.test#<br>");
	}
</cfscript>