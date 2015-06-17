<cfscript>
	numbers = queryNew("id,ma,en", "integer,varchar,varchar", [
		[1, "tahi", "one"],
		[2, "rua", "two"],
		[3, "toru", "three"],
		[2, "wha", "four"]
	]);

	maori = queryColumnData(numbers, "ma", function(){
		writeDump(arguments);return;
		if (id MOD 2){
			return ma;
		}
	})

	writeDump(variables);
</cfscript>