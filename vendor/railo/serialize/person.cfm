<cfscript>
// person.cfm
z = new Person();
name = new Name();
name.setFirstName("Zachary");
name.setLastName("Cameron Lynch");

z.setName(name);
z.setDob(createDate(2011,3,24));

serialised= serialize(z);
writeOutput("serialised: #serialised#<br><br>");
deserialised = evaluate(serialised);

writeOutput("First Name: #z.getName().getFirstName()#<br>");
writeOutput("Last Name: #z.getName().getLastName()#<br>");
writeOutput("DOB: #z.getDob()#<br>");
</cfscript>