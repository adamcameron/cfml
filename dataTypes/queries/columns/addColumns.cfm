<cfquery name="getPages" datasource="gbc" username="gbc_straker" password="gbc_straker">
	select uuid, page_name, page_title,  date_created
	from pages
</cfquery>
<cfscript>
	q = queryNew("");
	queryAddRow(q, getPages.recordCount);
	queryAddColumn(q, "uuid", getPages["uuid"]);
	queryAddColumn(q, "page_name", getPages["page_name"]);
	queryAddColumn(q, "page_title", getPages["page_title"]);
	
	l = arrayToList(getPages["date_created"]);
	l = reReplace(l, "([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{0,3})", "\1\2\3\4\5\6", "ALL");
	queryAddColumn(q, "date_created", listToArray(l));

</cfscript>
<cfdump var="#q#">
