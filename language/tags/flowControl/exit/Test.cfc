// Test.cfc
component {

	public void function testExit(){
		writeOutput("Top of testExit()<br>");
		exit;
		writeOutput("Bottom of testExit()<br>");
	}

	public void function testAbort(){
		writeOutput("Top of testAbort()<br>");
		abort;
		writeOutput("Bottom of testAbort()<br>");
	}

}