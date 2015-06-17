<cfscript>
	function roundTo(fNumber, iDecimalPlaces){
		var scale = 10 ^ arguments.iDecimalPlaces;
		return round(fNumber * scale) / scale;
	}

	function fixTo(fNumber, iDecimalPlaces){
		var scale = 10 ^ arguments.iDecimalPlaces;
		return (fix(fNumber * scale)) / scale;
	}

	f = 1.69;
	writeOutput("roundTo(): #roundTo(f, 1)#<br />");
	writeOutput("fixTo(): #fixTo(f, 1)#<br />");
	writeOutput("numberFormat(): #numberFormat(f, "0.0")#<br />");
	writeOutput("decimalFormat(): #decimalFormat(f)#<br />");
</cfscript>