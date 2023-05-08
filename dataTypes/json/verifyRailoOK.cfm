<cfinclude template="createRecords.cfm">

<cfquery name="results.deserialised.filter" dbtype="query">
	SELECT	*
	FROM	deserialisedRecords
	WHERE	intData > 1
</cfquery>

<cfquery name="results.deserialised.null" dbtype="query">
	SELECT	*
	FROM	deserialisedRecords
	WHERE	intData IS NULL
</cfquery>

<cfquery name="results.deserialised.emptystring" dbtype="query">
	SELECT	*
	FROM	deserialisedRecords
	WHERE	intData = ''
</cfquery>

<cfquery name="results.deserialised.nullOrEmpty" dbtype="query">
	SELECT	*
	FROM	deserialisedRecords
	WHERE	intData = '' OR intData IS NULL
</cfquery>


<cfquery name="results.original.filter" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData > 1
</cfquery>

<cfquery name="results.original.null" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData IS NULL
</cfquery>

<cfquery name="results.original.emptystring" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData = ''
</cfquery>

<cfquery name="results.original.nullOrEmpty" dbtype="query">
	SELECT	*
	FROM	records
	WHERE	intData = '' OR intData IS NULL
</cfquery>

<cfset results.deserialised.metadata = getMetadata(deserialisedRecords)>
<cfset results.original.metadata = getMetadata(records)>


<cfdump var="#results#">