<cfcomponent extends="b" output="false">


	<cffunction name="fcOnly" returntype="boolean" access="public" output="false" hint="A method in C.">
		<cfreturn true>
	</cffunction>


	<cffunction name="fbOverrideInC" returntype="boolean" access="public" output="false" hint="A method from B, overriden in C.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInC" returntype="boolean" access="public" output="false" hint="A method from A, overriden in C.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInBandC" returntype="boolean" access="public" output="false" hint="A method from A, overriden in B, and overridden in C too.">
		<cfreturn true>
	</cffunction>


</cfcomponent>