<cfscript>
// arrayAsArgumentCollection.cfm

function f(required z, y, required x){
	dump(arguments)
}

echo("Control: using a struct<br>")
args = {x="value for x", z="value for z"}
f(argumentCollection=args)

echo("Test 1: simple array<br>")
args = ["value for z", null, "value for x"]
f(argumentCollection=args)

echo("Test 2: sparse array<br>")
args = []
args[3] = "value for x"
args[1] = "value for z"
f(argumentCollection=args)
</cfscript>