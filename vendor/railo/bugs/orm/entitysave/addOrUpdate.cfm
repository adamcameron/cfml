<cfscript>
	param name="URL.id" type="numeric";
	param name="URL.firstName";
	param name="URL.lastname";

	person = new Person();
	person.setId(URL.id);
	person.setFirstName(URL.firstName);
	person.setLastName(URL.lastName);
	writeDump(var=person);
	entitySave(person);

	people = entityLoad("Person");
	writeDump(var=people);
</cfscript>