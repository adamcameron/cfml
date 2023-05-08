<cffunction name="test" access="public" output="false" returntype="any">
	<cfargument name="thevalue" type="numeric" required="yes">

	<cfset var retval = structnew()>
	<cfset retval.isnumeric = isnumeric(arguments.thevalue)>
	<cfset retval.isDate = isDate(arguments.thevalue)>
	<cfset retval.asDate = dateFormat(arguments.thevalue)>
	<cfset retval.rawvalue = arguments.thevalue>
	<cfset retval.dothemath = arguments.thevalue - 0>
	<cfset retval.theval = val(arguments.thevalue)>

	<cfreturn retval>
</cffunction>

<!---<cfset valList = "1,1,6|0,1|1,1,6,9|0,0,1">--->
<cfset valList = "1,1,0|1,1,1|1,1,2|1,1,3">
<cfset valList = "1,1,6|1,2,6|0,1|1,1,6,9|0,0,1">


<cfloop list="#valList#" index="i" delimiters="|">
	Passing in: <cfoutput>#i#</cfoutput><br />
	<!---<cftry>--->
		<cfset retval = test(i)>
<!---		<cfcatch type="any">
			<cfset retval = "ERROR: " & cfcatch.detail>
		</cfcatch>
	</cftry>--->
		<cfdump var="#retval#">
	<hr />
</cfloop>
