<cfcomponent output="false" hint="I am the Dashboard settings model." singleton>

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="SettingsService" output="false">
		<cfargument name="coldbox" required="true" type="any" inject="coldbox">
		<cfscript>
			instance = structnew();
			
			// setup coldbox
			instance.coldbox = arguments.coldbox;
			
			// Prepare Instance
			instance.hashAlg = "SHA-384";
			instance.settingsFilePath = ExpandPath("config/settings.xml.cfm");
			instance.rolloversFilePath = ExpandPath("config/rollovers.xml");
			instance.qSettings = queryNew("");
			instance.qDistributionURLS = queryNew("url", "varchar");
			instance.qRollovers = queryNew("pagesection,rolloverid, text","varchar,varchar,varchar");
			instance.xmlObj = "";
			
			// Parse
			parseSettings();
			parseRollovers();
			
			return this;			
		</cfscript>
	</cffunction>
	
<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- Change Password --->
	<cffunction name="changePassword" access="public" returntype="struct" output="false">
		<!--- ************************************************************* --->
		<cfargument name="oldpassword"  type="string" required="true">
		<cfargument name="newpassword"  type="string" required="true">
		<cfargument name="newpassword2" type="string" required="true">
		<!--- ************************************************************* --->
		<cfset var rtnStruct = structnew()>
		<cfset var x = 1>
		
		<!--- Prepare return --->
		<cfset rtnStruct.results = false>
		<cfset rtnStruct.message = "">
		
		<!--- Validate Password --->
		<cfif not validatePassword(arguments.oldpassword)>
			<cfset rtnStruct.message = "Old password is invalid.">
		<cfelseif compare(arguments.newpassword, arguments.newpassword2) neq 0>
			<cfset rtnStruct.message = "New password and confirmation password are not the same.">
		<cfelse>
			<!--- Save Password --->
			<cfset instance.xmlObj.xmlRoot.settings.password.xmlText = hash(arguments.newpassword, instance.hashAlg)>
			<!--- Savce XML --->
			<cfset saveSettings()>
			<!--- Parse Settings Again --->
			<cfset instance.qSettings = queryNew("")>
			<cfset parseSettings()>
			<!--- Set Results --->
			<cfset rtnStruct.results = true>
		</cfif>
		<cfreturn rtnStruct>
	</cffunction>

	<!--- Validate a password --->
	<cffunction name="validatePassword" access="public" returntype="boolean" output="false">
		<!--- ************************************************************* --->
		<cfargument name="password" required="true" type="string">
		<!--- ************************************************************* --->
		<cfset var qry = "">
		<cfquery name="qry" dbtype="query">
		select password
		from   instance.qSettings
		where  password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(arguments.password,instance.hashAlg)#">
		</cfquery>
		<cfif qry.recordcount>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<!--- Get All Rollovers --->
	<cffunction name="getRollovers" access="public" returntype="query" output="false">
		<cfreturn instance.qRollovers>
	</cffunction>

	<!--- Get All Settings --->
	<cffunction name="getSettings" access="public" returntype="query" output="false">
		<cfreturn instance.qSettings>
	</cffunction>
	
	<!--- Get Distro URLS --->
	<cffunction name="getDistributionUrls" access="public" returntype="query" output="false">
		<cfreturn instance.qDistributionURLS>
	</cffunction>

<!------------------------------------------- PRIVATE ------------------------------------------->

	<!--- Parse my Settings --->
	<cffunction name="parseSettings" access="private" returntype="void" output="false">
		<cfset var xmlString = "">
		<cfset var settingsArray = ArrayNew(1)>
		<cfset var urlArray = ArrayNew(1)>
		<cfset var x = 1>
		
		<!--- Read File --->
		<cffile action="read" file="#instance.settingsFilePath#" variable="xmlString">
		
		<cfscript>
			//Parse File
			instance.xmlObj = XMLParse(trim(xmlString));
			
			//Create Query of Settings
			settingsArray = instance.xmlObj.xmlRoot.settings.XMLChildren;
			/* Populate Settings */
			for (x=1; x lte ArrayLen(settingsArray); x=x+1){
				QueryAddRow(instance.qSettings,1);
				QueryAddColumn(instance.qSettings, trim(settingsArray[x].xmlName), trim(settingsArray[x].xmlAttributes["type"]) , ArrayNew(1));
				QuerySetCell(instance.qSettings, trim(settingsArray[x].xmlName), trim(settingsArray[x].xmlText),1);
			}
			
			//Root of DisURL's
			urlArray = instance.xmlObj.xmlRoot.distribution_urls.XMLChildren;
			/* Add Distro URL's */
			for (x=1; x lte ArrayLen(urlArray);x=x+1){
				//Create Query of Distribution URL's
				QueryAddRow(instance.qDistributionURLS, 1);
				QuerySetCell(instance.qDistributionURLS,"url", trim(urlArray[x].xmlText), x);
			}
		</cfscript>
	</cffunction>

	<!--- Save our settings --->
	<cffunction name="saveSettings" access="private" returntype="void" output="false" hint="Saves the settings back to the storage">
		<!--- Save the File --->
		<cffile action="write" file="#instance.settingsFilePath#" output="#toString(instance.xmlObj)#">
	</cffunction>

	<!--- Parse Rollovers --->
	<cffunction name="parseRollovers" access="private" returntype="void" output="false">
		<cfset var xmlString = "">
		<cfset var xmlChildren = ArrayNew(1)>
		<cfset var xmlObj = "">
		<cfset var x = 1>
		<cfset var j = 1>
		<!--- Read File --->
		<cffile action="read" file="#instance.rolloversFilePath#" variable="xmlString">
		<!--- Parse File --->
		<cfset xmlObj = XMLParse(trim(xmlString))>
		<!--- Create Query --->
		<cfscript>
			for (x=1; x lte ArrayLen(xmlObj.rollovers.section); x=x+1){
				//Loop Through Rollovers
				for(j=1; j lte ArrayLen(xmlObj.rollovers.section[x].XMLChildren) ; j=j+1){
					QueryAddRow(instance.qRollovers,1);
					QuerySetCell(instance.qRollovers, "pagesection", trim(xmlObj.rollovers.section[x].XMLAttributes.id) );
					QuerySetCell(instance.qRollovers, "rolloverid", trim(xmlObj.rollovers.section[x].xmlChildren[j].xmlAttributes.id) );
					QuerySetCell(instance.qRollovers, "text", trim(xmlObj.rollovers.section[x].xmlChildren[j].xmlText) );
				}
			}
		</cfscript>
	</cffunction>

</cfcomponent>