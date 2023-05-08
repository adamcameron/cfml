<cfcomponent>


	<cffunction name="returnArray" returntype="array" access="remote">
		<cfset var a = arrayNew(1)>
		<cfset a[1] = structNew()>
		<cfset a[1].one = "tahi">
		<cfset a[2] = structNew()>
		<cfset a[2].two = "rua">
		<cfset a[3] = structNew()>
		<cfset a[3].three = "toru">
		<cfset a[4] = structNew()>
		<cfset a[4].four = "wha">
		<cfreturn createObject("java", "java.util.Vector").init(a)>
	</cffunction> 

	
</cfcomponent>