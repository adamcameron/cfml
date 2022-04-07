<cfscript>
	param name="URL.keyword" type="regex" pattern="^(?i)[a-z]+$";

	oKeyword = entityNew("Keyword");
	oKeyword.setWord(URL.keyword);
	entitySave(oKeyword);
</cfscript>