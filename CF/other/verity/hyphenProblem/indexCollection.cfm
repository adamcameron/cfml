<cfflush interval="64">

<cfset sCollection = "testHyphenProblem">


<cftry>
	Indexing files&hellip;
	<cfindex key="#expandPath('./docs/')#" urlpath="/shared/cf/other/verity/hyphenProblem/docs/" extensions=".*" type="path" action="refresh" collection="#sCollection#" status="stIndex">
	Indexed<br />
	<cfdump var="#stIndex#"><br />
	<cfcatch>
		Error indexing files: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>

<cftry>
	Indexing query&hellip;
	<cfscript>
		q = queryNew("id,title,body", "integer,varchar,varchar");
		for (i=1; i <= 5; i++){
			queryAddRow(q);
			querySetCell(q, "id", i);
			querySetCell(q, "title", "Record #i# Title");
			querySetCell(q, "body", "We are using verity to create and search collections.  The text in the collections includes words with a hyphen (patient-centered) but when searching on patient-centered we don't find any results. Is there a way to search on words with hyphens? Thanks for the help.");
		}
	</cfscript>

	<cfindex query="q" collection="#sCollection#" action="Update" type="Custom" key="id" title="title" body="body">
	Indexed<br />
	<cfdump var="#stIndex#"><br />
	<cfcatch>
		Error indexing query: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
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