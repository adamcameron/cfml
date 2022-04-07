<!--- functions.cfm --->

<cffunction name="acceptArrayOfSamples" returntype="any">
	<cfargument name="samples" type="Sample[]" required="true">
	<cfreturn samples>
</cffunction>


<cffunction name="returnArrayOfSamples" returntype="Sample[]">
	<cfargument name="samples" type="array" required="true">
	<cfreturn samples>
</cffunction>

<cffunction name="acceptArrayOfStrings" returntype="any">
	<cfargument name="strings" type="string[]" required="true">
	<cfreturn strings>
</cffunction>

<cffunction name="returnArrayOfStrings" returntype="string[]">
	<cfargument name="strings" type="array" required="true">
	<cfreturn strings>
</cffunction>

<cffunction name="acceptArrayOfNumerics" returntype="any">
	<cfargument name="numerics" type="numeric[]" required="true">
	<cfreturn numerics>
</cffunction>

<cffunction name="returnArrayOfNumerics" returntype="numeric[]">
	<cfargument name="numerics" type="array" required="true">
	<cfreturn numerics>
</cffunction>

<cffunction name="acceptArrayOfStructs" returntype="any">
	<cfargument name="structs" type="struct[]" required="true">
	<cfreturn structs>
</cffunction>

<cffunction name="returnArrayOfStructs" returntype="struct[]">
	<cfargument name="structs" type="array" required="true">
	<cfreturn structs>
</cffunction>