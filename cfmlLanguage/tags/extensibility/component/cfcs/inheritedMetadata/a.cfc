<cfcomponent output="false">


	<cffunction name="faOnly" returntype="boolean" access="public" output="false" hint="A method in A.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInB" returntype="boolean" access="public" output="false" hint="A method in A in be overriden in B.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInC" returntype="boolean" access="public" output="false" hint="A method in A in be overriden in C.">
		<cfreturn true>
	</cffunction>


	<cffunction name="faOverrideInBandC" returntype="boolean" access="public" output="false" hint="A method in A in be overriden in B and C.">
		<cfreturn true>
	</cffunction>


</cfcomponent>
