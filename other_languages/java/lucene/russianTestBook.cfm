<cfsetting requesttimeout="300">
<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">

<!--- Sort the collection out.--->
<cfset sCollection = "testcollection">
<cfset sLang = "russian">

<cfxml variable="xWords">
	<word>
		<variant case="nominative" plurality="singular">книга</variant>
		<variant case="nominative" plurality="plural">книги</variant>
		<variant case="accusative" plurality="singular">книгу</variant>
		<variant case="accusative" plurality="plural">книги</variant>
		<variant case="dative" plurality="singular">книге</variant>
		<variant case="dative" plurality="plural">книгам</variant>
		<variant case="genitive" plurality="singular">книгу</variant>
		<variant case="genitive" plurality="plural">книги</variant>
		<variant case="instrumental" plurality="singular">книгой</variant>
		<variant case="instrumental" plurality="plural">книгами</variant>
		<variant case="prepositional" plurality="singular">книге</variant>
		<variant case="prepositional" plurality="plural">книгах</variant>
		<variant case="common_base" plurality="n/a">книг*</variant>
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

<!--- look for it
<cfloop index="i" from="1" to="#iArrayLen#">
	<cfset sWord		= aWords[i].xmltext>
	<cfset sCase		= aWords[i].xmlAttributes["case"]>
	<cfset sPlurality	= aWords[i].xmlAttributes["plurality"]>
	<cfsearch
		name		= "qSearch"
		collection	= "#sCollection#"
		status		= "stSearch"
		criteria	= "#sWord#"
		language	= "#sLang#"
		type		= "simple"
	>

	<cfdump var="#qSearch#" label="qSearch: #sWord# [#sCase#][#sPlurality#]">
	<cfdump var="#stSearch#" label="stSearch: #sWord#">
</cfloop> --->
<!--- add stemming from lucene and prep for search   --->



<!--- <cfdump var="#aWords[i].xmltext#"> --->
<cfset line = aWords[12].xmltext>
<!--- 
<cfloop index="i" from="2" to="#ArrayLen(aWords)#">
  <cfset line = line & " " & aWords[i].xmltext>
</cfloop> 
 --->

<cfscript>
  //Analyzer analyzer = new SnowballAnalyzer("Russian");
  analyzer = CreateObject("java", "org.apache.lucene.analysis.ru.RussianAnalyzer").init();

  parser = CreateObject("java", "org.apache.lucene.queryParser.QueryParser").init("", analyzer);


  query = CreateObject("java", "org.apache.lucene.search.Query");

  query = parser.parse(line);
</cfscript>


<!--- add stemming from lucene and prep for search   --->



<br /><br />
Now searching for a string "книг*"
<br />
<cfloop index="i" from="1" to="#iArrayLen#">
	<cfset sWord		= query.toString() & "*">
	<cfset sCase		= aWords[i].xmlAttributes["case"]>
	<cfset sPlurality	= aWords[i].xmlAttributes["plurality"]>
	<cfsearch
		name		= "qSearch"
		collection	= "#sCollection#"
		status		= "stSearch"
		criteria	= "#sWord#"
		language	= "#sLang#"
		type		= "simple"
	>

	<cfdump var="#qSearch#" label="qSearch: #sWord# [#sCase#][#sPlurality#]">
	<cfdump var="#stSearch#" label="stSearch: #sWord#">
</cfloop><!---  --->
