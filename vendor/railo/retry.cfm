<cfscript>
count = 0;
retries = 5;
try {
	writeOutput("<hr>");
	writeOutput("Count: #count#<br>");
	writeOutput("Above exception<br>");
	throw(type="ForcedException");
	writeOutput("Below exception<br>");
}
catch (ForcedException e){
	writeOutput("Top of CATCH<br>");
	
	if (++count <= retries){
		writeOutput("Before RETRY<br>");
		retry
		writeOutput("After RETRY<br>");
	}
	writeOutput("Bottom of CATCH<br>");
}

writeOutput("After TRY<br>");
</cfscript>