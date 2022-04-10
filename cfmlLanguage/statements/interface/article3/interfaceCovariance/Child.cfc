//Child.cfc
component implements="IChild" {

	public void function parentFunction() {
		writeOutput("G'day from Child.parentFunction()");
	}

	public void function childFunction() {
		writeOutput("G'day from Child.childFunction()");
	}

}