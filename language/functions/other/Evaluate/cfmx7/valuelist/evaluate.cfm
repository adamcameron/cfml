<cfparam name="URL.iterations" type="integer">
<cfscript>
	coloursInMaori		= makeQuery("colour", listToArray("whero,karaka,kowhai,kakariki,kikorangi,tawatawa,mawhero"));
	coloursInEnglish	= makeQuery("colour", listToArray("red,orange,yellow,green,blue,indigo,violet"));

	start=getTickCount();
	for (i=1; i LE URL.iterations; i=i+1){
		languageToUse = "English";
		rainbow = evaluate("valueList(coloursIn#languageToUse#.colour)");
	
		dynamicColumn = "id";
		englishColumnData = evaluate("valueList(coloursInEnglish.#dynamicColumn#)");
	}
	logIt(getTickCount()-start);
</cfscript>