<cfflush interval="16">
<cfloop condition="true">
	<cftry>
		<cfset sKey = makeKey()>
		<cfoutput>Creating [#sKey#]&hellip;</cfoutput>
		
		<cfset variable[sKey] = makeData()>
		created<br />
		<cfcatch>
			Error <cfoutput>[#cfcatch.message#] [#cfcatch.detail#]</cfoutput>.  Abort.<br />
			<cfbreak>
		</cfcatch>
	</cftry>
</cfloop>

<cffunction name="makeKey" returntype="string" output="false">
	<cfset var sKey	= "">
	<cfset var i	= 0>

	<cfloop index="i" from="1" to="5">
		<cfset sKey = sKey & chr(randRange(65,90))>
	</cfloop>
	<cfreturn sKey>
</cffunction>


<cffunction name="makeData" returntype="string" output="false">
	<cfset var i	= 0>
	
	<cfif not structKeyExists(request, "data")>
		<cfset request.data = "">
		<cfloop index="i" from="1" to="32768">
			<cfset request.data = request.data & chr(randRange(65,90))>
		</cfloop>
	</cfif>
	<cfreturn request.data>
</cffunction>