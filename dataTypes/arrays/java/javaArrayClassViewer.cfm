<cfscript>
// cfmlArrayClassViewer.cfm	

cfmlArray = ["tahi", "rua", "toru", "wha"];
javaArray = cfmlArray.toList().split(",");
writeOutput("<pre>#createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(javaArray)#</pre>");
</cfscript>