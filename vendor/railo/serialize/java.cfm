<cfscript>
// Java.cfm
z = createObject("java", "Name");
z.firstName = "Zachary";
z.lastName = "Cameron Lynch";
writeDump(z);
	
try{
	serialised= serialize(z);
	writeDump(serialised);

	try{
		deserialised = evaluate(serialised);
		writeDump(deserialised);  
	}
	catch (any e){
		writeOutput("#e.type#: #e.message# #e.detail#<br>")
	}
}
catch (any e){
	writeOutput("#e.type#: #e.message# #e.detail#<br>")
}
</cfscript>