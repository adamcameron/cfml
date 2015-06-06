<cfcomponent output="false">


<cfset THIS.name 				= "testApp">


	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfscript>
//			THIS.name 				= "testApp";
			THIS.sessionManagement 	= true;
			THIS.setClientCookies 	= true;
			THIS.setDomainCookies 	= false;
			application.tsStart		= now();
		</cfscript>
		<cfreturn true>
	</cffunction>


	<cffunction name="onApplicationEnd">
		<cfargument name="ApplicationScope" required="true">
	</cffunction>


	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfif structKeyExists(URL, "appRestart") and isBoolean(URL.appRestart) and URL.appRestart>
			<cfset onApplicationStart()>
		</cfif>
		<cfreturn true>
	</cffunction>


</cfcomponent>