<cfinclude template="./createRecords.cfm">

<cfwddx action="cfml2wddx" input="#records#" output="wddx">
<cfwddx action="wddx2cfml" input="#wddx#" output="deserialisedRecords">


<cfdump var="#records#">
<cfquery name="qoqRecords" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData > 1
</cfquery>
<cfdump var="#qoqRecords#" label="qoqRecords">
<hr>

<cfdump var="#deserialisedRecords#">
<cfdump var="#getMetadata(deserialisedRecords)#">
<cftry>
	<cfquery name="qoqDeserialisedRecords" dbtype="query">
		SELECT	*
		FROM	deserialisedRecords
		WHERE	intData > 1
	</cfquery>
	<cfdump var="#qoqDeserialisedRecords#">
	<cfcatch>
		<cfdump var="#[cfcatch.message,cfcatch.detail]#">
	</cfcatch>
</cftry>

