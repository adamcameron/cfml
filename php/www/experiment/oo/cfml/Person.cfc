// Person.cfc

component {
	
	variables.firstName	="";
	variables.lastName	="";
	variables.fullName	="";

	public Person function init(required String firstName, required String lastName){
		variables.firstName	= firstName;
		variables.lastName	= lastName;
		setFullName();

		return this;
	}

	private void function setFullName(){
		writeOutput("Used setFullName() from Person<br>");
		variables.fullName = variables.firstName & " " & variables.lastName;
	}

	public String function getFullName(){
		return variables.fullName;
	}

}