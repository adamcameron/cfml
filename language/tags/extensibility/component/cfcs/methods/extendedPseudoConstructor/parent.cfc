<cfcomponent output="false">

	<cfset createObject("java", "java.lang.Thread").sleep(10)>
	<cfset this.ordering.parentPseudoConstructor = getTickCount()>

	<cffunction name="init" returntype="parent" output="false" access="public">
		<cfset createObject("java", "java.lang.Thread").sleep(10)>
		<cfset this.ordering.parentInit = getTickCount()>
		<cfreturn this>
	</cffunction>

</cfcomponent>