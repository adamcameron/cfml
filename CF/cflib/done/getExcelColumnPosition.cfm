<cffunction name="GetExcelColumnPosition" output="false" returnType="string">
	<cfargument name="numpos" type="numeric" required="true" />
	<cfset var letterA = "" />
	<cfset var multiplier = "" />
	<cfset var excelPos = "" />
	<cfset letterA = Int(arguments.numpos-26)>
	<cfset multiplier = Int(arguments.numpos/26) />
	<cfif letterA lte 0>
		<cfset excelPos = Chr(arguments.numpos+64) />
	<cfelse>
		<cfset excelPos = Chr(multiplier+64)&Chr(arguments.numpos-(multiplier*26)+65)>
	</cfif>
	<cfreturn excelPos />
</cffunction>

<cfoutput>
<cfloop index="i" from="1" to="100">
	#i#: #GetExcelColumnPosition(i)#<br>
</cfloop>
</cfoutput>