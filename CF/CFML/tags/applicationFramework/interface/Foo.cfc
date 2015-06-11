<cfcomponent implements="shared.cf.cfml.I.interface.IFoo">


	<cffunction name="getSelf" returntype="IFoo">
		<cfreturn this>
	</cffunction>


</cfcomponent>