<cfcomponent>

	<cfdump var="#this#">

	<cffunction name="privateFunction" access="private" returntype="void">
		privateFunction()<br />
	</cffunction>
	
	<cffunction name="publicFunction" access="public" returntype="void">
		publicFunction()<br />
	</cffunction>

	<cffunction name="publicWrapperForPrivateFunction" access="public" returntype="void">
		publicWrapperForPrivateFunction() => [<cfoutput>#this.privateFunction()#</cfoutput>]<br />
	</cffunction>

	<cffunction name="publicWrapperForPublicFunction" access="public" returntype="void">
		publicWrapperForPublicFunction() => [<cfoutput>#this.publicFunction()#</cfoutput>]<br />
	</cffunction>

</cfcomponent>