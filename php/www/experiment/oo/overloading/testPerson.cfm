<cfscript>
// testPerson.cfm

person = new Person();
person.firstName = "Donald";
person.middleName = "Adam";
person.lastName = "Cameron";


writeOutput("Full name: #person.firstName# #person.lastName#<br>");

writeDump(person);
</cfscript>