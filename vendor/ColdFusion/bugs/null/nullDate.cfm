<cfscript>
	date function conditionallyReturnDate(required boolean returnADate){
		if (returnADate) {
			return now();
		}
		return;
	}

	dateValue = conditionallyReturnDate(true);

	nullValue = conditionallyReturnDate(false);
	writeOutput(isnull(nullValue));
	writeDump(var=[variables]);
</cfscript>