<cfscript>
// javaLangError.cfm

runsafe(function(){
	writeOutput("Force an exception with code<br>");
	var result = 1/0;
});	

runsafe(function(){
	writeOutput("Create an Exception and throw it<br>");
	javaLangException = createObject("java", "java.lang.Exception").init("Exception Message");
	throw(type=javaLangException);
});	


runsafe(function(){
	writeOutput("Create an Error and throw it<br>");
	javaLangError = createObject("java", "java.lang.Error").init("Error Message");
	throw(type=javaLangError);
});	

runsafe(function(){
	writeOutput("Call a java method which throws an Error<br>");
	writeOutput("Before java.lang.Error is thrown<br>");
	createObject("java", "me.adamcameron.miscellany.TestErrors").throwsError();
	writeOutput("After java.lang.Error is thrown<br>");
});	

runsafe(function(){
	writeOutput("After everything");
});	

function runsafe(task){
	try {
		task();
	}catch (any e){
		writeOutput("
			type: [#e.type#]<br>
			message: [#e.message#]<br>
			detail: [#e.detail#]<br>
		");
	}finally {
		writeOutput("<hr>");
	}
}
</cfscript>