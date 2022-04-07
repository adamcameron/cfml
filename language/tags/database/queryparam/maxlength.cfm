<cfset q = queryNew("")>
<cfset queryAddColumn(q, "data", "varchar", ["tahi", "rua", "toru", "wha"])>

<cfset sFilter = "tahi">

<cftry>
	<cfquery name="q2" dbtype="query">
		SELECT	*
		FROM	q
		WHERE	data = <cfqueryparam value="#sFilter#" maxlength="3">
	</cfquery>
	CFQUERYPARAM MAXLENGTH failed
	<cfdump var="#q2#">
	<cfcatch>
		CFQUERYPARAM MAXLENGTH worked
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>