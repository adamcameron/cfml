<!---
Author			:	Luis Majano
Create Date		:	September 19, 2006
Update Date		:	September 25, 2006
Description		:

This is the app Builder handler.

--->
<cfcomponent name="ehGenerator" extends="baseHandler" output="false">

	<cfproperty name="settingsService" 	inject="id:SettingsService">
	<cfproperty name="GeneratorService" inject="id:GeneratorService">
	
<!------------------------------------------- PUBLIC ------------------------------------------->

	<cffunction name="dspGenerator" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any" required="true">
		<cfscript>
			var rc = event.getCollection();
			// EXIT HANDLERS
			rc.xehServerBrowser = "ehServerBrowser.dspBrowser";
			rc.xehGenerate = "ehGenerator.generateApplication";
			// Help
			rc.help = renderView("tools/help/generator");
			// Set the View
			event.setView("tools/vwGenerator");
		</cfscript>
	</cffunction>

	<!--- ************************************************************* --->

	<cffunction name="generateApplication" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = event.getCollection();
			var oGeneratorBean = getModel("GeneratorBean");
			var appRelocation = "";
			
			//Populate bean with form data
			getPlugin("BeanFactory").populateBean(oGeneratorBean);
			
			//Set appRelocation
			appRelocation = oGeneratorBean.getAppLocation();
			try{
				//Generate Application
				generatorService.generate(oGeneratorBean);
				//Set message
				getPlugin("MessageBox").setMessage("info", "Generation completed with no errors.");
				//Relocate
				setNextEvent("ehGenerator.dspGeneratedSummary","appRelocation=#urlEncodedFormat(appRelocation)#");
			}
			Catch(Any e){
				writeDump(e);abort;
				getPlugin("MessageBox").setMessage("error", "An error occurred generating your application. Please look at the logs for more information. Diagnostic: #e.detail# #e.message#");
				getPlugin("Logger").logError("Error generating application",e);
				setNextEvent("ehGenerator.dspGenerator");
			}
		</cfscript>
	</cffunction>

	<!--- ************************************************************* --->

	<cffunction name="dspGeneratedSummary" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any" required="true">
		<cfscript>
			var rc = event.getCollection();
			var webroot = ExpandPath('/');
			
			rc.appRelocation = urlDecode(rc.appRelocation);
			rc.appOutsideWebroot = true;
			
			/* Test App Location is in webroot */
			if( findnocase(webroot,rc.appRelocation) ){
				rc.appOutsideWebroot = false;
				rc.webrootLocation = replacenocase(rc.appRelocation,webroot,'');
				rc.webrootLocation = replace(rc.webrootLocation,"\","/","all");
				if( left(rc.webrootLocation,1) neq "/"){
					rc.webrootLocation = "/" & rc.webrootLocation;
				}
			}
			
			/* Get Directory Listing */
			rc.qAppListing = generatorService.getDirectoryListing(rc.appRelocation);
			rc.qAppListing = getPlugin("QueryHelper").sortQuery(rc.qAppListing,"directory");
			
			// Set the View
			event.setView("tools/vwGeneratorSummary");
		</cfscript>
	</cffunction>


</cfcomponent>