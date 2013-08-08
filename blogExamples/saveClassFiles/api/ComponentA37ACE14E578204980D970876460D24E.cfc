
<cfcomponent output="false">


	<cffunction name="init" returntype="ComponentA37ACE14E578204980D970876460D24E" access="public" output="false" hint="Initialises and returns the object">
		<cfargument name="configFile" type="string" required="true" hint="Config file name">

		<cfset var jsonConfig = "">

		<cffile action="read" file="#expandPath('./')##arguments.configFile#" variable="rawConfig">

		<cfset variables.config = deserializeJson(jsonConfig)>

		<cfreturn this>
	</cffunction>

	

	<cffunction name="fA37ACDEEB9D272CA70DB48B90B252EC9" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDEF-C5E0-25DB-7EDCC06229185D14">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 5>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACDF1F3847FD921D1CDC490199BA5" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDF2-FA6F-02BE-B83A60FA089B6401">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 4>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACDF491AD59FFF5D37E2CE2372057" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDF5-EE81-DD65-7143C95E5EF6005B">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 10>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACDF7021C0471D5113A384E43BA6A" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDF8-C4B1-CEC6-58C6FA45295597AF">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 6>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACDFA089D4FBE97AD38FC3CA18C14" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDFB-BD80-696F-58596D2DD34443A9">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 5>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACDFDC4E63C717C92EF6ED9B12AF8" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACDFE-0D70-32DC-57F27B3C3B9152F4">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 7>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE0006FBFEEAA49779371AF0CCCD" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE01-EBFB-575E-34F4BC24BF1601BD">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 7>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE0394AF954AFB84DD2F3737A496" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE04-9E85-B4EA-A6FADF7B938E194E">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 8>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE0697D20F064AF6465BE8FFA802" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE07-C5BE-2944-293E4B95BAE7665C">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 2>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE09A53E2EA2EF55FC722AEF4A77" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE0A-AC40-82D1-C78CA88F42CCD14C">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 10>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE0C9011A15DEA4AC1D9E21F2C36" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE0D-97F8-8C90-C95070BD1E74E8F4">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 8>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE0FC098B329BF3D9FF4B8B2C029" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE10-BE3E-5EBC-897385ABB14045F1">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 10>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA37ACE12D189E40404E5EC82913C332C" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A37ACE13-A3A9-E7CC-CFE5055A70FF5851">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 9>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

</cfcomponent>
