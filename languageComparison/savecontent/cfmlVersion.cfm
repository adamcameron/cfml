<cfsavecontent variable="content">
	Some text<br>
	<cfif randRange(0,1)>
		<cfset result = "value if true">
	<cfelse>
		<cfset result = "and if it's false">
	</cfif>
	<cfoutput>#result#</cfoutput><br>
	Message from include is:
	<cfinclude template="./inc.cfm">
</cfsavecontent>

<cfoutput>#content#</cfoutput>