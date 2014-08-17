// TestEmployee.java

public class TestEmployee {

	public static void main(String[] args){
		Person person = new Person("Zachary", "Daniel", "Cameron Lynch");
		System.out.println(person.getFullName());

		Employee employee = new Employee("Donald", "Adam", "Cameron", "17");
		System.out.println(employee.getFullName());
	} 
}