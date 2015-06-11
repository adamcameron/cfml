<cfcomponent output="false" extends="com.strakerinteractive.search.Search" hint="Verity implementation of Search component">


	<cffunction name="init" output="false" returntype="com.strakerinteractive.search.Verity" access="public" hint="Initialises the object.">
		<cfreturn this>
	</cffunction>


	<cffunction name="collection" access="public" output="false" returntype="any" hint="Emulates &lt;cfcollection&gt; tag (http://livedocs.adobe.com/coldfusion/7/htmldocs/00000230.htm for details). Returns a query if action argument is <em>LIST</em>; returns a struct if action argument is <em>CATEGORYLIST</em>.  Passes of database- or filesystem-specific tasks to helper CFCs (verity/Database.cfc; verity/File.cfc).  This is slightly unorthodox, but is to work round a shortcoming of CF.">
		<cfargument name="action"		type="string"	required="false"	default="list">
		<cfargument name="collection"	type="string"	required="false">
		<cfargument name="path"			type="string"	required="false">
		<cfargument name="language"		type="string"	required="false"	default="English">
		<cfargument name="name"			type="string"	required="false"	hint="Not used.">
		<cfargument name="categories"	type="boolean"	required="false"	default="false">

		<cfset vReturn = false>

		<!--- Validate action --->
		<cftry>
			<cfparam name="arguments.action" default="" type="regex" pattern="PURGE|LIST|MAP|DELETE|REPAIR|CATEGORYLIST|CREATE|OPTIMIZE">
			<cfcatch>
				<cfthrow	message 	= "Argument validation error for method collection()"
							detail		= "The value of the attribute ACTION, which is currently ""#arguments.action#"", must be one of the values: PURGE,LIST,MAP,DELETE,REPAIR,CATEGORYLIST,CREATE,OPTIMIZE."
							type		= "com.strakerinteractive.search.Verity"
							errorcode	= "collection.badAction"
				>
			</cfcatch>
		</cftry>
		<!--- NOTE: some of these combinations make no sense, but "garbage-in, garbage-out": just let CF error --->
		<cfif listFindNoCase("LIST,CATEGORYLIST", arguments.action)><!--- We returna  value for these ones --->
			<cfif structKeyExists(arguments, "collection")>
				<cfif structKeyExists(arguments, "path")>
					<cfcollection action="#arguments.action#" collection="#arguments.collection#" path="#arguments.path#" language="#arguments.language#" name="vReturn">
					<cfreturn vReturn>
				<cfelse>
					<cfcollection action="#arguments.action#" collection="#arguments.collection#" language="#arguments.language#" name="vReturn">
					<cfreturn vReturn>
				</cfif>
			<cfelse>
				<cfif structKeyExists(arguments, "path")>
					<cfcollection action="#arguments.action#" path="#arguments.path#" language="#arguments.language#" name="vReturn">
					<cfreturn vReturn>
				<cfelse>
					<cfcollection action="#arguments.action#" language="#arguments.language#" name="vReturn">
					<cfreturn vReturn>
				</cfif>
			</cfif>
		<cfelse>
			<cfif structKeyExists(arguments, "collection")>
				<cfif structKeyExists(arguments, "path")>
					<cfcollection action="#arguments.action#" collection="#arguments.collection#" path="#arguments.path#" language="#arguments.language#">
				<cfelse>
					<cfcollection action="#arguments.action#" collection="#arguments.collection#" language="#arguments.language#">
				</cfif>
			<cfelse>
				<cfif structKeyExists(arguments, "path")>
					<cfcollection action="#arguments.action#" path="#arguments.path#" language="#arguments.language#">
				<cfelse>
					<cfcollection action="#arguments.action#" language="#arguments.language#">
				</cfif>
			</cfif>
		</cfif>
		<cfreturn>
	</cffunction>


	<cffunction name="index" access="public" output="false" returntype="any" hint="Emulates &lt;cfindex&gt; tag (http://livedocs.adobe.com/coldfusion/7/htmldocs/00000278.htm for details).">
		<cfargument name="collection"	type="string"	required="true">
		<cfargument name="action"		type="string"	required="true">
		<cfargument name="type"			type="string"	required="false">
		<cfargument name="title"		type="string"	required="false">
		<cfargument name="key"			type="string"	required="false"	default="">
		<cfargument name="body"			type="string"	required="false">
		<cfargument name="custom1"		type="string"	required="false">
		<cfargument name="custom2"		type="string"	required="false">
		<cfargument name="custom3"		type="string"	required="false">
		<cfargument name="custom4"		type="string"	required="false">
		<cfargument name="category"		type="string"	required="false">
		<cfargument name="categoryTree"	type="string"	required="false">
		<cfargument name="urlPath"		type="string"	required="false">
		<cfargument name="extensions"	type="string"	required="false"	default="htm,html,cfm,cfml,dbm,dbml">
		<cfargument name="query"		type="query"	required="false">
		<cfargument name="recurse"		type="boolean"	required="false"	default="false">
		<cfargument name="language"		type="string"	required="false"	default="English">
		<cfargument name="status"		type="string"	required="false"	hint="Not used.">
		<cfargument name="prefix"		type="string"	required="false">

		<cfset var stStatus = structNew()>
		
		<cfswitch expression="#arguments.action#">
			<cfcase value="purge">
				<cfindex collection="#arguments.collection#" action="purge">
			</cfcase>
			<cfcase value="delete">
			
			</cfcase>
			<cfcase value="update,refresh">
				<cfscript>
					if (not structKeyExists(arguments, "type")){
						if (structKeyExists(arguments, "query")){
							arguments.type	= "custom";
						}else{
							arguments.type	= "file";
						}			
					}

					if (arguments.type eq "custom"){
						stStatus = createObject("component", "com.strakerinteractive.search.verity.Database").index(argumentCollection=arguments);
					}else{	// file or path
						stStatus = createObject("component", "com.strakerinteractive.search.verity.File").index(argumentCollection=arguments);
					}
				</cfscript>
			</cfcase>
			<cfdefaultcase>
				<cfthrow>
			</cfdefaultcase>
		</cfswitch>

		<cfreturn stStatus>
	</cffunction>
	
	
	<cffunction name="search" access="public" output="false" returntype="struct" hint="Emulates &lt;cfindex&gt; tag (http://livedocs.adobe.com/coldfusion/7/htmldocs/00000330.htm for details).">
		<cfargument name="collection"				type="string"	required="true">
		<cfargument name="category"					type="string"	required="false">
		<cfargument name="categoryTree"				type="string"	required="false">
		<cfargument name="status"					type="string"	required="false">
		<cfargument name="type"						type="string"	required="false"	default="simple">
		<cfargument name="criteria"					type="string"	required="false">
		<cfargument name="maxrows"					type="string"	required="false"	default="All">
		<cfargument name="startRows"				type="numeric"	required="false"	default="1">
		<cfargument name="suggestions"				type="string"	required="false"	default="never">
		<cfargument name="contextPassages"			type="numeric"	required="false"	default="0">
		<cfargument name="contextBytes"				type="numeric"	required="false"	default="300">
		<cfargument name="contextHighlightBegin"	type="string"	required="false"	default="<b>">
		<cfargument name="contextHighlightEnd"		type="string"	required="false"	default="</b>">
		<cfargument name="previousCriteria"			type="string"	required="false">
		<cfargument name="language"					type="string"	required="false"	default="English">
		<cfargument name="name"						type="string"	required="false"	hint="Not used.">

		<cfreturn>
	</cffunction>


</cfcomponent>