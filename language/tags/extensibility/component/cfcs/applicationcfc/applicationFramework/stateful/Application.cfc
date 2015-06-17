<cfcomponent>

	<cfset this.name = "TestApplication">
	<cfset this.Sessionmanagement=true>
	<cfset this.Sessiontimeout="#createtimespan(0,0,10,0)#">
	<cfset this.applicationtimeout="#createtimespan(5,0,0,0)#">


	<cffunction name="onApplicationStart" output="false" returntype="boolean">
		<cfreturn true>
	</cffunction>


	<cffunction name="onRequestStart" output="true">
		<cfparam name="i" default="0">
		<cfset i=i+1>
		<cfoutput>#i#</cfoutput>
		<cfset createObject("java", "java.lang.Thread").sleep(5000)>
	</cffunction>

</cfcomponent>