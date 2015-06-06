<cfoutput><pre>
	<cfset s = "{d '2012-02-28'}">
	isODBCDate("#s#") = #isODBCDate(s)#<br />
	<cfset s = "{d '2012-02-31'}">
	isODBCDate("#s#") = #isODBCDate(s)#<br />
	<cfset s = "{d '2012-02-31'}">
	isODBCDate("#s#") = #isODBCDate(s)#<br />
	<cfset s = "{d '2012-19-39'}">
	isODBCDate("#s#") = #isODBCDate(s)#<br />
</pre></cfoutput>

<cffunction name="isODBCDate" access="public" returntype="boolean" output="false">
	<cfargument name="str" required="yes" type="string" />
	<cftry>
		<cfset parseDateTime(arguments.str)>
		<cfreturn (len(str) gt 10 and refindNoCase("^\{(d|t|ts) \'([1-3][0-9]{3}\-[0-1][0-9]\-[0-3][0-9] ?)?([0-2][0-9]:[0-5][0-9]:[0-5][0-9])?\'\}$", str)) />
		<cfcatch>
			<cfreturn false>
		</cfcatch>
	</cftry>
</cffunction>