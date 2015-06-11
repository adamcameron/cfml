<cfcomponent extends="a">


	<cffunction name="fbOnly" returntype="boolean" access="public" output="false" hint="A method in B.">
		<cfreturn true>
	</cffunction>


	<cffunction name="fbOverrideInC" returntype="boolean" access="public" output="false" hint="A method in B in be overriden in C.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInB" returntype="boolean" access="public" output="false" hint="A method from A, overriden in B.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInBandC" returntype="boolean" access="public" output="false" hint="A method from A, overriden in B (and will be overridden in C too).">
		<cfreturn true>
	</cffunction>


</cfcomponent>