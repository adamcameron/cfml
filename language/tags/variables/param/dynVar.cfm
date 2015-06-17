<cfset myVarName = "myVar">
<cfparam name="variables.#myVarName#" default="foo">
<cfoutput>#variables.myVar#</cfoutput>