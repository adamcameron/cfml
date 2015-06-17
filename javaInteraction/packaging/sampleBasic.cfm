<cfscript>
// sampleBasic.cfm

greeter = createObject("java", "me.adamcameron.miscellany.Greeter");
writeOutput(greeter.gday("Zachary"));
</cfscript>