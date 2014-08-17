<cfscript>
// testEmployee.cfm
person = new Person("Zachary", "Cameron Lynch");
writeOutput(person.getFullName() & "<br>");

employee = new Employee("Donald", "Adam", "Cameron", "17");
writeOutput(employee.getFullName() & "<br>");
</cfscript>