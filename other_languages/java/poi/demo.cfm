<cfscript>
	sDocPath	= expandPath("./");
	sSrcDocFile = sDocPath & "empty.doc";
	sDstDocFile = sDocPath & "new.doc";
	oFileInpStream = createObject("java", "java.io.FileInputStream").init(sSrcDocFile);
	oWord		= createObject("java", "org.apache.poi.hwpf.HWPFDocument").init(oFileInpStream);
	
	// centered paragraph with large font size
	oRange = oWord.getRange();
	oParaProps1 = createObject("java", "org.apache.poi.hwpf.usermodel.ParagraphProperties").init();
	oPara1 = oRange.insertAfter(oParaProps1, 0);
	oPara1.setSpacingAfter(200);
	oPara1.setJustification(2);	// justification: (byte) 0=left, 1=center, 2=right, 3=left and right
	
	
	oRun1 = oPara1.insertAfter("one");
	oRun1.setFontSize(2 * 18);
	// font size: twice the point size
	
	// paragraph with bold typeface
	oParaProps2 = createObject("java", "org.apache.poi.hwpf.usermodel.ParagraphProperties").init();
	oPara2 = oRun1.insertAfter(oParaProps2, 0);
	oPara2.setSpacingAfter(200);
	oRun2 = oPara2.insertAfter("two two two two two two two two two two two two two");
	oRun2.setBold(true);
writeOutput(oRun2.isBold());	
	// paragraph with italic typeface and a line indent in the first line
	oParaProps3 = createObject("java", "org.apache.poi.hwpf.usermodel.ParagraphProperties").init();
	oPara3 = oRun2.insertAfter(oParaProps3, 0);
	oPara3.setFirstLineIndent(200);
	oPara3.setSpacingAfter(200);
	oRun3 = oPara3.insertAfter(
		"three three three three three three three three three "
		& "three three three three three three three three three three three three three three "
		& "three three three three three three three three three three three three three three"
	);
	oRun3.setItalic(true);

/*	*/
	// add a custom document property (needs POI 3.5; POI 3.2 doesn't save custom properties)
	oDocSummaryInfo = oWord.getDocumentSummaryInformation();
	oCustProps = oDocSummaryInfo.getCustomProperties();
	if (! isDefined("variables.oCustProps")){
		oCustProps = createObject("java", "org.apache.poi.hpsf.CustomProperties").init();
	}
	oCustProps.put("myProperty", "foo bar baz");
	oDocSummaryInfo.setCustomProperties(oCustProps);

	oFileOutStream = createObject("java", "java.io.FileOutputStream").init(sDstDocFile);
	oWord.write(oFileOutStream);
	oFileOutStream.close();
	
</cfscript>

<cfdump var="#variables#">