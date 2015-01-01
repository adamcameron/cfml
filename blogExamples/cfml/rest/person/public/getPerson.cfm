<cfscript>
// getPerson.cfm
person = entityLoad("Person", URL.id, true);
writeDump({id=person.id,firstName=person.firstName,lastName=person.lastName});

</cfscript>