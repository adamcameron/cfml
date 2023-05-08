<cfscript>
	param name="URL.keyword" type="regex" pattern="^(?i)[a-z]+$";
	
	iStart = getTickCount();
	a = ormSearch(URL.keyword, "Document", ["keywords.word"]);
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>