<cfscript>
// catchErrorInJava.cfm

writeOutput("Before java.lang.Error is caught<br>");
result = createObject("java", "me.adamcameron.miscellany.TestErrors").catchesError();
writeOutput("result: #result#<br>");
writeOutput("After java.lang.Error is caught<br>");
</cfscript>