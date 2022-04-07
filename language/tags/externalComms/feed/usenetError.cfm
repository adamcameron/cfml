<cffeed action="read" source="http://rssfeeds.webmd.com/rss/rss.aspx" query="myfeed">
<cfdump var="#myFeed#">
<cfabort>
<cfset myfeed = REReplaceNoCase (trim(myfeed), "^[^<]*", "") />

<cfoutput query = "myfeed" maxrows="6">
	<a href = "#rsslink#" target="_blank">#myfeed.title#</a> <br />
</cfoutput>
