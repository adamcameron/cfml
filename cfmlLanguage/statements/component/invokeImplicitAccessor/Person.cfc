// Person.cfc
component accessors=true {

	property firstName;
	property lastName;
	property date dob;

	function setdob(date dob){
		writeOutput("#getFunctionCalledName()# called<br>");
		variables.dob = arguments.dob;
	}

	function getdob(){
		writeOutput("#getFunctionCalledName()# called<br>");
		return variables.dob;
	}	
}