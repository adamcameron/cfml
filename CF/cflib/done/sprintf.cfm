<cfscript>
string function format(required string str, required array args){
	return str.format(str, args);
}

writeOutput(format("%s is a required field", ["email"]));
writeOutput("<br />");
writeOutput(format("My last name is %2$s and my first name is %1$s", ["john","doe"]));
writeOutput("<br />");
</cfscript>