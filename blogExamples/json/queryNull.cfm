<cfscript>
// helper function for populating a whole query row in one hit
function queryAppendRow(required query query, required struct data){
	queryAddRow(query);
	for (var key in data){
		querySetCell(query, key, data[key]);
	}
}


// create a query with some sample data, including some null values
records = queryNew("id,strData,intData", "Integer,Varchar,Integer");
queryAppendRow(records, {id=1, strData="tahi", intData=1});	// no nulls
queryAppendRow(records, {id=2, intData=2});					// null in string column
queryAppendRow(records, {id=3, strData="toru"});			// null in integer column

// serialise it, then deserialise it again
json = serializeJson(records, true);
deserialisedRecords = deserializeJson(json, false);

// what have we got?
writeDump([
	records,
	json,
	deserialisedRecords
]);
abort;
</cfscript>



<cfquery name="qoqWithRecords" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData > 1
</cfquery>
<cfdump var="#qoqWithRecords#">

<cftry>
	<cfquery name="qoqWithDeserialisedRecords" dbtype="query">
		SELECT	*
		FROM	deserialisedRecords
		WHERE	intData > 1
	</cfquery>
	<cfdump var="#qoqWithDeserialisedRecords#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>
