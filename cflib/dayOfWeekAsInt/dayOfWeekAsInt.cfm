<!--- dayOfWeekAsInt.cfm --->
<cffunction name="dayOfWeekAsInt" returntype="numeric" output="false" hint="I convert a day string to a number (e.g. Sunday to 1, Monday to 2, etc.)">
	<cfargument name="dayAsString" type="string" required="true">
	<cfreturn listfindnocase("Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday", Trim(arguments.dayAsString))>
</cffunction>