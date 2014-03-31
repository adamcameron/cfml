<cfquery name="colours" datasource="scratch_mssql">
	SELECT	id, en, mi
	FROM	colours
</cfquery>
<cfdump var="#colours#" metainfo="false">