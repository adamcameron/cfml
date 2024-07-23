<cfscript>
// testSub.cfm

o = new Sub();
writeDump(var=getMetadata(o));
o.baseMethod();
writeDump(var=getMetadata(o.baseMethod));
</cfscript>
