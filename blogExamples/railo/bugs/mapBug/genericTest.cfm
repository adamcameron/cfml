<cfscript>
/*
// will not compile. Errors with "The name [ucase] is already used by a built in Function"
function ucase(s){
	writeOutput("ucase() UDF was called<br>");
	return s.toUpperCase()
}
*/

uCase = function(s){
	writeOutput("ucase() function expression was called<br>");
	return s.toUpperCase();
};

o = new GenericVersion();
s = "tahi,rua,toru,wha";

writeOutput("Using method<br>");
writeOutput(o.ucase(s) & "<hr>");

writeOutput("Using unscoped reference within CFC<br>");
writeOutput(o.viaUnscoped(s) & "<hr>");

writeOutput("Using scoped reference within CFC<br>");
writeOutput(o.viaScoped(s) & "<hr>");


writeOutput("Using unscoped ucase() within CFM<br>");
writeOutput(ucase(s) & "<hr>");

writeOutput("Using scoped ucase() within CFM<br>");
writeOutput(variables.ucase(s) & "<hr>");
</cfscript>