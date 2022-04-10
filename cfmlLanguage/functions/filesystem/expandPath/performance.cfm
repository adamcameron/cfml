<cfscript>
	start = getTickCount();
	expandPath("/");
	writeOutput(getTickCount() - start);
</cfscript>