<cfcomponent>
	Outer Application.cfc<br />

	<cffunction name="onApplicationStart" output="true" returntype="boolean">
		Outer onApplicationStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" output="true" returntype="boolean">
		Outer onApplicationEnd<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart" output="true" returntype="boolean">
		Outer onRequestStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestEnd" output="true" returntype="boolean">
		Outer onRequestEnd<br />
		<cfreturn true>
	</cffunction>

</cfcomponent>