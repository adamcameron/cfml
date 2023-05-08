<cfscript>
o = createObject("java", "TestReturningNullObject");
emptyC = o.conditionallyReturnObject(true);

nullC = o.conditionallyReturnObject(false);
writeOutput(isnull(nullC));
writeDump(var=[variables]);
</cfscript>