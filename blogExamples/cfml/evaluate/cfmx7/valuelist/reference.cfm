<cfparam name="URL.iterations" type="integer">
<cfscript>
	coloursInMaori		= makeQuery("colour", listToArray("whero,karaka,kowhai,kakariki,kikorangi,tawatawa,mawhero"));
	coloursInEnglish	= makeQuery("colour", listToArray("red,orange,yellow,green,blue,indigo,violet"));

	start=getTickCount();
	for (i=1; i LE URL.iterations; i=i+1){
		languageToUse = "English";
		queryToUse = variables["coloursIn#languageToUse#"];
		rainbow = valueList(queryToUse.colour);
	
		dynamicColumn = "id";
		englishColumnData = arrayToList(coloursInEnglish[dynamicColumn]);
	}
	logIt(getTickCount()-start);
</cfscript>