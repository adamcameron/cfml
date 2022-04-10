<cfscript>
	param name="URL.iterations" type="integer";

	coloursInMaori		= makeQuery("colour", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
	coloursInEnglish	= makeQuery("colour", ["red","orange","yellow","green","blue","indigo","violet"]);


	timeIterations(URl.iterations, evaluateValueList);
	timeIterations(URl.iterations, referenceValueList);

	function evaluateValueList(){
		var languageToUse = "English";
		var rainbow = evaluate("valueList(coloursIn#languageToUse#.colour)");

		var dynamicColumn = "id";
		var englishColumnData = evaluate("valueList(coloursInEnglish.#dynamicColumn#)");
	}

	function referenceValueList(){
		var languageToUse = "English";

		var queryToUse = variables["coloursIn#languageToUse#"];
		var rainbow = valueList(queryToUse.colour);

		var dynamicColumn = "id";
		var englishColumnData = arrayToList(coloursInEnglish[dynamicColumn]);
	}
</cfscript>