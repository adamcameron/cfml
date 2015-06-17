<cfscript>
	cv = createObject("java", "ClassViewer");
	q = queryNew("col");
	
	writeOutput("<pre>#cv.viewObject(q["col"])#</pre>");
	
</cfscript>