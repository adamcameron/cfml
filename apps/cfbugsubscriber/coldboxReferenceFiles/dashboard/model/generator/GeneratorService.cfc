<cfcomponent hint="The generator service" singleton output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<!--- ************************************************************* --->

	<cffunction name="init" access="public" returntype="GeneratorService" output="false">
		<cfargument name="coldbox" required="true" type="any" inject="coldbox">
		<cfscript>
			instance 				= structnew();
			instance.coldbox 		= arguments.coldbox;
			instance.templatesPath 	= expandPath('model/templates/');
			return this;
		</cfscript>
	</cffunction>

	<!--- ************************************************************* --->

<!------------------------------------------- PUBLIC ------------------------------------------->

	<cffunction name="getDirectoryListing" output="false" access="public" returntype="query" hint="Get Directory Listing of generated Application">
		<cfargument name="appDirectory" type="string" required="true"/>
		<cfset var qListing = "">
		<cfdirectory action="list" directory="#arguments.appDirectory#" recurse="true" name="qListing">
		<cfreturn qListing>
	</cffunction>
	
	<!--- removeRouteIndex --->
    <cffunction name="removeRouteIndex" output="false" access="private" returntype="any" hint="">
    	<cfargument name="location" type="any" required="true"/>
    	<cfscript>
			var routesFile 		= arguments.location & "/config/Routes.cfm";
			var routesContents 	= "";
			
			if( NOT fileExists(routesFile) ){
				return;
			}
			
			routesContents = readFile(routesFile);
			routesContents = replacenocase(routesContents,"index.cfm","");
			writeFile(routesFile,routesContents);
		</cfscript>
    </cffunction>

	
	<cffunction name="generate" access="public" returntype="void" hint="Generate an application" output="false" >
		<cfargument name="generatorBean" required="true" type="any" hint="The app configs">
		<cfscript>
		var EclipseProjectContents = "";
		var EclipseFile = "";
		var expandedAppLocation = arguments.generatorBean.getApplocation();
		var templateApp 		= instance.templatesPath & arguments.generatorBean.getAppTemplate() & ".zip";
				
		//First step is to unzip the template to the destination directory.
		instance.coldbox.getPlugin("Zip").extract(zipFilePath=templateApp,extractPath=expandedAppLocation,overwriteFiles=true);
		// Copy eclipse project to root of expanded app
		fileCopy( instance.templatesPath & ".project", expandedAppLocation);
		// Copy rewrite engine if selected
		switch( arguments.generatorBean.getRewriteEngine() ){
			case "mod_rewrite" 	: { fileCopy( instance.templatesPath & ".htaccess", expandedAppLocation); removeRouteIndex(expandedAppLocation); break; }
			case "isapi" 		: { fileCopy( instance.templatesPath & ".IsapiRewrite4.ini", expandedAppLocation); removeRouteIndex(expandedAppLocation); break; }
			case "webconfig" 	: { fileCopy( instance.templatesPath & "web.config", expandedAppLocation); removeRouteIndex(expandedAppLocation); break; }
		}
		
		// Modify Eclipse Name
		EclipseFile = expandedAppLocation & "/.project";
		EclipseProjectContents = readFile(EclipseFile);
		EclipseProjectContents = replacenocase(EclipseProjectContents,"@APPNAME@",arguments.generatorBean.getAppName());
		writeFile(EclipseFile,EclipseProjectContents);
		
		</cfscript>
	</cffunction>

<!------------------------------------------- PRIVATE ------------------------------------------->

	<cffunction name="removeDirectory" access="private" returntype="void" hint="Remove a directory" output="false" >
		<cfargument name="dirPath" required="true" type="string" hint="">
		<cfdirectory action="delete" directory="#arguments.dirpath#" recurse="true">
	</cffunction>

	<cffunction name="readFile" access="private" hint="Facade to Read a file's content" returntype="Any" output="false">
		<!--- ************************************************************* --->
		<cfargument name="FileToRead"	 		type="String"  required="yes" 	 hint="The absolute path to the file.">
		<!--- ************************************************************* --->
		<cfset var FileContents = "">
		<cffile action="read" file="#arguments.FileToRead#" variable="FileContents">
		<cfreturn FileContents>
	</cffunction>

	<cffunction name="writeFile" access="private" hint="Facade to write a file's content" returntype="Any" output="false">
		<!--- ************************************************************* --->
		<cfargument name="FileToWrite"	 		type="String"   required="yes" 	 hint="The absolute path to the file.">
		<cfargument name="Contents" 			type="String"	 	required="true"  hint="The string to write">
		<!--- ************************************************************* --->
		<cffile action="write" file="#arguments.FileToWrite#" output="#arguments.Contents#">
	</cffunction>
	
	<cffunction name="removeFile" access="public" returntype="void" hint="Facade to remove a file" output="false" >
		<!--- ************************************************************* --->
		<cfargument name="FileToRemove" required="true" type="string" hint="File To Remove">
		<!--- ************************************************************* --->
		<cffile action="delete" file="#arguments.FileToRemove#">
	</cffunction>
	
</cfcomponent>