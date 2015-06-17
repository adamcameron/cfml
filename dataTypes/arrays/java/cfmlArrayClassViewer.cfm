<cfscript>
// cfmlArrayClassViewer.cfm	

cfmlArray = ["tahi", "rua", "toru", "wha"];
writeOutput("<pre>#createObject("java", "ClassViewer").viewObject(cfmlArray)#</pre>");
</cfscript>