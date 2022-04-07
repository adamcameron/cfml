// Counter.cfc
component {

	property numeric counter;

	variables.counter = 0;

	this.variables = variables;

	function getCounter(){
		writeOutput("#getFunctionCalledName()# called (#variables.counter#)<br>");
		return variables.counter;
	}

	function setCounter(counter){
		writeOutput("#getFunctionCalledName()# called (#variables.counter#)<br>");
		variables.counter = arguments.counter;
	}

}