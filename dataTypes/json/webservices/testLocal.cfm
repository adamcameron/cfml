<cfscript>
	include "../createRecords.cfm";

	local = new Local();

	result = local.sendQuery(records);

</cfscript>

<cfquery name="qoqDeserialisedRecords" dbtype="query">
	SELECT	*
	FROM	result
	WHERE	intData > 1
</cfquery>
<cfdump var="#[records,result,qoqDeserialisedRecords]#">