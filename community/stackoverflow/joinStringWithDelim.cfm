<cfscript>
records = queryNew("a,b,c", "varchar,varchar,varchar", [
	["", "", ""],
	["a2", "", ""],
	["a3", "b3", ""],
	["a4", "b4", "c4"]
]);

for (qRoute in records){
	if (!qRoute.a.len()) continue;
	str = "";
	str = str.listAppend(qRoute.a, "/").listAppend(qRoute.b, "/").listAppend(qRoute.c, "/").listChangeDelims("/", "/");
	writeOutput(str & "<br>");
}
</cfscript>