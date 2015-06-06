<cfprocessingdirective pageencoding="utf-8"><!--- File has Cyrillic data in it --->
<!---
<header>
	<title>testLucene4.cfm</title>
	<author>Adam Cameron</author>
	<copyright>(c) Straker Interactive 2007</copyright>
	<description>
		Proof of concept that Lucene does in fact do Russian-language stemming
	</description>
	<notes>
		Loops over a list of lists, where each sublist is a set of all case/gender combinations for a given word.
		Sticks each word into a Lucene index as single-word documents
		After each set is indexed, does a separate search on each word, the idea being each sought-after word should match ALL the other words (/documents).

		Russian-language stem-searching seems to work with a fairly good accuracy.  The words it doesn't do properly are grammatically exceptional cases (according to our tame Russian speaker).
	</notes>
	<history>
		<version number="1.0" date="2007-02-24" author="AC">Initial implementation: on set of words; just getting Lucene to work</version>
		<version number="2.0" date="2007-02-24" author="AC">Multiple sets of words</version>
		<version number="3.0" date="2007-02-24" author="AC">Sussed out how the inner classes on the doc fields work, so chucking them in</version>
		<version number="4.0" date="2007-02-24" author="AC">Isolating relevant code for sending to Adobe</version>
	</history>
</header>
--->

<cfflush interval="50">


<div style="font-family:verdana; font-size:8pt;">
<cfscript>
	// just create a sub-dir @ current location
	sIndexPath	= getDirectoryFromPath(getCurrentTemplatePath()) & "testIndex";
	
	// this is a list of lists.  The comma-delimited list is each of the variations on the word; each set of these is delimited by a pipe
	lWordSets	= "палатка,палатки,палатки,палаток,палатке,палаткам,палатку,палатки,палаткой,палатками,палатке,палатках|холера,холеры,холеры,холер,холере,холерам,холеру,холеры,холерой,холерами,холере,холерах|корь,кори,кори,корей,кори,корям,корь,кори,корью,корями,кори,корях|помощь,помощи,помощи,помощей,помощи,помощам,помощь,помощи,помощью,помощами,помощи,помощях|хирургия,хирургии,хирургии,хирургий,хирургии,хирургиям,хирургию,хирургии,хирургией,хирургиями,хирургии,хирургиях|природная катастрофа,природные катастрофы,природной катастрофы,природных катастроф,природной катастрофе,природным катастрофам,природную катастрофу,природные катастрофы,природной катастрофой,природными катастрофами,природной катастрофе,природных катастрофах|сонная болезнь,сонные болезни,сонной болезни,сонных болезней,сонной болезни,сонным болезням,сонную болезнь,сонные болезни,сонной болезнью,сонными болезнями,сонной болезни,сонных болезнях|сестра,сестры,сестры,сестер,сестре,сестрам,сестру,сестер,сестрой,сестрами,сестре,сестрах|земля,земли,земли,землями,земле,землям,землю,земли,землей,землями,земле,землях|мышь,мыши,мыши,мышей,мыши,мышам,мышь,мышей,мышью,мышами,мыши,мышах|рожь,рожи,ржи,рожей,ржи,рожам,рожь,рожи,рожью,рожами,ржи,рожах|туберкулез,туберкулезы,туберкулеза,туберкулезов,туберкулезу,туберкулезам,туберкулез,туберкулезы,туберкулезом,туберкулезами,туберкулезе,туберкулезах|беженец,беженцы,беженца,беженцев,беженцу,беженцам,беженца,беженцев,беженцем,беженцами,беженце,беженцах|голод,голода,голода,голодов,голоду,голодам,голод,голода,голодом,голодами,голоде,голодах|вынужденный переселенец,вынужденные переселенцы,вынужденного переселенца,вынужденных переселенцев,вынужденному переселенцу,вынужденным переселенцам,вынужденного переселенца,вынужденных переселенцев,вынужденным переселенцем,вынужденными переселенцами,вынужденном переселенце,вынужденных переселенцах|дедушка,дедушки,дедушки,дедушек,дедушке,дедушкам,дедушку,дедушек,дедушкой,дедушками,дедушке,дедушках|дядя,дяди,дяди,дядей,дяде,дядям,дядю,дядей,дядей,дядями,дяде,дядях|конь,кони,коня,коней,коню,коням,коня,коней,конем,конями,коне,конях|недоедание,недоедания,недоедания,недоеданий,недоеданию,недоеданиям,недоедание,недоедания,недоеданием,недоеданиями,недоедании,недоеданиях|психическое здоровье,психические здоровья,психического здоровья,психических здоровьев,психическому здоровью,психическим здоровьям,психическое здоровье,психические здоровья,психическим здоровьем,психическими здоровьями,психическом здоровье,психических здоровьях|поле,поля,поля,полей,полю,полям,поле,поля,полем,полями,поле,полях|зерно,зерна,зерна,зерен,зерну,зернам,зерно,зерна,зерном,зернами,зерне,зернах|Ангола,Анголы,Анголы,Ангол,Анголе,Анголам,Анголу,Анголы,Анголой,Анголами,Анголе,Анголах|Ирак,Ираки,Ирака,Ираков,Ираку,Иракам,Ирак,Ираки,Ираком,Ираками,Ираке,Ираках|читать,читаю,читаешь,читает,читай,читаем,читаете,читают,читайте,читал,читала,читали|говорить,говорю,говоришь,говорит,говори,говорим,говорите,говорят,говорите,говорил,говорила,говорили|кормить,кормлю,кормишь,кормит,корми,кормим,кормите,кормят,кормите,кормил,кормила,кормили|бежать,бегу,бежишь,бежит,беги,бежим,бежите,бегут,бегите,бежал,бежала,бежали";

	// lucene stuff
	oAnalyser	= createObject("java", "org.apache.lucene.analysis.ru.RussianAnalyzer").init();
	oField		= createObject("java", "org.apache.lucene.document.Field");
	
	// needed for creating fields in a doc
	oFieldIndex				= createObject("java","org.apache.lucene.document.Field$Index");
	oFieldIndexNo			= oFieldIndex.NO;
	oFieldIndexTokenised	= oFieldIndex.TOKENIZED;
	oFieldStore				= createObject("java","org.apache.lucene.document.Field$Store");
	oFieldStoreYes			= oFieldStore.YES;
	oFieldStoreNo			= oFieldStore.NO;
	

	// loop over each set of words, performing the index test
	for (j=1; j le listLen(lWordSets, "|"); j=j+1){
		// index a set of words, then search for them
		lWords = listGetAt(lWordSets, j, "|");
		iWords = listLen(lWords);

		try {
			writeOutput(statusMsg("Initialising Lucene", "INFO"));
			if (directoryExists(sIndexPath)){
				try {
					cfdirectory(action="delete", directory=sIndexPath, recurse=true);
				} catch (any e){
					// try closing the index and trying again
					oWriter		= createObject("java", "org.apache.lucene.index.IndexWriter").init(sIndexPath, oAnalyser).close();
					oSearcher	= createObject("java", "org.apache.lucene.search.IndexSearcher").init(sIndexPath).close();
					cfdirectory(action="delete", directory=sIndexPath, recurse=true);
				}
			}
			oWriter = createObject("java", "org.apache.lucene.index.IndexWriter").init(sIndexPath, oAnalyser);
			writeOutput(statusMsg("Initialised", "OK"));
		} catch (any e){
			writeOutput(statusMsg("Error in initialisation process: [#e.message#][#e.detail#]", "ERROR"));
			try {
				writeOutput(statusMsg("Closing indexer... ", "INFO"));
				oWriter.close();
				writeOutput(statusMsg("Success", "OK"));
			} catch (any e){
				writeOutput(statusMsg("error closing index writer: [#e.message#][#e.detail#]", "WARNING"));
			}
			writeOutput(statusMsg("ABORT", "ERROR"));
			cfAbort();
		}	// end of whether we initialised

		// index each word separately: we're just demonstrating that stemming works
		writeOutput(statusMsg("Indexing: [#lWords#]", "INFO"));
		for (i=1; i le iWords; i=i+1){
			sIndexTerm = listGetAt(lWords, i);

			// make a doc with a couple of fields
			oDoc = createObject("java", "org.apache.lucene.document.Document").init();

			oDoc.add(oField.init("id",		javacast("string", i),	oFieldStoreYes,	oFieldIndexNo));
			oDoc.add(oField.init("keyword",	sIndexTerm,				oFieldStoreNo,	oFieldIndexTokenised));

			// stick it in the index
			oWriter.addDocument(oDoc);
		}	// end of looping over word list
		// finished indexing
		writeOutput(statusMsg("Indexing Complete", "OK"));

		// close up
		try {
			writeOutput(statusMsg("Closing indexer... ", "INFO"));
			oWriter.close();
			writeOutput(statusMsg("Success", "OK"));
		} catch (any e){
			writeOutput(statusMsg("Error closing index writer: [#e.message#][#e.detail#]", "WARNING"));
			writeOutput(statusMsg("CF RESTART REQUIRED", "ERROR"));
		}

		// search for those words and see what we find
		try {
			oSearcher = createObject("java", "org.apache.lucene.search.IndexSearcher").init(sIndexPath);

			writeOutput(statusMsg("Searching", "INFO"));
			for (i=1; i le iWords; i=i+1){
				sSearchTerm		= listGetAt(lWords, i);
				
				writeOutput(statusMsg("Searching for [#sSearchTerm#]", "INFO"));

				oQueryParser	= createObject("java", "org.apache.lucene.queryParser.QueryParser").init("keyword", oAnalyser);
				oQuery			= oQueryParser.parse(sSearchTerm);

				// do a search and see what we find?
				oHits			= oSearcher.search(oQuery);
				iHits			= oHits.length();	// just a count is OK for our purposes
				if (iHits eq iWords){
					sStatus	= "OK";	// got 
				}else if (iHits le (iWords\2)){
					sStatus	= "ERROR";
				}else{
					sStatus	= "WARNING";
				}
				writeOutput(statusMsg("Found: [#iHits#] match#iif(iHits neq 1, de("es"), de(""))#", sStatus));
			}	// end of looping over each word in group

			// this test finished.  Close searcher
			writeOutput('<span style="color:green">Test Complete</span><br />');

			// close up
			try {
				writeOutput(statusMsg("Closing searcher... ", "INFO"));
				oSearcher.close();
				writeOutput(statusMsg("Success", "OK"));
			} catch (any e){
				writeOutput(statusMsg("Error closing index searcher: [#e.message#][#e.detail#]", "WARNING"));
				writeOutput(statusMsg("CF RESTART REQUIRED", "ERROR"));
			}

		} catch (any e){
			writeOutput(statusMsg("Error searching: [#e.message#][#e.detail#]", "ERROR"));
		}
		writeOutput('<hr />');
	}	// end of looping over all words
	writeOutput(statusMsg("All Tests Complete", "OK"));
	writeOutput(statusMsg("END", "INFO"));
</cfscript>
</div>


<!--- LIB --->

<cffunction name="cfDirectory" returntype="void"output="false">
	<cfargument name="action"		type="string"	required="true">
	<cfargument name="directory"	type="string"	required="true">
	<cfargument name="recurse"		type="boolean"	required="false">
	<cfdirectory action="#arguments.action#" directory="#arguments.directory#" recurse="#arguments.recurse#">
</cffunction>

<cffunction name="cfAbort" returntype="void" output="false">
	<cfabort>
</cffunction>

<cfscript>
	function statusMsg(msg, status){
		var sColour = "";
		
		switch (arguments.status){
			case "INFO":{
				sColour = "blue";
				break;
			}
			case "OK":{
				sColour = "green";
				break;
			}
			case "WARNING":{
				sColour = "orange";
				break;
			}
			case "ERROR":{
				sColour = "red";
				break;
			}
			default:{
				sColour = "black";
				break;
			}
		}
		return '<span style="color:#sColour#;">#arguments.msg#</span><br />';
	}
</cfscript>