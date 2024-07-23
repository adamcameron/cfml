<cfscript>
	include "createRecords.cfm";


	// make type list
	metadata = getMetadata(records);
	types = [];
	for (col in metadata){
		arrayAppend(types, col.typeName);
	}
	deserialisedAsStruct = deserializeJson(cleanedJson);
	deserialisedAsStruct.types=types;

	serialisedFromStruct = serializeJson(deserialisedAsStruct);
	deserialisedAsStruct = deserializeJson(serialisedFromStruct);

	writeDump([serialisedFromStruct]);
	writeDump(deserialisedAsStruct);

	new = queryNew("");
	for (i=1; i <= arrayLen(deserialisedAsStruct.columns); i++){
		col = deserialisedAsStruct.columns[i];
		type = deserialisedAsStruct.types[i];
		data = deserialisedAsStruct.data[deserialisedAsStruct.columns[i]];
		queryAddColumn(new, col, type, data);
	}
</cfscript>

<cfdump var="#records#">
<cfdump var="#getMetadata(records)#">
<cfquery name="qoqRecords" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData > <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
</cfquery>
<cfdump var="#qoqRecords#" label="qoqRecords">
<hr>

<cfdump var="#new#">
<cfdump var="#getMetadata(new)#">
<cftry>
	<cfquery name="qoqDeserialisedRecords" dbtype="query">
		SELECT	*
		FROM	new
		WHERE	CAST(intData AS INTEGER) > <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">
	</cfquery>
	<cfdump var="#qoqDeserialisedRecords#">
	<cfcatch>
		<cfdump var="#[cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>
