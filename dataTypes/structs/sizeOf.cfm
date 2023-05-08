<cftry>
	<cfinclude template="/Application.cfm">
	<cfcatch><!--- no probs... just wanted to load this for a client-specific situation ---></cfcatch>
</cftry>


<cfwddx action="cfml2wddx" input="#application#" output="w">

<cfoutput>#htmlEditFormat(w)#</cfoutput>