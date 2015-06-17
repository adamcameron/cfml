<cfflush interval="64">

<cfset sCollection = "testHyphenProblem">

<cftry>
	Deleting collection&hellip;
	<cfcollection action="delete" path="#expandPath('./collection')#" collection="#sCollection#">
	Deleted<br />
	<cfcatch>
		Error deleting collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Creating collection&hellip;
	<cfcollection action="create" path="#expandPath('./collection')#" collection="#sCollection#">
	Created<br />
	<cfcatch>
		Error creating collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>
