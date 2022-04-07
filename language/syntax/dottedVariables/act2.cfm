<!--- act.cfm --->
<cfparam name="url.dot.in.name" default="false">
<cfif not structKeyExists(URL, "dot")>
	<cfset url.dot.in.name = "different variable entirely">
</cfif>
<cfdump var="#url#">