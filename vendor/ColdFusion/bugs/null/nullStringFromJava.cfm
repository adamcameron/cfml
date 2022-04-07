<cfscript>
	o = createObject("java", "TestReturningNullString");
	emptyString = o.conditionallyReturnString(true);

	nullString = o.conditionallyReturnString(false);
	writeOutput(isnull(nullString));
	writeDump(var=[variables]);
</cfscript>