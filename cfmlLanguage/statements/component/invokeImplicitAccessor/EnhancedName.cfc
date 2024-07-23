// EnhancedName.cfc
component invokeImplicitAccessor=true {

	function setFirst(first){
		writeOutput("#getFunctionCalledName()# called<br>");
		variables.first = arguments.first;
	}

	function setLast(last){
		writeOutput("#getFunctionCalledName()# called<br>");
		variables.last = arguments.last;
	}

	function getFirst(){
		writeOutput("#getFunctionCalledName()# called<br>");
		return variables.first;		
	}

	function getLast(){
		writeOutput("#getFunctionCalledName()# called<br>");
		return variables.last;		
	}
}