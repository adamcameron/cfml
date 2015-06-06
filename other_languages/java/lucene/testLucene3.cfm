<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">


<div style="font-family:verdana; font-size:8pt;">
<cfscript>
	sIndexPath	= getDirectoryFromPath(getCurrentTemplatePath()) & "testIndex";
	lWordSets	= "читать,читаю,читаешь,читает,читай,читаем,читаете,читают,читайте,читал,читала,читали|говорить,говорю,говоришь,говорит,говори,говорим,говорите,говорят,говорите,говорил,говорила,говорили|кормить,кормлю,кормишь,кормит,корми,кормим,кормите,кормят,кормите,кормил,кормила,кормили|бежать,бегу,бежишь,бежит,беги,бежим,бежите,бегут,бегите,бежал,бежала,бежали";

	oCfml		= createObject("component", "msf.api.util.cfml");
	oThread		= createObject("java", "java.lang.Thread");

	oAnalyser	= createObject("java", "org.apache.lucene.analysis.ru.RussianAnalyzer").init();
	oField		= createObject("java", "org.apache.lucene.document.Field");

	// loop over each set of words, performing the index test
	for (j=1; j le listLen(lWordSets, "|"); j=j+1){
		// index a set of words, then search for them
		lWords	= listGetAt(lWordSets, j, "|");
		iWords	= listLen(lWords);

		try {
			writeOutput('<span style="color:blue">Initialising Lucene</span><br />');
			if (directoryExists(sIndexPath)){
				try {
					oCfml.cfdirectory(action="delete", directory=sIndexPath, recurse=true);
				} catch (any e){
					// try closing the index and trying again
					oWriter		= createObject("java", "org.apache.lucene.index.IndexWriter").init(sIndexPath, oAnalyser).close();
					oSearcher	= createObject("java", "org.apache.lucene.search.IndexSearcher").init(sIndexPath).close();
					oCfml.cfdirectory(action="delete", directory=sIndexPath, recurse=true);
				}
			}
			oWriter = createObject("java", "org.apache.lucene.index.IndexWriter").init(sIndexPath, oAnalyser);
			writeOutput('<span style="color:green">Initialised</span><br />');

		} catch (any e){
			writeOutput('<span style="color:red">Error in initialisation process: [[#e.message#]]#e.detail#]]</span><br />');
			try {
				writeOutput('<span style="color:blue">Closing indexer... </span>');
				oWriter.close();
				writeOutput('<span style="color:green">success</span><br />');
			} catch (any e){
				writeOutput('<span style="color:orange">error closing index writer: [#e.message#]</span><br />');
			}
			writeOutput('<span style="color:red">ABORT</span><br />');
			oCfml.cfAbort();
		}

		// index each word separately
		writeOutput('<span style="color:blue">Indexing: [#lWords#]</span><br />');
		for (i=1; i le iWords; i=i+1){
			sIndexTerm = listGetAt(lWords, i);

			oDoc = createObject("java", "org.apache.lucene.document.Document").init();

			oDoc.add(oField.init("id", createObject("java", "java.io.StringReader").init(javacast("string", i))));
			oDoc.add(oField.init("keyword", createObject("java", "java.io.StringReader").init(sIndexTerm)));

			oWriter.addDocument(oDoc);
		}
		// finished indexing
		writeOutput('<span style="color:green">Indexing Complete</span><br />');

		// close up
		try {
			writeOutput('<span style="color:blue">Closing indexer... </span>');
			oWriter.close();
			writeOutput('<span style="color:green">success</span><br />');
		} catch (any e){
			writeOutput('<span style="color:orange">Error closing index writer: [#e.message#]</span><br />');
			writeOutput('<span style="color:red">CF RESTART REQUIRED</span><br />');
		}

		try {
			oSearcher = createObject("java", "org.apache.lucene.search.IndexSearcher").init(sIndexPath);

			writeOutput('<span style="color:blue">Searching</span><br />');
			for (i=1; i le iWords; i=i+1){
				sSearchTerm		= listGetAt(lWords, i);

				writeOutput('<span style="color:blue">Searching for [#sSearchTerm#]</span>');

				oQueryParser	= createObject("java", "org.apache.lucene.queryParser.QueryParser").init("keyword", oAnalyser);
				oQuery			= oQueryParser.parse(sSearchTerm);

				oHits			= oSearcher.search(oQuery);
				iHits			= oHits.length();
				if (iHits eq iWords){
					sColour	= "green";
				}else if (iHits le (iWords\2)){
					sColour	= "red";
				}else{
					sColour	= "orange";
				}
				writeOutput('<span style="color:#sColour#">Found: [#iHits#] match#iif(iHits neq 1, de("es"), de(""))#</span><br />');
			}	// end of looping over each word in group

			// this test finished.  Close searcher
			writeOutput('<span style="color:green">Test Complete</span><br />');

			// close up
			try {
				writeOutput('<span style="color:blue">Closing searcher... </span>');
				oSearcher.close();
				writeOutput('<span style="color:green">success</span><br />');
			} catch (any e){
				writeOutput('<span style="color:orange">Error closing index searcher: [#e.message#]</span><br />');
				writeOutput('<span style="color:red">CF RESTART REQUIRED</span><br />');
			}

		} catch (any e){
			writeOutput('<span style="color:red">Error searching: [#e.message#]</span>');
		}
		writeOutput('<hr />');
	}	// end of looping over all words
	writeOutput('<span style="color:green">All Tests Complete</span><br />');
	writeOutput('<span style="color:blue">END</span><br />');
</cfscript>
</div>
