<cfscript>
	param name="URL.count" default=0 type="integer";
	param name="URL.matchWord" default="" type="regex" pattern="^(?i)[a-z]{6,}$";
	
	CRLF = chr(13) & chr(10);
	
	lLorem = fileRead(expandPath("../lorem.dat"));
	aLorem = listToArray(lLorem, "|");
	iLoremSize = arrayLen(aLorem);

	for (i=1; i <= URL.count; i++){
		iParas = randRange(1,10);
		aParas = [];
		while(arrayLen(aParas) < iParas){
			arrayAppend(aParas, aLorem[randRange(1, iLoremSize)]);
		}
		sParas = arrayToList(aParas, CRLF);
		iParasWords = listLen(sParas, " ");
		
		for (iMatch=1; iMatch <= randRange(1, iParas*2); iMatch++){
			iWordToMatch = randRange(1, iParasWords-1);
			sParas = listDeleteAt(sParas, iWordToMatch, " ");
			sParas = listInsertAt(sParas, iWordToMatch, URL.matchWord, " ");
		}
		
		oDoc = entityNew("SimpleDocument");
		oDoc.setDoc(sParas);
		entitySave(oDoc);
	}
</cfscript>