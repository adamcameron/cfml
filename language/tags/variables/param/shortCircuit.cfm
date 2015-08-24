<cfscript>
function defaulter(){
	writeOutput("defaulter() ran<br>");
	return "default";
}	
</cfscript>

<cfparam name="url.test" default="#defaulter()#">
<cfoutput>#url.test#</cfoutput>