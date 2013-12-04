<cfscript>
sameStructs = [];
arraySet(sameStructs, 1, 5, {});
sameStructs[3].foo = "bar";
writeDump(sameStructs);
</cfscript>