<cfoutput><pre>
	#createODBCDate(now())#
	#CreateODBCTime(now())#
	#CreateODBCDateTime(now())#
	isODBCDate(createODBCDate(now())) = #isODBCDate(createODBCDate(now()))#
	isODBCDate(createODBCtime(now())) = #isODBCDate(createODBCtime(now()))#
	isODBCDate(createODBCDatetime(now())) = #isODBCDate(createODBCDatetime(now()))#
	isODBCDate("{t '31:28:49'}") = #isODBCDate("{t '31:28:49'}")#
</pre></cfoutput>

<cffunction name="isODBCDate" access="public" returntype="boolean" output="false">
	<cfargument name="str" required="yes" type="string" />
	<cfreturn (len(str) gt 10 and refindNoCase("^\{(d|t|ts) \'([1-3][0-9]{3}\-[0-1][0-9]\-[0-3][0-9] ?)?([0-2][0-9]:[0-5][0-9]:[0-5][0-9])?\'\}$", str)) />
</cffunction>
