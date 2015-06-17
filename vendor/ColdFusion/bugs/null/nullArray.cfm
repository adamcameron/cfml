<cfscript>
	array function conditionallyReturnArray(required boolean returnAnArray){
		if (returnAnArray) {
			return [];
		}
		return;
	}

	arrayValue = conditionallyReturnArray(true);

	nullValue = conditionallyReturnArray(false);
	writeOutput(isnull(nullValue));
	writeDump(var=[variables]);
</cfscript>