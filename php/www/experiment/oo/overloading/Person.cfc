// Person.cfc
component {

	property firstName;
	property lastName;

	public string function getFirstName(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		return firstName;
	}

	public void function setFirstName(firstName){
		writeOutput("#getFunctionCalledName()#() called with #firstName#<br>");
		variables.firstname = arguments.firstName;
	}

	public string function getLastName(){
		writeOutput("#getFunctionCalledName()#() called<br>");
		return lastName;
	}

	public void function setLastName(lastName){
		writeOutput("#getFunctionCalledName()#() called with #lastName#<br>");
		variables.lastName = arguments.lastName;
	}

}