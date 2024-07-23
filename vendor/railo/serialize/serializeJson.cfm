<cfscript>
numbers = queryNew("id,ma,en", "integer,varchar,varchar", [
	[1, "tahi", "one"],
	[2, "rua", "two"],
	[3, "toru", "three"],
	[4, "wha", "four"]
]);
serialised= serializeJson(numbers);
deserialised = deserializeJson(serialised, false);
writeDump([numbers,serialised,deserialised]);  
</cfscript>