<cfscript>
	function f(){
		writeDump(arguments);
	}
	function g(a,b,c,d){
		writeDump(arguments);
	}
	function h(a,b){
		writeDump(arguments);
	}

	writeOutput("f()<br>");
	f(1,2,3,4);
	f(a=1,b=2,c=3,d=4);
	writeOutput("<hr>");

	writeOutput("g()<br>");
	g(1,2,3,4);
	g(a=1,b=2,c=3,d=4);
	writeOutput("<hr>");

	writeOutput("h()<br>");
	h(1,2,3,4);
	h(a=1,b=2,c=3,d=4);
	writeOutput("<hr>");
</cfscript>