<cfprocessingdirective pageencoding="UTF8">
<cfscript>
    curStruct.value = "≥ 25";
</cfscript>

<cfsavecontent variable="fileContent">
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
	<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:html="http://www.w3.org/TR/REC-html40">
		<cols>
	        <col min="1" max="1" width="24"/>
            <col min="2" max="2" width="75"/>
        </cols>
        <sheetData>
            <row>
				<c s="2" t="inlineStr"><is><t><cfoutput>#xmlFormat('Surface')#</cfoutput></t></is></c>
				<c s="1" t="inlineStr"><is><t><cfoutput>#encodeForXml(curStruct.value)#</cfoutput></t></is></c>
			</row>
	    </sheetData>
    </worksheet>
</cfsavecontent>
<cfscript>
    filePath = getTempDirectory() & "mine.xml";
    wsFile = fileOpen(filePath, "write");
    fileWrite(wsFile, trim(fileContent));
	fileClose(wsFile);
</cfscript>
