<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">

<!--- Sort the collection out.--->
<cfset sCollection = "testCollection">
<cftry>
	<cfcollection action="delete" collection="#sCollection#">
	<cfoutput>The collection #sCollection# has been deleted<br/></cfoutput>
	<cfcatch><cfoutput>Exception trapped: #cfcatch.message#</cfoutput></cfcatch>
</cftry>

<cfcollection action="list" name="qAllCollections">
<cfif not listFindNoCase(valueList(qAllCollections.name), sCollection)>
	<cfcollection
		action		= "CREATE"
		collection	= "#sCollection#"
		path		= "#getDirectoryFromPath(getCurrentTemplatePath())#"
		categories	= "true"
		language	= "russian"
	>
	<cfoutput>The collection #sCollection# has been created.<br /></cfoutput>
<cfelse>
	<cfoutput>The collection #sCollection# already existed.<br /></cfoutput>
</cfif>


<!--- XML with Russian category --->
<cfxml variable="x">
	<root id="1">
		<node id="2" russian="Россия" english="Russia" />
	</root>
</cfxml>
<cfset aX = xmlSearch(x, "/root/node[@id='2']/@russian")><!--- change this to 'english' and it works --->
<cfdump var="#aX#" label="aX">
<cfset sCategory = aX[1].xmlValue>


<!--- ---><cfset sCategory = "Россия"><!--- override with hardcode --->

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
	language	= "russian"
>
<cfdump var="#stIndex#" label="stIndex">

<!--- look for it --->
<cfsearch
	name		= "qSearch"
	collection	= "#sCollection#"
	category	= "#sCategory#"
	status		= "stSearch"
	criteria	= "*"
	language	= "russian"
>

<cfdump var="#qSearch#" label="qSearch">
<cfdump var="#stSearch#" label="stSearch">
