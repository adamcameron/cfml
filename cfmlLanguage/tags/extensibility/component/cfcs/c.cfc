<cfcomponent>

	<cffunction name="init" output="true">
		<div>init() called</div>
		<cfdump var="#this#" label="this before">
		<cfdump var="#variables#" label="variables before">
		<cfset this.f = variables.f>
		<cfdump var="#this#" label="this after">
		<cfdump var="#variables#" label="variables after">
		<cfset structDelete(this, "init")>
		<div>init() removed from CFC</div>
		<cfreturn this>
	</cffunction>


	<cffunction name="f" output="true" access="private">
		<div>f() called</div>
		<cfreturn />
	</cffunction>


</cfcomponent>