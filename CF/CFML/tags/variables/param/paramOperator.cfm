<cfscript>
myVarName = "myVar";
//param variables[myVarName]="foo";
param "variables.#myVarName#"="foo";
writeOutput(variables.myVar);
</cfscript>