<cfscript>
message = "this is the one set in the calling code<br>";

function taskDeclaredViaStatement(){
	writeOutput(message);
}	

taskDeclaredViaExpression = function(){
	writeOutput(message);
};

o = new C();

o.taskRunner(taskDeclaredViaStatement);
o.taskRunner(taskDeclaredViaExpression);

</cfscript>