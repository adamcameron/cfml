<cfscript>
	qData = queryNew("");
	queryAddColumn(qData, "category", listToArray("cat1,cat2,cat3,cat4,cat5"));
	queryAddColumn(qData, "sitename", listToArray("sitename1,sitename2,sitename3,sitename4,sitename5"));
	queryAddColumn(qData, "url", listToArray("url1,url2,url3,url4,url5"));
	queryAddColumn(qData, "keywords", listToArray("keywords1,keywords2,keywords3,keywords4,keywords5"));
	queryAddColumn(qData, "descript", listToArray("descript1,descript2,descript3,descript4,descript5"));
	queryAddColumn(qData, "subcat1", listToArray("subcat11,subcat12,subcat13,subcat14,subcat15"));
	queryAddColumn(qData, "subcat2", listToArray("subcat21,subcat22,subcat23,subcat24,subcat25"));
</cfscript>

<cfindex
	collection	= "testcollection"
	action		= "update"
	type		= "custom"
	custom1		= "category"
	custom2		= "sitename"
	key			= "url"
	body		= "keywords, descript, sitename, category, subcat1, subcat2, url"
	title		= "sitename"
	query		= "qData"
>