<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="128">
<cftry>
	Deleting collection&hellip;
	<cfcollection action="delete" collection="russianTest">
	deleted<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Creating collection&hellip;
	<cfcollection action="create" collection="russianTest" path="#expandPath('collection')#" engine="solr" language="russian">
	created<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Indexing collection&hellip;
	<cfset sDir = expandPath("docs/")>
	<cfindex action="refresh" collection="russianTest" extensions=".pdf" key="#sDir#" type="path" recurse="true" urlpath="/shared/CF10/solr/russianTest/docs" language="russian">
	indexed<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Searching collection&hellip;
	<cfsearch collection="russianTest" name="qResults" criteria="палатка" language="russian">
	<cfdump var="#qResults#" top="5">
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>