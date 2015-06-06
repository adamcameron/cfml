<cffunction name="decade" returntype="string" output="no">
	<cfargument name="year" type="numeric" required="yes">

	<cfset startYear = arguments.year - (arguments.year MOD 10)>
	<cfset endYear = arguments.year + (10 - (arguments.year MOD 10) - 1)>

	<cfreturn startYear & "-" & endYear>
</cffunction>

<cfoutput>
#decade("1983")# = 1980-1989<br />
#ListFirst(decade("1983"), "-")# = 1980<br />
#ListLast(decade("1983"), "-")# = 1989<br />	
</cfoutput>