<cfscript>
//c.cfm

o = new C();

o.publicWrapper();
writeOutput("<hr>");

void function injectedMethod(){
	writeOutput("injectedMethod() called<br>");
}
o.privateMethod = injectedMethod;

writeOutput("Calling o.privateMethod()<br>");
o.privateMethod();
writeOutput("<hr>");

o.publicWrapper();
writeOutput("<hr>");

o.publicWrapperForInjectedMethod();
writeOutput("<hr>");




</cfscript>