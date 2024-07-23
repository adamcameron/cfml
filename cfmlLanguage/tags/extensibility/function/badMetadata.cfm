<cfscript>
// badMetadata.cfm
function f() mxunit:expectedException="SomeException" {
	writeDump(var=getMetadata());
}

f();
writeDump(var=getmetaData(f));
</cfscript>