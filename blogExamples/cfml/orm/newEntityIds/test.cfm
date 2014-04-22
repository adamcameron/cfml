<cfscript>
	person = new Person();
	writeDump(var=person, label="new");

	person.setName("Zachary");
	writeDump(var=person, label="set");

	entitySave(person);
	writeDump(var=person, label="after save");

	ormFlush();
	writeDump(var=person, label="after flush");
</cfscript>