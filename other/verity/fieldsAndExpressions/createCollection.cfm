

<cfcollection action="list" name="qCollections">

<cfquery name="qThisCollection" dbtype="query" maxrows="1">
	SELECT	*
	FROM	qCollections
	WHERE	name	= <cfqueryparam value="#sCollectionName#" cfsqltype="CF_SQL_VARCHAR">
</cfquery>

<cfif qThisCollection.recordCount>
	<cfcollection action="delete" collection="#sCollectionName#">
</cfif>

<cfcollection action="create" collection="#sCollectionName#" path="C:\Adobe\collections\verity\">