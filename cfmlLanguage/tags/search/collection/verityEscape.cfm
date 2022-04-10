<cfflush interval="50">

<!--- Sort the collection out.--->
<cfset sCollection	= "testCollection">
<!---
<cftry><!--- just try/catching this so it runs first time without modification --->
	<cfcollection action="delete" collection="#sCollection#">
	<cfoutput>The collection #sCollection# has been deleted<br/></cfoutput>
	<cfcatch><cfoutput>Exception trapped: #cfcatch.message#</cfoutput></cfcatch>
</cftry>

<cfcollection
	action		= "CREATE"
	collection	= "#sCollection#"
	path		= "#getDirectoryFromPath(getCurrentTemplatePath())#"
>
<cfoutput>The collection #sCollection# has been created.<br /></cfoutput>


<!--- query to index --->
<cfscript>
	qIndex = queryNew("id,title,body,category");
	queryAddRow(qIndex);
	querySetCell(qIndex, "id", 1);
	querySetCell(qIndex, "title", "My Story about C++");
	querySetCell(qIndex, "body", "This is all about C++.  You should read it.");

	queryAddRow(qIndex);
	querySetCell(qIndex, "id", 2);
	querySetCell(qIndex, "title", "My Story about C##");
	querySetCell(qIndex, "body", "This is all about C##.  You should read it.");

</cfscript>
<cfdump var="#qIndex#" label="qIndex">

<!--- index it --->
<cfindex
	collection	= "#sCollection#"
	query		= "qIndex"
	action		= "refresh"
	type		= "custom"
	key			= "id"
	title		= "title"
	body		= "body"
	status		= "stIndex"
>
<cfdump var="#stIndex#" label="stIndex">
 --->
<!--- Test Search--->
<cfsearch
	name		= "qSearch"
	collection	= "#sCollection#"
	status		= "stSearch"
	criteria	= "*"
>

<cfdump var="#qSearch#" label="qSearch">
<cfdump var="#stSearch#" label="stSearch">

<!--- Actual Search--->
<cfsearch
	name			= "qSearch"
	collection		= "#sCollection#"
	status			= "stSearch"
	type			= "simple"
	contextpassages	="10"
	criteria		= '"C``+``+"'
>
<cfdump var="#qSearch#" label="qSearch">
<cfdump var="#stSearch#" label="stSearch">