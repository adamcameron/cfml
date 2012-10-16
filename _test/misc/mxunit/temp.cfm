<cfscript>
	o = createObject("component", "OverrideDecorator");

	metadata = getMetadata(o);
	functionReferences = structFindKey(metadata, "functions", "all");
	functions = arrayNew(1);
	methodIndex = structNew();
	for (cfcArrayIndex=1; cfcArrayIndex LE arrayLen(functionreferences); cfcArrayIndex=cfcArrayIndex+1){
		theseFunctions = functionreferences[cfcArrayIndex].value;
		for (functionIndex=1; functionIndex LE arrayLen(theseFunctions); functionIndex=functionIndex+1){
			if (not structKeyExists(methodIndex, theseFunctions[functionIndex].name)){
				arrayAppend(functions, theseFunctions[functionIndex]);
				methodIndex[theseFunctions[functionIndex].name] = true; // just keeping track of the methods we've already got. Don't want to grab any methods that have been overridden
			}
		}
	}
</cfscript>
<cfdump var="#functionReferences#">
<cfdump var="#metadata#">
<cfdump var="#functions#">