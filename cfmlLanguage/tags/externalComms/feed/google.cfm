<!--- 
<rss version="2.0" 
xmlns:g="http://base.google.com/ns/1.0">
<channel>
<title>The name of your data feed</title>
<link>http://www.example.com</link>
<description>A description of your content</description>
<item>
<title>Red wool sweater</title>
<link> http://www.example.com/item1-info-page.html</link>
<description>Comfortable and soft, this sweater will keep you warm on those cold winter nights.</description>
<g:image_link>http://www.example.com/image1.jpg</g:image_link>
<g:price>25</g:price>
<g:condition>new</g:condition>
<g:id>1a</g:id>
</item>
</channel>
</rss>

 --->

<cfscript>
	st					= structNew();
	st.title			= "The name of your data feed";
	st.link				= "http://www.example.com";
	st.description		= "A description of your content";
	st.pubDate			= Now(); 
	st.version			= "rss_2.0"; 
	st.item						= arrayNew(1);
	st.item[1]					= structNew();
	st.item[1].title			= "Red wool sweater";
	st.item[1].link				= "http://www.example.com/item1-info-page.html";
	st.item[1].description		= structNew();
	st.item[1].description.value= "Comfortable and soft, this sweater will keep you warm on those cold winter nights.";
	st.item[1]["g:image_link"]	= "http://www.example.com/image1.jpg";
	st.item[1]["g:price"]		= "25";
	st.item[1]["g:condition"]	= "new";
	st.item[1]["g:id"]			= "1a";
</cfscript>

<cffeed action="create" name="#st#" xmlvar="sRss">
<cfset xRss = xmlParse(sRss)>
<cfdump var="#variables#">