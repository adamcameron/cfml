component {

	variables.privateVar = "this is private";
	this.publicVar = "this is public";

	public function callsAnotherPublicFunction(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		return anotherPublicFunction();
	}

	public function anotherPublicFunction(){
		writeOutput("#getFunctionCalledName()#() called<br>");
	}

	public function callsSomePrivateFunction(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		return somePrivateFunction();
	}

	public function showVariables(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		writeDump(var=variables, label="variables");
		writeDump(var=this, label="this");
	}

	private function somePrivateFunction(){
		writeOutput("#getFunctionCalledName()#() called<br>");
	}

}