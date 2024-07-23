
<cfparam name="form.linkLogo" default="">
<cfset upDir=expandpath("logos")>

<cfdump var="#variables#" label="variables">
<cfdump var="#form#" label="form">


<cfif len(form.linkLogo) gt 1>
	<cffile action="upload" filefield="form.linkLogo" destination="#upDir#" nameconflict="makeunique">
	<cfdump var="#cffile#">
</cfif>
