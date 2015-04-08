<cfscript>
// baseline.cfm

function f(x,y){
	return x*y
}

echo("Using function statement: #f(2,3)#<br>")

g = function(x,y) {
	return x*y
}
echo("Using function expression with traditional literal syntax: #g(5,7)#<br>")


h = (x,y) -> x*y
echo("Using function expression with lambda syntax: #h(11,13)#<br>")

j = (x,y) -> {
	return x * y
}
echo("Using lambda syntax with block: #j(17,19)#<br>")

</cfscript>