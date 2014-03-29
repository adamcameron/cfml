<cfscript>
/*
// will not compile. Errors with "The name [ucase] is already used by a built in Function"
function ucase(s){
	writeOutput("ucase() UDF was called<br>");
	return s.toUpperCase()
}
*/

uCase = function(s){
	echo("ucase() function expression was called<br>")
	return s.toUpperCase()
}

o = new RailoVersion()
s = "tahi,rua,toru,wha"

echo("Using method<br>")
echo(o.ucase(s) & "<hr>")

echo("Using unscoped reference within CFC<br>")
echo(o.viaUnscoped(s) & "<hr>")

echo("Using scoped reference within CFC<br>")
echo(o.viaScoped(s) & "<hr>")


echo("Using unscoped ucase() within CFM<br>")
echo(ucase(s) & "<hr>")

echo("Using scoped ucase() within CFM<br>")
echo(variables.ucase(s) & "<hr>")
</cfscript>