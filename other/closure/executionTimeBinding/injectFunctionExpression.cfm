<cfscript>
//injectFunctionExpression.cfm

variables.someVar = "Set in calling code's variables scope";

o = new C();

dumpVariables = function (){
	writeDump(var=variables);
};

o.dumpVariables = dumpVariables;
o.dumpVariables();
</cfscript>