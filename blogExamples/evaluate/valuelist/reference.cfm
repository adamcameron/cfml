<cfscript>
	param name="URL.iterations" type="integer";

	coloursInMaori		= makeQuery("colour", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
	coloursInEnglish	= makeQuery("colour", ["red","orange","yellow","green","blue","indigo","violet"]);

	start=getTickCount();
	for (i=1; i <= URL.iterations; i++){
		languageToUse = "English";
		queryToUse = variables["coloursIn#languageToUse#"];
		rainbow = valueList(queryToUse.colour);
	
		dynamicColumn = "id";
		englishColumnData = arrayToList(coloursInEnglish[dynamicColumn]);
	}
	logIt(getTickCount()-start);
</cfscript>