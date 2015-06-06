<cfscript>
	oCsvData = createObject("java", "com.csvreader.CsvReader").init(expandPath("./complex.csv"));
	
	oCsvData.readHeaders();
	aHeaders = oCsvData.getHeaders();
	while (oCsvData.readRecord()){
		for (iHeader=1; iHeader <= arrayLen(aHeaders); iHeader++){
			sHeader = aHeaders[iHeader];
			writeOutput("#sHeader#: #oCsvData.get(sHeader)#");
			if (iHeader < arrayLen(aHeaders)){
				writeOutput("; ");
			}
		}
		writeOutput("<br />");
	}
</cfscript>