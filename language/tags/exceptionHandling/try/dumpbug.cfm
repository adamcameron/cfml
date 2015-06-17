<cftry>
	<cfthrow message="message" type="type" detail="details" errorcode="error code" extendedinfo="extended info">
	<cfcatch>
		<cfset st = structNew()>
		<cfloop collection="#cfcatch#" item="key">
			<cfset st[key] = duplicate(cfcatch[key])>
		</cfloop>
		<cfdump var="#st#">
	</cfcatch>
</cftry>