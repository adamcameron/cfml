<!--- /differentapps/app2/clearCachedNumbers.cfm --->

<cfquery datasource="scratch_mysql">
	INSERT INTO numbers (
		english, maori
	) values (
		<cfqueryparam value="five">,
		<cfqueryparam value="rima">
	)
</cfquery>
<cfquery name="numbers" datasource="scratch_mysql" cachedwithin="#createTimeSpan(0,0,0,0)#">
	SELECT		id, english, maori
	FROM		numbers
	ORDER BY	id
</cfquery>
<cfdump var="#numbers#">