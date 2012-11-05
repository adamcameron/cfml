<!---
Author			:	Luis Majano
Create Date		:	September 19, 2005
Update Date		:	September 25, 2006
Description		:

Informative handler.

--->
<cfcomponent name="ehInfo" extends="baseHandler" output="false">
	
	<cfproperty name="settingsService" inject="id:SettingsService">
	
	<!--- preHandler --->
	<cffunction name="preHandler" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any" required="yes">
	    <cfif not findnocase("gateway",event.getCurrentEvent())>
	    	<cfset event.setLayout("Layout.Ajax")>
	    </cfif> 
	</cffunction>

	<!--- ************************************************************* --->
	<!--- HOME SECTION 													--->
	<!--- ************************************************************* --->

	<cffunction name="dspGateway" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehSystemInfo = "ehInfo.dspSystemInfo">
		<cfset rc.xehResources = "ehInfo.dspOnlineResources">
		<cfset rc.xehCFCDocs = "ehInfo.dspCFCDocs">
		<!--- Set the Rollovers --->
		<cfset rc.qRollovers = getPlugin("QueryHelper").filterQuery( settingsService.getRollovers(),"pagesection","home")>
		<!--- Set the View --->
		<cfset Event.setView("home/gateway")>
	</cffunction>

	<cffunction name="dspSystemInfo" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- Check if install folder exists --->
		<cfset rc.InstallFolderExits = directoryExists(ExpandPath("/coldbox/install"))>
		<!--- Check if the samples folder exists --->
		<cfset rc.SampleFolderExists = directoryExists(ExpandPath("/coldbox/samples"))>
		<!--- Help --->
		<cfset rc.help = renderView("home/help/SystemInfo")>
		<!--- Set the View --->
		<cfset Event.setView("home/vwSystemInfo")>
	</cffunction>

	<cffunction name="dspOnlineResources" access="public" returntype="void" output="false" cache="true" cacheTimeout="10">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- Help --->
		<cfset rc.help = renderView("home/help/OnlineResources")>
		<!--- Set the View --->
		<cfset Event.setView("home/vwOnlineResources")>
	</cffunction>

	<cffunction name="dspCFCDocs" access="public" returntype="void" output="false" cache="true" cacheTimeout="10">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<cfset var dirpath = getSetting("coldbox_location")>

		<!--- EXIT HANDLERS: --->
		<cfset rc.xehCFCDocs = "ehInfo.dspCFCDocs">
		<cfset rc.cfcViewer = getMyPlugin("CFCViewer")>
		
		<!---Help --->
		<cfset rc.help = renderView("home/help/CFCDocs")>
		
		<!---Logic --->
		<cfset Event.paramValue("show", "")>
		<!--- Setup the cfc viewer --->		
		<cfset rc.cfcViewer.setup(dirpath="#dirpath#/",
								  cfcpath="#dirpath#/",
								  jsLink="doEvent('ehInfo.dspCFCDocs&@package@', 'content', {})")>
		
		<!--- Set the View --->
		<cfset Event.setView("home/vwCFCDocs")>
	</cffunction>

</cfcomponent>