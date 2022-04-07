<cfset cSep = createObject("java", "java.io.File").separator>
<cfset sBaseUrl = "/shared/cf/cfml/G-I/index/files/">
<cfset sDir = expandPath(sBaseUrl)>
<cfdirectory action="list" directory="#sDir#" name="qListing" recurse="true">

<cfquery name="qListing" dbtype="query">
	select	*
	from	qListing
	where	type = 'File'
</cfquery>

<!--- <cfscript>
	qListing = queryNew("directory,name,size,sTitle,sType");
	queryAddRow(qListing);
	querysetCell(qListing, "directory", "C:/webroots/shared/cf/cfml/G-I/invoke");
	querysetCell(qListing, "name", "babelFishWs.cfm");
	querysetCell(qListing, "size", 123);
	querysetCell(qListing, "sTitle", "title1");
	querysetCell(qListing, "sType", "file");
	queryAddRow(qListing);
	querysetCell(qListing, "directory", "C:/webroots/shared/cf/cfml/G-I/index");
	querysetCell(qListing, "name", "testHierarchy.cfm");
	querysetCell(qListing, "size", 456);
	querysetCell(qListing, "sTitle", "title2");
	querysetCell(qListing, "sType", "file");
	queryAddRow(qListing);
	querysetCell(qListing, "directory", "C:/webroots/shared/cf/cfml/G-I/include");
	querysetCell(qListing, "name", "caller.cfm");
	querysetCell(qListing, "size", 789);
	querysetCell(qListing, "sTitle", "title3");
	querysetCell(qListing, "sType", "file");
	querysetCell(qListing, "directory", "C:/webroots/shared/cf/cfml/G-I/include");
	querysetCell(qListing, "name", "caller.cfm");
	querysetCell(qListing, "size", 789);
	querysetCell(qListing, "sTitle", "title3");
	querysetCell(qListing, "sType", "file");
</cfscript> --->

<cfset queryAddColumn(qListing, "u", arrayNew(1))>
<cfset queryAddColumn(qListing, "fullPath", arrayNew(1))>
<cfset queryAddColumn(qListing, "thisRow", arrayNew(1))>
<cfset queryAddColumn(qListing, "urlPath", arrayNew(1))>
<cfset queryAddColumn(qListing, "newTitle", arrayNew(1))>
<cfloop query="qListing">
	<cfset qListing["u"][currentRow] = createUuid()>
	<cfset qListing["thisRow"][currentRow] = currentRow>

	<cfset sThisPath = directory & cSep & name>
	<cfset qListing["fullPath"][currentRow] = sThisPath>

	<cfset sThisUrl = replace(sThisPath, sDir, sBaseUrl, "ONE")>
	<cfset sThisUrl = replace(sThisUrl, "\", "/", "ALL")>
	<cfset qListing["urlPath"][currentRow] = sThisUrl>

	<cfset qListing["newTitle"][currentRow] = name & "_" & currentRow>
</cfloop>
<cfdump var="#qListing#">
<cftry>
	<cfcollection collection="testBd" action="create" path="#expandPath('./collection/')#" >
	<cfcatch>COLLECTION ERROR: <cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput></cfcatch>
</cftry>

<cftry>
	<cfindex action="refresh" collection="testBd" query="qListing" type="file" key="fullPath" title="newTitle" custom1="u" custom2="sType" custom3="thisRow" custom4="size" urlpath="urlPath" status="stIndex">
	<cfdump var="#stIndex#" label="stIndex">
	<cfcatch>INDEX ERROR: <cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput></cfcatch>
</cftry>

<cfparam name="URL.criteria">
<cftry>
	<cfsearch collection="testBd" criteria="#URL.criteria#" name="qSearch" status="stSearch">
	<cfdump var="#qSearch#" label="qSearch">
	<cfdump var="#stSearch#" label="stSearch">
	<cfcatch>INDEX ERROR: <cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput></cfcatch>
</cftry>
