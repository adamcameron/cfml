<cfscript>
// javaLangThrowable.cfm
/*
runsafe(function(){
	javaLangException = createObject("java", "java.lang.Exception").init("Exception Message");
	throw(type=javaLangException);
});	

runsafe(function(){
	throwableNonException = createObject("java", "me.adamcameron.miscellany.ThrowableNonException").init("ThrowableNonException Message");
	throw(type=throwableNonException);
});	
*/
runsafe(function(){
	writeOutput("Before me.adamcameron.miscellany.ThrowableNonException is thrown<br>");
	createObject("java", "me.adamcameron.miscellany.TestErrors").throwsThrowableNonException();
	writeOutput("After me.adamcameron.miscellany.ThrowableNonException is thrown<br>");
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