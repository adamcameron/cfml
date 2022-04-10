<cfcomponent output="false">

	<cfset variables.list = "">
	<cfset variables.array = []>
	<cfset variables.delimiters = ",">
	<cfset variables.includeEmptyValues = true>
	<cfset variables.nullChar = chr(7)>

	<cfset setVersion()>
	<cfset setCompatibilityLevels()>
	
	<cffunction name="init" returntype="List" access="public" output="false">
		<cfargument name="list" type="string" required="true">
		<cfargument name="delimiters" type="string" required="false" default=",">
		<cfargument name="includeEmptyValues" type="boolean" required="false" default="false">

		<cfset variables.delimiters = arguments.delimiters>
		<cfset variables.list = arguments.list>
		<cfset variables.includeEmptyValues = arguments.includeEmptyValues>
		<cfset variables.array = _toArray()>
		<cfreturn this>
	</cffunction>

	
	<cffunction name="toString" returntype="string" access="public" output="false">
		<cfreturn variables.list>
	</cffunction>
	

	<cffunction name="toArray" returntype="array" access="public" output="false">
		<cfreturn variables.array>
	</cffunction>


	<cffunction name="each" returntype="void" access="public">
		<cfargument name="callback" type="any" required="true">
		<cfset var i = 0>
		<cfloop index="i" from="1" to="#arrayLen(variables.array)#">
			<cfset arguments.callback(variables.array[i], i, variables.list, variables.delimiters)>
		</cfloop>
	</cffunction>


	<cffunction name="some" returntype="void" access="public">
		<cfargument name="callback" type="any" required="true">
		<cfset var i = 0>
		<cfloop index="i" from="1" to="#arrayLen(variables.array)#">
			<cfif arguments.callback(variables.array[i], i, variables.list, variables.delimiters)>
				<cfreturn true>
			</cfif>
			<cfreturn false>
		</cfloop>
	</cffunction>


	<cffunction name="every" returntype="void" access="public">
		<cfargument name="callback" type="any" required="true">
		<cfset var i = 0>
		<cfloop index="i" from="1" to="#arrayLen(variables.array)#">
			<cfif NOT arguments.callback(variables.array[i], i, variables.list, variables.delimiters)>
				<cfreturn false>
			</cfif>
			<cfreturn true>
		</cfloop>
	</cffunction>


	<cffunction name="filter" returntype="void" access="public">
		<cfargument name="callback" type="any" required="true">
		<cfset var i = 0>
		<cfloop index="i" from="1" to="#arrayLen(variables.array)#">
			<cfif NOT arguments.callback(variables.array[i], i, variables.list, variables.delimiters)>
				<cfreturn false>
			</cfif>
			<cfreturn true>
		</cfloop>
	</cffunction>


	<cffunction name="_toArray" returntype="array" access="private" output="false">
		<cfset var delimToUse = "">
		<cfset var i = 0>
		<cfset var elem = "">
		<cfset var tempList = variables.list>
		<cfif variables.compat.includeEmptyValues>
			<cfreturn listToArray(variables.list, variables.delimiters, variables.includeEmptyValues)>
		</cfif>
		<cfif NOT variables.includeEmptyValues>
			<cfreturn listToArray(variables.list, variables.delimiters)>
		</cfif>

		<cfset delimToUse = left(variables.delimiters, 1)>
		<cfset tempList = reReplace(tempList, "^[#variables.delimiters#]", "#variables.nullChar##delimToUse#", "ONE")>
		<cfset tempList = reReplace(tempList, "[#variables.delimiters#]$", "#delimToUse##variables.nullChar#", "ONE")>
		<cfset tempList = reReplace(tempList, "[#variables.delimiters#]{2}", "#delimToUse##variables.nullChar##delimToUse#", "ALL")>
		<cfset array = listToArray(tempList, variables.delimiters)>
		<cfloop index="i" from="1" to="#arrayLen(array)#">
			<cfif array[i] EQ variables.nullChar>
				<cfset array[i] = "">
			</cfif>
		</cfloop>
		<cfreturn array>
	</cffunction>



	<cffunction name="setVersion" returntype="void" access="private" output="false">
		<cfset variables.compat.version = listFirst(server.coldfusion.productversion)>
	</cffunction>


	<cffunction name="setCompatibilityLevels" returntype="void" access="private" output="false">
		<cfset variables.compat.includeEmptyValues = variables.compat.version GE 8>
	</cffunction>


	<cffunction name="forceVersion" returntype="void" access="public" output="false">
		<cfargument name="version" type="numeric" required="true">
		<cfset variables.compat.version = arguments.version>
		<cfset setCompatibilityLevels()>
	</cffunction>


</cfcomponent>