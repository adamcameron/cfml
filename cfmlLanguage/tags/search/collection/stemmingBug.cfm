<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">

<!--- Sort the collection out.--->
<cfset sCollection = "testCollection">
<cfset sLang = "russian">

<cfxml variable="xWords">
	<word>
		<variant case="nominative" plurality="singular">беженец</variant>
		<variant case="nominative" plurality="plural">беженцы</variant>
		<variant case="accusative" plurality="singular">беженца</variant>
		<variant case="accusative" plurality="plural">беженцев</variant>
		<variant case="dative" plurality="singular">беженцу</variant>
		<variant case="dative" plurality="plural">беженцам</variant>
		<variant case="genitive" plurality="singular">беженца</variant>
		<variant case="genitive" plurality="plural">беженцев</variant>
		<variant case="instrumental" plurality="singular">беженцем</variant>
		<variant case="instrumental" plurality="plural">беженцами</variant>
		<variant case="prepositional" plurality="singular">беженце</variant>
		<variant case="prepositional" plurality="plural">беженцах</variant>
	</word>
</cfxml>
<cfset aWords 	= xmlSearch(xWords, "/word/variant")>
<cfset iArrayLen= arrayLen(aWords)>

<cfparam name="url.recreate" default="false" type="boolean">
<cfif url.recreate>
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
				categories	= "false"
				language	= "#sLang#"
			>
			<cfoutput>The collection #sCollection# has been created.<br /></cfoutput>

	<cfelse>
		<cfoutput>The collection #sCollection# already existed.<br /></cfoutput>
	</cfif>
</cfif>

<!--- query to index --->
<cfscript>
	qIndex = queryNew("id,title,body");
	for (i=1; i le iArrayLen; i=i+1){
		sWord = aWords[i].xmltext;
		sCase		= aWords[i].xmlAttributes["case"];
		sPlurality	= aWords[i].xmlAttributes["plurality"];
		queryAddRow(qIndex);
		querySetCell(qIndex, "id", i);
		querySetCell(qIndex, "title", "#sWord# [#sCase#][#sPlurality#]");
		querySetCell(qIndex, "body", sWord);
	}
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
	language	= "#sLang#"
>


<cfdump var="#stIndex#" label="stIndex">

<!--- look for it --->
<cfloop index="i" from="1" to="#iArrayLen#">
	<cfset sWord		= aWords[i].xmltext>
	<cfset sCase		= aWords[i].xmlAttributes["case"]>
	<cfset sPlurality	= aWords[i].xmlAttributes["plurality"]>
	<cfsearch
		name		= "qSearch"
		collection	= "#sCollection#"
		status		= "stSearch"
		criteria	= "<STEM>#sWord#"
		language	= "#sLang#"
		type		= "explicit"
	>

	<cfdump var="#qSearch#" label="qSearch: #sWord# [#sCase#][#sPlurality#]">
	<cfdump var="#stSearch#" label="stSearch: #sWord#">
</cfloop>