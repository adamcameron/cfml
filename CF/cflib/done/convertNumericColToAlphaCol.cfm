<cfscript>
public string function convertNumericColToAlphaCol(required numeric col){
	var theColNum = abs(int(arguments.col));
	var colLetter = '';
	
	if ( theColNum gt 0 ) {
		if ( theColNum gt 26 ) {
			colLetter = Chr(Int((theColNum - 1) / 26) + 64) & Chr(((theColNum - 1) Mod 26) + 65);
		} else {
			colLetter = Chr(theColNum + 64);
		}
	}
	return colLetter;
}

function excelColumnNumtoColumnName(columnNumber){
    var dividend = fix(arguments.columnNumber); //make sure input is an integer
    var columnName = '';
    var modulo = 0;
    //if dividend <= 0, an empty string will be returned
    while (dividend gt 0){
        modulo = (dividend - 1) mod 26;
        columnName = "#chr(65 + modulo)##columnName#";
        dividend = fix((dividend - modulo) / 26);
    }
    return columnName;
}
</cfscript>

<cfoutput>
column 1 is #ExcelColumnNumtoColumnName(1)#:#convertNumericColToAlphaCol(1)#<br/>
column 18 is #ExcelColumnNumtoColumnName(18)#:#convertNumericColToAlphaCol(18)#<br/>
column 100 is #ExcelColumnNumtoColumnName(100)#:#convertNumericColToAlphaCol(100)#<br/>
column 653 is #ExcelColumnNumtoColumnName(653)#:#convertNumericColToAlphaCol(653)#<br/>	
	
</cfoutput>