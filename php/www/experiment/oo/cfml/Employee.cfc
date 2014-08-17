// Employee.cfc

component extends="Person" {

	variables.employeeId = "";
	variables.middleName = "";

	public Employee function init(required String firstName, required String middleName, required String lastName, required String employeeId){
		variables.middleName = middleName;
		variables.employeeId = employeeId;
		super.init(firstName, lastName);

		return this;
	}

	private void function setFullName(){
		writeOutput("Used setFullName() from Employee<br>");
		variables.fullName = variables.firstName & " " & variables.middleName & " " & variables.lastName;
	}

}