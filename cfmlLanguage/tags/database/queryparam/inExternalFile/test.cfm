<cfquery name="numbers">
	SELECT *
	FROM numbers
	<cfinclude template="./filters.cfm">
	ORDER BY id
</cfquery>
<cfdump var="#numbers#">
