<cfscript>
test = [
	{one="tahi"},
	["rua", "toru"],
	"wha"
];

try {
	arrayDelete(test, "WHA");
	writeDump(test);
} catch (any e){
	writeOutput("#e.message# #e.detail#<br />");
}

test = [
	"tahi",
	{two="rua"},
	["toru", "wha"]
];

try {
	arrayDelete(test, "tahi");
	writeDump(test);
} catch (any e){
	writeOutput("#e.message# #e.detail#<br />");
}
</cfscript>