<cfflush interval="16">
<cfscript>
	import me.adamcameron.docs.*;

	functionsDir = expandPath("./functions/");

	functionIndexPage = new FunctionIndexPage();
	functions = functionIndexPage.getFunctions();

	for (singleFunction in functions){
		try {
			writeOutput("Scraping #singleFunction.name#<br>");
			docs = new FunctionPage(singleFunction.url).getDocumentation();
			fileWrite(functionsDir & singleFunction.name & ".json", serializeJson(docs), "UTF-8");
			writeDump(var={functionname=docs.pagename, description=docs.description});
		}
		catch (any e){
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
	}
</cfscript>