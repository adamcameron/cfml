<cfscript>
function f(x){
	var x = "unscoped";
	return {unscoped=x, arguments=arguments.x};
}
writeDump(var=f(x="arguments"), label="f()");

writeOutput("<hr>");

function g(){
	var x = "unscoped";
	return {unscoped=x, arguments=arguments.x};
}
writeDump(var=g(x="arguments"), label="g()");



form.number = "tahi";
URL.number = "rua";
variables.number = "toru";

arguments.colour = "whero";
local.colour = "kakariki";

var day = "Rāhina";
var day = "Rātū";



</cfscript>


