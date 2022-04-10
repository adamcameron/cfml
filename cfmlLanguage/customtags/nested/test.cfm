<!--- test.cfm --->
<cf_query name="people" datasource="myDsn" result="result">
	SELECT	*
	FROM	person
	WHERE	name	LIKE	<cf_queryparam value="%Zachary%" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
	AND		dob		>		<cf_queryparam value="#createDate(2011,1,1)#" cfsqltype="CF_SQL_DATE">
</cf_query>
<cfdump var="#people#" label="query result">
<cfdump var="#result#" label="query metadata">