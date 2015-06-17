<cfscript>
// missingStringMemberFunctions.cfm
textString = "G'day world";
numericString = "42";
dateString = "2014-02-23";
listString = "tahi,rua,toru,wha";

writeOutput("<h3>reMatch()</h3>");
writeDump(var=safeCall(function(){
	return textString.rematch("");
}));

writeOutput("<hr><h3>numberFormat()</h3>");
writeDump(var=safeCall(function(){
	return numericString.numberFomat("99");
}));

writeOutput("<hr><h3>val()</h3>");
writeDump(var=safeCall(function(){
	return numericString.val();
}));

writeOutput("<hr><h3>parseDateTime()</h3>");
writeDump(var=safeCall(function(){
	return dateString.parseDateTime();
}));

writeOutput("<hr><h3>htmlEditFormat()</h3>");
writeDump(var=safeCall(function(){
	s = "<h4>#textString#</h4>";
	return s.htmlEditFormat();
}));

writeOutput("<hr><h3>refind()</h3>");
writeDump(var=safeCall(function(){
	return textString.refind("day");
}));

writeOutput("<hr><h3>hash()</h3>");
writeDump(var=safeCall(function(){
	return textString.hash();
}));

writeOutput("<hr><h3>javaCast()</h3>");
writeDump(var=safeCall(function(){
	return textString.javaCast("String");
}));

writeOutput("<hr><h3>jsStringFormat()</h3>");
writeDump(var=safeCall(function(){
	return textString.jsStringFormat("String");
}));

writeOutput("<hr><h3>isNumeric()</h3>");
writeDump(var=safeCall(function(){
	return textString.isNumeric();
}));

writeOutput("<hr><h3>isValid()</h3>");
writeDump(var=safeCall(function(){
	return numericString.isValid("integer");
}));

writeOutput("<hr><h3>repeatString()</h3>");
writeDump(var=safeCall(function(){
	writeOutput(repeatString(textString, 2));
	return textString.repeatString(2);
}));

writeOutput("<hr><h3>reReplace()</h3>");
writeDump(var=safeCall(function(){
	return textString.reReplace("[aeiou]", "_", "ALL");
}));

writeOutput("<hr><h3>replaceList()</h3>");
writeDump(var=safeCall(function(){
	return textString.replaceList("G'day,world", "Hello,universe");
}));

writeOutput("<hr><h3>toBase64()</h3>");
writeDump(var=safeCall(function(){
	return textString.toBase64();
}));

writeOutput("<hr><h3>urlDecode()</h3>");
writeDump(var=safeCall(function(){
	var s = textString & "%20" & textString;
	return s.urlDecode();
}));

writeOutput("<hr><h3>urlEncodedFormat()</h3>");
writeDump(var=safeCall(function(){
	return textString.urlEncodedFormat();
}));

writeOutput("<hr><h3>val()</h3>");
writeDump(var=safeCall(function(){
	return numericString.val();
}));

writeOutput("<hr><h3>xmlFormat()</h3>");
writeDump(var=safeCall(function(){
	return textString.xmlFormat();
}));

writeOutput("<hr><h3>listValueCount()</h3>");
writeDump(var=safeCall(function(){
	return listString.listValueCount("world");
}));

writeOutput("<hr><h3>LSParseEuroCurrency()</h3>");
writeDump(var=safeCall(function(){
	var currencyString = "€1.000,00";
	var locale = "DE_DE";
	return currencyString.LSParseEuroCurrency(locale);
}));

writeOutput("<hr><h3>serializeJson()</h3>");
writeDump(var=safeCall(function(){
	return textString.serializeJson();
}));

writeOutput("<hr><h3>deserializeJson()</h3>");
writeDump(var=safeCall(function(){
	var a = listToArray(listString);
	var json = serializeJson(a);
	return json.deserializeJson();
}));

writeOutput("<hr><h3>xmlParse()</h3>");
writeDump(var=safeCall(function(){
	var xmlString = "<aaa><bbb /></aaa>";
	var xml = xmlParse(xmlString);
	return xmlString.xmlParse();
}));

writeOutput("<hr><h3>encrypt()</h3>");
writeDump(var=safeCall(function(){
	return textString.encrypt("CFMX_COMPAT");
}));

writeOutput("<hr><h3>decrypt()</h3>");
writeDump(var=safeCall(function(){
	var encrypted = encrypt(textString, "CFMX_COMPAT");
	return encrypted.decrypt("CFMX_COMPAT");
}));

writeOutput("<hr><h3>canonicalize()</h3>");
writeDump(var=safeCall(function(){
	return textString.canonicalize(true, true);
}));

writeOutput("<hr><h3>encodeForUrl()</h3>");
writeDump(var=safeCall(function(){
	return textString.encodeForUrl();
}));

writeOutput("<hr><h3>isDate()</h3>");
writeDump(var=safeCall(function(){
	return dateString.isDate();
}));

writeOutput("<hr><h3>reEscape()</h3>");
writeDump(var=safeCall(function(){
	return textString.reEscape();
}));

function safeCall(required function f, struct args={}){
	try {
		var result = "";
		result = f(argumentCollection=args);
	}catch (any e){
		result = e.message;
	}
	finally {
		return result;
	}
}
</cfscript>