<cfset sCollection = "vCollection">
<cfflush interval="20">
<cftry>
<cfcollection action="create" collection="#sCollection#" path="#getDirectoryFromPath(getCurrentTemplatePath())#">
Collection created<br />
<cfcatch>
	<cfoutput>#cfcatch.message#</cfoutput><br />
</cfcatch>
</cftry>

<cfscript>
	q = queryNew("idCol,dataCol", "CF_SQL_INTEGER,CF_SQL_VARCHAR");
	for (i=1; i le 10; i=i+1){
		queryAddRow(q);
		querySetCell(q, "idCol", i);
		querySetCell(q, "dataCol", "Data record#iif(i mod 2, de('-'), de(''))##i#");
	}
</cfscript>

Indexing...<br />
<cfindex collection="#sCollection#" action="refresh" type="custom" key="idCol" body="dataCol" query="q" status="stIndex">
<cfdump var="#stIndex#">
Indexed<br />

Searching...
<cfsearch collection="#sCollection#" name="qSearch" criteria="\-\1" type="internet_basic">
<cfdump var="#qSearch#">
Search complete