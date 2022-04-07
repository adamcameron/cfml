<cfparam name="URL.word">
<cftry>
	Searching collection&hellip;
	<cfsearch collection="englishTestVerity" name="qResults" criteria="#URL.word#">
	<cfdump var="#qResults#" top="5">
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>