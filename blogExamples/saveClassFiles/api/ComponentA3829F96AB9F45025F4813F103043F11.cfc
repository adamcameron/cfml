
<cfcomponent output="false">


	<cffunction name="init" returntype="ComponentA3829F96AB9F45025F4813F103043F11" access="public" output="false" hint="Initialises and returns the object">
		<cfargument name="configFile" type="string" required="true" hint="Config file name">

		<cfset var jsonConfig = "">

		<cffile action="read" file="#expandPath('./')##arguments.configFile#" variable="rawConfig">

		<cfset variables.config = deserializeJson(jsonConfig)>

		<cfreturn this>
	</cffunction>

	

	<cffunction name="fA3829F8096BE69F0BDEC6CA831714CA7" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F81-9347-0B2C-569442513BC34EDF">
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

	<cffunction name="fA3829F82E6B3DBD8E6AE1AE03D35A2B6" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F83-01EB-EFED-75CDCC964C05FC79">
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

	<cffunction name="fA3829F84AD328FA6F4380E758CDEE728" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F85-ABED-7CC3-5D15943D5D4749C9">
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

	<cffunction name="fA3829F86DBC03071ED0D221B71EB12C3" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F87-A9FA-23C5-6BA17D6DC4D45451">
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

	<cffunction name="fA3829F88D16DC39891B4B5CB1EFF6BA4" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F89-AE48-B2AB-B51CBA8C6ACEDD71">
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

	<cffunction name="fA3829F8AEB36188632FA4F0700712C86" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F8B-F97F-2BCB-7FD39217164B33BD">
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

	<cffunction name="fA3829F8C9668BA153616BAC66B0533B6" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F8D-C5B9-317E-F7344151956B7DD3">
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

	<cffunction name="fA3829F8E902908FDDAB6196DBD46348D" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F8F-B449-6550-D26614719706EB3E">
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

	<cffunction name="fA3829F90EDFAD86D065C3482D2451993" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F91-A84D-FD11-CEF34052A0E1F9EB">
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

	<cffunction name="fA3829F92F94B1445B8BC96099B764823" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F93-A795-9006-EE7FE62441970C81">
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

	<cffunction name="fA3829F9498C98F35157C495B0E467D8C" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A3829F95-CEA6-2CCF-47D40EDF2124D108">
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
