<cfscript>
	processingdirective pageencoding="UTF-8";

	rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
	serialised= serialize(rainbow);
	deserialised = evaluate(serialised);
	writeDump([rainbow,serialised,deserialised]);  

	numbers = queryNew("id,ma,en", "integer,varchar,varchar", [
		[1, "tahi", "one"],
		[2, "rua", "two"],
		[3, "toru", "three"],
		[2, "wha", "four"]
	]);
	serialised= serialize(numbers);
	deserialised = evaluate(serialised);
	writeDump([numbers,serialised,deserialised]);  

	week = {
		monday = "Rāhina",
		tuesday = "Rātū",
		wednesday = "Rāapa",
		thursday = "Rāpare",
		friday = "Rāmere",
		saturday = "Rāhoroi",
		sunday = "Rātapu"
	}
	serialised= serialize(week);
	deserialised = evaluate(serialised);
	writeDump([week,serialised,deserialised]); 
</cfscript>