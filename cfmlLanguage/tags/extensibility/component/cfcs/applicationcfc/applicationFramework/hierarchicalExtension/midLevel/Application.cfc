<cfcomponent extends="shared.cf.cfcs.applicationFramework.hierarchicalExtension.Application">
	Mid-level Application.cfc<br />

	<cffunction name="onApplicationStart" output="true" returntype="boolean">
		Mid-level onApplicationStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" output="true" returntype="boolean">
		Mid-level onApplicationEnd<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart" output="true" returntype="boolean">
		<cfset super.onRequestStart()>
		Mid-level onRequestStart<br />
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestEnd" output="true" returntype="boolean">
		<cfset super.onRequestEnd()>
		Mid-level onRequestEnd<br />
		<cfreturn true>
	</cffunction>

</cfcomponent>