<cfscript>
	C function conditionallyReturnObject(required boolean returnAnObject){
		if (returnAnObject) {
			return new c();
		}
		return;
	}

	objectValue = conditionallyReturnObject(true);

	nullValue = conditionallyReturnObject(false);
	writeOutput(isnull(nullValue));
	writeDump(var=[variables]);
</cfscript>