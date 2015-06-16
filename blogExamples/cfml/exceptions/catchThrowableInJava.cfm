<cfscript>
// catchThrowableInJava.cfm

writeOutput("Before me.adamcameron.miscellany.ThrowableNonException is caught<br>");
result = createObject("java", "me.adamcameron.miscellany.TestErrors").catchesThrowable();
writeOutput("result: #result#<br>");
writeOutput("After me.adamcameron.miscellany.ThrowableNonException is caught<br>");
</cfscript>