<cfscript>
// createPerson.cfm
import "entities.*";
person = new Person();
person.firstName = URL.firstName;
person.lastName = URL.lastName;

entitySave(person);

writeDump(var=person, label="Person via object");
include "dumpPeopleViaSql.cfm";
</cfscript>
