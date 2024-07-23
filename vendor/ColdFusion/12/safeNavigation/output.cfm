<cfscript>
function f(){}
writeOutput("Null is output as an empty string:<br>");
writeOutput("[#f()#]");	
writeOutput("<hr>");




writeOutput("This is outputting null:<br>");
writeOutput("[#nonExistentStruct?.someKey#]");	
writeOutput("<hr>");

result = nonExistentStruct?.someKey;
writeOutput("See? It's null:<br>");
writeOutput("isNull(): [#isNull(result)#]");	
</cfscript>
