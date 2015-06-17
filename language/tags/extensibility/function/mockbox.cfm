<cfscript>
function $results(){
	if (structKeyExists(arguments, "callback")){
		writeOutput("Use argument as a callback<br>");
	}else{
		writeOutput("Use arguments as return values<br>");
	}
}

$results(f,g,h);
$results(callback=f);

function f(){}
function g(){}
function h(){}
</cfscript>