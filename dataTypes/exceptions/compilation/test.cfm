<cfscript>
// test.cfm
try {
	include "doesNotCompile.cfm";
}	catch(any e){
	writeOutput("
		type: #e.type#<br>
		message: #e.message#<br>
		detail: #e.detail#<br>
	");
}
</cfscript>