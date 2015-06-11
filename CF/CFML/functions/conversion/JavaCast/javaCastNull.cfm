<cffunction name="f" returntype="boolean" output="true">
	<cfargument name="i" required="true">
	<cfdump var="#arguments#" label="arguments">
	<cfreturn arguments.i>
</cffunction>

<cfdump var="#f(i=javaCast('null', ''))#" label="f(i=n)">
<cfdump var="#variables#" label="variables">
