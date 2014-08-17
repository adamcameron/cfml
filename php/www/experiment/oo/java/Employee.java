// Employee.java
public class Employee extends Person {

	protected String employeeId;

	public Employee(String firstName, String middleName, String lastName, String employeeId){
		super(firstName, middleName, lastName);
		this.employeeId = employeeId;
	}

	protected void setFullName(){
		System.out.println("Used setFullName() from Employee");
		this.fullName = this.firstName + " " + this.middleName + " " + this.lastName;
	}

}