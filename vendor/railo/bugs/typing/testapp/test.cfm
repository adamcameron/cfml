<cfscript>
// test.cfm
test = new pkg.Test();

try {
	writeOutput("Calling takesTestObject()<br>");
	test.takesTestObject(test);
	writeOutput("OK<br>");
}catch (any e){
	writeOutput("#e.type# #e.message# #e.detail#<br>");
}
writeOutput("<hr>");

try {
	writeOutput("Calling returnsTestObject()<br>");
	test.returnsTestObject(test);
	writeOutput("OK<br>");
}catch (any e){
	writeOutput("#e.type# #e.message# #e.detail#<br>");
}
writeOutput("<hr>");
</cfscript>