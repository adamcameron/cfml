component accessors=true  {

	property name="firstName";
	property name="lastName";
	
	public Person function init(){
		writeOutput("init() called<br />");
		variables.firstName = "";
		variables.lastName = "";
		return this;
	}
	
	public string function getFirstName(){
		writeOutput("getFirstName() called<br />");
		return variables.firstName;
	}
	
	public void function setFirstName(required string firstName){
		writeOutput("setFirstName() called<br />");
		variables.firstName = arguments.firstName;
	}
	
	public string function getLastName(){
		writeOutput("getLastName() called<br />");
		return variables.lastName;
	}
	
	public void function setLastName(required string lastName){
		writeOutput("setLastName() called<br />");
		variables.lastName = arguments.lastName;
	}
	
	public void function setPerson(required struct person){
		for (var name in person){
			var setterName = "set#name#";
			if (structKeyExists(this, setterName)){
				var setter = this[setterName];
				setter(person[name]);
			}
		}
	}

}