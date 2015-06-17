<cfscript>
	CRLF	= chr(13) & chr(10);
	
	sFileSrc	= "C:\temp\comments.xls";
	sFileDest	= "C:\temp\comments2.xls";
	
	// make source file
	/*
		creates a file with A1-A4:
		tahi
		rua
		toru
		wha
		Each with a comment containing their English equivalent
	*/
	xls = spreadsheetNew("Maori");
	spreadsheetSetCellValue(xls, "tahi", 1, 1);
	spreadsheetSetCellComment(xls, {comment="one"}, 1, 1);
	spreadsheetSetCellValue(xls, "rua", 2, 1);
	spreadsheetSetCellComment(xls, {comment="two"}, 2, 1);
	spreadsheetSetCellValue(xls, "toru", 3, 1);
	spreadsheetSetCellComment(xls, {comment="three"}, 3, 1);
	spreadsheetSetCellValue(xls, "wha", 4, 1);
	spreadsheetSetCellComment(xls, {comment="four"}, 4, 1);
	
	spreadsheetWrite(xls, sFileSrc, "", true);

	
	// run test
	xls = spreadsheetRead(sFileSrc, "Maori");
	
	spreadsheetCreateSheet(xls, "Translation");
	
	// loop over the rows in the XLS
	for(iRow=1; iRow <= xls.rowcount; iRow++){
		
		// select the main sheet, and pull the value and comment
		spreadsheetSetActiveSheet(xls, "Maori");
		sValue = spreadsheetGetCellValue(xls, iRow, 1);
		stComment = spreadsheetGetCellComment(xls, iRow, 1);

		// switch to the new sheet and put the Maori in the first col, English in the second col of each row
		spreadsheetSetActiveSheet(xls, "Translation");
		spreadsheetSetCellValue(xls, sValue, iRow, 1);
		spreadsheetSetCellValue(xls, stComment.comment, iRow, 2);
	}
	// write the result
	spreadsheetWrite(xls, sFileDest, "", true);
</cfscript>
