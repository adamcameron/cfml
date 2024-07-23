<!--- toUpper.cfm --->
<cfif thistag.HasEndTag>
	<cfthrow type="IllegalClosingTag" message="The 'toupper' tag must not have a closing tag">
</cfif>
<cfparam name="attributes.value">

<cfif THISTAG.ExecutionMode EQ "Start">
	<cfset attributes.value = ucase(attributes.value)>
	<cfassociate basetag="cf_arraymap" datacollection="callbackResults">
	<cfexit method="exittag">
</cfif>