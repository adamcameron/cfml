<cfquery name="qRecords" datasource="intranet">
	select		p.uuid, p.page_title, p.date_created, cv.content, 'http://localhost:8307/page.cfm?uuid=' || uuid as link_url
	from		pages p
	inner join	pages_containers_link pcl
	on			p.uuid				= pcl.page_uuid
	inner join	containers c
	on			pcl.container_uuid	= c.uuid
	inner join	container_versions cv
	on			c.uuid				= cv.container_uuid
	and			c.version_uuid		= cv.version_uuid
	where		ROWNUM <= 10
</cfquery>

<cfscript>
	// Map the orders column names to the feed query column names.
	stColMap				= structNew();
	stColMap.publisheddate	= "date_created";
	stColMap.content		= "content";
	stColMap.title			= "page_title";
	stColMap.rsslink		= "link_url";

	// Set the feed stMetadata.
	stMeta.title		= "Pages";
	stMeta.link			= "http://localhost:8307/";
	stMeta.description	= "Some pages";
	stMeta.version		= "rss_2.0";
</cfscript>

<!--- Create the feed. --->
<cffeed	action		= "create"
		query		= "#qRecords#"
		properties	= "#stMeta#"
		columnMap	= "#stColMap#"
		xmlvar		= "xRss"
		outputfile	= "#expandPath('./')#rssPages.xml"
		overwrite	= "true"
>

<cfdump var="#xmlParse(xRss)#">
