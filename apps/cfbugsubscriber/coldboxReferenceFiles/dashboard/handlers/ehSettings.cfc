<!---
Author			:	Luis Majano
Create Date		:	September 19, 2005
Update Date		:	September 25, 2006
Description		:

This is the settings handler

--->
<cfcomponent name="ehSettings" extends="baseHandler" output="false">

	<cfproperty name="settingsService" 			inject="id:SettingsService">
	<cfproperty name="coldBoxSettingsService" 	inject="id:ColdBoxSettingsService">
	
	<!--- preHandler --->
	<cffunction name="preHandler" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any" required="yes">
	    <cfif not findnocase("gateway",event.getCurrentEvent())>
	    	<cfset event.setLayout("Layout.Ajax")>
	    </cfif> 
	</cffunction>
	
	<!--- ************************************************************* --->
	<!--- SETTINGS SECTION 												--->
	<!--- ************************************************************* --->

	<!--- Display the gateway --->
	<cffunction name="dspGateway" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehSettings = "ehSettings.dspOverview">
		<cfset rc.xehLogSettings = "ehSettings.dspLogSettings">
		<cfset rc.xehGeneralSettings = "ehSettings.dspGeneralSettings">
		<cfset rc.xehDebuggerSettings = "ehSettings.dspDebuggerSettings">
		<cfset rc.xehConventions = "ehSettings.dspConventions">
		<cfset rc.xehPassword = "ehSettings.dspChangePassword">
		<cfset rc.xehProxy = "ehSettings.dspProxySettings">
		<cfset rc.xehCacheSettings = "ehSettings.dspCachesettings">
		<!--- Set the Rollovers For This Section --->
		<cfset rc.qRollovers = getPlugin("QueryHelper").filterQuery(settingsService.getRollovers(),"pagesection","settings")>
		<!--- Set the View --->
		<cfset Event.setView("settings/gateway")>
	</cffunction>

	<!--- Display the overview --->
	<cffunction name="dspOverview" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		
		<cfset rc.fwSettings = coldBoxSettingsService.getSettings()>
		
		<!--- Help --->
		<cfset rc.help = renderView("settings/help/Overview")>
		
		<!--- Set the View --->
		<cfset Event.setView("settings/vwOverview")>
	</cffunction>

	<!--- Display general Settings --->
	<cffunction name="dspGeneralSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doSaveGeneralSettings">
		
		<!--- Get general Settings --->
		<cfset rc.fwSettings = coldBoxSettingsService.getSettings()>
		<cfset rc.help = renderView("settings/help/GeneralSettings")>
		
		<!--- Set the View --->
		<cfset Event.setView("settings/vwGeneralSettings")>
	</cffunction>
	
	<!--- Save the General Settings --->	
	<cffunction name="doSaveGeneralSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfscript>
			var rc = event.getCollection();
			var fwSettings = coldBoxSettingsService.getSettings();
			var errors = "";
			
			//Error Checks
			if( len(Trim(rc.EventName)) eq 0 ){
				getPlugin("MessageBox").setMessage("error","Please enter all the required fields.");
				setNextEvent("ehSettings.dspGeneralSettings");
			}
			else{
				coldBoxSettingsService.saveGeneralSettings(rc);
				getPlugin("MessageBox").setMessage("info","Settings have been updated successfully. Please remember to reinitialize the framework on your applications for the changes to take effect.");
				setNextEvent("ehSettings.dspGeneralSettings");
			}
			
		</cfscript>
	</cffunction>
	
	<!--- Display the Conventions --->
	<cffunction name="dspConventions" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doSaveConventions">
		
		<cfset rc.Conventions = coldBoxSettingsService.getConventions()>
		<cfset rc.help = renderView("settings/help/conventions")>
				
		<!--- Set the View --->
		<cfset Event.setView("settings/vwConventions")>
	</cffunction>
	
	<!--- save the conventions --->
	<cffunction name="doSaveConventions" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfscript>
			var rc = event.getCollection();
			//var Get Bean
			var oConventions = getModel("ConventionsBean");
			
			//Populate bean with form data
			getPlugin("BeanFactory").populateBean(oConventions);
			
			//Validate Bean.
			if ( oConventions.validate() ){
				//Save results
				coldBoxSettingsService.saveConventions(oConventions);
				//messagebox
				getPlugin("MessageBox").setMessage("warning", "Changes made sucessfully.Please make sure you change your conventions appropiately.");
				//Relocate
				setNextEvent("ehSettings.dspConventions");
			}
			else{
				getPlugin("MessageBox").setMessage("info","Please fill out all the values");
				setNextEvent("ehSettings.dspConventions");
			}			
		</cfscript>		
	</cffunction>
	
	<!--- Display debugger Settings --->
	<cffunction name="dspDebuggerSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doSaveDebuggerSettings">
		
		<!--- Get general Settings --->
		<cfset rc.fwSettings = coldBoxSettingsService.getSettings()>
		<cfset rc.help = renderView("settings/help/DebuggerSettings")>
		
		<!--- Set the View --->
		<cfset Event.setView("settings/vwDebuggerSettings")>
	</cffunction>
	
	<!--- Save the Debugger Settings --->	
	<cffunction name="doSaveDebuggerSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfscript>
			var rc = event.getCollection();
			var fwSettings = coldBoxSettingsService.getSettings();
			var errors = "";
			
			//Error Checks
			if( len(trim(rc.maxPersistentRequestProfilers)) eq 0 or 
			    len(Trim(rc.maxRCPanelQueryRows)) eq 0){
				getPlugin("MessageBox").setMessage("error","Please enter all the required fields.");
				setNextEvent("ehSettings.dspDebuggerSettings");
			}
			else if( not isNumeric(rc.maxPersistentRequestProfilers) or
			         not isNumeric(rc.maxRCPanelQueryRows) ){
					getPlugin("MessageBox").setMessage("error","The maxPersistentRequestProfilers and maxRCPanelQueryRows settings must be numeric.");
					setNextEvent("ehSettings.dspDebuggerSettings");
			}
			else{
				coldBoxSettingsService.saveDebuggerSettings(rc);
				getPlugin("MessageBox").setMessage("info","Settings have been updated successfully. Please remember to reinitialize the framework on your applications for the changes to take effect.");
				setNextEvent("ehSettings.dspDebuggerSettings");
			}
			
		</cfscript>
	</cffunction>

	<!--- Display log settings --->
	<cffunction name="dspLogSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doSaveLogFileSettings">
		
		<cfset rc.fwSettings = coldBoxSettingsService.getSettings()>
		<cfset rc.help = renderView("settings/help/LogFileSettings")>
		
		<!--- Set the View --->
		<cfset Event.setView("settings/vwLogFileSettings")>
	</cffunction>

	<!--- Save Log Settings --->
	<cffunction name="doSaveLogFileSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<cfset var fwSettings = coldBoxSettingsService.getSettings()>
		<cfset var errors = false>
		
		<!--- Validate blanks --->
		<cfif len(trim(rc.DefaultLogDirectory)) eq 0 or len(trim(rc.LogFileEncoding)) eq 0 or len(trim(rc.LogFileMaxArchives)) eq 0 or len(trim(rc.LogFileMaxSize)) eq 0>
			<cfset getPlugin("MessageBox").setMessage("error","Please make sure you fill out all the values.")>
			<cfset errors = true>
		</cfif>
		<!--- ValidateMax Size ---->
		<cfif not isNumeric(rc.LogFileMaxSize)>
			<cfset getPlugin("MessageBox").setMessage("error","The Log File Max Size you sent in is not numeric. Please try again")>
			<cfset errors = true>
		</cfif>
		<!--- LogFileMaxArchives Size ---->
		<cfif not isNumeric(rc.LogFileMaxArchives) or rc.LogFileMaxArchives lte 0>
			<cfset getPlugin("MessageBox").setMessage("error","The Log File Max Archives you sent in is not numeric or valid. Please try again")>
			<cfset errors = true>
		</cfif>
		
		<!--- Check for Errors --->
		<cfif not errors>
			<!--- Update the settings --->
			<cfset coldBoxSettingsService.saveLogFileSettings(rc)>
			<cfset getPlugin("MessageBox").setMessage("info","Settings have been updated successfully. Please remember to reinitialize the framework on your applications for the changes to take effect.")>
		</cfif>
		
		<!--- Relocate --->
		<cfset setNextEvent("ehSettings.dspLogSettings")>
	</cffunction>

	<!--- Disp change password --->
	<cffunction name="dspChangePassword" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doChangePassword">
		<!--- Help --->
		<cfset rc.help = renderView("settings/help/Password")>
		<!--- Set the View --->
		<cfset Event.setView("settings/vwPassword")>
	</cffunction>

	<!--- Change Password --->
	<cffunction name="doChangePassword" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<cfset var errors = false>
		<cfset var rtnStruct = "">
		<!--- Validate Passwords --->
		<cfif len(trim(rc.oldpassword)) eq 0 or len(trim(rc.newpassword)) eq 0 or len(trim(rc.newpassword2)) eq 0>
			<cfset getPlugin("MessageBox").setMessage("error", "Please fill out all the necessary fields.")>
		<cfelse>
			<!--- Save the new password --->
			<cfset rtnStruct = settingsService.changePassword(rc.oldpassword,rc.newpassword,rc.newpassword2)>
			<!--- Validate --->
			<cfif not rtnStruct.results>
				<cfset getPlugin("MessageBox").setMessage("error", "#rtnStruct.message#")>
			<cfelse>
				<cfset getPlugin("MessageBox").setMessage("info", "Your new password has been updated successfully.")>
			</cfif>
		</cfif>
		<!--- Move to new event --->
		<cfset setnextEvent("ehSettings.dspChangePassword")>
	</cffunction>

	<!--- Disp Cache Se4ttings --->
	<cffunction name="dspCacheSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehDoSave = "ehSettings.doSaveCacheSettings">
		
		<cfset rc.fwSettings = coldBoxSettingsService.getSettings()>
		<cfset rc.help = renderView("settings/help/CachingSettings")>
		
		<!--- Set the View --->
		<cfset Event.setView("settings/vwCachingSettings")>
	</cffunction>

	<!--- Save Cache Settings --->
	<cffunction name="doSaveCacheSettings" access="public" returntype="void" output="false">
		<cfargument name="event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<cfset var fwSettings = coldBoxSettingsService.getSettings()>
		<cfset var errors = false>
		
		<!--- Validate blanks --->
		<cfif len(trim(rc.CacheObjectDefaultTimeout)) eq 0 or
		      len(trim(rc.CacheObjectDefaultLastAccessTimeout)) eq 0 or
		      len(Trim(rc.CacheReapFrequency)) eq 0 or
		      len(trim(rc.CacheMaxObjects)) eq 0 or
		      len(trim(rc.CacheFreeMemoryPercentageThreshold)) eq 0>
			<cfset getPlugin("MessageBox").setMessage("error","You cannot leave any empty configurations.")>
			<cfset setNextEvent("ehSettings.dspCacheSettings")>
		<cfelseif not isNumeric(rc.CacheObjectDefaultTimeout) or
				  not isNumeric(rc.CacheObjectDefaultLastAccessTimeout) or
				  not isNumeric(rc.CacheReapFrequency) or
				  not isNumeric(rc.CacheMaxObjects) or
				  not isNumeric(rc.CacheFreeMemoryPercentageThreshold)>
			<cfset getPlugin("MessageBox").setMessage("error","Only numerical values are allowed.")>
			<cfset setNextEvent("ehSettings.dspCacheSettings")>
		<cfelse>
			<cfset coldBoxSettingsService.saveCacheSettings(rc)>
			<cfset getPlugin("MessageBox").setMessage("info","Settings have been updated successfully. Please remember to reinitialize the framework on your applications for the changes to take effect.")>
			<!--- Relocate --->
			<cfset setNextEvent("ehSettings.dspCacheSettings")>
		</cfif>
	</cffunction>

</cfcomponent>