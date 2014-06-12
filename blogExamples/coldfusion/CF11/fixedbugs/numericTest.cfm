<cfscript>
// numericTest.cfm

any function acceptNumeric(required numeric x){
	return;
}

numeric function returnNumeric(required any x){
	return x;
}

s = " 123 "; // This. Is. Not. Fucking. Numeric.

safe(function(){
	acceptNumeric(s);
});

safe(function(){
	returnNumeric(s);
});



function safe(required function f){
	try {
		f();
		writeOutput("OK");
	}
	catch (any e){
		writeOutput("FAILED");
	}
	writeOutput("<hr>");
}
	
</cfscript>