<cffunction name="isODBCDate" access="public" returntype="boolean" output="false">
	<cfargument name="str" required="yes" type="string">
	<cfscript>
		// test the format
		if (!(len(str) gt 10 and refindNoCase("^\{(d|t|ts) \'([1-3][0-9]{3}\-[0-1][0-9]\-[0-3][0-9] ?)?([0-2][0-9]:[0-5][0-9]:[0-5][0-9])?\'\}$", str))){
			return false;
		}
		// test that it's actually a valid date (ie: not 31 Feb, etc)
		try {
			parseDateTime(str);
			return true;
		}
		catch (any e){
			return false;
		}
	</cfscript>
</cffunction>


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