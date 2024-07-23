<cfscript>
//javaExceptions.cfm

illegalArgumentException = createObject("java", "java.lang.IllegalArgumentException").init("test exception");

try {
	throw(object=illegalArgumentException);
} catch(java e){
	writeOutput("caught it @ java");
} catch(java.lang e){
	writeOutput("caught it @ java.lang");
} catch(java.lang.IllegalArgumentException e){
	writeOutput("caught it @ java.lang.IllegalArgumentException");
} catch (any e){
	writeOutput("caught it @ any");
}
writeOutput("<hr>");

try {
	throw(object=illegalArgumentException);
} catch(java.lang e){
	writeOutput("caught it @ java.lang");
} catch (any e){
	writeOutput("caught it @ any");
}
writeOutput("<hr>");

try {
	throw(object=illegalArgumentException);
} catch(java.lang.IllegalArgumentException e){
	writeOutput("caught it @ java.lang.IllegalArgumentException");
} catch (any e){
	writeOutput("caught it @ any");
}
writeOutput("<hr>");
</cfscript>