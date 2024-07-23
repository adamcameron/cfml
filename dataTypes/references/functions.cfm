<cfscript>
function arrayHandler(array){
	arrayAppend(arguments.array, "toru");
	writeDump(var={variablesScope=variables.array, argumentsScope=arguments.array}, label="Within arrayHandler()");
}

function structHandler(struct){
	struct.six = "ono";
	writeDump(var={variablesScope=variables.struct, argumentsScope=arguments.struct}, label="Within structHandler()");
}

array = ["tahi", "rua"];
struct = {four="wha", five="rima"};

writeDump(var=[array], label="Before function calls");
writeOutput("<hr>");

arrayHandler(array);
writeOutput("<hr>");
structHandler(struct);
writeOutput("<hr>");

writeDump(var=[array,struct], label="After function calls");
</cfscript>