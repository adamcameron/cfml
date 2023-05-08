<cfscript>
//query.cfm
numbers = queryNew("");
queryAddColumn(numbers, "id", "integer", [1,2,3,4]);
queryAddColumn(numbers, "number", "varchar", ["tahi","rua","toru","wha"]);
for (row in numbers){
	writeOutput("#row.number#<br>");
}


</cfscript>