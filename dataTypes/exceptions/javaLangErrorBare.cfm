<cfscript>
// javaLangErrorBare.cfm

writeOutput("Before java.lang.Error is thrown<br>");
createObject("java", "me.adamcameron.miscellany.TestErrors").throwsError();
writeOutput("After java.lang.Error is thrown<br>");
</cfscript>