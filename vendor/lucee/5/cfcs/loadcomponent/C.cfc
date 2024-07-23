component initmethod=C {

	function C(){
		writeOutput("Constructor ran<br>");
		writeDump(arguments);
		return this;
	}

	function init(){
		writeOutput("Constructor ran<br>");
		writeDump(arguments);
		return this;
	}
}