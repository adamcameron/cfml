<cfcomponent displayname="Application">
	<cfscript>
		this.name = "RealEstate_part2";
		this.setclientcookies="false";
		
		// data source name as entered in the CF Administrator 
		variables.dns = "RealEstate";

		// folder path to this file (replace / by dots .)
		variables.componentPath = "realestate";
	</cfscript>

	<!--- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="OnApplicationStart">
	 	<cfset application.listingGateway = createObject("component",variables.componentPath & ".components.ListingGateway").init(variables.dns) />
		<cfset application.statesGateway = createObject("component",variables.componentPath & ".components.StateGateway").init(variables.dns) />
		<cfset application.listingManager = createObject("component",variables.componentPath & ".components.ListingDAO").init(variables.dns) />
	</cffunction>
		
	
	<!--- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
 	<cffunction name="onRequestStart" returnType="boolean">
		<cfargument type="String" name="targetPage" required="true" />
			
			<!--- for convenience, put the statesGateway in the request scope. In a bigger application, you may not want to do this --->
			<cfset request.statesGateway = application.statesGateway />
			<cfset request.componentPath = variables.componentPath />

		<cfreturn true>
	</cffunction> 
	
</cfcomponent>