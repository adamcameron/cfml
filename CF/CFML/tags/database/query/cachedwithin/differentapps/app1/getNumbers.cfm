<!--- /differentapps/app1/getNumbers.cfm --->

<cfquery name="numbers" datasource="scratch_mysql" cachedwithin="#createTimeSpan(0,0,0,30)#">
	SELECT		id, english, maori
	FROM		numbers
	ORDER BY	id
</cfquery>
<cfdump var="#numbers#">