<cfscript>
	abortPage = new me.adamcameron.docs.TagPage("cfabort.html");
	docObject = abortPage.getDocObject();
	documentation = abortPage.getDocumentation();

	writeDump(documentation);

	
</cfscript>