<cfscript>
// injectDeclaredFunction.cfm

variables.someVar = "Set in calling code's variables scope";

o = new C();

function dumpVariables(){
	writeDump(var=variables);
}

o.dumpVariables = dumpVariables;
o.dumpVariables();
</cfscript>