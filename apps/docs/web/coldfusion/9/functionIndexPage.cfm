<cfscript>
	import me.adamcameron.docs.*;

	functionIndexPage = new FunctionIndexPage();

	functionListingPages = functionIndexPage.getListingPages();
	writeDump(functionListingPages);

	functions = functionIndexPage.getFunctions();
	writeDump(functions);
</cfscript>