<!---
Author			:	Luis Majano
Create Date		:	March 10, 2007
Description		:

This is the security handler

--->
<cfcomponent name="ehSecurity" extends="baseHandler" output="false">

	<cfproperty name="settingsService" inject="id:SettingsService">

	<!--- ************************************************************* --->
	<!--- LOGIN SECTION													--->
	<!--- ************************************************************* --->
	
	<cffunction name="dspLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<cfset rc.xehLogin = "ehSecurity.doLogin">
		
		<!--- Set the View --->
		<cfset Event.setView("vwLogin")>
	</cffunction>
	
	<cffunction name="doLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Do Login --->
		<cfif len(trim(Event.getValue("password",""))) eq 0>
			<cfset getPlugin("MessageBox").setMessage("error", "Please fill out the password field.")>
			<cfset setNextEvent()>
		</cfif>
		<cfif settingsService.validatePassword(Event.getValue("password"))>
			<!--- Validate user --->
			<cfset getPlugin("SessionStorage").setVar("authorized",true)>
			<cfset setNextEvent()>
		<cfelse>
			<cfset getPlugin("MessageBox").setMessage("error", "The password you entered is not correct. Please try again.")>
			<cfset setNextEvent()>
		</cfif>
	</cffunction>
	
	<cffunction name="doLogout" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset getPlugin("SessionStorage").deleteVar("authorized")>
		<cfset SetNextEvent("ehSecurity.dspLogin")>
	</cffunction>
		
</cfcomponent>