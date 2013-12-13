<cfscript>
function f(){												writeOutput("f() top: arguments: #arguments.varF#; unscoped: #varF#<br>");
	var varF	= "var_#i()#";								writeOutput("f() after var: arguments: #arguments.varF#; unscoped: #varF#<br>");
	varF		= "unscoped_#i()#";							writeOutput("f() after unscoped: arguments: #arguments.varF#; unscoped: #varF#<br>");
	return {arguments=arguments,varF=varF};
}
function g(){i();											writeOutput("g() top: arguments: #arguments.varG#; unscoped: #varG#<br>");
	//var varG	= "var_#i()#";								writeOutput("g() after var: arguments: #arguments.varG#; unscoped: #varG#<br>");
	varG		= "unscoped_#i()#";							writeOutput("g() after unscoped: arguments: #arguments.varG#; unscoped: #varG#<br>");
	return {arguments=arguments, varG=varG};
}

function h(){												writeOutput("h() top: arguments: #arguments.varH#; unscoped: #varH#<br>");
	varH		= "unscoped_#i()#";							writeOutput("h() after unscoped: arguments: #arguments.varH#; unscoped: #varH#<br>");
	var varH	= "var_#i()#";								writeOutput("h() after var: arguments: #arguments.varH#; unscoped: #varH#<br>");
	return {arguments=arguments,varH=varH};
}


request.count = 0;
result = f(varF="arg_#i()#");
writeDump(var=result, label="f()");
writeOutput("<hr>");

request.count = 0;
result = g(varG="arg_#i()#");
writeDump(var=result, label="h()");
writeOutput("<hr>");

request.count = 0;
result = h(varH="arg_#i()#");
writeDump(var=result, label="g()");
writeOutput("<hr>");

function i(){
	param name="request.count" default=0;
	return ++request.count;
}
</cfscript>