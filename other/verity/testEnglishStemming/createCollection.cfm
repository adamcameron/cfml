<cfflush interval="128">
<cftry>
	Deleting collection&hellip;
	<cfcollection action="delete" collection="englishTestVerity">
	deleted<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Creating collection&hellip;
	<cfcollection action="create" collection="englishTestVerity" path="#expandPath('./collection')#" engine="verity">
	created<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Indexing collection&hellip;
	<cfset sDir = expandPath("docs/")>
	<cfindex action="refresh" collection="englishTestVerity" extensions=".pdf" key="#sDir#" type="path" recurse="true" urlpath="/shared/CF/verity/testEnglishStemming/docs/">
	indexed<br />
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>
<cftry>
	Searching collection&hellip;
	<cfsearch collection="englishTestVerity" name="qResults" criteria="biggest">
	<cfdump var="#qResults#" top="5">
	<cfcatch>
		error: <cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput><br />
	</cfcatch>
</cftry>