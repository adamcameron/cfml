<cfcomponent output="false" extends="parent">

	<cfset createObject("java", "java.lang.Thread").sleep(10)>
	<cfset this.ordering.childPseudoConstructor = getTickCount()>

	<cffunction name="init" returntype="child" output="false" access="public">
		<cfset super.init()>
		<cfset createObject("java", "java.lang.Thread").sleep(10)>
		<cfset this.ordering.childInit = getTickCount()>
		<cfreturn this>
	</cffunction>

</cfcomponent>