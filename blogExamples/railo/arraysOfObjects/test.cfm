<cfscript>
	function f(required C[] c){
		writeDump(var=arguments);
	}

	try {
		writeOutput("<h3>No value</h3>");
		f();
	} catch(any e){
		writeDump(var=[e.type, e.message, e.detail]);
	}
	writeOutput("<hr>");

	try {
		writeOutput("<h3>Array of Cs</h3>");
		f([new C(), new C()]);
	} catch(any e){
		writeDump(var=[e.type, e.message, e.detail]);
	}
	writeOutput("<hr>");

	try {
		writeOutput("<h3>Array of Ds and Cs</h3>");
		f([new D(), new C()]);
	} catch(any e){
		writeDump(var=[e.type, e.message, e.detail]);
	}
	writeOutput("<hr>");

	try {
		writeOutput("<h3>Array of strings</h3>");
		f(["", ""]);
	} catch(any e){
		writeDump(var=[e.type, e.message, e.detail]);
	}
	writeOutput("<hr>");

	try {
		writeOutput("<h3>Array of Es</h3>");
		f([new E(), new E()]);
	} catch(any e){
		writeDump(var=[e.type, e.message, e.detail]);
	}
	writeOutput("<hr>");
</cfscript>