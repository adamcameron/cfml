<cffunction name="getRSSItems" access="public" returntype="query" output="no" hint="Returns a query of items from an RSS feed.">
	<cfargument name="source" type="string" required="yes">
	
	<cfset var CFHTTP = 0>
	<cfset var xData = 0>
	<cfset var axItems = 0>
	<cfset var cols = "title,description,pubDate,link,guid">
	<cfset var qItems = QueryNew(cols)>
	<cfset var ii = 0>
	<cfset var col = "">
	
	<cfhttp url="#arguments.source#">
		<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
	</cfhttp>
	
	<cfset xData = XmlParse( REReplace(cfhttp.FileContent, "^[^<]*", "", "ALL") )>
	<cfset axItems = xData.rss.channel.item>
	
	<cfset QueryAddRow(qItems,ArrayLen(axItems))>
	<cfloop index="ii" from="1" to="#ArrayLen(axItems)#">
		<cfloop list="#cols#" index="col">
			<cfif StructKeyExists(axItems[ii],col)>
				<cfset QuerySetCell(qItems,col,HTMLEditFormat(axItems[ii][col].XmlText),ii)>
			</cfif>
		</cfloop>
	</cfloop>
	
	<cfreturn qItems>
</cffunction>

<cfset qFrameworkEntries = getRSSItems("http://www.bryantwebconsulting.com/blog/rss.cfm?mode=full&mode2=cat&catid=2032EC89-3048-78A9-F9CF62DCEA264447")>


<!---
 Converts an RSS 0.9+, ATOM or RDF feed into a query.
 
 @param path 	 URL of RSS feed. (Required)
 @return Returns a structure. 
 @author Joe Nicora (&#106;&#111;&#101;&#64;&#115;&#101;&#101;&#109;&#101;&#99;&#114;&#101;&#97;&#116;&#101;&#46;&#99;&#111;&#109;) 
 @version 1, April 9, 2007 
--->
<cffunction name="feedToQuery" returntype="struct" output="false">
	/**
	 * Converts an RSS 0.9+, ATOM or RDF feed into a query.
	 * 
	 * @param path 	 		RSS feed url or file path, must be valid RSS, ATOM or RDF. (Required)
	 * @return 				Returns a structure with meta data and a query. 
	 * @author 				Joe Nicora (joe@seemecreate.com) 
	 * @version 1, 			July 16, 2006 
	 */
	<cfargument name="path" type="string" required="yes" />
	
	<cfset var parsed = "" />
	<cfset var index = 0 />
	<cfset var rows = 0 />
	<cfset var thisArr = arrayNew(1) />
	<cfset var retStruct = structNew() />
	<cfset var XMLText = "" />
	<cfset var retQuery = queryNew("title,link,description") />
	
	<cfif path CONTAINS "://">
		<cfhttp url="#path#" resolveurl="no" />
		<cfset XMLText = cfhttp.fileContent />
	<cfelse>
		<cffile action="read" file="#path#" variable="XMLText">
	</cfif>
	
	<cfscript>
		nodeToReplace = mid(XMLText, 1, evaluate(find("?>", XMLText) + 1));
		XMLText = replaceNoCase(XMLText, nodeToReplace, "", "ALL");
		parsed = XMLParse(XMLText);
		
		if (find("<rdf:RDF", parsed))
		{
			if (isArray(XMLSearch(parsed, "/rdf:RDF/")))
			{
				if (isArray(XMLSearch(parsed, "/channel/")))
				{
					retStruct.channel = structNew();
					if (structKeyExists(parsed["rdf:RDF"]["channel"].XMLAttributes, "rdf:about")) retStruct.channel.about = parsed["rdf:RDF"]["channel"].XMLAttributes["rdf:about"];
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "link")) retStruct.channel.link = parsed["rdf:RDF"]["channel"].link.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "title")) retStruct.channel.title = parsed["rdf:RDF"]["channel"].title.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "description")) retStruct.channel.description = parsed["rdf:RDF"]["channel"].description.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"].XMLAttributes, "rdf:resource")) retStruct.channel.image = parsed["rdf:RDF"]["channel"].image.XMLAttributes["rdf:resource"];
					retStruct.channel.type = "RDF";
				}
				if (isArray(XMLSearch(parsed, "/item/")))
				{
					for (index = 1; index LTE arrayLen(parsed["rdf:RDF"].XMLChildren); index = index + 1)
					{
						if (parsed["rdf:RDF"].XMLChildren[index].XMLName IS "item")
						{
							rows = rows + 1;
							queryAddRow(retQuery, 1);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "title")) querySetCell(retQuery, "title", parsed["rdf:RDF"].XMLChildren[index].title.XMLText, rows);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "link")) querySetCell(retQuery, "link", parsed["rdf:RDF"].XMLChildren[index].link.XMLText, rows);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "description")) querySetCell(retQuery, "description", parsed["rdf:RDF"].XMLChildren[index].description.XMLText, rows);
						}
					}
				}
				retStruct.query = retQuery;
			}
		}
		if (find("<rss", parsed))
		{
			if (isArray(XMLSearch(parsed, "/rss/")))
			{
				if (isArray(XMLSearch(parsed, "/channel/")))
				{
					retStruct.channel = structNew();
					if (structKeyExists(parsed["rss"]["channel"], "title")) retStruct.channel.title = parsed["rss"]["channel"].title.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "link")) retStruct.channel.link = parsed["rss"]["channel"].link.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "description")) retStruct.channel.description = parsed["rss"]["channel"].description.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "language")) retStruct.channel.language = parsed["rss"]["channel"].language.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "pubDate")) retStruct.channel.pubDate = parsed["rss"]["channel"].pubDate.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "lastBuildDate")) retStruct.channel.lastBuildDate = parsed["rss"]["channel"].lastBuildDate.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "docs")) retStruct.channel.docs = parsed["rss"]["channel"].docs.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "generator")) retStruct.channel.generator = parsed["rss"]["channel"].generator.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "manageEditor")) retStruct.channel.managingEditor = parsed["rss"]["channel"].managingEditor.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "webMaster")) retStruct.channel.webMaster = parsed["rss"]["channel"].webMaster.XMLText;
					retStruct.channel.type = "RSS";
				}
				if (isArray(XMLSearch(parsed, "/rss/channel/item/")))
				{
					retQuery = queryNew("title,link,description,pubDate,guid");
					queryAddRow(retQuery, arrayLen(XMLSearch(parsed, "/rss/channel/item/")));
					for (index = 1; index LTE arrayLen(XMLSearch(parsed, "/rss/channel/item/")); index = index + 1)
					{
						thisArray = XMLSearch(parsed, "/rss/channel/item/");
						if (structKeyExists(thisArray[index], "title")) querySetCell(retQuery, "title", thisArray[index].title.XMLText, index);
						if (structKeyExists(thisArray[index], "link")) querySetCell(retQuery, "link", thisArray[index].link.XMLText, index);
						if (structKeyExists(thisArray[index], "description")) querySetCell(retQuery, "description", thisArray[index].description.XMLText, index);
						if (structKeyExists(thisArray[index], "pubDate")) querySetCell(retQuery, "pubDate", thisArray[index].pubDate.XMLText, index);
						if (structKeyExists(thisArray[index], "guid")) querySetCell(retQuery, "guid", thisArray[index].guid.XMLText, index);
					}
				}
				retStruct.query = retQuery;
			}
		}
		if (find("<feed", parsed))
		{		
			retStruct.channel = structNew();
			if (structKeyExists(parsed["feed"], "title")) retStruct.channel.title = parsed["feed"].title.XMLText;
			if (structKeyExists(parsed["feed"], "link")) retStruct.channel.link = parsed["feed"].link.XMLAttributes.href;
			if (structKeyExists(parsed["feed"], "tagLine")) retStruct.channel.tagLine = parsed["feed"].tagLine.XMLText;
			if (structKeyExists(parsed["feed"], "id")) retStruct.channel.id = parsed["feed"].id.XMLText;
			if (structKeyExists(parsed["feed"], "modified")) retStruct.channel.modified = parsed["feed"].modified.XMLText;
			if (structKeyExists(parsed["feed"], "generator")) retStruct.channel.generator = parsed["feed"].generator.XMLText;
			retStruct.channel.type = "ATOM";
			
			if (isArray(XMLSearch(parsed, "/feed/entry/")))
			{
				retQuery = queryNew("title,link,content,id,author,issued,modified,created");
				for (index = 1; index LTE arrayLen(parsed["feed"].XMLChildren); index = index + 1)
				{
					if (parsed["feed"].XMLChildren[index].XMLName IS "entry")
					{
						rows = rows + 1;
						queryAddRow(retQuery, 1);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "title")) querySetCell(retQuery, "title", parsed["feed"].XMLChildren[index].title.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "link")) querySetCell(retQuery, "link", parsed["feed"].XMLChildren[index].link.XMLAttributes.href, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "content")) querySetCell(retQuery, "content", parsed["feed"].XMLChildren[index].content.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "id")) querySetCell(retQuery, "id", parsed["feed"].XMLChildren[index].id.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "author")) querySetCell(retQuery, "author", parsed["feed"].XMLChildren[index].author.name.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "issued")) querySetCell(retQuery, "issued", parsed["feed"].XMLChildren[index].issued.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "modified")) querySetCell(retQuery, "modified", parsed["feed"].XMLChildren[index].modified.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "created")) querySetCell(retQuery, "created", parsed["feed"].XMLChildren[index].created.XMLText, rows);
					}
				}
			}	
			retStruct.query = retQuery;	
		}
	</cfscript>
	<cfreturn retStruct />
	
</cffunction>



<cfset qFrameworkEntries2 = feedToQuery("http://www.bryantwebconsulting.com/blog/rss.cfm?mode=full&mode2=cat&catid=2032EC89-3048-78A9-F9CF62DCEA264447")>


<cfoutput>
	Columns: #compare(qFrameworkEntries.columnList, qFrameworkEntries2.query.columnList)#<br />
</cfoutput>

<cfloop query="qFrameworkEntries">
	<cfloop index="col" list="#qFrameworkEntries.columnList#">
		<cfif compare(qFrameworkEntries[col][currentRow], qFrameworkEntries2.query[col][currentRow])>
			<cfoutput>
				Column: #col#<br />
				Row: #currentRow#<br />
				Value1: #qFrameworkEntries[col][currentRow]#<br />
				Value2: #qFrameworkEntries2.query[col][currentRow]#<br />
			</cfoutput>
			<cfdump var="#qFrameworkEntries#" top="#currentRow#">
			<cfdump var="#qFrameworkEntries2#" top="#currentRow#">
			<cfabort>
		</cfif>
	</cfloop>
</cfloop>

