<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="128">
<cftry>
	Deleting collection&hellip;
	<cfcollection action="delete" collection="englishTest">
	deleted<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Creating collection&hellip;
	<cfcollection action="create" collection="englishTest" path="#expandPath('collection')#" engine="solr">
	created<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Indexing collection&hellip;
	<cfset sDir = expandPath("docs/")>
	<cfindex action="refresh" collection="englishTest" extensions=".pdf" key="#sDir#" type="path" recurse="true" urlpath="/shared/CF10/solr/englishTest/docs">
	indexed<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Searching collection&hellip;
	<cfsearch collection="englishTest" name="qResults" criteria="палатка">
	<cfdump var="#qResults#" top="5">
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>