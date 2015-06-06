<cffunction name="convertQueryStringToStruct" access="public" returntype="struct" output="false" hint="I accept a URL query string and return it as a structure.">
	<cfargument name="querystring" type="string" required="true" hint="I am the query string for which to parse.">

	<cfreturn createObject('java', 'coldfusion.util.HTMLTools').parseQueryString(arguments.querystring)>
</cffunction>

<cfdump var="#convertQueryStringToStruct(CGI.query_string)#">