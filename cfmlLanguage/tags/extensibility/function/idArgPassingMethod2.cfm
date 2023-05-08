<cfscript>
	function f(){
		writeOutput(structKeyExists(arguments, "1") & "<br>");
	}

	writeOutput("f()<br>");
	f(1,2,3,4);
	f(a=1,b=2,c=3,d=4);
	writeOutput("<hr>");
</cfscript>