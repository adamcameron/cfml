<!---
Author			:	Luis Majano
Create Date		:	September 19, 2005
Update Date		:	September 25, 2006
Description		:

This is the main event handler for the ColdBox dashboard.

--->
<cfcomponent name="main" extends="baseHandler" output="false">

	<!--- ************************************************************* --->

	<cffunction name="onAppStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
	</cffunction>
	
	<!--- ************************************************************* --->

	<cffunction name="onRequestStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Get Session Plugin --->
		<cfset var storage = getPlugin("SessionStorage")>
		
		<!--- GLOBAL EXIT HANDLERS: --->
		<cfset Event.setValue("xehLogout","ehSecurity.doLogout")>
		
		<!--- Authorization --->
		<cfif (not storage.exists("authorized") or storage.getvar("authorized") eq false) and Event.getCurrentEvent() neq "ehSecurity.doLogin">
			<cfset log.info("Login not authorized, redirecting to login")>
			<cfset Event.overrideEvent("ehSecurity.dspLogin")>
		</cfif>
	</cffunction>

	<!--- ************************************************************* --->
	<!--- FRAMESET SECTION												--->
	<!--- ************************************************************* --->
	
	<cffunction name="dspFrameset" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehHome = "ehInfo.dspGateway">
		<cfset rc.xehHeader = "main.dspHeader">
		<!--- Set the View --->
		<cfset Event.setView("vwFrameset",true)>
	</cffunction>
	
	<cffunction name="dspHeader" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehHome = "ehInfo.dspGateway">
		<cfset rc.xehSettings = "ehSettings.dspGateway">
		<cfset rc.xehTools = "ehTools.dspGateway">
		<cfset rc.xehUpdate = "ehUpdater.dspGateway">
		<cfset rc.xehBugs = "ehBugs.dspGateway">
		<!--- Set the View --->
		<cfset Event.setView("tags/header")>
	</cffunction>
		
</cfcomponent>