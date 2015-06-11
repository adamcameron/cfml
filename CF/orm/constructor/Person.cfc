component persistent=true {

	property name="id" generator="increment"; 
	property name="firstName"; 
	property name="lastName"; 

	function init(id, firstName, lastName){
		writeDump(arguments);
		variables.id = arguments.id;
		variables.firstName = arguments.firstName;
		variables.lastName = arguments.lastName;
		writeLog(file="ormConstructor", text="init() called");
		return this;
	}

}