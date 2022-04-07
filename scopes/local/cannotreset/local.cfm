<cfscript>
// local.cfm
function f(){
	local.meaningOfLife = 42;
	local.THX = 1138;
	local = {};
	writeDump(var=local, label="local");
	writeDump(var=variables, label="variables");
}
f();
</cfscript>
