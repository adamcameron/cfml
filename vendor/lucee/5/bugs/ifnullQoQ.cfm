<cfdump var="#server.lucee.version#">
<cfquery name="dbData">
	SELECT *
	FROM bug_test_data
</cfquery>
<cfdump var="#dbData#">
<cfquery name="qoqData" dbtype="query">
	SELECT
		IFNULL(plan, 'n/a') AS plan,
		IFNULL(subscription_name, 'n/a') AS subscription_name
	FROM dbData
</cfquery>
<cfdump var="#qoqData#">
