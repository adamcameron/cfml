<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">

<!--- Sort the collection out.---><cfset sCollection	= "testCollection">
<cfset sLang		= "russian"><!--- change this to "english", and it "works" (although it doesn't, really... you'll see what I mean). So not an option --->
<cfset sCategory	= lcase("Россия")><!--- change this from "Россия" to be something in English, and it works fine --->

<cftry><!--- just try/catching this so it runs first time without modification --->
	<cfcollection action="delete" collection="#sCollection#">
	<cfoutput>The collection #sCollection# has been deleted<br/></cfoutput>
	<cfcatch><cfoutput>Exception trapped: #cfcatch.message#</cfoutput></cfcatch>
</cftry>

<cfcollection
	action		= "CREATE"
	collection	= "#sCollection#"
	path		= "#getDirectoryFromPath(getCurrentTemplatePath())#"
	categories	= "true"
	language	= "#sLang#"
>
<cfoutput>The collection #sCollection# has been created.<br /></cfoutput>


<!--- query to index --->
<cfscript>
	qIndex = queryNew("id,title,body,category");
	queryAddRow(qIndex);
	querySetCell(qIndex, "id", 1);
	querySetCell(qIndex, "title", "My Title");
	querySetCell(qIndex, "body", "My Body");
	querySetCell(qIndex, "category", sCategory);
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
	category	= "category"
	status		= "stIndex"
	language	= "#sLang#"
>
<cfdump var="#stIndex#" label="stIndex">

<!--- look for it --->
<cfsearch
	name		= "qSearch"
	collection	= "#sCollection#"
	category	= "#sCategory#"
	status		= "stSearch"
	criteria	= "*"
	language	= "#sLang#"
>

<cfdump var="#qSearch#" label="qSearch">
<cfdump var="#stSearch#" label="stSearch">