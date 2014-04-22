<cfscript>
string function conditionallyReturnString(required boolean returnAString){
	if (returnAString) {
		return "";
	}
	return;
}

emptyString = conditionallyReturnString(true);

nullString = conditionallyReturnString(false);
writeOutput(isnull(nullString));
writeDump(var=[variables]);
</cfscript>