<cfscript>
/**
 * Function to take a single row from a query and generate an array.
 *
 * @param query  The query (Required)
 * @param row 	 Row (Required)
 * @return Returns an array.
 */
function queryRowtoArray(query, row){
	var i = 1;
	var queryCols = getMetadata(query);
	var arrayReturn = [];

	for(i = 1; i <= arrayLen(querycols); i++){
		arrayReturn[i] = query[querycols[i].name][arguments.row];
	}
	return arrayReturn;
}	
</cfscript>

<cfscript>
	q = queryNew("");
	queryAddColumn(q, "id", [1,2,3,4]);
	queryAddColumn(q, "english", ["one","two","three","four"]);
	queryAddColumn(q, "maori", ["tahi","rua","toru","wha"]);

	writeDump(q);	
	writeDump(queryRowtoArray(q, 1));
</cfscript>