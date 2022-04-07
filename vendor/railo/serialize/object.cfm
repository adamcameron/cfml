<cfscript>
z = new Name();
z.setFirstName("Zachary");
z.setLastName("Cameron Lynch");

serialised= serialize(z);
deserialised = evaluate(serialised);
writeDump([z,serialised,deserialised]);  
</cfscript>