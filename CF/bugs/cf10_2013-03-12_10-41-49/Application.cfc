<cfcomponent displayname="Application"
			output="true"
			hint="Handle the application."
>
	
	<cfscript>
		THIS.Name = "testcf10";
		THIS.enableSession = false;
		THIS.clientManagement = false;
		THIS.SessionManagement = false;
		THIS.SetClientCookies = false;
		THIS.setDomainCookies = false;
		
		THIS.mappings["/root"] = expandPath('.');
		
	</cfscript>


	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		
		<cfif not isDefined("application.include")>
			<cfinclude template="fnc.cfm">
			<cfset application.include = variables.basicInclude>
		</cfif>		

		<cfreturn true />
	</cffunction>	


</cfcomponent>