<cfscript>
	param name="URL.count" default=0 type="integer";
	param name="URL.matchWord" type="regex" pattern="^(?i)[a-z]{6,}$";
	
	aKeywords = EntityLoad("Keyword");

	CRLF = chr(13) & chr(10);
	
	lLorem = fileRead(expandPath("../lorem.dat"));
	aLorem = listToArray(lLorem, "|");
	iLoremSize = arrayLen(aLorem);

	for (iDoc=1; iDoc <= URL.count; iDoc++){
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
	
		oDoc = entityNew("Document");
		oDoc.setDoc(sParas);
	
		lKeywords = "";
		for (iKeyword=1; iKeyword <= randRange(1, arrayLen(aKeywords)); iKeyword++){
			do {
				iKeyword = randRange(1, arrayLen(aKeywords));
			} while (listFind(lKeywords, iKeyword));
			lKeywords = listAppend(lKeywords, iKeyword);
			oDoc.addKeywords(aKeywords[iKeyword]);
		}
		entitySave(oDoc);
	}
</cfscript>