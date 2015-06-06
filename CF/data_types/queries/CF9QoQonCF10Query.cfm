<cffunction name="serialiseB64" output="false" access="private" >
	<cfargument name="o" required="true">
	
	<cfreturn toBase64(objectsave(o))>
	
</cffunction>

<cffunction name="deserialiseB64" output="false" access="private" >
	<cfargument name="o" required="true">
	
	<cfreturn objectload(tobinary(o))>
	
</cffunction>

<cfoutput>
<cfif left(server.coldfusion.productversion,2) is "10">
	COLDFUSION 10 GENERATED QUERY
	<BR>
	
	<cfset q = queryNew("id,name", "cf_sql_integer, cf_sql_varchar")>
	<cfset qrowcount = 5>
	<cfset queryAddRow(q,qrowcount)>
	<cfloop from="1" to ="#qrowcount#" index="r">
		<cfset querySetCell(q, "id", r, r)>
		<cfset querySetCell(q, "name", "record #r#", r)>
	</cfloop>
	<cfdump var="#q#">

	<cfquery name="qoq10" dbtype="query" >
		SELECT *
		FROM q
	</cfquery>

	<div>
		ORIGINAL QUERY AFTER QUERY OF QUERIES
	</div>
	<cfdump var="#qoq10#">

	<cfset sq = serialiseB64(q)>

	<div>
		COPY AND PASTE THE BELOW INTO THIS SCRIPT ON A CF9 SERVER
	</div>
	<textarea rows="8" cols="100"><cfoutput>#sq#</cfoutput></textarea>
<cfelseif left(server.coldfusion.productversion,1) is "9">
	COLDFUSION 9 PROCESSING CF10 QUERY
	<BR>
	<cfif isDefined('form.serialisedcf10query')>
		<cfset variables.serialisedcf10query = form.serialisedcf10query>
		<cfset cf10query = deserialiseB64(variables.serialisedcf10query)>

		<div>
			ORIGINAL CF10 Query
		</div>
		<cfdump var="#cf10query#">

		<cfquery name="qoq9to10" dbtype="query" >
			SELECT *
			FROM cf10query
		</cfquery>
		<div>
			CF10 Query After Query of Queries
		</div>
		<cfdump var="#qoq9to10#">

		<div>
			Original Query recordcount: #cf10query.recordcount#
		</div>

	<cfelse>
		<cfset cf10query = "">
		<cfset variables.serialisedcf10query = "">
	</cfif>

	<form method="post">
		<div>
		PASTE SERIALISED CF10 QUERY HERE
		</div>
		<textarea rows="8" cols="100" name="serialisedcf10query">#variables.serialisedcf10query#</textarea>
		<div>
		<input type="submit">
		</div>
	</form>

	
</cfif>
</cfoutput>

<div>
	SERVER DETAILS
</div>
<cfdump var="#server#">


