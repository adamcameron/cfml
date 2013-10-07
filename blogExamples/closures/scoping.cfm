<cfscript>
function helloTranslator(String helloWord) {
	var outerAgs = arguments;
	return function(String name) {
		return "#outerAgs.helloWord#, #name#"; 
	}; 
} 

gday = helloTranslator("G'day");

writeOutput(gday("Zachary"));
</cfscript>
