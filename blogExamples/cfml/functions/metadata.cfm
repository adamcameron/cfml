<cfscript>
// metadata.cfm

/**
* @mxunit:expectedException SomeException
*/ 
function g() {
	writeDump(var=getMetadata());
}
g();

</cfscript>