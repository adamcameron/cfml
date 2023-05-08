<cfscript>
// queryTypesInJson.cfm
fromDB = queryExecute("SELECT * FROM words WHERE type = ?",["day"],{datasource="scratch_mssql"});
json = serializeJson(fromDB);
fromJson = deserializeJson(json, false);
writeDump([
	{data= {
		fromDB=fromDB,
		fromJson=fromJson
	}},
	{json=json},
	{metadata= {
		fromDB=getmetadata(fromDB),
		fromJson=getmetadata(fromJson)
	}}
]);
</cfscript>