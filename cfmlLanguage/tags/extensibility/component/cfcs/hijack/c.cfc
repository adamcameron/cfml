<cfcomponent>
	<!--- this is a 'private' variable --->
	<cfset secret = "This is a secret">

	<cffunction name="safeFunction" output="false" access="private">
		<cfreturn "A safe value">
	</cffunction>
</cfcomponent>