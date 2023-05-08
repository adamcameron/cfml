<cfsavecontent variable="sDump">
	<cfset lScopes = "this,variables,arguments,getPageContext().getActiveFunctionLocalScope(),attributes">
	<cfloop list="#lScopes#" index="sScope">
		<cftry>
			<cfset vScope = evaluate(sScope)>
			<cfdump var="#vScope#" label="#sScope#">
			<cfcatch>
				<cfoutput>No #sScope# variables</cfoutput>
			</cfcatch>
		</cftry>
		<hr />
	</cfloop>
</cfsavecontent>
<cffile action="append" file="C:\temp\variables.html" output="#sDump#">