<cfscript>
thisUrlPath = CGI.script_name;
thisURlDir	= listDeleteAt(thisUrlPath, listLen(thisUrlPath ,"/"), "/") & "/";
remote = createObject("webservice", "http://#CGI.http_host##thisURlDir#Data.cfc?wsdl");

for (rows in [50,51]){
	try {
		records = remote.getRecords(rows);
		writeOutput("Test query has #records.recordCount# rows<br>");
		writeOutput("Is version column numeric: #isColumnNumeric(records, 'version')#<br>");
		lastId = new Query(dbtype="query", records=records, sql="SELECT MAX(id) AS maxId FROM records", maxrows=1).execute().getResult();
		writeOutput("last ID is: #lastId.maxId#<br>");
	}
	catch (any e){
		writeOutput("#e.type# exception: #e.message# #e.detail#<br>");
	}
	writeOutput("<hr>");
}

function isColumnNumeric(required query query, required string column){
	try {
		javacast("double[]", query[column]);
		return true;
	} catch (any e){
		return false;
	}
}
</cfscript>