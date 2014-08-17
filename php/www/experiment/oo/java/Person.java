// Person.java

public class Person {
	protected String firstName;
	protected String middleName;
	protected String lastName;
	protected String fullName;

	public Person(String firstName, String middleName, String lastName){
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		setFullName();
	}

	protected void setFullName(){
		System.out.println("Used setFullName() from Person");
		this.fullName = this.firstName + " " + this.lastName;
	}

	public String getFullName(){
		return this.fullName;
	}

}