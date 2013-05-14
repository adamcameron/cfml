<!---
Author			:	Luis Majano
Create Date		:	September 19, 2005
Update Date		:	September 25, 2006
Description		:

This is the updater handler

--->
<cfcomponent name="ehUpdater" extends="baseHandler">

	<cfproperty name="settingsService" inject="id:SettingsService">
	
	<!--- preHandler --->
	<cffunction name="preHandler" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any" required="yes">
	    <cfif not findnocase("gateway",event.getCurrentEvent())>
	    	<cfset event.setLayout("Layout.Ajax")>
	    </cfif> 
	</cffunction>
	
	<!--- ************************************************************* --->
	<!--- UPDATE SECTION 												--->
	<!--- ************************************************************* --->
	<cffunction name="dspGateway" access="public" returntype="void">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehUpdater = "ehUpdater.dspUpdater">
		<!--- Set the Rollovers For This Section --->
		<cfset rc.qRollovers = getPlugin("QueryHelper").filterQuery( settingsService.getRollovers(),"pagesection","update")>
		<!--- Set the View --->
		<cfset Event.setView("update/gateway")>
	</cffunction>

	<!--- ************************************************************* --->

	<cffunction name="dspUpdater" access="public" returntype="void">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehCheck = "ehUpdater.docheckForUpdates">
		<!--- Get distribution URL's --->
		<cfset rc.qURLS = settingsService.getDistributionUrls()>
		<!--- Help --->
		<cfset rc.help = renderView("update/help/Updater")>
		<!--- Set the View --->
		<cfset Event.setView("update/vwUpdater")>
	</cffunction>

	<!--- ************************************************************* --->

	<cffunction name="docheckForUpdates" access="public" returntype="void">
		<cfargument name="event" type="any" required="true">
		<cfset var errorString = "Error retrieving update information from the ColdBox distribution site. Below you can see some diagnostic information.<br><br>">
		<cfset var updateWS = "">
		<cfset var updateResults = "">
		<!--- Param Site--->
		<cfset Event.paramValue("distribution_site", "")>
		<cftry>
			<!--- Check for URL --->
			<cfif Event.getValue("distribution_site") eq "">
				<cfset getPlugin("MessageBox").setMessage("warning", "The distribution site to query seems to be invalid. Please check again")>
				<cfset setnextEvent("ehUpdater.dspUpdater")>
			</cfif>
			<!--- Get a WS Object --->
			<cfset updateWS = CreateObject("webservice",Event.getValue("distribution_site"))>
			<!--- Check for Updates --->
			<cfset updateResults = updateWS.getUpdateInfo('#getSetting("Version",1)#',"#getSetting("Version")#")>
			<!--- CHeck for WS Errors --->
			<cfif updateResults.error>
				<cfset getPlugin("Logger").logError(errorString,structnew(),updateResults.errorMessage)>
				<cfset getPlugin("MessageBox").setMessage("error", errorString & updateResults.errorMessage)>
			<cfelse>
				<!--- Save Update Results --->
				<cfset getPlugin("SessionStorage").setVar("updateResults", updateResults)>
				<!--- set next event --->
				<cfset setNextEvent("ehUpdater.dspUpdaterResults")>
			</cfif>
			<!--- Catch --->
			<cfcatch type="any">
				<cfset getPlugin("Logger").logError(errorString, cfcatch)>
				<cfset getPlugin("MessageBox").setMessage("error","#errorString##cfcatch.Detail#<br><br>#cfcatch.Message#")>
			</cfcatch>
		</cftry>
		<cfset setnextEvent("ehUpdater.dspUpdater")>
	</cffunction>

	<!--- ************************************************************* --->

	<cffunction name="dspUpdaterResults" access="public" returntype="void">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehdoUpdate = "ehUpdater.doGetUpdate">
		<cfset rc.UpdateResults = getPlugin("SessionStorage").getVar("updateResults")>
		<!--- Help --->
		<cfset rc.help = renderView("update/help/UpdaterResults")>
		<!--- Set the View --->
		<cfset Event.setView("update/vwUpdaterResults")>
	</cffunction>

	<!--- ************************************************************* --->

</cfcomponent>