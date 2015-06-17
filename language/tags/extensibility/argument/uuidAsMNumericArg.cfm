<cffunction name="f" output="true" returntype="struct">
	<cfargument name="n" type="numeric" required="true">
	<cfdump var="#arguments#">
	<cfreturn arguments>
</cffunction>

<cfdump var="#f(n='ECCFD78C-9BA8-B1BC-4BAB-0D1BBC44ED39')#">