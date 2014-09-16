<cfscript>

person = new Person();
person.firstName = "Zachary";
person.lastName = "Cameron Lynch";

firstName = person.firstName;
lastName = person.lastName;

writeOutput("Full name: #firstName# #lastName#<br>");
</cfscript>