component accessors=true {

	property firstName;
	property lastName;
	property date dob;

	function setLastName(lastName){
		variables.lastName = arguments.lastName;
		writeOutput("setLastName() called<br>");
	}

}