<cfscript>
// nullCoalescing.cfm
variableToSet = notDefined.invalidProperty ?: "default value";

writeDump({variableToSet=variableToSet});
</cfscript>
