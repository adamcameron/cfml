<cfparam name="URL.criteria" default="*">

<cfset sCollection = "testUnreadablePdfs">
<cftry>
	Searching collection&hellip;
	<cfsearch name="qResults" collection="#sCollection#" criteria="#URL.criteria#">
	
	<cfdump var="#qResults#"><br />
	<cfcatch>
		Error searching collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>