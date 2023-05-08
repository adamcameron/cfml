<cfscript>
// queryTypesInJson.cfm
fromDB = new Query(sql="SELECT * FROM words WHERE type = ?",parameters=[{value="day"}], datasource="scratch_mssql").execute().getResult();
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