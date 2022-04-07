// C.cfc
component {

	public void function publicWrapper(){
		writeOutput("publicWrapper() called<br>");
		writeOutput("Calling privateMethod()<br>");
		privateMethod();
	}
	private void function privateMethod(){
		writeOutput("privateMethod() called<br>");
	}

	public void function publicWrapperForInjectedMethod(){
		writeOutput("publicWrapperForInjectedMethod() called<br>");
		writeOutput("Calling this.privateMethod()<br>");
		this.privateMethod();
		writeOutput("Calling variables.privateMethod()<br>");
		variables.privateMethod();
		writeOutput("Calling privateMethod()<br>");
		privateMethod();
	}

}