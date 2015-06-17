<cfscript>
// request2simple.cfm
function f(){
	request.meaningOfLife = 42;
	request.THX = 1138;
	request = 23;
	writeDump(var=request, label="request");
	writeDump(var=variables, label="variables");
}
f();
</cfscript>