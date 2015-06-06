<cfprocessingdirective pageencoding="utf-8">
<cfflush interval="50">


<div style="font-family:verdana; font-size:8pt;">
<cfscript>
	sIndexPath	= getDirectoryFromPath(getCurrentTemplatePath()) & "testIndex";
	lWordSets	= "палатка,палатки,палатки,палаток,палатке,палаткам,палатку,палатки,палаткой,палатками,палатке,палатках|холера,холеры,холеры,холер,холере,холерам,холеру,холеры,холерой,холерами,холере,холерах|корь,кори,кори,корей,кори,корям,корь,кори,корью,корями,кори,корях|помощь,помощи,помощи,помощей,помощи,помощам,помощь,помощи,помощью,помощами,помощи,помощях|хирургия,хирургии,хирургии,хирургий,хирургии,хирургиям,хирургию,хирургии,хирургией,хирургиями,хирургии,хирургиях|природная катастрофа,природные катастрофы,природной катастрофы,природных катастроф,природной катастрофе,природным катастрофам,природную катастрофу,природные катастрофы,природной катастрофой,природными катастрофами,природной катастрофе,природных катастрофах|сонная болезнь,сонные болезни,сонной болезни,сонных болезней,сонной болезни,сонным болезням,сонную болезнь,сонные болезни,сонной болезнью,сонными болезнями,сонной болезни,сонных болезнях|сестра,сестры,сестры,сестер,сестре,сестрам,сестру,сестер,сестрой,сестрами,сестре,сестрах|земля,земли,земли,землями,земле,землям,землю,земли,землей,землями,земле,землях|мышь,мыши,мыши,мышей,мыши,мышам,мышь,мышей,мышью,мышами,мыши,мышах|рожь,рожи,ржи,рожей,ржи,рожам,рожь,рожи,рожью,рожами,ржи,рожах|туберкулез,туберкулезы,туберкулеза,туберкулезов,туберкулезу,туберкулезам,туберкулез,туберкулезы,туберкулезом,туберкулезами,туберкулезе,туберкулезах|беженец,беженцы,беженца,беженцев,беженцу,беженцам,беженца,беженцев,беженцем,беженцами,беженце,беженцах|голод,голода,голода,голодов,голоду,голодам,голод,голода,голодом,голодами,голоде,голодах|вынужденный переселенец,вынужденные переселенцы,вынужденного переселенца,вынужденных переселенцев,вынужденному переселенцу,вынужденным переселенцам,вынужденного переселенца,вынужденных переселенцев,вынужденным переселенцем,вынужденными переселенцами,вынужденном переселенце,вынужденных переселенцах|дедушка,дедушки,дедушки,дедушек,дедушке,дедушкам,дедушку,дедушек,дедушкой,дедушками,дедушке,дедушках|дядя,дяди,дяди,дядей,дяде,дядям,дядю,дядей,дядей,дядями,дяде,дядях|конь,кони,коня,коней,коню,коням,коня,коней,конем,конями,коне,конях|недоедание,недоедания,недоедания,недоеданий,недоеданию,недоеданиям,недоедание,недоедания,недоеданием,недоеданиями,недоедании,недоеданиях|психическое здоровье,психические здоровья,психического здоровья,психических здоровьев,психическому здоровью,психическим здоровьям,психическое здоровье,психические здоровья,психическим здоровьем,психическими здоровьями,психическом здоровье,психических здоровьях|поле,поля,поля,полей,полю,полям,поле,поля,полем,полями,поле,полях|зерно,зерна,зерна,зерен,зерну,зернам,зерно,зерна,зерном,зернами,зерне,зернах|Ангола,Анголы,Анголы,Ангол,Анголе,Анголам,Анголу,Анголы,Анголой,Анголами,Анголе,Анголах|Ирак,Ираки,Ирака,Ираков,Ираку,Иракам,Ирак,Ираки,Ираком,Ираками,Ираке,Ираках";

	oCfml		= createObject("component", "msf.api.util.cfml");
	oThread		= createObject("java", "java.lang.Thread");

	oAnalyser	= createObject("java", "org.apache.lucene.analysis.ru.RussianAnalyzer").init();
	oField		= createObject("java", "org.apache.lucene.document.Field");

	// loop over each set of words, performing the index test
	for (j=1; j le listLen(lWordSets, "|"); j=j+1){
		// index a set of words, then search for them
		lWords = listGetAt(lWordSets, j, "|");

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
		for (i=1; i le listLen(lWords); i=i+1){
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
			for (i=1; i le listLen(lWords); i=i+1){
				sSearchTerm		= listGetAt(lWords, i);

				writeOutput('<span style="color:blue">Searching for [#sSearchTerm#]</span>');

				oQueryParser	= createObject("java", "org.apache.lucene.queryParser.QueryParser").init("keyword", oAnalyser);
				oQuery			= oQueryParser.parse(sSearchTerm);

				oHits			= oSearcher.search(oQuery);
				iHits			= oHits.length();
				if (iHits eq 12){
					sColour	= "green";
				}else if (iHits le 6){
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
