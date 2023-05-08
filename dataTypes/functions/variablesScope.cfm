<cfscript>
variables.outer1 = "set outside";

f =function(){
	writeOutput("variables.outer1: #variables.outer1#<br>");
	variables.outer2 = "set inside";
}

f();

writeOutput("variables.outer2: #variables.outer2#<br>");

	
</cfscript>