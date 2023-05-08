<cfscript>
// local2simple.cfm
function f(){
	local.meaningOfLife = 42;
	local.THX = 1138;
	local = 23;
	writeDump(var=local, label="local");
	writeDump(var=variables, label="variables");
}
f();
</cfscript>