<cftry>
<cfparam name="URL.optionalParam" default="optional">
<cfparam name="URL.requiredParam">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
<cffinally>
	<cfdump var="#URL#" label="URL">
	<cfdump var="#variables#" label="variables">
</cffinally>
</cftry>