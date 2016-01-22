<cfscript>
try {
	1/0;
}
finally {
	writeOutput("hi");
}
</cfscript>