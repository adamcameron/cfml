<cfflush interval="64">

<cfset sCollection = "testHyphenProblem">



<cftry>
	Searching collection&hellip;
	<cfsearch name="qResults" collection="#sCollection#" criteria="patient-centred">
	Done<br />
	<cfdump var="#qResults#"><br />
	<cfcatch>
		Error searching collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>