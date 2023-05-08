<cfcomponent>
	 Application.cfc<br />

	<cffunction name="onApplicationStart" output="true" returntype="boolean">
		onApplicationStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" output="true" returntype="boolean">
		onApplicationEnd<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart" output="true" returntype="boolean">
		onRequestStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestEnd" output="true" returntype="boolean">
		onRequestEnd<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onrequest" output="true" returntype="void">
		<cfargument name="targetpage" type="string" required="true">
		onRequest<br />
		<cfinclude template="#arguments.targetpage#">
	</cffunction>

</cfcomponent>