<cfcomponent extends="SuperC">

	
	<cffunction name="childMethod">
		Top of childMethod()<br />
		Before sleep<br />
		<cfset sleep(10000)>
		After sleep<br />
		Before calling superMethod()<br />
		<cfset super.superMethod()>
		After calling superMethod()<br />
		Bottom of childMethod()<br />
		<cfdump var="#getMetadata(this)#">
		<cfdump var="#getMetadata(superMethod)#">
	</cffunction>
	
	<cffunction name="mungSuper">
		<cfset structClear(super)>
	</cffunction>
	
</cfcomponent>