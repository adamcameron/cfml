<cfcomponent>

	<cffunction name="originalMethodName" returntype="any" output="false">
		<cfreturn createObject("java","java.lang.Exception").init()>
	</cffunction>

</cfcomponent>