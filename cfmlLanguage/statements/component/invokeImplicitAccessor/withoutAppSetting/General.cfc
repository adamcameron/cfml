component {
	property x;

	function getX(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		return x;
	}

	function setX(x){
		writeOutput("#getFunctionCalledName()#() called<br>");
		variables.x = arguments.x;
	}

	function checkMetadata(){
		writeDump({
			this = this,
			variables = variables,
			metadata = getMetadata(this)
		});
		writeOutput("<hr>");

	}
}