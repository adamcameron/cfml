<cfscript>
	import me.adamcameron.docs.*;

	functionListPage = new FunctionListPage("WSc3ff6d0ea77859461172e0811cbec1a783-7fd7.html");

	functions = functionListPage.getFunctions();

	writeDump(functions);
</cfscript>