<cfapplication name="lz" sessionmanagement="true">
<cfflush interval="16">
<cfparam name="URL.rows" default="0" type="integer">

<cfquery name="q" datasource="scratch">
	SELECT		*
	FROM		tbl_leading_zeros
	WHERE		lz_id <= <cfqueryparam value="#URL.rows#" cfsqltype="cf_sql_integer">
	ORDER BY	lz_id
</cfquery>

<cfdump var="#q#">

<table border="1">
<cfloop query="q">
	<cfoutput><tr><td>#lz_id#</td><td>#lz_data#</td></tr></cfoutput>
</cfloop>
</table>

<cfset session.q = q>
<cfdump var="#session.q#">

<table border="1">
<cfloop query="session.q">
	<cfoutput><tr><td>#lz_id#</td><td>#lz_data#</td></tr></cfoutput>
</cfloop>
</table>