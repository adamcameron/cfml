<cfscript>
// metadata.cfm

/**
* @mxunit:expectedException SomeException
*/ 
function f() {
}
writeDump(var=getMetadata(f),label="f()");

</cfscript>

<cfscript>
/**
* @customMetadata metadata value
*/	
</cfscript>
<cffunction name="g">
</cffunction>
<cfdump var="#getMetadata(g)#" label="g()">

<cfscript>
/**
* @customMetadata metadata value
*/	
</cfscript>
<cfscript>
function h() {
}
writeDump(var=getMetadata(h),label="h()");


</cfscript>