<cfscript>
	void function sayHello(string name) {
		var text = 'Hello ' & arguments.name;
		var sayAlert = "";
		sayAlert = closure() {
			writeOutput(text);
		};
		sayAlert();
	}
	
	sayHello("Adam");
	

</cfscript>