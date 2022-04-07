<cfscript>
// cfmlArrayClassViewer.cfm	

cfmlArray = ["tahi", "rua", "toru", "wha"];
writeOutput("<pre>#createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(cfmlArray)#</pre>");
</cfscript>