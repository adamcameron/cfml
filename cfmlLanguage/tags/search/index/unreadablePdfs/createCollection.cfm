<cfflush interval="64">

<cfset sCollection = "testUnreadablePdfs">

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
<cftry>
	Indexing collection&hellip;
	<cfindex key="#expandPath('./docs/')#" urlpath="/shared/cf/cfml/tags/search/index/unreadablePdfs/docs/" extensions=".pdf" type="path" action="refresh" collection="#sCollection#" status="stIndex">
	Indexed<br />
	<cfdump var="#stIndex#"><br />
	<cfcatch>
		Error indexing collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Searching collection&hellip;
	<cfsearch name="qResults" collection="#sCollection#" criteria="">
	Done<br />
	<cfdump var="#qResults#"><br />
	<cfcatch>
		Error searching collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>