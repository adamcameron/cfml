<cfscript>
// variables.cfm
function f(){
	variables.meaningOfLife = 42;
	variables.THX = 1138;
	variables = {};
	writeDump(var=variables, label="variables");
}
f();
</cfscript>
