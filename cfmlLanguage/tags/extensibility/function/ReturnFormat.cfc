<cfcomponent output="false">

	<cffunction access="remote" output="true" name="f" returntype="struct" returnformat="plain" hint="Investigating return formats">
		<cfreturn {u=createUuid()}>
	</cffunction>
	
</cfcomponent>