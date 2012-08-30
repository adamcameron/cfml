<cfscript>
void function f(){
	writeDump(arguments);
	writeOutput("isArray(): #isArray(arguments)#<br />");
	writeOutput("isStruct(): #isStruct(arguments)#<br />");
	writeOutput("arguments.getClass().getName: #arguments.getClass().getName()#<br />");
	writeOutput("arrayLen(): #arrayLen(arguments)#<br />");
	writeOutput("structCount(): #structCount(arguments)#<br />");
}

f("tahi", "rua", "toru", "wha");
writeOutput("<hr />");

f(one="tahi", two="rua", three="toru", four="wha");
writeOutput("<hr />");
</cfscript>