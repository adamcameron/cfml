<cfcomponent output="false" hint="I am the Coldb ox Settings model." singleton>

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
	
	<cfscript>
		variables.instance = structnew();
	</cfscript>

	<cffunction name="init" access="public" returntype="ColdBoxSettingsService" output="false">
		<cfargument name="coldbox" required="true" type="any" inject="coldbox">
		<cfscript>
			instance.coldbox 		  	= arguments.coldbox;
			instance.settingsFilePath 	= ExpandPath("#arguments.coldbox.getSetting("coldbox_location")#/web/config/settings.xml");
			instance.qSettings 			= queryNew("");
			instance.Conventions 		= structnew();
			instance.xmlObj 			= "";
			
			// parse coldbox settings.
			parseSettings();
			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- Save Conventions --->
	<cffunction name="saveConventions" access="public" returntype="void" output="false">
		<cfargument name="conventionBean" required="true" type="any">
		<cfscript>
			//save conventions
			var xmlConventions = instance.xmlObj.xmlRoot.Conventions;
			var key = "";
			var Conventions = getConventions();
			var thisConvention = "";
			var conventionsMemento = arguments.conventionBean.getMemento();
			
			//Save XML
			for( x=1; x lte ArrayLen(xmlConventions.xmlChildren); x=x+1){
				thisConvention = conventionsMemento[xmlConventions.xmlChildren[x].xmlName];
				xmlConventions.xmlChildren[x].xmltext = thisConvention;
				Conventions[xmlConventions.xmlChildren[x].xmlName] = thisConvention;
			}
			
			//save file.
			saveSettings();
		</cfscript>
	</cffunction>

	<!--- Save Log File Settings --->
	<cffunction name="saveLogFileSettings" access="public" returntype="void" output="false">
		<!--- ************************************************************* --->
		<cfargument name="rc" required="true" type="struct" hint="The request collection">
		<!--- ************************************************************* --->
		<cfscript>
		var x = 1;
		var settingArray = instance.xmlObj.xmlRoot.settings.xmlChildren;
		for (x=1; x lte ArrayLen(settingArray); x=x+1){
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"DefaultLogDirectory") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.DefaultLogDirectory);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"LogFileEncoding") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.logFileEncoding);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"LogFileMaxArchives") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.LogFileMaxArchives);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"LogFileMaxSize") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.LogFileMaxSize);
			}
		}
		saveSettings();
		</cfscript>
	</cffunction>
	
	<!--- Save Debugger Settings --->
	<cffunction name="saveDebuggerSettings" access="public" returntype="void" output="false">
		<!--- ************************************************************* --->
		<cfargument name="rc" required="true" type="struct" hint="The request collection">
		<!--- ************************************************************* --->
		<cfscript>
		var x = 1;
		var settingArray = instance.xmlObj.xmlRoot.settings.xmlChildren;
		for (x=1; x lte ArrayLen(settingArray); x=x+1){
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"PersistentRequestProfiler") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.PersistentRequestProfiler);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"maxPersistentRequestProfilers") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.maxPersistentRequestProfilers);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"maxRCPanelQueryRows") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.maxRCPanelQueryRows);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"showTracerPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.showTracerPanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"expandedTracerPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.expandedTracerPanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"showInfoPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.showInfoPanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"expandedInfoPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.expandedInfoPanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"showCachePanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.showCachePanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"expandedCachePanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.expandedCachePanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"showRCPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.showRCPanel);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"expandedRCPanel") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.expandedRCPanel);
			}
		}
		saveSettings();
		</cfscript>
	</cffunction>

	<!--- General Settings --->
	<cffunction name="saveGeneralSettings" access="public" returntype="void" output="false">
		<!--- ************************************************************* --->
		<cfargument name="rc" required="true" type="struct" hint="The request collection">
		<!--- ************************************************************* --->
		<cfscript>
		var x = 1;
		var settingArray = instance.xmlObj.xmlRoot.settings.xmlChildren;
		for (x=1; x lte ArrayLen(settingArray); x=x+1){
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"EventName") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.EventName);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"FlashURLPersistScope") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.FlashURLPersistScope);
			}			
		}
		/* Persist settings. */
		saveSettings();
		</cfscript>
	</cffunction>

	<!--- Save Cache Settings --->
	<cffunction name="saveCacheSettings" access="public" returntype="void" output="false">
		<!--- ************************************************************* --->
		<cfargument name="rc" required="true" type="struct" hint="The request collection">
		<!--- ************************************************************* --->
		<cfscript>
		var x = 1;
		var settingArray = instance.xmlObj.xmlRoot.settings.xmlChildren;
		for (x=1; x lte ArrayLen(settingArray); x=x+1){
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheObjectDefaultTimeout") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheObjectDefaultTimeout);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheObjectDefaultLastAccessTimeout") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheObjectDefaultLastAccessTimeout);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheReapFrequency") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheReapFrequency);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheMaxObjects") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheMaxObjects);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheFreeMemoryPercentageThreshold") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheFreeMemoryPercentageThreshold);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheUseLastAccessTimeouts") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheUseLastAccessTimeouts);
			}
			if ( Comparenocase(settingArray[x].xmlAttributes.name,"CacheEvictionPolicy") eq 0){
				settingArray[x].xmlAttributes.value = trim(arguments.rc.CacheEvictionPolicy);
			}
		}
		saveSettings();
		</cfscript>
	</cffunction>

<!------------------------------------------- ACCESSORS/MUTATORS ------------------------------------------->

	<!--- ColdBox Controller --->
	<cffunction name="getcoldbox" access="public" output="false" returntype="any" hint="Get coldbox">
		<cfreturn instance.coldbox/>
	</cffunction>
	<cffunction name="setcoldbox" access="public" output="false" returntype="void" hint="Set coldbox">
		<cfargument name="coldbox" type="any" required="true"/>
		<cfset instance.coldbox = arguments.coldbox/>
	</cffunction>

	<!--- Get settings Query --->
	<cffunction name="getSettings" access="public" returntype="query" output="false" hint="Get coldbox settings">
		<cfreturn instance.qSettings>
	</cffunction>
	
	<!--- Get Conventions structure --->
	<cffunction name="getConventions" access="public" output="false" returntype="struct" hint="Get Conventions">
		<cfreturn instance.Conventions/>
	</cffunction>
	
<!------------------------------------------- PRIVATE ------------------------------------------->

	<!--- Parse the coldbox settings --->
	<cffunction name="parseSettings" access="private" returntype="void" output="false">
		<cfset var xmlString = "">
		<cfset var xmlSettings = ArrayNew(1)>
		<cfset var xmlConventions = ArrayNew(1)>
		<cfset var x = 1>

		<cflock type="exclusive" name="fwSettingsOperation" timeout="15" throwontimeout="true">
			<!--- Read File --->
			<cffile action="read" file="#instance.settingsFilePath#" variable="xmlString">
		</cflock>

		<!--- Parse File --->
		<cfset instance.xmlObj = XMLParse(trim(xmlString))>
		<!--- Get XML NODES --->
		<cfset xmlSettings = instance.xmlObj.xmlRoot.Settings.xmlChildren>
		<cfset xmlConventions = instance.xmlObj.xmlRoot.Conventions>
		
		<!--- Loop Over Conventions and create structure --->	
		<cfloop from="1" to="#arrayLen(xmlConventions.xmlChildren)#" index="x">
			<cfset structInsert(getConventions(),trim(xmlConventions.xmlChildren[x].xmlName),trim(xmlConventions.xmlChildren[x].xmlText))>
		</cfloop>
		
		<!--- Create Query of settings --->
		<cfscript>
			QueryAddRow(instance.qSettings,1);
			for (x=1; x lte ArrayLen(xmlSettings); x=x+1){
				QueryAddColumn(instance.qSettings, trim(xmlSettings[x].xmlAttributes.name), "varchar" , ArrayNew(1));
				QuerySetCell(instance.qSettings, trim(xmlSettings[x].xmlAttributes.name), trim(xmlSettings[x].xmlAttributes.value),1);
			}
		</cfscript>		
	</cffunction>

	<!--- Save settings back to storage --->
	<cffunction name="saveSettings" access="private" returntype="void" output="false">
		<cflock type="exclusive" name="fwSettingsOperation" timeout="15" throwontimeout="true">
			<cffile action="write" file="#instance.settingsFilePath#" output="#toString(instance.xmlObj)#">
		</cflock>
	</cffunction>
	
	<!--- Dump facade --->
	<cffunction name="dump" access="private" hint="Facade for cfmx dump" returntype="void">
		<cfargument name="var" required="yes" type="any">
		<cfdump var="#var#">
	</cffunction>
	
	<!--- Abort Facade --->
	<cffunction name="abort" access="private" hint="Facade for cfabort" returntype="void" output="false">
		<cfabort>
	</cffunction>

</cfcomponent>