<cfparam name="URL.error" default="false" type="boolean">

<cfdump var="#application#" label="application">

<cfif URL.error>
	<cfset e = 1/0>
</cfif>