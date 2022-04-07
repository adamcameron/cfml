<cfscript>
// constructorIssue.cfm

package = "me.adamcameron.bug";
classes = ["UnqualifiedPerson", "PublicPerson"];

classes.each(function(class){
	var qualifiedClass = "#package#.#class#";

	writeOutput("<h4>Testing with #class#</h4>");

	runSafe(function(){
		writeOutput("Static only<br>");
		var staticPersonProxy = createObject("java", qualifiedClass);
		writeOutput(staticPersonProxy.greet("Zachary"));
	});


	runSafe(function(){
		writeOutput("No init()<br>");
		var personWithoutInit = createObject("java", qualifiedClass);
		personWithoutInit.setName("Zachary");
		writeOutput(personWithoutInit.getName());
	});


	runSafe(function(){
		writeOutput("With init()<br>");
		var personWithoutInit = createObject("java", qualifiedClass).init();
		personWithoutInit.setName("Zachary");
		writeOutput(personWithoutInit.getName());
	});
});

function runSafe(task){
	try {
		task();
	} catch (any e){
		writeOutput("Type: #e.type#<br>Message: #e.message#<br>Detail:#e.detail#");
	} finally {
		writeOutput("<hr>");
	}
}

</cfscript>