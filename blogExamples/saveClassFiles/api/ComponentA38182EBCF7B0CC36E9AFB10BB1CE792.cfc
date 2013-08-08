
<cfcomponent output="false">


	<cffunction name="init" returntype="ComponentA38182EBCF7B0CC36E9AFB10BB1CE792" access="public" output="false" hint="Initialises and returns the object">
		<cfargument name="configFile" type="string" required="true" hint="Config file name">

		<cfset var jsonConfig = "">

		<cffile action="read" file="#expandPath('./')##arguments.configFile#" variable="rawConfig">

		<cfset variables.config = deserializeJson(jsonConfig)>

		<cfreturn this>
	</cffunction>

	

	<cffunction name="fA38182CBF1B07DECB56191E0E97EF0C8" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182CC-B77E-428E-722B61D67E8B27B6">
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

	<cffunction name="fA38182CEE4148A50EC1A68153D501448" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182CF-AC30-2532-ABCDEFE07FE34E78">
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

	<cffunction name="fA38182D000FDDC488C3BBA74FCC1D482" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182D1-FE90-B249-ED4A51876BD606B6">
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

	<cffunction name="fA38182D2EAEBEF9AE3BD1A14DA4170BD" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182D3-D2C2-501E-D8F64F6DB47C01F2">
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

	<cffunction name="fA38182D4B2597FC7503C6A0752222B9C" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182D5-AEB4-0E03-226F9E25CE1C85E6">
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

	<cffunction name="fA38182D6EF5E8A82771B27366D69F528" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182D7-AD22-0068-20C982A6EA42356E">
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

	<cffunction name="fA38182D89AEF049A1905B27A6182AC8F" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182D9-DF30-FB18-745DA764C2328EFB">
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

	<cffunction name="fA38182DAF82A6F154CAC0DBD7C4B6C16" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182DB-986E-707B-1C369E47C302292E">
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

	<cffunction name="fA38182DC0A21AA414C91D15AB8B305CB" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182DD-D437-7A23-9E81D12B8C92D3AD">
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

	<cffunction name="fA38182DFDD3A48643B251D78DF06BEE5" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182E0-A453-84D0-E1597542AA90E8B6">
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

	<cffunction name="fA38182E1B29DC08517F08FEF21E94554" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182E2-CE6C-2CBE-3D4481E7BA0846E4">
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

	<cffunction name="fA38182E3C716A419638B54EA67E72C75" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182E4-AD74-CC7C-AC07FDA51973CD52">
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

	<cffunction name="fA38182E5E01A992C274C77C21F21C957" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182E6-CE0F-E94A-6EEF26FF3314B1F4">
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

	<cffunction name="fA38182E7940C3071226576C44DEDF14E" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182E8-BE97-29C5-5DD211A3626012B1">
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

	<cffunction name="fA38182E9AF2C7662D85DC3E7922C75DD" returntype="string" output="false" hint="A unique function">
		<cfargument name="data" type="query" required="true" hint="Data to process">
		<cfargument name="col" type="string" required="true" hint="Column to filter">

		<cfset var resultData = false>
		<cfset var filterValue = "A38182EA-D310-B516-EF80DF033F7287D3">
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
