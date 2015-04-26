<cfscript>
// cfmlArrayClassViewer.cfm	

cfmlArray = ["tahi", "rua", "toru", "wha"];
javaArray = cfmlArray.toList().split(",");
writeOutput("<pre>#createObject("java", "ClassViewer").viewObject(createObject("java", "java.util.Arrays").asList(javaArray))#</pre>");
</cfscript>