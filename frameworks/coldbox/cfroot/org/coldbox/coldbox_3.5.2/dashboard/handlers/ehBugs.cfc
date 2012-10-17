<!---
Author			:	Luis Majano
Create Date		:	September 19, 2005
Update Date		:	September 25, 2006
Description		:

Bug handler

--->
<cfcomponent name="ehBugs" extends="baseHandler" output="false">
	
	<cfproperty name="settingsService" 	inject="id:SettingsService">
	<cfproperty name="dashboardService" inject="id:dashboardService">
	
	<!--- preHandler --->
	<cffunction name="preHandler" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any" required="yes">
	    <cfif not findnocase("gateway",event.getCurrentEvent())>
	    	<cfset event.setLayout("Layout.Ajax")>
	    </cfif> 
	</cffunction>
	
	<!--- ************************************************************* --->
	<!--- SUBMIT BUG	 												--->
	<!--- ************************************************************* --->
	<cffunction name="dspGateway" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehSubmitBug = "ehBugs.dspSubmitBug">
		<!--- Set the Rollovers For This Section --->
		<cfset rc.qRollovers = getPlugin("QueryHelper").filterQuery(settingsService.getRollovers(),"pagesection","bugs")>
		<!--- Set the View --->
		<cfset Event.setView("bugs/gateway")>
	</cffunction>

	<cffunction name="dspSubmitBug" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehBugs.doSubmitBug">
		<!--- Help --->
		<cfset rc.help = renderView("bugs/help/SubmitBugs")>
		<!--- Set the View --->
		<cfset Event.setView("bugs/vwSubmitBugs")>
	</cffunction>

	<cffunction name="doSubmitBug" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- Validate --->
		<cfif len(trim(rc.email)) eq 0 or len(trim(rc.bugreport)) eq 0 or len(trim(rc.name)) eq 0>
			<cfset getPlugin("MessageBox").setMessage("warning", "Please fill out all the mandatory fields.")>
		<cfelse>
			<cftry>
				<!--- Send report --->
				<cfset dashboardService.sendBugReport(rc,getSettingStructure(true))>
				<cfset getPlugin("MessageBox").setMessage("info", "You have successfully sent your bug report to the ColdBox bug email address.")>
				<cfcatch type="any">
					<cfset getPlugin("Logger").logError("Error sending bug report.", cfcatch)>
					<cfset getPlugin("MessageBox").setMessage("error","An error ocurred while sending the bug report: #cfcatch.Detail# #cfcatch.message#")>
				</cfcatch>
			</cftry>
		</cfif>
		<cfset setNextEvent("ehBugs.dspSubmitBug")>
	</cffunction>


</cfcomponent>