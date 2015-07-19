<cfscript>
// udf.cfm
function value(string){
	return val(string);
}
try {
	result = value("42", "bogus arg");
writeOutput("The result is: [#result#]");
} catch (any e){
	writeOutput("#e.type#: #e.message#");
}

</cfscript>