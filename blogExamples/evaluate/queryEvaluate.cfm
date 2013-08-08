<cfscript>
	param name="URL.iterations" type="integer";

	coloursInMaori		= makeQuery("colour", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
	coloursInEnglish	= makeQuery("colour", ["red","orange","yellow","green","blue","indigo","violet"]);

	start=getTickCount();
	for (i=1; i <= URL.iterations; i++){
		languageToUse = "English";
		rainbow = evaluate("valueList(coloursIn#languageToUse#.colour)");
	
		dynamicColumn = "id";
		englishColumnData = evaluate("valueList(coloursInEnglish.#dynamicColumn#)");
	}
	writeLog(file="#application.applicationname#_queryEvaluate", text="Elapsed: #getTickCount()-start#ms");
</cfscript>