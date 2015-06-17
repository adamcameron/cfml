<cfset uTenId = "2F493069-7CE9-4555-AEBA95698DB3B6F8">
<cfquery name="q1" datasource="syc_test" result="st1" cachedwithin="#createTimespan(0,0,1,0)#">
	SELECT		sobj_id, sobj_created, sobj_modified
	FROM		sobj_user
	WHERE		ten_id = <cfqueryparam value="#uTenId#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
	ORDER BY	usr_loginid
</cfquery>
<cfdump var="#q1#" label="q1">
<cfdump var="#st1#" label="st1">

<cfquery name="q2" datasource="syc_test" result="st2" cachedwithin="#createTimespan(0,0,1,0)#">
	SELECT		sobj_id, sobj_created, sobj_modified
	FROM		sobj_user
	WHERE		ten_id = <cfqueryparam value="#uTenId#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
	ORDER BY	usr_loginid
</cfquery>
<cfdump var="#q2#" label="q2">
<cfdump var="#st2#" label="st2">

<cfquery name="q3" datasource="syc_test" result="st3" cachedwithin="#createTimespan(0,0,2,0)#">
	SELECT		sobj_id, usr_loginid, usr_password, usr_firstname, usr_lastname
	FROM		sobj_user
	WHERE		ten_id = <cfqueryparam value="#uTenId#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
	ORDER BY	usr_loginid
</cfquery>
<cfdump var="#q3#" label="q3">
<cfdump var="#st3#" label="st3">

<cfquery name="q4" datasource="syc_test" result="st4" cachedwithin="#createTimespan(0,0,2,0)#">
	SELECT		sobj_id, usr_loginid, usr_password, usr_firstname, usr_lastname
	FROM		sobj_user
	WHERE		ten_id = <cfqueryparam value="#uTenId#" cfsqltype="CF_SQL_VARCHAR" maxlength="35">
	ORDER BY	usr_loginid
</cfquery>
<cfdump var="#q4#" label="q4">
<cfdump var="#st4#" label="st4">
