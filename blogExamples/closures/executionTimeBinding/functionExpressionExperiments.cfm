<cfscript>
// functionExpressionExperiments.cfm

variables.someVar = "Set in calling code's variables scope";

o = new C();

dumpVariables = function (){
	writeDump(var=this, label="this");
	writeDump(var=getMetadata(this), label="metadata");
};
o.dumpVariables = dumpVariables;
o.dumpVariables();
</cfscript>