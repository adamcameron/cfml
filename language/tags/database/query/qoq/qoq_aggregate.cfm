<cfscript>
	oCFML = createObject("component", "cfml");
	q1 = queryNew("col1,col2");
	for (i=2; i le 4; i=i+1){
		queryAddRow(q1); querySetCell(q1, "col1", i); querySetCell(q1, "col2", chr(65 + (i mod 26)));
	}
	
	wddxQ = oCFML.cfWDDX(action="cfml2wddx", input=q1);
	writeOutput("#htmlEditFormat(tostring(wddxQ))#<br />");
	
	xmlQ = xmlParse(wddxQ);
//	oCFML.cfDump(xmlQ);
	colNode = duplicate(xmlQ.wddxPacket.data.recordSet.field[1]);
	colString = toString(colNode);
	fixedString = reReplaceNoCase(colString, "<([/]{0,1})string>", "<\1number>", "ALL");
	fixedNode = xmlParse(fixedString);

xmlQ.wddxPacket.data.recordSet.xmlChildren[1] = tostring(fixedNode);

	oCFML.cfDump(xmlQ);
</cfscript>

