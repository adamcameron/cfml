<!--- C.cfc --->
<cfcomponent>
	
	<cffunction name="returnArrayOfStrings" returntype="string[]">
		<cfargument name="data">
		<cfreturn arguments.data>
	</cffunction>
	
	<cffunction name="takeArrayOfStrings">
		<cfargument name="data" type="string[]">
		<cfreturn arguments.data>
	</cffunction>
	
	<cffunction name="returnArrayOfBaseObjects" returntype="BaseObject[]">
		<cfargument name="data">
		<cfreturn arguments.data>
	</cffunction>
	
	<cffunction name="takeArrayOfBaseObjects">
		<cfargument name="data" type="BaseObject[]">
		<cfreturn arguments.data>
	</cffunction>

</cfcomponent>