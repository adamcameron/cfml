<cfcomponent>

	<cfset variables.instance	= structNew()>
	<cfset variables.internal	= structNew()>
	<cfset variables.internal.EqualityTester = createObject("java", "EqualityTester")>

	<cffunction name="init" returntype="shared.cfcs.equals.Name" output="false" access="public" hint="Initialises the Name">
		<cfargument name="firstName" type="string" required="yes" hint="First name">
		<cfargument name="lastName" type="string" required="yes" hint="Last name">
		<cfset variables.instance.firstName = arguments.firstName>
		<cfset variables.instance.lastName = arguments.lastName>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="equalsObject" returntype="boolean" output="false" access="public" hint="Returns whether this object is the same as another object">
		<cfargument name="object" type="WEB-INF.cftags.component" required="true" hint="An object to test for equality">
		<cfreturn variables.internal.EqualityTester.equal(this, arguments.object)>
	</cffunction>

</cfcomponent>