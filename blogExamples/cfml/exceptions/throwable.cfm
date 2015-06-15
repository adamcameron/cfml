<cfscript>
// throwable.cfm

writeOutput("Before me.adamcameron.miscellany.ThrowableNonException is thrown<br>");
createObject("java", "me.adamcameron.miscellany.TestErrors").throwsThrowableNonException();
writeOutput("After me.adamcameron.miscellany.ThrowableNonException is thrown<br>");
</cfscript>