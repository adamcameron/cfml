// Name.cfc
component {

	function init(first, last){
		this.first = arguments.first;
		this.last = arguments.last;
		return this;
	}

	function setFirst(first){
		writeOutput("#getFunctionCalledName()# called<br>");
		variables.first = arguments.first;
	}

	function setLast(first){
		writeOutput("#getFunctionCalledName()# called<br>");
		variables.last = arguments.last;
	}

}