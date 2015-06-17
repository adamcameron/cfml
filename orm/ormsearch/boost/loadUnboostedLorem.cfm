<cfscript>
	param name="URL.count" default=0 type="integer";
	param name="URL.matchWord" default="" type="regex" pattern="^[a-z]{6,}$";
	
	CRLF = chr(13) & chr(10);
	
	lLorem = fileRead(expandPath("./lorem.dat"));
	aLorem = listToArray(lLorem, "|");
	iLoremSize = arrayLen(aLorem);

	for (i=1; i <= URL.count; i++){
		iMainParas = randRange(1,10);
		aMainParas = [];

		iSubParas = randRange(1,10);
		aSubParas = [];

		while(arrayLen(aMainParas) <iMainParas){
			arrayAppend(aMainParas, aLorem[randRange(1, iLoremSize)]);
		}
		sMainParas = arrayToList(aMainParas, CRLF);
		iMainParamsWords = listLen(sMainParas, " ");
		
		switch (randRange(1,4)){
			case 1: {	// both main & sub with have matches
				iMainParasMatchesToInsert	= randRange(1, iMainParas*2);
				iSubParasMatchesToInsert	= randRange(1, iSubParas*2);
				break;
			}
			case 2: {	// just mains will have matches
				iMainParasMatchesToInsert	= randRange(1, iMainParas*2);
				iSubParasMatchesToInsert	= 0;
				break;
			}
			case 3: {	// just subs will have matches
				iMainParasMatchesToInsert	= 0;
				iSubParasMatchesToInsert	= randRange(1, iSubParas*2);
				break;
			}
			case 4: {	// no matches in either
				iMainParasMatchesToInsert	= 0;
				iSubParasMatchesToInsert	= 0;
				break;
			}
		}
		
		for (iMatch=1; iMatch <= iMainParasMatchesToInsert; iMatch++){
			iWordToMatch = randRange(1, iMainParamsWords-1);
			sMainParas = listDeleteAt(sMainParas, iWordToMatch, " ");
			sMainParas = listInsertAt(sMainParas, iWordToMatch, URL.matchWord, " ");
		}
		
		while(arrayLen(aSubParas) <iSubParas){
			arrayAppend(aSubParas, aLorem[randRange(1, iLoremSize)]);
		}
		sSubParas = arrayToList(aSubParas, CRLF);
		iSubParamsWords = listLen(sSubParas, " ");
		
		
		for (iMatch=1; iMatch <= iSubParasMatchesToInsert; iMatch++){
			iWordToMatch = randRange(1, iSubParamsWords-1);
			sSubParas = listDeleteAt(sSubParas, iWordToMatch, " ");
			sSubParas = listInsertAt(sSubParas, iWordToMatch, URL.matchWord, " ");
		}

		oLorem = new shared.CF.orm.ormsearch.api.UnboostedLorem();
		oLorem.setMainText(sMainParas);
		oLorem.setSubText(sSubParas);
		oLorem.setMainTextParaCount(iMainParas);
		oLorem.setSubTextParaCount(iSubParas);
		oLorem.setMainTextMatchCount(iMainParasMatchesToInsert);
		oLorem.setSubTextMatchCount(iSubParasMatchesToInsert);
		oLorem.setMainTextWordCount(listLen(sMainParas, " "));
		oLorem.setSubTextWordCount(listLen(sSubParas, " "));
		
		entitySave(oLorem);
	}
</cfscript>