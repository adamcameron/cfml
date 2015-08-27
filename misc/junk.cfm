<cfscript>
getTester = createObject("java", "me.adamcameron.miscellany.GetTester");
writeDump(getTester);
i = getTester.get("nope");

writeDump(i);
</cfscript>