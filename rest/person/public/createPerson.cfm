<cfscript>
// createPerson.cfm
import "app.*";
person = new Person();
person.firstName = URL.firstName;
person.lastName = URL.lastName;

entitySave(person);

people = entityLoad("Person");
writeDump(var=people);
</cfscript>