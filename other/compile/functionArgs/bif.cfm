<cfscript>
// builtin.cfm
try {
	result = val("42", "bogus arg");
writeOutput("The result is: [#result#]");
} catch (any e){
	writeOutput("#e.type#: #e.message#");
}
</cfscript>