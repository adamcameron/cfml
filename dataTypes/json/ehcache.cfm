<cfinclude template="./createRecords.cfm">

<cfset cacheId = createUuid()>
<cfset cachePut(cacheId, records)>
<cfset deserialisedRecords = cacheGet(cacheId)>


<cfdump var="#records#">
<cfquery name="qoqRecords" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	CAST(intData AS INTEGER) >  1
</cfquery>
<cfdump var="#qoqRecords#" label="qoqRecords">
<hr>

<cfdump var="#deserialisedRecords#">
<cfdump var="#getMetadata(deserialisedRecords)#">
<cftry>
	<cfquery name="qoqDeserialisedRecords" dbtype="query">
		SELECT	*
		FROM	deserialisedRecords
		WHERE	CAST(intData AS INTEGER) > 1
	</cfquery>
	<cfdump var="#qoqDeserialisedRecords#">
	<cfcatch>
		<cfdump var="#[cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>