<cfscript>
function f(){}
writeOutput("Null is output as an empty string:<br>");
writeOutput("[#f()#]");	
writeOutput("<hr>");

result = f();
writeOutput("However CF struggles with the idea of a variable being null:<br>");
writeOutput("[#result#]");	
</cfscript>
