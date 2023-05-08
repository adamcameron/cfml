<cfscript>
	numeric function conditionallyReturnNumeric(required boolean returnANumeric){
		if (returnANumeric) {
			return 1;
		}
		return;
	}

	numericValue = conditionallyReturnNumeric(true);

	nullValue = conditionallyReturnNumeric(false);
	writeOutput(isnull(nullValue));
	writeDump(var=[variables]);
</cfscript>