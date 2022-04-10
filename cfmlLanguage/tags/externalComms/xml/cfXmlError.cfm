<cftry>
	<cfset x = variables.f(s=chr(1))>
	<!--- <cfdump var="#x#" label="x"> --->
	<cfcatch>
		<!--- <cfdump var="#cfcatch#" label="cfcatch"> --->
		BUNG
	</cfcatch>
</cftry>

<cffunction name="f" returntype="xml">
	<cfargument name="s" type="string" required="true">
	<cfxml variable="x">
		<node><cfoutput>#arguments.s#</cfoutput></node>
	</cfxml>
	<cfreturn x>
</cffunction>