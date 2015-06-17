<cfset params = {
	low		= URL.low,
	high	= URL.high
}>
<cfquery name="colours" datasource="mssql_scratch" params="#params#">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	:low AND :high
</cfquery>

<cfset params = [URL.low, URL.high]>
<cfquery name="colours" datasource="mssql_scratch" params="#params#">
	SELECT	en AS english, mi AS maori
	FROM	colours
	WHERE	id	BETWEEN	? AND ?
</cfquery>
