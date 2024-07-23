<cfscript>
orderedViaFunction = structNew("ordered");
writeDump(var=orderedViaFunction, label=orderedViaFunction.getClass().getName());

orderedViaLiteral = [=]; // or : for the assignment if you must
writeDump(var=orderedViaLiteral, label=orderedViaFunction.getClass().getName());
</cfscript>