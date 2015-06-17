<cfscript>
// request.cfm
function f(){
	request.meaningOfLife = 42;
	request.THX = 1138;
	request = {};
	writeDump(var=request, label="request");
	writeDump(var=variables, label="variables");
}
f();
</cfscript>
