<cfscript>
// localScopeBug.cfm

function myFunction() {
	var myVar="";
	structDelete(local, "myVar", true);
	structClear(local);
	myVar="value for myVar";
	writeOutput(variables.myVar);
}
myFunction();
</cfscript>