<cfscript>
	integerOnly = "";
	decimalOnly = "";
	withBoth	= "";
	intPart		= "";
	decPart		= "";
	xls = spreadsheetNew();
	writeOutput('<table border="1">');
	writeOutput('<tr>');
	writeOutput('<th rowspan="2">Digits</th>');
	writeOutput('<th colspan="3">Integer</th><th colspan="3">Decimal</th><th colspan="3">Both</th>');
	writeOutput('</tr>');
	writeOutput('<tr>');
	writeOutput('<th>String</th><th>Number</th><th>Equal</th>');
	writeOutput('<th>String</th><th>Number</th><th>Equal</th>');
	writeOutput('<th>String</th><th>Number</th><th>Equal</th>');
	writeOutput('</tr>');
	for (i=1; i <= 20; i++){
		if (i mod 10){	// no zeros
			integerOnly &= (i mod 10);
			decimalOnly = "0.#integerOnly#";
			if (i mod 2){
				intPart &= (i mod 10);
			}else{
				decPart &= (i mod 10);
			}
			withBoth ="#len(intPart)?intPart:0#.#len(decPart)?decPart:0#";
			
			intCompared = compareStringToNumeric(integerOnly);
			decCompared = compareStringToNumeric(decimalOnly);
			withBothCompared = compareStringToNumeric(withBoth);
			
			writeOutput("<tr>");
			writeOutput("<td>#i#</td>");
			writeOutput("<td>#integerOnly#</td>");
			writeOutput("<td>#intCompared.asNumber#</td>");
			writeOutput("<td>#intCompared.equal#</td>");
			writeOutput("<td>#decimalOnly#</td>");
			writeOutput("<td>#decCompared.asNumber#</td>");
			writeOutput("<td>#decCompared.equal#</td>");
			writeOutput("<td>#withBoth#</td>");
			writeOutput("<td>#withBothCompared.asNumber#</td>");
			writeOutput("<td>#withBothCompared.equal#</td>");
			writeOutput("</tr>");

			spreadsheetSetCellValue(xls, i, i, 1);

			spreadsheetSetCellValue(xls, integerOnly, i, 2);
			spreadsheetSetCellValue(xls, intCompared.asNumber, i, 3);
			
			spreadsheetSetCellValue(xls, decimalOnly, i, 5);
			spreadsheetSetCellValue(xls, decCompared.asNumber, i, 6);
			
			spreadsheetSetCellValue(xls, withBoth, i, 8);
			spreadsheetSetCellValue(xls, withBothCompared.asNumber, i, 9);

		}
	}
	writeOutput('</table>');
	spreadsheetWrite(xls, expandPath("./") & "result.xls", true);

	struct function compareStringToNumeric(string s){
		var result = {
			asString	= s,
			asNumber	= val(s)
		};
		result.equal = !compare(result.asString, result.asNumber);
		return result;
	}

	
</cfscript>