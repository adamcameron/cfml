<cfcomponent extends="Parent">

	<cffunction name="privateFunction" access="private">
	</cffunction>

	<cffunction name="booleanFunction" returntype="boolean">
		<cfargument name="x">
		<cfreturn x>
	</cffunction>


	<cffunction name="hasMetadata" output="false" roles="special" hint="This appears in the API docs for the function" description="This is a description" displayName="This is the displayName">
	</cffunction>


</cfcomponent>
