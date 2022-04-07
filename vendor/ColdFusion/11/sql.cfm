SELECT		*
FROM		words
<cfif structKeyExists(URL, "type")>
	WHERE		type = :type
	<cfset params = {type={value=URL.type, cfsqltype="CF_SQL_VARCHAR"}}>
<cfelse>
	<cfset params = {}>
</cfif>
ORDER BY	id