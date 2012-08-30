<cfscript>
a = [];
arraySet(a, 1,5, {});
writeDump(a);

a[1].key = "value";

writeDump(a);
</cfscript>