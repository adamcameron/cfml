<cfscript>
function f(x){
	return x;
}

function g(x){
	return arguments.x;
}

f(1);
g(2);
</cfscript>