<cfcomponent>
	Top of CFC<br />
	<cffunction name="f" output="yes" returntype="void">
		<cfflush>
		Top of Function<br />
		<cfinclude template="./inc_first.cfm">
	</cffunction>
</cfcomponent>