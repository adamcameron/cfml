<cfscript>
//test.cfm
o = new C();
try {
	writeDump(var=[o.callsMixedInDateFunctionCorrectly()]);
}catch(any e){
	writeDump(var=e);
}
try {
	writeDump(var=[o.callsMixedInDateFunctionIncorrectly()]);
}catch(any e){
	writeDump(var=e);
}
</cfscript>