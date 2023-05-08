<cfscript>
	// context.cfm

	param name="URL.dynamicMethod" default="whichContext";

	variables.context = "within the calling code";

	myObj = new My();

	myStaticallyNamedMethod = myObj[URL.dynamicMethod];

	writeOutput("The method is being called in the context of " & myStaticallyNamedMethod());
</cfscript>