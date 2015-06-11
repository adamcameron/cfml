<cfscript>
myVarName = "myVar";
param name="variables.#myVarName#" default="foo";
system.dump(variables);
</cfscript>