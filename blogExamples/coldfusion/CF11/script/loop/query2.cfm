<cfscript>
numbers = queryNew("id,digit,number", "integer,varchar,varchar", [
	[1, 1, "tahi"],
	[2, 1, "один"],
	[3, 2, "rua"],
	[4, 2, "два"],
	[5, 3, "toru"],
	[6, 3, "три"],
	[7, 4, "wha"],
	[8, 4, "четыре"]
]);

cfloop(query=numbers, group="digit"){
	writeOutput("#digit#:");
	cfloop(){
		writeOutput(" #number#");
	}
	writeOutput("<br>");
}
</cfscript>