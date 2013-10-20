<cfscript>
numbers = queryNew("id,ma,en", "integer,varchar,varchar", [
	[1, "tahi", "one"],
	[2, "rua", "two"],
	[3, "toru", "three"],
	[4, "wha", "four"]
]);
serialised= serialize(numbers);
deserialised = evaluate(serialised);
writeDump([numbers,serialised,deserialised]);  
</cfscript>