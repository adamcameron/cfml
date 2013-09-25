<cfscript>
	// scrapetagPage.cfm
	import me.adamcameron.docs.*;

	tagPage = new TagPage("WSc3ff6d0ea77859461172e0811cbec22c24-7fde.html");
	documentation = tagPage.getDocumentation();
	writeDump([
		{pageName=documentation.pageName},
		{description=documentation.description},
		{category=documentation.category},
		{syntax=documentation.syntax},
		{seeAlso=documentation.seeAlso},
		{history=documentation.history},
		{usage=documentation.usage},
		{example=documentation.example}
	]);
</cfscript>