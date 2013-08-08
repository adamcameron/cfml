
<cfcomponent output="false">


	<cffunction name="init" returntype="ComponentA381EFAEB218EF48ACA8C13E40B98A8B" access="public" output="false" hint="Initialises and returns the object">
		<cfargument name="configFile" type="string" required="true" hint="Config file name">

		<cfset var jsonConfig = "">

		<cffile action="read" file="#expandPath('./')##arguments.configFile#" variable="rawConfig">

		<cfset variables.config = deserializeJson(jsonConfig)>

		<cfreturn this>
	</cffunction>

	

	<cffunction name="fA381EF96AF7CF4157B6F0224C0EE176C" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EF97-BC24-CC39-9845170D8EF44E6A">
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

	<cffunction name="fA381EF9A95EE17D0FD771E8DC5EFAD19" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EF9D-F5C0-692A-1C5A62C407A11546">
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

	<cffunction name="fA381EF9EA5DB555E8647CF0271EE3A1C" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EF9F-B355-3812-491D1814D8DE4089">
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

	<cffunction name="fA381EFA0E81730A19F14EA6C75D0B58F" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFA1-9C29-1B3D-667B2B4A4003AB8A">
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

	<cffunction name="fA381EFA2A1C195042FCF148DE9F8D2F3" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFA3-C0EA-9B0D-8A68C2F5F4787065">
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

	<cffunction name="fA381EFA49AFA3A1F4EDC080BB314C32B" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFA5-FE40-DA80-97DAC3D68DD1DF91">
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

	<cffunction name="fA381EFA6C2FFF30D67F02AEEE028F997" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFA7-FFFC-2E92-DF84BB862AACACB2">
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

	<cffunction name="fA381EFA8B1BDCFF6A1A532FCDAC5B62F" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFA9-0094-BFD9-1370139EA484D5E9">
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

	<cffunction name="fA381EFAA0CEA497B014391D87385E737" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFAB-F8A1-F1A4-22D2183DDCD10B64">
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

	<cffunction name="fA381EFAC9CCBF9EA8927F3EAF9528737" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A381EFAD-D466-3B1B-F026EF81826333FA">
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

</cfcomponent>
