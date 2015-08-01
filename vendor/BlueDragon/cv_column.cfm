<cfscript>
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	q = queryNew("col");
	
	writeOutput("<pre>#cv.viewObject(q["col"])#</pre>");
	
</cfscript>