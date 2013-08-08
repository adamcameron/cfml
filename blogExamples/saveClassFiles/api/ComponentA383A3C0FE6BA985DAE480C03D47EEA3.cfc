
<cfcomponent output="false">


	<cffunction name="init" returntype="ComponentA383A3C0FE6BA985DAE480C03D47EEA3" access="public" output="false" hint="Initialises and returns the object">
		<cfargument name="configFile" type="string" required="true" hint="Config file name">

		<cfset var jsonConfig = "">

		<cffile action="read" file="#expandPath('./')##arguments.configFile#" variable="rawConfig">

		<cfset variables.config = deserializeJson(jsonConfig)>

		<cfreturn this>
	</cffunction>

	

	<cffunction name="fA383A3A9BE016D7A41F62A3787B2E5BF" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3AA-BF90-4B3B-B42C070FF66901CE">
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

	<cffunction name="fA383A3AB036C03004E284F0E8BD5FBEF" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3AC-CD3D-4226-ECD6EF9E03E71BE8">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 1>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA383A3ADBCF402341D6BD936D210C6B6" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3AE-933E-1D2F-FC5118AD90EDDD3A">
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

	<cffunction name="fA383A3AFBE81F9432928D9053262FE67" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3B0-EA05-0258-805BCFBCF9D380DC">
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

	<cffunction name="fA383A3B1E5531D773609CD3BA842A510" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3B2-C391-B162-EA94BB62047EAF09">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 1>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA383A3B3A72EC843207CAB58C83F3F01" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3B4-C47B-3CD0-86566C88D77F8473">
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

	<cffunction name="fA383A3B8C624AE1F48B39603010488A5" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3B9-F3D3-EA89-BF56AD46B1E4EA6A">
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

	<cffunction name="fA383A3BADC4D27D193B65AD2552623A7" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3BB-E1CE-5D3F-FB536916087FEBB9">
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

	<cffunction name="fA383A3BCC0D25BBE71D85D18CE6279C5" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3BD-A049-9905-C21522BFF2D6C3FE">
		<cfset var result = "">

		<cfquery name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	#col#	= <cfqueryparam value="#filterValue#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>

		<cfloop query="resultData">
			<cfif len(otherCol) GT 3>
				<cfset result = listAppend(result, otherCol)>
			</cfif>
		</cfloop>
		<cfreturn result>

	</cffunction> 

	<cffunction name="fA383A3BE0106ACF5B644ADA93B1497B6" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A383A3BF-B121-DED8-1655F22FF15DD214">
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

</cfcomponent>
