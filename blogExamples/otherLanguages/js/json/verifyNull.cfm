<cfinclude template="./createRecords.cfm">

<cfoutput>
isNull(records.intData[3]): #isNull(records.intData[3])#<br>
isNull(deserialisedRecords.intData[3]): #isNull(deserialisedRecords.intData[3])#<br>
</cfoutput>

<cfquery name="qoqRecords" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData IS NULL
</cfquery>
<cfdump var="#qoqRecords#" label="qoqRecords">
<hr>

<cfquery name="qoqDeserialisedRecords" dbtype="query">
	SELECT	*
	FROM	deserialisedRecords
	WHERE	intData IS NULL
</cfquery>
<cfdump var="#qoqDeserialisedRecords#" label="qoqDeserialisedRecords">
